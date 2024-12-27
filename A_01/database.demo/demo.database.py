import pytest
import pymysql
import logging
from typing import Dict, List, Any
from datetime import datetime
import pandas as pd
from dataclasses import dataclass
import json


# Test Configuration
@dataclass
class TestConfig:
    host: str
    user: str
    password: str
    database: str
    port: int = 3306


# Database Connection Handler
class DatabaseConnection:
    def __init__(self, config: TestConfig):
        self.config = config
        self.connection = None

    def connect(self):
        try:
            self.connection = pymysql.connect(
                host=self.config.host,
                user=self.config.user,
                password=self.config.password,
                database=self.config.database,
                port=self.config.port
            )
            return self.connection
        except Exception as e:
            logging.error(f"Database connection failed: {str(e)}")
            raise

    def disconnect(self):
        if self.connection:
            self.connection.close()


# Data Validation Class
class DataValidator:
    @staticmethod
    def validate_data_types(data: Dict, schema: Dict) -> bool:
        for column, expected_type in schema.items():
            if column in data:
                if not isinstance(data[column], expected_type):
                    return False
        return True

    @staticmethod
    def validate_constraints(data: Dict, constraints: Dict) -> List[str]:
        errors = []
        for column, rules in constraints.items():
            if column in data:
                value = data[column]
                if 'min_length' in rules and len(str(value)) < rules['min_length']:
                    errors.append(f"{column} length is less than minimum required")
                if 'max_length' in rules and len(str(value)) > rules['max_length']:
                    errors.append(f"{column} length exceeds maximum allowed")
                if 'required' in rules and rules['required'] and value is None:
                    errors.append(f"{column} is required but found null")
        return errors


# Test Cases
class TestEmployeeDatabase:
    @pytest.fixture(scope="class")
    def db_connection(self):
        config = TestConfig(
            host="localhost",
            user="test_user",
            password="test_password",
            database="employee_db"
        )
        db = DatabaseConnection(config)
        connection = db.connect()
        yield connection
        db.disconnect()

    def test_database_connection(self, db_connection):
        assert db_connection.open, "Database connection failed"

    def test_table_structure(self, db_connection):
        with db_connection.cursor() as cursor:
            # Check if employees table exists
            cursor.execute("SHOW TABLES LIKE 'employees'")
            assert cursor.fetchone(), "Employees table does not exist"

            # Verify table schema
            cursor.execute("DESCRIBE employees")
            columns = {row[0]: row[1] for row in cursor.fetchall()}

            expected_schema = {
                "id": "int",
                "name": "varchar(100)",
                "email": "varchar(100)",
                "department": "varchar(50)",
                "salary": "decimal(10,2)",
                "hire_date": "date"
            }

            for column, data_type in expected_schema.items():
                assert column in columns, f"Column {column} is missing"
                assert data_type in columns[column].lower(), f"Incorrect data type for {column}"

    def test_data_insertion(self, db_connection):
        test_employee = {
            "name": "John Doe",
            "email": "john.doe@company.com",
            "department": "Engineering",
            "salary": 75000.00,
            "hire_date": datetime.now().date()
        }

        # Data validation
        schema = {
            "name": str,
            "email": str,
            "department": str,
            "salary": (int, float),
            "hire_date": datetime.date
        }

        constraints = {
            "email": {"required": True, "max_length": 100},
            "name": {"required": True, "max_length": 100},
            "department": {"required": True, "max_length": 50}
        }

        validator = DataValidator()
        assert validator.validate_data_types(test_employee, schema), "Data type validation failed"
        errors = validator.validate_constraints(test_employee, constraints)
        assert not errors, f"Constraint validation failed: {errors}"

        with db_connection.cursor() as cursor:
            sql = """
            INSERT INTO employees (name, email, department, salary, hire_date)
            VALUES (%(name)s, %(email)s, %(department)s, %(salary)s, %(hire_date)s)
            """
            cursor.execute(sql, test_employee)
            db_connection.commit()

            # Verify insertion
            cursor.execute("SELECT * FROM employees WHERE email = %(email)s",
                           {"email": test_employee["email"]})
            result = cursor.fetchone()
            assert result, "Data insertion failed"

    def test_data_retrieval(self, db_connection):
        with db_connection.cursor() as cursor:
            cursor.execute("""
                SELECT * FROM employees 
                WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
            """)
            recent_hires = cursor.fetchall()

            # Convert to pandas DataFrame for analysis
            df = pd.DataFrame(recent_hires, columns=[
                "id", "name", "email", "department", "salary", "hire_date"
            ])

            # Perform data quality checks
            assert not df.empty, "No recent hires found"
            assert df['email'].is_unique, "Duplicate email addresses found"
            assert df['salary'].min() > 0, "Invalid salary values found"

            # Generate test report
            report = {
                "total_records": len(df),
                "departments": df['department'].value_counts().to_dict(),
                "avg_salary": float(df['salary'].mean()),
                "test_timestamp": datetime.now().isoformat()
            }

            with open('test_report.json', 'w') as f:
                json.dump(report, f, indent=4)

    def test_data_update(self, db_connection):
        with db_connection.cursor() as cursor:
            # Test updating salary with transaction
            try:
                db_connection.begin()
                cursor.execute("""
                    UPDATE employees 
                    SET salary = salary * 1.1 
                    WHERE department = 'Engineering'
                """)

                # Verify update
                cursor.execute("""
                    SELECT COUNT(*) 
                    FROM employees 
                    WHERE department = 'Engineering' 
                    AND salary/1.1 != salary
                """)
                affected_rows = cursor.fetchone()[0]
                assert affected_rows > 0, "Salary update failed"

                db_connection.commit()
            except Exception as e:
                db_connection.rollback()
                raise Exception(f"Update failed: {str(e)}")

    def test_data_deletion(self, db_connection):
        with db_connection.cursor() as cursor:
            # Test soft delete functionality
            try:
                db_connection.begin()
                cursor.execute("""
                    UPDATE employees 
                    SET active = FALSE 
                    WHERE hire_date < DATE_SUB(CURDATE(), INTERVAL 5 YEAR)
                """)

                # Verify soft delete
                cursor.execute("""
                    SELECT COUNT(*) 
                    FROM employees 
                    WHERE active = FALSE
                """)
                inactive_count = cursor.fetchone()[0]
                assert inactive_count >= 0, "Soft delete operation failed"

                db_connection.commit()
            except Exception as e:
                db_connection.rollback()
                raise Exception(f"Deletion failed: {str(e)}")


if __name__ == "__main__":
    logging.basicConfig(
        level=logging.INFO,
        format='%(asctime)s - %(levelname)s - %(message)s',
        filename='database_tests.log'
    )
    pytest.main([__file__, "-v", "--html=report.html"])
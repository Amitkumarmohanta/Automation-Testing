*** Settings ***
Library  DatabaseLibrary
Library  OperatingSystem

Suite Setup     Connect To Database   pymysql    ${DBName}  ${DBUser}  ${DBPass}  ${DBHost}  ${DBPort}
Suite Teardown   Disconnect From Database

*** Variables ***
${DBName}       mydb
${DBUser}       root
${DBPass}       Mynameissonu@796
${DBHost}       127.0.0.1
${DBPort}       3306

*** Test Cases ***
#Create person table
#    ${output}       Execute SQL String  Create table person(id integer,first_name varchar(20),last_name varchar(20));
#    log to console      ${output}
#    Should be equal as strings  ${output}   None

#Inserting Data in person table
#    # For inserting Single Record
#    ${output}       Execute SQL String      Insert into person values(101,"John","Canady");
#    # delete from mydb.person  --> run in SQL workbench
#
#    # For inserting Multiple Record
##    ${output}       Execute SQL Script  ./Test Data/mydb_person_insertData.sql
#    log to console      ${output}
#    Should be equal as strings      ${output}       None

## Validations
Check/Verify name record present in person table
    check if exists in database     select id from mydb.person where first_name="John";

Check/Verify Peter record not present in person table
    check if not exists in database     select id from mydb.person where first_name="Peter";

Check person table exists in mydb database
    table must exist    person

Verify row count is zero
    Check Row Count    SELECT * FROM mydb.person WHERE first_name = 'XYZ'    ==    0
#    Disconnect From Database    # use it or not

Verify row count is equal to some value
    Check Row Count      SELECT * FROM mydb.person WHERE first_name = "David"   ==  1

Verify row count is greater than some value
    Check Row Count      SELECT * FROM mydb.person WHERE first_name = "David"   >  0

Verify row count is less than some value
    Check Row Count      SELECT * FROM mydb.person WHERE first_name = "David"   <     5

Update record in person table
    ${output}       Execute SQL String  UPDATE mydb.person set first_name ="Sunny" WHERE id = 104;
    log to console      ${output}
    Should be equal as strings      ${output}       None

Retrieve records from person table
    @{queryResults}     Query       SELECT * FROM mydb.person;
    log to console    ${queryResults}

Delete records from person table
    ${output}       Execute SQL String      DELETE from mydb.person;
    Should be equal as strings      ${output}       None


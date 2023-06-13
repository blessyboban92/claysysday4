create database pankali;
use pankali;
CREATE TABLE registertbl
(
    regid INT IDENTITY(100, 1) PRIMARY KEY,
    fname VARCHAR(100),
    lname VARCHAR(30),
    dob DATE,
    age INT,
    gender VARCHAR(10),
    phonenumber VARCHAR(20),
    email VARCHAR(30),
    address VARCHAR(100),
    state VARCHAR(20),
    city VARCHAR(20),
    username VARCHAR(30),
    password VARCHAR(10),
    cpassword VARCHAR(10)
);
/*   SINGLE STORED PROCEDURE FOR CRUD OPERATION BASED ON MY PROJECT  */
CREATE PROCEDURE Manageregister_Pro
(
    @Operation VARCHAR(10),
    @regid INT = NULL,
    @fname VARCHAR(100) = NULL,
    @lname VARCHAR(30) = NULL,
    @dob DATE = NULL,
    @age INT = NULL,
    @gender VARCHAR(10) = NULL,
    @phonenumber VARCHAR(20) = NULL,
    @email VARCHAR(30) = NULL,
    @address VARCHAR(100) = NULL,
    @state VARCHAR(20) = NULL,
    @city VARCHAR(20) = NULL,
    @username VARCHAR(30) = NULL,
    @password VARCHAR(10) = NULL,
    @cpassword VARCHAR(10) = NULL
)
AS
BEGIN
    IF @Operation = 'CREATE'
    BEGIN
        INSERT INTO registertbl (fname, lname, dob, age, gender, phonenumber, email, address, state, city, username, [password], cpassword)
        VALUES (@fname, @lname, @dob, @age, @gender, @phonenumber, @email, @address, @state, @city, @username, @password, @cpassword);
    END;
  ELSE IF @Operation = 'READ'
    BEGIN
        IF @regid IS NOT NULL
        BEGIN
           
            SELECT * FROM registertbl WHERE regid = @regid;
        END
        ELSE
        BEGIN
            
            SELECT * FROM registertbl;
        END;
    END;
    ELSE IF @Operation = 'UPDATE'
    BEGIN
        UPDATE registertbl
        SET fname = @fname,
            lname = @lname,
            dob = @dob,
            age = @age,
            gender = @gender,
            phonenumber = @phonenumber,
            email = @email,
            address = @address,
            state = @state,
            city = @city,
            username = @username,
            [password] = @password,
            cpassword = @cpassword
        WHERE regid = @regid;
    END;
    ELSE IF @Operation = 'DELETE'
    BEGIN
        DELETE FROM registertbl WHERE regid = @regid;
    END;
END;
EXEC ManageRegister_pro 'CREATE', NULL, 'John', 'Biju', '1990-01-01', 30, 'Male', '1234567890', 'john@biju.com', '123 Main St', 'California', 'Los Angeles', 'johndoe', 'password', 'password';
EXEC ManageRegister_pro 'READ';
EXEC ManageRegister_pro 'READ', 100;
EXEC ManageRegister 'UPDATE', 100, 'John', 'Smith', '1990-01-01', 30, 'Male', '1234567890', 'john@example.com', '123 Main St', 'California', 'Los Angeles', 'johndoe', 'newpassword', 'newpassword';
EXEC ManageRegister 'DELETE', 104; 

/****************END**************/
/******Different Stored Method for crud opertaion **************/
CREATE PROCEDURE CreateRegister
(
    @fname VARCHAR(100),
    @lname VARCHAR(30),
    @dob DATE,
    @age INT,
    @gender VARCHAR(10),
    @phonenumber VARCHAR(20),
    @email VARCHAR(30),
    @address VARCHAR(100),
    @state VARCHAR(20),
    @city VARCHAR(20),
    @username VARCHAR(30),
    @password VARCHAR(10),
    @cpassword VARCHAR(10)
)
AS
BEGIN
    INSERT INTO registertbl (fname, lname, dob, age, gender, phonenumber, email, address, state, city, username, [password], cpassword)
    VALUES (@fname, @lname, @dob, @age, @gender, @phonenumber, @email, @address, @state, @city, @username, @password, @cpassword);
END;
/********READ****/
CREATE PROCEDURE ReadRegister1
(
    @regid INT = NULL
)
AS
BEGIN
    IF @regid IS NOT NULL
    BEGIN
       
        SELECT * FROM registertbl WHERE regid = @regid;
    END
    ELSE
    BEGIN

        SELECT * FROM registertbl;
    END;
END;
EXEC ReadRegister;
/***********Update ***********/
CREATE PROCEDURE UpdateRegister1
(
    @regid INT,
    @fname VARCHAR(100),
    @lname VARCHAR(30),
    @dob DATE,
    @age INT,
    @gender VARCHAR(10),
    @phonenumber VARCHAR(20),
    @email VARCHAR(30),
    @address VARCHAR(100),
    @state VARCHAR(20),
    @city VARCHAR(20),
    @username VARCHAR(30),
    @password VARCHAR(10),
    @cpassword VARCHAR(10)
)
AS
BEGIN
    UPDATE registertbl
    SET fname = @fname,
        lname = @lname,
        dob = @dob,
        age = @age,
        gender = @gender,
        phonenumber = @phonenumber,
        email = @email,
        address = @address,
        state = @state,
        city = @city,
        username = @username,
        [password] = @password,
        cpassword = @cpassword
    WHERE regid = @regid;
END;
/********DELETE *************/
CREATE PROCEDURE DeleteRegister1
(
    @regid INT = NULL
)
AS
BEGIN
    IF @regid IS NOT NULL
    BEGIN
        -- Delete operation for a specific record
        DELETE FROM registertbl WHERE regid = @regid;
    END
    ELSE
    BEGIN
        -- Delete operation for all records
        DELETE FROM registertbl;
    END;
END;
EXEC UpdateRegister1 103, 'Anu', 'Santhosh', '1990-01-01', 30, 'Male', '1234567890', 'john@example.com', '123 Main St', 'California', 'Los Angeles', 'johndoe', 'newpassword', 'newpassword';
EXEC DeleteRegister1 101; 
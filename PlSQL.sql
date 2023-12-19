-- 1. Write a simple PL/SQL program. Declare a variable,
-- assign the number of records in the EMP table to that variable,
-- and print the result as "There are 10 persons in the table," for example.
DECLARE
    count_record_emp INTEGER;
BEGIN
    SELECT COUNT(*) INTO count_record_emp FROM EMP;
    DBMS_OUTPUT.PUT_LINE('There are ' || count_record_emp || ' persons in the table');
END;


-- 2. Check the number of employees in the EMP table in a PL/SQL block.
-- If the count is less than 16,
-- insert an employee named Kowalski and print an appropriate message.
-- Otherwise, print a message indicating that no data was inserted.
DECLARE
    count_record_emp INTEGER;
BEGIN
    SELECT COUNT(*) INTO count_record_emp FROM EMP;
    IF count_record_emp < 16 THEN
        INSERT INTO EMP VALUES (2, 'Kowalski', 'CLERK', 4000, SYSDATE, 2000, 2000.0, 20);
        DBMS_OUTPUT.PUT_LINE('ADD NEW STUFF');
    ELSE
        DBMS_OUTPUT.PUT_LINE('INSERT BLOCKED');
    END IF;
END;


-- 3. Write a procedure for inserting departments into the Dept table.
-- The procedure will take parameters: department number, name, and location.
-- Check if a department with the given name or location already exists.
-- If it exists, do not insert a new record.
CREATE OR REPLACE PROCEDURE addNewDept(
    dept_number INTEGER,
    name VARCHAR2(20),
    location VARCHAR2(20)
)
IS
    currentDept INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO currentDept
    FROM DEPT D
    WHERE D.DNAME = name
      AND D.LOC = location
      AND D.DEPTNO = dept_number;

    IF currentDept = 0 THEN
        INSERT INTO DEPT VALUES (dept_number, name, location);
        DBMS_OUTPUT.PUT_LINE('ADD NEW DEPT');
    ELSE
        DBMS_OUTPUT.PUT_LINE('DEPT ALREADY EXISTS');
    END IF;
END;


-- 4. Write a procedure for inserting employees. Pass parameters: department number and last name.
-- The procedure should check if the given department exists (otherwise raise an error),
-- calculate the employee's salary as the minimum salary in his department.
-- The procedure should also assign a new EMPNO to the new employee,
-- calculated as the maximum EMPNO in the table + 1.
CREATE OR REPLACE PROCEDURE addNewEmp(
    dept_number INTEGER,
    last_name VARCHAR2(20)
)
IS
    v_currentDept     INTEGER;
    v_minSalaryInDept INTEGER;
    v_newEmpno        INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO v_currentDept
    FROM DEPT D
    WHERE D.DEPTNO = dept_number;

    IF v_currentDept = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'DEPT DOES NOT EXIST');
    END IF;

    SELECT MIN(SAL)
    INTO v_minSalaryInDept
    FROM EMP E
    WHERE E.DEPTNO = dept_number;

    SELECT MAX(EMPNO) + 1
    INTO v_newEmpno
    FROM EMP;

    INSERT INTO EMP
    VALUES (v_newEmpno, last_name, 'CLERK', v_minSalaryInDept, SYSDATE, 2000, dept_number);

    DBMS_OUTPUT.PUT_LINE('Employee has been added.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;


-- 5. Create a table called Warehouse (IdPosition, Name, Quantity) containing quantities of various goods
-- in the warehouse, and insert several sample records.
-- In a PL/SQL block, check which product has the highest quantity in the warehouse,
-- and decrease the quantity of that product by 5
-- (if the quantity is greater than or equal to 5, otherwise raise an error).
CREATE TABLE Warehouse
(
    IdPosition INTEGER PRIMARY KEY,
    Name       VARCHAR2(30),
    Quantity   INTEGER
);

INSERT INTO Warehouse (IdPosition, Name, Quantity) VALUES (1, 'Item1', 10);
INSERT INTO Warehouse (IdPosition, Name, Quantity) VALUES (2, 'Item2', 8);
INSERT INTO Warehouse (IdPosition, Name, Quantity) VALUES (3, 'Item3', 15);

CREATE OR REPLACE PROCEDURE checkAndUpdateProduct
IS
    maxQuantityProductId INTEGER;
    maxQuantityProduct   INTEGER;
BEGIN
    SELECT MAX(Quantity) INTO maxQuantityProduct FROM Warehouse;

    IF maxQuantityProduct < 5 THEN
        RAISE_APPLICATION_ERROR(-20001, 'QUANTITY TOO LOW');
    ELSE
        SELECT IdPosition INTO maxQuantityProductId FROM Warehouse W WHERE W.Quantity = maxQuantityProduct;
        UPDATE Warehouse W SET W.Quantity = W.Quantity - 5 WHERE W.IdPosition = maxQuantityProductId;
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

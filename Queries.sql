----------------------------------------------------------------------------------------------------------------
-----------------------------------------SET 1-------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

-- 1. Write a simple Transact-SQL program. Declare a variable, assign the number of
-- records in the Emp table (or any other table) to that variable, and print the result
-- using the PRINT statement, in the form of a string like "There are 10 people in the table."
exec getCountEmp;

-- 2. Using Transact-SQL, count the number of employees in the EMP table. If
-- the count is less than 16, insert an employee named Kowalski and print a message.
-- Otherwise, print a message stating that no data was inserted.
exec getCountEmpByKowalski;

-- 3. Write a procedure to return employees who earn more
-- than the value specified by the procedure parameter.
exec getEmpBySalary 4000;

-- 4. Write a procedure to insert departments into the Dept table.
-- The procedure will take parameters such as department number, name, and location. Check
-- whether a department with the same name or location already exists. If it does, do not insert a new record.
exec addDept 30, 'name', 'Warsaw';

-- 5. Write a procedure that allows the user to enter new
-- employees into the EMP table. The parameters will include the surname and
-- department number of the hired employee. The procedure should check if the specified department exists
-- (if not, an error should be raised) and calculate their salary
-- equal to the minimum salary in that department. The EMPNO of the new employee should be calculated as
-- the highest existing value in the table + 1.

-- Many questions about validations
exec addEmp 'Denis', 200;

----------------------------------------------------------------------------------------------------------------
-----------------------------------------SET 2-------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

-- 1. Using a cursor, go through all employees and modify their salaries so that
-- those earning less than 1000 have their salary increased by 10%,
-- while those earning more than 1500 have their salary reduced by 10%. Print each change made to the screen.
exec setNewSalary;

-- 2. Modify the code from task 1 into a procedure so that salary values (1000 and 1500) are not fixed,
-- but are parameters of the procedure.
exec setNewSalaryWithParameters 1100, 1500;

-- 3. In the procedure, check the average salary from the EMP table in a department specified by the procedure parameter.
-- Then give a commission (comm) to those employees in that department who earn below the average.
-- The commission should be 5% of their monthly salary.
exec giveBonusByDeptno 30;

-- 4. (without a cursor) Create a Magazyn table (IdPozycji, Nazwa, Ilosc) containing quantities
-- of various goods in the warehouse, and insert several sample records into it.
-- In a Transact-SQL block, check which article has the most in stock and
-- decrease the quantity of that article by 5 (if the quantity is greater than or equal to 5, otherwise raise an error).
exec changeStuffQuantity;

-- 5. Modify the code from task 4 into a procedure where we can provide the value
-- by which we reduce the stock (instead of hardcoding "5").
exec changeStuffQuantityWithParameters 30;

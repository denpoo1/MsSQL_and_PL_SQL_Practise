-- 1. Create a trigger that prevents deleting a record from the Emp table.
CREATE TRIGGER checkEmpByDelete
    ON EMP
    FOR DELETE
    AS
BEGIN
    RAISERROR ('There is no option to delete an entry.', 16, 1);
    ROLLBACK;
END;

-- Attempt to delete a record
    DELETE
    FROM emp
    WHERE EMPNO = 20;

    -- 2. Create a trigger that, when inserting an employee into the Emp table,
-- inserts a commission of 0 if the commission was empty.
-- Note: This task can be achieved without triggers using DEFAULT. However, let's use a trigger for training purposes.
    CREATE OR ALTER TRIGGER checkEmpByInsert
        ON EMP
        FOR INSERT
        AS
    BEGIN
        DECLARE @prowizja INT, @deptno INT;
        SELECT @prowizja = COMM, @deptno = EMPNO FROM inserted;
        IF @prowizja IS NULL
            BEGIN
                UPDATE EMP SET SAL = @prowizja WHERE DEPTNO = @deptno;
            END
    END;

        -- 3. Create a trigger that, when inserting or modifying data in the Emp table,
-- checks whether the new salaries (inserted or modified) are greater than 1000.
-- Otherwise, the trigger should raise an error and prevent the insertion of the record.
-- Note: The same effect can be achieved more easily using CHECK constraints. Let's use a trigger for training purposes.
        CREATE TRIGGER checkEmpByUpdateAndInsert
            ON EMP
            FOR INSERT, UPDATE
            AS
        BEGIN
            IF EXISTS (SELECT 1 FROM inserted WHERE SAL < 1000)
                BEGIN
                    RAISERROR ('Salary less than 1000', 16, 1);
                    ROLLBACK;
                END
        END;

            -- 4. Create a table
-- CREATE TABLE budget
-- (
--     value INT NOT NULL
-- ) This table will store the total value of salaries for all employees.
-- The table will always contain one row. First, calculate the initial value of salaries:
-- INSERT INTO budget (value)
-- SELECT SUM(sal)
-- FROM emp Create a trigger that will ensure
-- that the value in the budget table is always up-to-date, so with
-- all operations updating the emp table (INSERT, UPDATE, DELETE),
-- the trigger will update the entry in the budget table.

-- --------------------------------Version 1---------------------------------------
            CREATE OR ALTER TRIGGER checkSalary
                ON emp
                FOR UPDATE, INSERT, DELETE
                AS
            BEGIN
                DECLARE @new_budget INT = (SELECT value FROM budzet);
                DECLARE @salaryBeforeOperation INT;

                IF (SELECT COUNT(*) FROM deleted) > 0
                    BEGIN
                        -- DELETE operation
                        SET @salaryBeforeOperation = (SELECT SAL FROM deleted);
                        SET @new_budget -= @salaryBeforeOperation;
                    END
                ELSE
                    BEGIN
                        -- INSERT or UPDATE operation
                        DECLARE @current_salary INT = (SELECT SAL FROM inserted);

                        IF @current_salary > @salaryBeforeOperation
                            SET @new_budget += @current_salary - ISNULL(@salaryBeforeOperation, 0);
                        ELSE
                            SET @new_budget -= ISNULL(@salaryBeforeOperation, 0) - @current_salary;
                    END

                -- Update budget table
                UPDATE budzet SET wartosc = @new_budget;
            END;

-- --------------------------------Version 2---------------------------------------
                CREATE TRIGGER checkBudget
                    ON EMP
                    FOR INSERT, UPDATE, DELETE
                    AS
                BEGIN
                    DECLARE @decreased INT, @increased INT;

                    SELECT @decreased = SUM(SAL) FROM deleted;
                    SELECT @increased = SUM(SAL) FROM inserted;

                    UPDATE budzet SET wartosc = value - ISNULL(@decreased, 0) + ISNULL(@increased, 0);
                END;

                    -- 5. Write a trigger that prevents modifying department names in the dept table.
-- However, inserting new departments should be allowed.
                    CREATE OR ALTER TRIGGER changeDeptName
                        ON DEPT
                        FOR UPDATE
                        AS
                    BEGIN
                        IF UPDATE(DNAME)
                            BEGIN
                                RAISERROR ('There is no option to update an entry', 16, 1);
                                ROLLBACK;
                            END
                    END

                        -- 6. Write a single trigger that:
-- • Prevents deleting an employee with a salary greater than 0.
-- • Prevents changing the last name of an employee.
-- • Prevents inserting an employee who already exists (checking by last name).
                        CREATE OR ALTER TRIGGER checkEmployeeOperations
                            ON EMP
                            FOR INSERT, UPDATE, DELETE
                            AS
                        BEGIN
                            -- Check 1: Do not delete an employee with a salary greater than 0
                            IF (SELECT COUNT(*) FROM DELETED WHERE SAL > 0) > 0
                                BEGIN
                                    RAISERROR ('Cannot delete an employee with a salary greater than 0.', 16, 1);
                                    ROLLBACK;
                                    RETURN;
                                END

                            -- Check 2: Do not update the last name of an employee
                            IF UPDATE(ENAME)
                                BEGIN
                                    RAISERROR ('Cannot update the last name of an employee.', 16, 1);
                                    ROLLBACK;
                                    RETURN;
                                END

                            -- Check 3: Do not insert an employee with an existing last name
                            IF (SELECT COUNT(*)
                                FROM EMP E
                                         JOIN INSERTED I ON E.ENAME = I.ENAME) > 1
                                BEGIN
                                    RAISERROR ('Cannot insert an employee with an existing last name.', 16, 1);
                                    ROLLBACK;
                                    RETURN;
                                END
                        END;

                            -- 7. Write a trigger that:
-- • Prevents decreasing salaries.
-- • Prevents deleting employees.
                            CREATE OR ALTER TRIGGER checkSalaryAndDelete
                                ON EMP
                                FOR UPDATE, DELETE
                                AS
                            BEGIN
                                -- Check 1: Do not decrease the salary
                                IF (SELECT COUNT(*) FROM DELETED WHERE SAL > INSERTED.SAL) > 0
                                    BEGIN
                                        RAISERROR ('Cannot decrease the salary.', 16, 1);
                                        ROLLBACK;
                                        RETURN;
                                    END

                                -- Check 2: Do not delete employees
                                IF (SELECT COUNT(*) FROM DELETED) > 0
                                    BEGIN
                                        RAISERROR ('Cannot delete employees.', 16, 1);
                                        ROLLBACK;
                                        RETURN;
                                    END
                            END;


--                                                     .-%--#*..
--                                          ...-...=*+#@*..::-=+#*.
--                                         .:#@=.-*:........:---:-*:..
--                                         .#-.:-:.:-::::*@*-------=%:.
--                                         .+=...:#-..:-...:%+--*#+-:#=.
--                                         .%*+=*+...........::...+%--%-.
--                                         .#:#-=-........=#-....:#+--*#.
--                                         .-@:.............:....+*---#*.
--                                         .#+.:@*...*..=@@#:....:#=+-%=.
--                 ..-=:.                  :%...=..-*......--....-*+*%#..
--               .:*-..+-                  -*.....*%............:++-#@:
--               .+....*:                 .=*......#=....:.......:::%*.
--               :=...:*.                 .-%.-#:......:-%%-........=%:
--               .#...:#.                  .%==%:.......:##*.......-@=.
--           .....=%:..:*=..               .=@:..:+#%#+-...:....+@=:.
--           :%=::::-+#=::#+.               .+@-..:**-........:##..
--           +-........-#..#@#=:...       ....-%*:.........:-#@=-*#=:..
--           .##%@@@@*:-%..-@*==+*#%@@@%%##*++==*%%=.........==..:%**%#:..
--           -#........=+..+-*==================%:.:%@@+-:+%*:...*#+*++*#%:.
--           .#+-===-:..#--#:+*+================+#:..:----:....-%#+++++****%=..
--           .:%:....-+%*.-*.#*++++==============+#.........-+%#*++++++++++**%=..
--           ..%=:....:*#:*:**++++++++++++%*=====+*.....:%%#*++++++++++++++++**%:..
--             .-@#-:::+%==#*****+*++*#%#=%+=====*-.....*#+*++++++++++++++++++**#*.
--               .....::-=++++++=--:.....:%======#:....:%**+++++++++*+++++++++++**%:.
--                                       .%+=====%:....:%++++++++*#%#**+++++++++++*#-.
--                                       .%+====+#.....-#++++++++*####@###***++++**#@.
--                                       .#*====+*.....-#**++++++*###%# ..#*+++++*##*.
--                                       .*#====**.....-#+++++++*####@-.:%*++++*###%:
--                                       .+%====**.....=#++++++**####%::#*+++**###%-.
--                                        :@#+==+*.....-#++++++**###%#.%*+**#####%=..
--                                        .#-:#%*#.....-#+**+*+*###%@*%**#######%+.
--                                        .+=..........:%%%%@@@#=:.:%%@@#######%=..
--                                        .-*......................:%%:-%%####@=.
--                                        .:%-......................#*...:-+@@-
--                                         .%+*#*=-:.........::-=*%@@%:...-*:-%..
--                                         .#*===++*#%@@@@@%%########@-....+#-%..

CREATE procedure addDept @nr_działu int, @nazwa varchar(30), @lokalizacja varchar(30)
    as
    begin
        if not exists(select 1 from DEPT where DNAME = @nazwa or LOC = @lokalizacja)
            begin
                insert into DEPT (DEPTNO, DNAME, LOC) values (@nr_działu, @nazwa, @lokalizacja);
                print 'add new dept';
            end
        else
            begin
                print 'dept already exist';
            end
    end;



CREATE procedure addEmp @nazwisko varchar(15), @nr_działu int
        as
        begin
            if exists(select 1 from DEPT where DEPTNO = @nr_działu)
                begin
                    declare @new_empno int = (select max(EMPNO) + 1 from EMP),
                        @new_salary int = (select min(SAL) from EMP where DEPTNO = @nr_działu);
                    insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
                    values (@new_empno, @nazwisko, 'SALESMAN', 4300, sysdatetime(), @new_salary, 400, 23);
                end
            else
                begin
                    throw 50001, 'dept is not exist', 1;
                end
        end;




create procedure changeStuffQuantity
as
begin
    declare @maxQuantityProduct int = (select max(Ilosc) from Magazyn);
    if @maxQuantityProduct >= 5
        begin
            update Magazyn set Ilosc -= 5 where Ilosc = @maxQuantityProduct;
            print ('Product with large quantity reduced by 5');
        end
    else
        begin
            Raiserror ('There are no products in the table with a quantity greater than 4', 16, 1);
        end
end;




create procedure changeStuffQuantityWithParameters @reductionAmount int
    as
    begin
        declare @maxQuantityProduct int;

        -- Находим IdPozycji товара с максимальным количеством
        select top 1 @maxQuantityProduct = IdPozycji
        from Magazyn
        order by Ilosc desc;

        if @maxQuantityProduct is not null
            begin
                -- Уменьшаем количество товара на указанное значение
                update Magazyn
                set Ilosc -= @reductionAmount
                where IdPozycji = @maxQuantityProduct
                  and Ilosc >= @reductionAmount;

                if @@ROWCOUNT > 0
                    begin
                        print ('Quantity of product with IdPozycji ' + cast(@maxQuantityProduct as varchar) +
                               ' reduced by ' + cast(@reductionAmount as varchar));
                    end
                else
                    begin
                        declare @error_message varchar(20) = 'Product with IdPozycji ' +
                                                             cast(@maxQuantityProduct as varchar) +
                                                             ' has insufficient quantity';
                        Raiserror (@error_message, 16, 1);
                    end
            end
        else
            begin
                Raiserror ('No products in the table', 16, 1);
            end
    end;






create procedure getCountEmp
as
begin
    declare @countRecord int = (select count(*)
                                from emp);
    print 'W tabeli jest ' + cast(@countRecord as varchar) + ' osób';
end;







create procedure getCountEmp
as
begin
    declare @countRecord int = (select count(*)
                                from emp);
    if @countRecord < 16
        begin
            insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
--         7499,ALLEN,SALESMAN,7698,1981-02-20 00:00:00.000,1600,300,30
            values (1, 'Kowalski', 'SALESMAN', 4300, sysdatetime(), 5000, 400, 23);
            print 'add people'
        end
    else
        begin
            print 'error';
        end
end
create procedure getEmpBySalary @salary int
as
begin
    select * from EMP where SAL > @salary;
end;





CREATE procedure giveBonusByDeptno @nr_działu int
as
begin
    if exists(select 1 from DEPT where DEPTNO = @nr_działu)
        begin
            declare @current_emphno int, @current_salary int;
            declare @average_salary_by_deptno int = (select avg(SAL) from EMP where DEPTNO = @nr_działu);
            declare cursor_emp cursor for select EMPNO, SAL from EMP where SAL < @average_salary_by_deptno;
            open cursor_emp;
            fetch next from cursor_emp into @current_emphno, @current_salary;
            while @@FETCH_STATUS = 0
                begin
                    update emp set SAL += SAL * 0.05 where EMPNO = @current_emphno;
                    print 'employee with empno ' + cast(@current_emphno as varchar) +
                          ' received a salary increase by 5%';
                    fetch next from cursor_emp into @current_emphno, @current_salary;
                end
            close cursor_emp;
            deallocate cursor_emp;
        end
    else
        begin
            DECLARE @error_message VARCHAR(MAX) = 'Deptno ' + CAST(@nr_działu AS VARCHAR) + ' not exist';
            THROW 50001, @error_message, 1;
        end
end;






CREATE procedure setNewSalary
as
begin
    declare cursor_emp cursor for select SAL, EMPNO from EMP where SAL not between 1000 and 1500;
    declare @new_salary int;
    declare @current_empno int;
    open cursor_emp;
    fetch next from cursor_emp into @new_salary, @current_empno;
    while @@fetch_status = 0
        begin
            if @new_salary < 1000
                begin
                    update EMP set SAL += @new_salary * 0.1 where EMPNO = @current_empno;
                    print 'employee with empno ' + cast(@current_empno as varchar) + ' received a salary increase by 10%';
                end
            else
                begin
                    update EMP set SAL -= @new_salary * 0.15 where EMPNO = @current_empno;
                    print 'employee with empno ' + cast(@current_empno as varchar) + ' received a salary reduction by 15%';
                end
            fetch next from cursor_emp into @new_salary, @current_empno;
        end
    close cursor_emp;
    deallocate cursor_emp;
end;







CREATE procedure setNewSalaryWithParameters @parameters1 int, @parameters2 int
as
begin
    declare cursor_emp cursor for select SAL, EMPNO from EMP where SAL not between @parameters1 and @parameters2;
    declare @new_salary int;
    declare @current_empno int;
    open cursor_emp;
    fetch next from cursor_emp into @new_salary, @current_empno;
    while @@fetch_status = 0
        begin
            if @new_salary < @parameters1
                begin
                    update EMP set SAL += @new_salary * 0.1 where EMPNO = @current_empno;
                    print 'employee with empno ' + cast(@current_empno as varchar) + ' received a salary increase by 10%';
                end
            else
                begin
                    update EMP set SAL -= @new_salary * 0.15 where EMPNO = @current_empno;
                    print 'employee with empno ' + cast(@current_empno as varchar) + ' received a salary reduction by 15%';
                end
            fetch next from cursor_emp into @new_salary, @current_empno;
        end
    close cursor_emp;
    deallocate cursor_emp;
end;

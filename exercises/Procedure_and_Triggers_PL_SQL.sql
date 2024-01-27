-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
----------------------------------Create Tables and Reference----------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-- Creating the Towar table
CREATE TABLE Towar
(
    IdTowaru INT PRIMARY KEY,
    Nazwa    VARCHAR2(30),
    Cena     NUMBER(7, 2),
    Stan     INT
);

-- Creating the Student table
CREATE TABLE Student
(
    IdStudenta INT PRIMARY KEY,
    NrIndeksu  VARCHAR2(10),
    Rok        INT,
    Imie       VARCHAR2(32),
    Nazwisko   VARCHAR2(64)
);

-- Creating the Ocena table
CREATE TABLE Ocena
(
    IdOceny    INT PRIMARY KEY,
    IdStudenta INT REFERENCES Student,
    Wartosc    NUMBER(2, 1),
    Przedmiot  VARCHAR2(32)
);

-- Creating the Osoba table
CREATE TABLE Osoba
(
    IdOsoby  INT PRIMARY KEY,
    PESEL    VARCHAR(11),
    Imie     VARCHAR2(32),
    Nazwisko VARCHAR2(64)
);

-- Creating the Zwierze table
CREATE TABLE Zwierze
(
    IdZwierzecia INT PRIMARY KEY,
    Imie         VARCHAR2(30),
    Gatunek      VARCHAR2(30),
    Nr_klatki    INT
);


-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
----------------------------------Insert Default Data------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------


-- Inserting data into the Towar table
INSERT INTO Towar (IdTowaru, Nazwa, Cena, Stan)
VALUES (1, 'Product1', 100.00, 10);
INSERT INTO Towar (IdTowaru, Nazwa, Cena, Stan)
VALUES (2, 'Product2', 150.50, 20);
INSERT INTO Towar (IdTowaru, Nazwa, Cena, Stan)
VALUES (3, 'Product3', 200.75, 15);
-- Add as many records as needed

-- Inserting data into the Student table
INSERT INTO Student (IdStudenta, NrIndeksu, Rok, Imie, Nazwisko)
VALUES (1, '123456', 2, 'John', 'Doe');
INSERT INTO Student (IdStudenta, NrIndeksu, Rok, Imie, Nazwisko)
VALUES (2, '789012', 3, 'Maria', 'Smith');
INSERT INTO Student (IdStudenta, NrIndeksu, Rok, Imie, Nazwisko)
VALUES (3, '345678', 2, 'Alex', 'Jones');
-- Add as many records as needed

-- Inserting data into the Ocena table
INSERT INTO Ocena (IdOceny, IdStudenta, Wartosc, Przedmiot)
VALUES (1, 1, 4.5, 'Mathematics');
INSERT INTO Ocena (IdOceny, IdStudenta, Wartosc, Przedmiot)
VALUES (2, 2, 3.2, 'Physics');
INSERT INTO Ocena (IdOceny, IdStudenta, Wartosc, Przedmiot)
VALUES (3, 3, 5.0, 'Chemistry');
-- Add as many records as needed

-- Inserting data into the Osoba table
INSERT INTO Osoba (IdOsoby, PESEL, Imie, Nazwisko)
VALUES (1, '12345678901', 'Anna', 'Kowalski');
INSERT INTO Osoba (IdOsoby, PESEL, Imie, Nazwisko)
VALUES (2, '23456789012', 'Paul', 'Smith');
INSERT INTO Osoba (IdOsoby, PESEL, Imie, Nazwisko)
VALUES (3, '34567890123', 'Olga', 'Ivanova');
-- Add as many records as needed

-- Inserting data into the Zwierze table
INSERT INTO Zwierze (IdZwierzecia, Imie, Gatunek, Nr_klatki)
VALUES (1, 'Whiskers', 'Cat', 101);
INSERT INTO Zwierze (IdZwierzecia, Imie, Gatunek, Nr_klatki)
VALUES (2, 'Rex', 'Dog', 202);
INSERT INTO Zwierze (IdZwierzecia, Imie, Gatunek, Nr_klatki)
VALUES (3, 'Tom', 'Rabbit', 303);
-- Add as many records as needed





-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
---------------------------------------PL SQL--------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------



-- Procedure for handling product delivery with checks for existence and updates
create or replace procedure delivery(product_name varchar2, quantity int) 
as
    product_status int;
    new_product_id  towar.IdTowaru%type;
begin
    select count(*) into product_status from Towar where Towar.Nazwa = product_name;

    if product_status = 0 then
        select max(IdTowaru) + 1 into new_product_id from Towar;
        insert into Towar(idtowaru, nazwa, stan) values (new_product_id, product_name, quantity);
        DBMS_OUTPUT.PUT_LINE('insert');
    else
        update Towar set STAN = quantity where Nazwa = product_name;
        DBMS_OUTPUT.PUT_LINE('update');
    end if;
end;

-- Procedure to delete students with a low average
create PROCEDURE delete_students_with_low_average IS
    CURSOR list_student_for_delete IS
        SELECT O.IDSTUDENTA
        FROM Student S
                 JOIN Ocena O ON S.IdStudenta = O.IdStudenta
        WHERE Rok = 2
        GROUP BY O.IdStudenta
        HAVING AVG(O.Wartosc) > 2.5;
    v_current_student STUDENT.IDSTUDENTA%type;
BEGIN
    OPEN list_student_for_delete;

    LOOP
        FETCH list_student_for_delete INTO v_current_student;
        EXIT WHEN list_student_for_delete%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Checking student with Id: ' || v_current_student);

        delete from OCENA where IDSTUDENTA = v_current_student;
        delete from STUDENT where IDSTUDENTA = v_current_student;

        DBMS_OUTPUT.PUT_LINE('Student with Id ' || v_current_student || ' deleted');
    END LOOP;

    CLOSE list_student_for_delete;
END;

-- Procedure to add an animal with checks for the same species in a cage
create procedure addAnimal(Imie_procedure VARCHAR2, Gatunek_procedure VARCHAR2,
                           nr_klatki_procedure INT)
    is
    current_animal_in_cage varchar2(50);
    new_id_animal            int;
begin
    begin
        select max(IDZWIERZECIA) + 1 into new_id_animal from ZWIERZE;
        select Gatunek into current_animal_in_cage from Zwierze where Nr_klatki = nr_klatki_procedure;

        if current_animal_in_cage = Gatunek_procedure then
            insert into Zwierze(IdZwierzecia, Imie, Gatunek, Nr_klatki)
            values (new_id_animal, Imie_procedure, Gatunek_procedure, nr_klatki_procedure);
            DBMS_OUTPUT.PUT_LINE('add new animal');
        else
            raise_application_error(-20100, 'Animal must be the same species in the cage');
        end if;

    exception
        when NO_DATA_FOUND then
            insert into Zwierze(IdZwierzecia, Imie, Gatunek, Nr_klatki)
            values (new_id_animal, Imie_procedure, Gatunek_procedure, nr_klatki_procedure);
    end;
end;

-- Trigger to prevent changing name or species if they already exist in the cage
create trigger DONTCHANGENAMEORGATUNEK
    before insert or update of IMIE, GATUNEK
    on ZWIERZE
    for each row
declare
    count_the_same_animal_name int;
begin
    if inserting then
        select count(*)
        into count_the_same_animal_name
        from Zwierze
        where Nr_klatki = :new.Nr_klatki and Imie = :new.Imie;
        if count_the_same_animal_name > 0 then
            raise_application_error(-20100, 'Animal already exists in the cage');
        end if;
    elsif updating then
        raise_application_error(-20100, 'Forbidden change of name or species');
    end if;
end;

-- Trigger to forbid changing price or quantity less than 0, and forbid deletion if quantity > 0
create trigger FORBIDDENDELETE
    before update of CENA, STAN or delete
    on TOWAR
    for each row
declare
    new_price TOWAR.CENA%type;
    new_Stan TOWAR.STAN%type;
begin
    new_Stan := :NEW.STAN;
    new_price := :NEW.CENA;
    
    if deleting then
        if :old.Stan > 0 then
            raise_application_error(-20100, 'Forbidden delete');
        end if;
    elsif updating then
        if :new.Stan < 0 or :new.Cena < 0 then
            raise_application_error(-20100, 'Forbidden change price and quantity less than 0');
        end if;
    end if;
end;

-- Trigger to check length of PESEL and forbid deleting 'Kowalski'
create trigger CHECKLENGTHPESELANDCKECKDELETE
    before insert or update of PESEL or delete
    on OSOBA
    for each row
begin
    if deleting then
        if :old.Nazwisko = 'Kowalski' then
            raise_application_error(-20100, 'Forbidden delete Kowalski');
        end if;
    elsif updating then
        if length(:new.PESEL) < 11 then
            raise_application_error(-20100, 'New Pesel must be more than 11 characters');
        end if;
    elsif inserting then
        if length(:new.PESEL) < 11 then
            raise_application_error(-20100, 'New Pesel must be more than 11 characters');
        end if;
    end if;
end;
/


-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
---------------------------------------Oracle SQL Tests----------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------



-- Calling the delivery procedure
call delivery('Product4', 30);
select * from Towar;

-- Dropping the trigger for demonstration purposes
drop trigger FORBIDDENDELETE;

-- Updating the Towar table
select * from Towar;
update Towar
set Cena = 3000
where IdTowaru = 1;

-- Inserting data into the Osoba table and testing trigger CHECKLENGTHPESELANDCKECKDELETE
INSERT INTO Osoba (IdOsoby, PESEL, Imie, Nazwisko)
VALUES (1, '12345678910', 'Anna', 'Kowalski');

update Osoba
set PESEL = '1234567810'
where IdOsoby = 1;

delete from Osoba
where Nazwisko = 'Kowalski';

select * from Osoba;

-- Inserting data into the Zwierze table and testing trigger DONTCHANGENAMEORGATUNEK
insert into Zwierze(IdZwierzecia, Imie, Gatunek, Nr_klatki)
values (4, 'Boris', 'Dog', 3);

update Zwierze
set Gatunek = 'Cat'
where IdZwierzecia = 4;

-- Showing the content of the Zwierze table
select * from Zwierze;




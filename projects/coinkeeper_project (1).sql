-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
----------------------------------Drop Tables and Reference if Exist---------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-01-12 11:22:36.356

-- foreign keys

BEGIN TRANSACTION;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Account_Account_Status')
ALTER TABLE Account
    DROP CONSTRAINT Account_Account_Status;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Account_User_Role')
ALTER TABLE Account
    DROP CONSTRAINT Account_User_Role;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Exchange_Rates_Valute_from')
ALTER TABLE Exchange_Rates
    DROP CONSTRAINT Exchange_Rates_Valute_from;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Exchange_Rates_Valute_to')
ALTER TABLE Exchange_Rates
    DROP CONSTRAINT Exchange_Rates_Valute_to;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Expense_Account')
ALTER TABLE Expense
    DROP CONSTRAINT Expense_Account;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Expense_Expense_Type')
ALTER TABLE Expense
    DROP CONSTRAINT Expense_Expense_Type;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Expense_Transaction')
ALTER TABLE Expense
    DROP CONSTRAINT Expense_Transaction;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Expense_Type_Icon')
ALTER TABLE Expense_Type
    DROP CONSTRAINT Expense_Type_Icon;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Function_Subscription')
ALTER TABLE "Function"
    DROP CONSTRAINT Function_Subscription;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Income_Sourses_Account')
ALTER TABLE Income_Sourses
    DROP CONSTRAINT Income_Sourses_Account;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Income_Sourses_Income_Type')
ALTER TABLE Income_Sourses
    DROP CONSTRAINT Income_Sourses_Income_Type;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Income_Sourses_Transaction')
ALTER TABLE Income_Sourses
    DROP CONSTRAINT Income_Sourses_Transaction;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Income_Type_Icon')
ALTER TABLE Income_Type
    DROP CONSTRAINT Income_Type_Icon;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Permission_Registry_Resourse')
ALTER TABLE Permission_Registry
    DROP CONSTRAINT Permission_Registry_Resourse;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Permissions_by_User_Role_User_Role')
ALTER TABLE Permissions_by_User_Role
    DROP CONSTRAINT Permissions_by_User_Role_User_Role;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Subscription_Payment_Account')
ALTER TABLE Subscription_Payment
    DROP CONSTRAINT Subscription_Payment_Account;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Subscription_Payment_Payment_Status')
ALTER TABLE Subscription_Payment
    DROP CONSTRAINT Subscription_Payment_Payment_Status;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Subscription_Payment_Subscription')
ALTER TABLE Subscription_Payment
    DROP CONSTRAINT Subscription_Payment_Subscription;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Transaction_Account')
ALTER TABLE "Transaction"
    DROP CONSTRAINT Transaction_Account;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Transaction_Transaction_Status')
ALTER TABLE "Transaction"
    DROP CONSTRAINT Transaction_Transaction_Status;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Transaction_Valute_from')
ALTER TABLE "Transaction"
    DROP CONSTRAINT Transaction_Valute_from;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Transaction_Valute_to')
ALTER TABLE "Transaction"
    DROP CONSTRAINT Transaction_Valute_to;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'User_Permissions_Permission_Registry')
ALTER TABLE Permissions_by_User_Role
    DROP CONSTRAINT User_Permissions_Permission_Registry;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Wallet_Account')
ALTER TABLE Wallet
    DROP CONSTRAINT Wallet_Account;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Wallet_Transaction')
ALTER TABLE Wallet
    DROP CONSTRAINT Wallet_Transaction;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Wallet_Type_Icon')
ALTER TABLE Wallet_Type
    DROP CONSTRAINT Wallet_Type_Icon;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Wallet_Wallet_Type')
ALTER TABLE Wallet
    DROP CONSTRAINT Wallet_Wallet_Type;

IF EXISTS (SELECT *
           FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Wallet_Wallet_Type')
ALTER TABLE Wallet
    DROP CONSTRAINT Wallet_Wallet_Type;

IF EXISTS (SELECT 1
           FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Wallet_Valute')
ALTER TABLE Wallet
    DROP CONSTRAINT Wallet_Valute;

IF EXISTS (SELECT 1
           FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
           WHERE CONSTRAINT_NAME = 'Income_Sourses_Valute')
ALTER TABLE Income_Sourses
    DROP CONSTRAINT Income_Sourses_Valute;

-- tables

DROP TABLE IF EXISTS Account_Status;

DROP TABLE IF EXISTS Account;

DROP TABLE IF EXISTS Exchange_Rates;

DROP TABLE IF EXISTS Expense;

DROP TABLE IF EXISTS Expense_Type;

DROP TABLE IF EXISTS "Function";

DROP TABLE IF EXISTS Icon;

DROP TABLE IF EXISTS Income_Sourses;

DROP TABLE IF EXISTS Income_Type;

DROP TABLE IF EXISTS Payment_Status;

DROP TABLE IF EXISTS Permission_Registry;

DROP TABLE IF EXISTS Permissions_by_User_Role;

DROP TABLE IF EXISTS Resourse;

DROP TABLE IF EXISTS Subscription;

DROP TABLE IF EXISTS Subscription_Payment;

DROP TABLE IF EXISTS "Transaction";

DROP TABLE IF EXISTS Transaction_Status;

DROP TABLE IF EXISTS User_Role;

DROP TABLE IF EXISTS Valute;

DROP TABLE IF EXISTS Wallet;

DROP TABLE IF EXISTS Wallet_Type;

COMMIT;

-- End of file.


-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
----------------------------------Create Tables and Reference----------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-- -- Created by Vertabelo (http://vertabelo.com)
-- -- Last modification date: 2024-01-12 11:22:36.356
-- -- tables
-- -- Table: Account
BEGIN TRANSACTION;

CREATE TABLE Account
(
    id                int         NOT NULL,
    name              varchar(15) NOT NULL,
    surname           varchar(10) NOT NULL,
    email             varchar(25) NOT NULL,
    password          varchar(45) NOT NULL,
    Account_Status_id int         NOT NULL,
    User_Role_id      int         NOT NULL,
    CONSTRAINT Account_pk PRIMARY KEY (id)
);

-- Table: Account_Status
CREATE TABLE Account_Status
(
    id          int         NOT NULL,
    name        varchar(15) NOT NULL,
    description text        NOT NULL,
    CONSTRAINT Account_Status_pk PRIMARY KEY (id)
);

-- Table: Exchange_Rates
CREATE TABLE Exchange_Rates
(
    id                        int           NOT NULL,
    exchange_rate_coefficient decimal(5, 3) NOT NULL,
    valute_currency_from      varchar(10)   NOT NULL,
    Valute_currency_to        varchar(10)   NOT NULL,
    CONSTRAINT Exchange_Rates_pk PRIMARY KEY (id)
);

-- Table: Expense
CREATE TABLE Expense
(
    id                   int           NOT NULL,
    Account_id           int           NOT NULL,
    Transaction_id       int           NOT NULL,
    current_balance      decimal(8, 3) NOT NULL,
    planned_spending     decimal(8, 3) NOT NULL,
    Valute_currency_code varchar(10)   NOT NULL,
    color_status_expense varchar(15)   NOT NULL,
    CONSTRAINT Expense_pk PRIMARY KEY (id)
);

-- Table: Expense_Type
CREATE TABLE Expense_Type
(
    Icon_id              int         NOT NULL,
    color_status_expense varchar(15) NOT NULL,
    CONSTRAINT Expense_Type_pk PRIMARY KEY (color_status_expense)
);

-- Table: Function
CREATE TABLE "Function"
(
    id              int         NOT NULL,
    name            varchar(15) NOT NULL,
    description     text        NOT NULL,
    subscription_id int         NOT NULL,
    CONSTRAINT Function_pk PRIMARY KEY (id)
);

-- Table: Icon
CREATE TABLE Icon
(
    id        int         NOT NULL,
    icon_name varchar(15) NOT NULL,
    icon_url  varchar(45) NOT NULL,
    CONSTRAINT Icon_pk PRIMARY KEY (id)
);

-- Table: Income_Sourses
CREATE TABLE Income_Sourses
(
    id                       int           NOT NULL,
    Account_id               int           NOT NULL,
    Transaction_id           int           NOT NULL,
    Valute_currency_code     varchar(10)   NOT NULL,
    color_status_income_type varchar(15)   NOT NULL,
    current_income_sourses   decimal(8, 3) NOT NULL,
    CONSTRAINT Income_Sourses_pk PRIMARY KEY (id)
);

-- Table: Income_Type
CREATE TABLE Income_Type
(
    Icon_id                  int         NOT NULL,
    color_status_income_type varchar(15) NOT NULL,
    CONSTRAINT Income_Type_pk PRIMARY KEY (color_status_income_type)
);

-- Table: Payment_Status
CREATE TABLE Payment_Status
(
    id          int         NOT NULL,
    name        varchar(15) NOT NULL,
    description text        NOT NULL,
    CONSTRAINT Payment_Status_pk PRIMARY KEY (id)
);

-- Table: Permission_Registry
CREATE TABLE Permission_Registry
(
    id              int NOT NULL,
    permission_name int NOT NULL,
    Resourse_id     int NOT NULL,
    CONSTRAINT Permission_Registry_pk PRIMARY KEY (id)
);

-- Table: Permissions_by_User_Role
CREATE TABLE Permissions_by_User_Role
(
    id                     int NOT NULL,
    resourse_name          int NOT NULL,
    Permission_Registry_id int NOT NULL,
    User_Role_id           int NOT NULL,
    CONSTRAINT Permissions_by_User_Role_pk PRIMARY KEY (id)
);

-- Table: Resourse
CREATE TABLE Resourse
(
    id                   int  NOT NULL,
    resourse_name        int  NOT NULL,
    resourse_description text NOT NULL,
    CONSTRAINT Resourse_pk PRIMARY KEY (id)
);

-- Table: Subscription
CREATE TABLE Subscription
(
    id          int           NOT NULL,
    description text          NOT NULL,
    price       decimal(6, 3) NOT NULL,
    CONSTRAINT Subscription_pk PRIMARY KEY (id)
);

-- Table: Subscription_Payment
CREATE TABLE Subscription_Payment
(
    id                int  NOT NULL,
    description       text NOT NULL,
    expiry_date       date NOT NULL,
    Account_id        int  NOT NULL,
    Payment_Status_id int  NOT NULL,
    Subscription_id   int  NOT NULL,
    CONSTRAINT Subscription_Payment_pk PRIMARY KEY (id)
);

-- Table: Transaction
CREATE TABLE "Transaction"
(
    id                     int         NOT NULL,
    count_valute_code_from varchar(10) NOT NULL,
    count_valute_code_to   varchar(10) NOT NULL,
    Transaction_Status_id  int         NOT NULL,
    Account_id             int         NOT NULL,
    comment                text        NOT NULL,
    CONSTRAINT Transaction_pk PRIMARY KEY (id)
);

-- Table: Transaction_Status
CREATE TABLE Transaction_Status
(
    id                 int         NOT NULL,
    status_name        varchar(15) NOT NULL,
    description_status text        NOT NULL,
    CONSTRAINT Transaction_Status_pk PRIMARY KEY (id)
);

-- Table: User_Role
CREATE TABLE User_Role
(
    id          int         NOT NULL,
    role_name   varchar(15) NOT NULL,
    description text        NOT NULL,
    CONSTRAINT User_Role_pk PRIMARY KEY (id)
);

-- Table: Valute
CREATE TABLE Valute
(
    currency_code varchar(10) NOT NULL,
    country       varchar(25) NOT NULL,
    CONSTRAINT Valute_pk PRIMARY KEY (currency_code)
);

-- Table: Wallet
CREATE TABLE Wallet
(
    id                   int           NOT NULL,
    Account_id           int           NOT NULL,
    Transaction_id       int           NOT NULL,
    Valute_currency_code varchar(10)   NOT NULL,
    color_status_wallet  varchar(15)   NOT NULL,
    current_balance      decimal(8, 3) NOT NULL,
    CONSTRAINT Wallet_pk PRIMARY KEY (id)
);

-- Table: Wallet_Type
CREATE TABLE Wallet_Type
(
    Icon_id             int         NOT NULL,
    color_status_wallet varchar(15) NOT NULL,
    CONSTRAINT Wallet_Type_pk PRIMARY KEY (color_status_wallet)
);

-- foreign keys
-- Reference: Account_Account_Status (table: Account)
ALTER TABLE Account
    ADD CONSTRAINT Account_Account_Status
        FOREIGN KEY (Account_Status_id)
            REFERENCES Account_Status (id);

-- Reference: Account_User_Role (table: Account)
ALTER TABLE Account
    ADD CONSTRAINT Account_User_Role
        FOREIGN KEY (User_Role_id)
            REFERENCES User_Role (id);

-- Reference: Exchange_Rates_Valute_from (table: Exchange_Rates)
ALTER TABLE Exchange_Rates
    ADD CONSTRAINT Exchange_Rates_Valute_from
        FOREIGN KEY (valute_currency_from)
            REFERENCES Valute (currency_code);

-- Reference: Exchange_Rates_Valute_to (table: Exchange_Rates)
ALTER TABLE Exchange_Rates
    ADD CONSTRAINT Exchange_Rates_Valute_to
        FOREIGN KEY (Valute_currency_to)
            REFERENCES Valute (currency_code);

-- Reference: Expense_Account (table: Expense)
ALTER TABLE Expense
    ADD CONSTRAINT Expense_Account
        FOREIGN KEY (Account_id)
            REFERENCES Account (id);

-- Reference: Expense_Expense_Type (table: Expense)
ALTER TABLE Expense
    ADD CONSTRAINT Expense_Expense_Type
        FOREIGN KEY (color_status_expense)
            REFERENCES Expense_Type (color_status_expense);

-- Reference: Expense_Transaction (table: Expense)
ALTER TABLE Expense
    ADD CONSTRAINT Expense_Transaction
        FOREIGN KEY (Transaction_id)
            REFERENCES "Transaction" (id);

-- Reference: Expense_Type_Icon (table: Expense_Type)
ALTER TABLE Expense_Type
    ADD CONSTRAINT Expense_Type_Icon
        FOREIGN KEY (Icon_id)
            REFERENCES Icon (id);

-- Reference: Function_Subscription (table: Function)
ALTER TABLE "Function"
    ADD CONSTRAINT Function_Subscription
        FOREIGN KEY (subscription_id)
            REFERENCES Subscription (id);

-- Reference: Income_Sourses_Account (table: Income_Sourses)
ALTER TABLE Income_Sourses
    ADD CONSTRAINT Income_Sourses_Account
        FOREIGN KEY (Account_id)
            REFERENCES Account (id);

-- Reference: Income_Sourses_Income_Type (table: Income_Sourses)
ALTER TABLE Income_Sourses
    ADD CONSTRAINT Income_Sourses_Income_Type
        FOREIGN KEY (color_status_income_type)
            REFERENCES Income_Type (color_status_income_type);

-- Reference: Income_Sourses_Transaction (table: Income_Sourses)
ALTER TABLE Income_Sourses
    ADD CONSTRAINT Income_Sourses_Transaction
        FOREIGN KEY (Transaction_id)
            REFERENCES "Transaction" (id);

-- Reference: Income_Type_Icon (table: Income_Type)
ALTER TABLE Income_Type
    ADD CONSTRAINT Income_Type_Icon
        FOREIGN KEY (Icon_id)
            REFERENCES Icon (id);

-- Reference: Permission_Registry_Resourse (table: Permission_Registry)
ALTER TABLE Permission_Registry
    ADD CONSTRAINT Permission_Registry_Resourse
        FOREIGN KEY (Resourse_id)
            REFERENCES Resourse (id);

-- Reference: Permissions_by_User_Role_User_Role (table: Permissions_by_User_Role)
ALTER TABLE Permissions_by_User_Role
    ADD CONSTRAINT Permissions_by_User_Role_User_Role
        FOREIGN KEY (User_Role_id)
            REFERENCES User_Role (id);

-- Reference: Subscription_Payment_Account (table: Subscription_Payment)
ALTER TABLE Subscription_Payment
    ADD CONSTRAINT Subscription_Payment_Account
        FOREIGN KEY (Account_id)
            REFERENCES Account (id);

-- Reference: Subscription_Payment_Payment_Status (table: Subscription_Payment)
ALTER TABLE Subscription_Payment
    ADD CONSTRAINT Subscription_Payment_Payment_Status
        FOREIGN KEY (Payment_Status_id)
            REFERENCES Payment_Status (id);

-- Reference: Subscription_Payment_Subscription (table: Subscription_Payment)
ALTER TABLE Subscription_Payment
    ADD CONSTRAINT Subscription_Payment_Subscription
        FOREIGN KEY (Subscription_id)
            REFERENCES Subscription (id);

-- Reference: Transaction_Account (table: Transaction)
ALTER TABLE "Transaction"
    ADD CONSTRAINT Transaction_Account
        FOREIGN KEY (Account_id)
            REFERENCES Account (id);

-- Reference: Transaction_Transaction_Status (table: Transaction)
ALTER TABLE "Transaction"
    ADD CONSTRAINT Transaction_Transaction_Status
        FOREIGN KEY (Transaction_Status_id)
            REFERENCES Transaction_Status (id);

-- Reference: Transaction_Valute_from (table: Transaction)
ALTER TABLE "Transaction"
    ADD CONSTRAINT Transaction_Valute_from
        FOREIGN KEY (count_valute_code_from)
            REFERENCES Valute (currency_code);

-- Reference: Transaction_Valute_to (table: Transaction)
ALTER TABLE "Transaction"
    ADD CONSTRAINT Transaction_Valute_to
        FOREIGN KEY (count_valute_code_to)
            REFERENCES Valute (currency_code);

-- Reference: User_Permissions_Permission_Registry (table: Permissions_by_User_Role)
ALTER TABLE Permissions_by_User_Role
    ADD CONSTRAINT User_Permissions_Permission_Registry
        FOREIGN KEY (Permission_Registry_id)
            REFERENCES Permission_Registry (id);

-- Reference: Wallet_Account (table: Wallet)
ALTER TABLE Wallet
    ADD CONSTRAINT Wallet_Account
        FOREIGN KEY (Account_id)
            REFERENCES Account (id);

-- Reference: Wallet_Transaction (table: Wallet)
ALTER TABLE Wallet
    ADD CONSTRAINT Wallet_Transaction
        FOREIGN KEY (Transaction_id)
            REFERENCES "Transaction" (id);

-- Reference: Wallet_Type_Icon (table: Wallet_Type)
ALTER TABLE Wallet_Type
    ADD CONSTRAINT Wallet_Type_Icon
        FOREIGN KEY (Icon_id)
            REFERENCES Icon (id);

-- Reference: Wallet_Wallet_Type (table: Wallet)
ALTER TABLE Wallet
    ADD CONSTRAINT Wallet_Wallet_Type
        FOREIGN KEY (color_status_wallet)
            REFERENCES Wallet_Type (color_status_wallet);

ALTER TABLE Wallet
    ADD CONSTRAINT Wallet_Valute
        FOREIGN KEY (Valute_currency_code)
            REFERENCES Valute (currency_code);

ALTER TABLE Income_Sourses
    ADD CONSTRAINT Income_Sourses_Valute
        FOREIGN KEY (Valute_currency_code)
            REFERENCES Valute (currency_code);

COMMIT;

-- End of file.

-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
----------------------------------Insert Default Data------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
BEGIN TRANSACTION;

INSERT INTO Transaction_Status (id, status_name, description_status)
VALUES (1, 'Pending', 'Transaction is pending'),
       (2, 'Completed', 'Transaction is completed');


INSERT INTO Account_Status (id, name, description)
VALUES (1, 'Active', 'Account is active'),
       (2, 'Inactive', 'Account is inactive');


INSERT INTO User_Role (id, role_name, description)
VALUES (1, 'Admin', 'Administrator role'),
       (2, 'User', 'Regular user role');


INSERT INTO Account (id, name, surname, email, password, Account_Status_id, User_Role_id)
VALUES (1, 'John', 'Doe', 'john.doe@example.com', 'password123', 1, 1),
       (2, 'Jane', 'Smith', 'jane.smith@example.com', 'securepass', 1, 2);


INSERT INTO Valute (currency_code, country)
VALUES ('USD', 'United States'),
       ('EUR', 'Eurozone');


INSERT INTO Exchange_Rates (id, exchange_rate_coefficient, valute_currency_from, Valute_currency_to)
VALUES (1, 1.05, 'USD', 'EUR'),
       (2, 0.95, 'EUR', 'USD'),
       (3, 1.00, 'USD', 'USD'),
       (4, 1.00, 'EUR', 'EUR');


INSERT INTO Icon (id, icon_name, icon_url)
VALUES (1, 'Icon1', 'url1'),
       (2, 'Icon2', 'url2'),
       (3, 'Icon3', 'url3'),
       (4, 'Icon4', 'url4'),
       (5, 'Icon5', 'url5'),
       (6, 'Icon6', 'url6');


INSERT INTO Expense_Type (Icon_id, color_status_expense)
VALUES (1, 'GREY'),
       (2, 'ORANGE'),
       (3, 'RED');


INSERT INTO "Transaction" (id, count_valute_code_from, count_valute_code_to, Transaction_Status_id, Account_id, comment)
VALUES (1, 'USD', 'EUR', 1, 1, 'Transaction 1 comment'),
       (2, 'EUR', 'USD', 2, 2, 'Transaction 2 comment'),
       (3, 'EUR', 'USD', 2, 2, 'Transaction 2 comment');


INSERT INTO Expense (id, Account_id, Transaction_id,
                     Valute_currency_code, color_status_expense, current_balance,
                     planned_spending)
VALUES (1, 1, 1, 'USD', 'GREY', 0, 500),
       (2, 2, 2, 'EUR', 'ORANGE', 0, 1000),
       (3, 2, 3, 'EUR', 'RED', 0, 1000);


INSERT INTO Subscription (id, description, price)
VALUES (1, 'Subscription 1', 19.99),
       (2, 'Subscription 2', 29.99);


INSERT INTO "Function" (id, name, description, subscription_id)
VALUES (1, 'Function1', 'Description for Function1', 1),
       (2, 'Function2', 'Description for Function2', 2);

-- Добавляем данные в таблицу Income_Type
INSERT INTO Income_Type (Icon_id, color_status_income_type)
VALUES (1, 'BLUE'),
       (2, 'BLACK');


INSERT INTO Income_Sourses (id, Account_id, Transaction_id, Valute_currency_code,
                            color_status_income_type, current_income_sourses)
VALUES (1, 1, 1, 'USD', 'BLUE', 1500),
       (2, 2, 2, 'EUR', 'BLUE', 3000);


INSERT INTO Payment_Status (id, name, description)
VALUES (1, 'Paid', 'Payment is received'),
       (2, 'Unpaid', 'Payment is pending');


INSERT INTO Resourse (id, resourse_name, resourse_description)
VALUES (1, 500, 'Description for Resourse 1'),
       (2, 600, 'Description for Resourse 2');


INSERT INTO Permission_Registry (id, permission_name, Resourse_id)
VALUES (1, 100, 1),
       (2, 200, 2);


INSERT INTO Permissions_by_User_Role (id, resourse_name, Permission_Registry_id, User_Role_id)
VALUES (1, 300, 1, 1),
       (2, 400, 2, 2);


INSERT INTO Subscription_Payment (id, description, expiry_date, Account_id, Payment_Status_id, Subscription_id)
VALUES (1, 'Payment for Subscription 1', '2024-12-31', 1, 1, 1),
       (2, 'Payment for Subscription 2', '2024-12-31', 2, 2, 2);


INSERT INTO Wallet_Type (Icon_id, color_status_wallet)
VALUES (1, 'YELLOW'),
       (2, 'GREEN');


INSERT INTO Wallet (id, Account_id, Transaction_id,
                    Valute_currency_code, color_status_wallet,
                    current_balance)
VALUES (1, 1, 1, 'USD', 'YELLOW', 0),
       (2, 2, 2, 'EUR', 'GREEN', 0);

COMMIT;


-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
---------------------------------------Microsoft SQL-------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------


-- Retrieves the exchange rate coefficient from the Exchange_Rates table based on the provided source and target currency codes.
-- If the exchange rate is available, calculates and returns the converted amount.
-- If the exchange rate is not available, throws an error.
CREATE PROCEDURE ConvertCurrency @source_currency_code VARCHAR(3),
                                 @target_currency_code VARCHAR(3),
                                 @amount DECIMAL(7, 3),
                                 @converted_amount DECIMAL(7, 3) OUTPUT
AS
BEGIN
    DECLARE @exchange_rate DECIMAL(5, 3);

    SELECT @exchange_rate = exchange_rate_coefficient
    FROM Exchange_Rates
    WHERE valute_currency_from = @source_currency_code
      AND valute_currency_to = @target_currency_code;

    IF @exchange_rate IS NOT NULL
        BEGIN
            SET @converted_amount = @amount * @exchange_rate;
        END
    ELSE
        BEGIN
            THROW 51000, 'Exchange rate not available for the specified currencies', 1;
        END
END;
go


-- Retrieves planned spending, current balance, and valute code from the Expense table based on the provided account ID.
-- Calls the ConvertCurrency procedure to convert the provided amount to the expense's currency.
-- Calculates the percentage of the current amount to the total amount and sets the status color based on the percentage.
CREATE PROCEDURE GetCurrentExpenseColorByAmountOfMoney @amount_money DECIMAL(7, 3),
                                                       @valute_code VARCHAR(3),
                                                       @expense_owner_account_id INT,
                                                       @status_color VARCHAR(15) OUTPUT
AS
BEGIN
    DECLARE
        @planned_spending DECIMAL(7, 3),
        @current_balance DECIMAL(7, 3),
        @expense_valute_code VARCHAR(3),
        @converted_amount DECIMAL(7, 3),
        @percentageCurrentAmountOfTotalAmount INT;

    IF EXISTS (SELECT 1 FROM Account WHERE id = @expense_owner_account_id)
        BEGIN
            SELECT @expense_valute_code = Valute_currency_code,
                   @planned_spending = planned_spending,
                   @current_balance = current_balance
            FROM Expense
            WHERE Account_id = @expense_owner_account_id;
        END;

    EXEC ConvertCurrency
         @valute_code,
         @expense_valute_code,
         @amount_money,
         @converted_amount OUTPUT;

    SET @percentageCurrentAmountOfTotalAmount = (@current_balance + @converted_amount / @planned_spending) * 100;

    IF @percentageCurrentAmountOfTotalAmount >= 100
        SET @status_color = 'RED';
    ELSE
        IF @percentageCurrentAmountOfTotalAmount >= 70
            SET @status_color = 'ORANGE';
        ELSE
            IF @percentageCurrentAmountOfTotalAmount > 0
                SET @status_color = 'GREY';
            ELSE
                THROW 51000, 'Exchange rate not available for the specified currencies', 1;
END;
go


-- Retrieves valute codes and IDs related to the expense and wallet.
-- Calls GetCurrentExpenseColorByAmountOfMoney to get the new status color after the transfer.
-- Calls ConvertCurrency to convert the amount from the wallet's currency to the expense's currency.
-- Updates the expense's balance and color status and deducts the amount from the wallet's balance.
CREATE PROCEDURE MakeTransferFromWalletToExpense @account_id_owner_expense INT,
                                                 @account_id_owner_wallet INT,
                                                 @amount_money DECIMAL(7, 3)
AS
BEGIN
    DECLARE
        @wallet_valute_code VARCHAR(3),
        @expense_valute_code VARCHAR(3),
        @id_owner_expense INT,
        @converted_amount DECIMAL(7, 3),
        @new_status_color VARCHAR(15);

    SELECT @id_owner_expense = Account_id
    FROM Expense
    WHERE Account_id = @account_id_owner_expense;

    IF EXISTS (SELECT 1 FROM Wallet WHERE Account_id = @account_id_owner_wallet)
        AND @id_owner_expense IS NOT NULL
        BEGIN
            SELECT @expense_valute_code = Valute_currency_code
            FROM Expense
            WHERE Account_id = @account_id_owner_expense;

            SELECT @wallet_valute_code = Valute_currency_code
            FROM Wallet
            WHERE Account_id = @account_id_owner_expense;

            EXEC GetCurrentExpenseColorByAmountOfMoney
                 @amount_money,
                 @wallet_valute_code,
                 @account_id_owner_expense,
                 @new_status_color OUTPUT;

            EXEC ConvertCurrency
                 @wallet_valute_code,
                 @expense_valute_code,
                 @amount_money,
                 @converted_amount OUTPUT;

            UPDATE Expense
            SET current_balance += @converted_amount,
                color_status_expense = @new_status_color
            WHERE Account_id = @id_owner_expense;

            UPDATE Wallet
            SET current_balance -= @amount_money
            WHERE Account_id = @id_owner_expense;
        END
    ELSE
        BEGIN
            THROW 51000, 'This user does not have access to manage data consumption', 1;
        END
END;
GO


-- Checks the updated balance after a wallet update.
-- If the balance becomes negative, raises an error indicating insufficient funds for the transaction.
CREATE OR ALTER TRIGGER Wallet_Balance_Check
    ON Wallet
    AFTER UPDATE
    AS
BEGIN
    DECLARE @account_id INT, @amount_money DECIMAL(7, 3);

    SELECT @account_id = Account_id, @amount_money = current_balance
    FROM inserted;

    IF (@amount_money < 0)
        BEGIN
            RAISERROR ('Insufficient funds for the transaction.', 16, 1);
            ROLLBACK;
        END
END;

-- Updates the color status of an expense after an insert or update.
-- Sets the color based on the current balance compared to the planned spending. If the balance is 0, it's
-- 'GREY'; if it's above 70%, it's 'ORANGE'; if it's equal to or above planned spending, it's 'RED'.
    CREATE OR ALTER TRIGGER Expense_Color_Update
        ON Expense
        AFTER INSERT, UPDATE
        AS
    BEGIN
        UPDATE e
        SET color_status_expense =
                CASE
                    WHEN e.current_balance = 0 THEN 'GREY'
                    WHEN e.current_balance > e.planned_spending * 0.7 THEN 'ORANGE'
                    WHEN e.current_balance >= e.planned_spending THEN 'RED'
                    ELSE e.color_status_expense
                    END
        FROM Expense e
                 INNER JOIN inserted i ON e.id = i.id;
    END;

        -----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
---------------------------------------Oracle SQL----------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-- Retrieves the exchange rate coefficient from the Exchange_Rates table based on the provided source and target currency codes.
-- If the exchange rate is available, calculates and returns the converted amount.
-- If the exchange rate is not available, throws an error.
CREATE OR REPLACE PROCEDURE ConvertCurrency(
    source_currency_code IN VARCHAR2,
    target_currency_code IN VARCHAR2,
    amount IN NUMBER,
    converted_amount OUT NUMBER
) AS
    exchange_rate NUMBER;
BEGIN
    SELECT exchange_rate_coefficient
    INTO exchange_rate
    FROM Exchange_Rates
    WHERE valute_currency_from = source_currency_code
      AND valute_currency_to = target_currency_code;

    IF exchange_rate IS NOT NULL THEN
        converted_amount := amount * exchange_rate;
    ELSE
        RAISE_APPLICATION_ERROR(-51000, 'Exchange rate not available for the specified currencies');
    END IF;
END;


-- Retrieves planned spending, current balance, and valute code from the Expense table based on the provided account ID.
-- Calls the ConvertCurrency procedure to convert the provided amount to the expense's currency.
-- Calculates the percentage of the current amount to the total amount and sets the status color based on the percentage.
CREATE OR REPLACE PROCEDURE GetCurrentExpenseColorByAmountOfMoney(
    amount_money IN NUMBER,
    valute_code IN VARCHAR2,
    expense_owner_account_id IN NUMBER,
    status_color OUT VARCHAR2
) AS
    planned_spending                     NUMBER;
    current_balance                      NUMBER;
    expense_valute_code                  VARCHAR2(3);
    converted_amount                     NUMBER;
    percentageCurrentAmountOfTotalAmount NUMBER;
BEGIN
    IF EXISTS (SELECT 1 FROM Account WHERE id = expense_owner_account_id) THEN
        SELECT Valute_currency_code, planned_spending, current_balance
        INTO expense_valute_code, planned_spending, current_balance
        FROM Expense
        WHERE Account_id = expense_owner_account_id;
    END
        IF;

    ConvertCurrency(valute_code, expense_valute_code, amount_money, converted_amount);

    percentageCurrentAmountOfTotalAmount := (current_balance + converted_amount / planned_spending) * 100;

    IF percentageCurrentAmountOfTotalAmount >= 100 THEN
        status_color := 'RED';
    ELSIF percentageCurrentAmountOfTotalAmount >= 70 THEN
        status_color := 'ORANGE';
    ELSIF percentageCurrentAmountOfTotalAmount > 0 THEN
        status_color := 'GREY';
    ELSE
        RAISE_APPLICATION_ERROR(-51000, 'Exchange rate not available for the specified currencies');
    END IF;
END;



-- Retrieves valute codes and IDs related to the expense and wallet.
-- Calls GetCurrentExpenseColorByAmountOfMoney to get the new status color after the transfer.
-- Calls ConvertCurrency to convert the amount from the wallet's currency to the expense's currency.
-- Updates the expense's balance and color status and deducts the amount from the wallet's balance.
CREATE OR REPLACE PROCEDURE MakeTransferFromWalletToExpense(
    account_id_owner_expense IN NUMBER,
    account_id_owner_wallet IN NUMBER,
    amount_money IN NUMBER
) AS
    wallet_valute_code  VARCHAR2(3);
    expense_valute_code VARCHAR2(3);
    id_owner_expense    NUMBER;
    converted_amount    NUMBER;
    new_status_color    VARCHAR2(15);
BEGIN
    SELECT Account_id
    INTO id_owner_expense
    FROM Expense
    WHERE Account_id = account_id_owner_expense;

    IF EXISTS (SELECT 1 FROM Wallet WHERE Account_id = account_id_owner_wallet) AND id_owner_expense IS NOT NULL THEN
        SELECT Valute_currency_code
        INTO expense_valute_code
        FROM Expense
        WHERE Account_id = account_id_owner_expense;

        SELECT Valute_currency_code
        INTO wallet_valute_code
        FROM Wallet
        WHERE Account_id = account_id_owner_expense;

        GetCurrentExpenseColorByAmountOfMoney(amount_money, wallet_valute_code, account_id_owner_expense,
                                              new_status_color);

        ConvertCurrency(wallet_valute_code, expense_valute_code, amount_money, converted_amount);

        UPDATE Expense
        SET current_balance      = current_balance + converted_amount,
            color_status_expense = new_status_color
        WHERE Account_id = id_owner_expense;

        UPDATE Wallet
        SET current_balance = current_balance - amount_money
        WHERE Account_id = id_owner_expense;
    ELSE
        RAISE_APPLICATION_ERROR(-51000, 'This user does not have access to manage data consumption');
    END IF;
END;


-- Checks the updated balance after a wallet update.
-- If the balance becomes negative, raises an error indicating insufficient funds for the transaction.
CREATE OR REPLACE TRIGGER Wallet_Balance_Check
    AFTER
        UPDATE
    ON Wallet
    FOR EACH ROW
DECLARE
    amount_money NUMBER;
BEGIN
    amount_money := :NEW.current_balance;

    IF amount_money < 0 THEN
        RAISE_APPLICATION_ERROR(-51000, 'Insufficient funds for the transaction.');
    END IF;
END;


-- Updates the color status of an expense after an insert or update.
-- Sets the color based on the current balance compared to the planned spending. If the balance is 0, 
--     it's 'GREY'; if it's above 70%, it's 'ORANGE'; if it's equal to or above planned spending, it's 'RED'.
CREATE OR REPLACE TRIGGER Expense_Color_Update
    AFTER INSERT OR
        UPDATE
    ON Expense
    FOR EACH ROW
BEGIN
    IF :NEW.current_balance = 0 THEN
        :NEW.color_status_expense := 'GREY';
    ELSIF
        :NEW.current_balance > :NEW.planned_spending * 0.7 THEN
        :NEW.color_status_expense := 'ORANGE';
    ELSIF :NEW.current_balance >= :NEW.planned_spending THEN
        :NEW.color_status_expense := 'RED';
    END IF;
END;




-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
---------------------------------------Microsoft SQL Tests-------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------


DECLARE @status_color VARCHAR(15);
EXEC getCurrentExpenseColorByAmountOfMoney
     @amount_money = 500.0,
     @valute_code = 'USD',
     @expense_owner_account_id = 1,
     @status_color = @status_color OUTPUT;

PRINT @status_color;


DECLARE @converted_amount DECIMAL(7, 3);
EXEC ConvertCurrency
     @source_currency_code = 'USD',
     @target_currency_code = 'EUR',
     @amount = 100.0,
     @converted_amount = @converted_amount OUTPUT;

PRINT 'Converted Amount: ' + CAST(@converted_amount AS VARCHAR(50));


exec makeTransferFromWalletToExpense 1, 1, 300.0;

UPDATE Wallet SET current_balance = -100 WHERE id = 1;

UPDATE Expense SET current_balance = 800, planned_spending = 1000 WHERE id = 1;



-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
---------------------------------------Oracle SQL Tests----------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------


DECLARE
    converted_amount NUMBER;
    status_color VARCHAR2(15);
BEGIN
    ConvertCurrency('USD', 'EUR', 100, converted_amount);
    DBMS_OUTPUT.PUT_LINE('Converted Amount: ' || converted_amount);
END;

DECLARE
    amount_money NUMBER := 50;
    valute_code VARCHAR2(3) := 'USD';
    expense_owner_account_id NUMBER := 1;
    status_color VARCHAR2(15);
BEGIN
    GetCurrentExpenseColorByAmountOfMoney(amount_money, valute_code, expense_owner_account_id, status_color);
    DBMS_OUTPUT.PUT_LINE('Status Color: ' || status_color);
END;

DECLARE
    account_id_owner_expense NUMBER := 1;
    account_id_owner_wallet NUMBER := 1;
    amount_money NUMBER := 100;
BEGIN
    MakeTransferFromWalletToExpense(account_id_owner_expense, account_id_owner_wallet, amount_money);
END;


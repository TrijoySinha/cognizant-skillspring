SET SERVEROUTPUT ON;

--------------------------------------------------
-- Exercise 3 - Scenario 1
-- Process monthly interest
-- Add 1% interest to savings accounts
--------------------------------------------------

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
AS

BEGIN

    UPDATE Accounts

    SET Balance = Balance + (Balance * 0.01)

    WHERE AccountType = 'Savings';


    COMMIT;


    DBMS_OUTPUT.PUT_LINE(
        'Monthly interest processed successfully'
    );

END;
/
--------------------------------------------------


-- Execute Procedure

BEGIN

    ProcessMonthlyInterest;

END;
/
--------------------------------------------------



--------------------------------------------------
-- Exercise 3 - Scenario 2
-- Update employee salary with bonus
--------------------------------------------------

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus
(
    p_DepartmentID IN NUMBER,
    p_BonusPercent IN NUMBER
)

AS

BEGIN

    UPDATE Employees

    SET Salary = Salary + 
        (Salary * p_BonusPercent / 100)

    WHERE DepartmentID = p_DepartmentID;


    COMMIT;


    DBMS_OUTPUT.PUT_LINE(
        'Employee bonus updated successfully'
    );

END;
/
--------------------------------------------------


-- Execute Procedure

BEGIN

    UpdateEmployeeBonus(
        101,
        10
    );

END;
/
--------------------------------------------------



--------------------------------------------------
-- Exercise 3 - Scenario 3
-- Transfer money between accounts
--------------------------------------------------

CREATE OR REPLACE PROCEDURE TransferFunds
(
    p_FromAccount IN NUMBER,
    p_ToAccount   IN NUMBER,
    p_Amount      IN NUMBER
)

AS

    v_Balance NUMBER;


BEGIN


    SELECT Balance

    INTO v_Balance

    FROM Accounts

    WHERE AccountID = p_FromAccount;



    IF v_Balance >= p_Amount THEN


        UPDATE Accounts

        SET Balance = Balance - p_Amount

        WHERE AccountID = p_FromAccount;



        UPDATE Accounts

        SET Balance = Balance + p_Amount

        WHERE AccountID = p_ToAccount;



        COMMIT;


        DBMS_OUTPUT.PUT_LINE(
            'Funds transferred successfully'
        );


    ELSE


        DBMS_OUTPUT.PUT_LINE(
            'Insufficient balance'
        );


    END IF;


END;
/
--------------------------------------------------


-- Execute Procedure

BEGIN

    TransferFunds(
        1001,
        1002,
        500
    );

END;
/
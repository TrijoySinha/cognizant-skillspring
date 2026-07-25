SET SERVEROUTPUT ON;

--------------------------------------------------
-- Exercise 1 - Scenario 1
-- Apply 1% discount on loan interest
-- for customers above 60 years
--------------------------------------------------

DECLARE
BEGIN

    FOR rec IN (
        SELECT 
            c.CustomerID,
            c.Age,
            l.LoanID,
            l.InterestRate
        FROM Customers c
        JOIN Loans l
        ON c.CustomerID = l.CustomerID
    )
    LOOP

        IF rec.Age > 60 THEN

            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE LoanID = rec.LoanID;

            DBMS_OUTPUT.PUT_LINE(
                '1% interest discount applied for Customer ID: '
                || rec.CustomerID
            );

        END IF;

    END LOOP;

    COMMIT;

END;
/
--------------------------------------------------


--------------------------------------------------
-- Exercise 1 - Scenario 2
-- Set VIP status for customers
-- having balance greater than 10000
--------------------------------------------------

DECLARE
BEGIN

    FOR rec IN (
        SELECT 
            CustomerID,
            Balance
        FROM Customers
    )
    LOOP

        IF rec.Balance > 10000 THEN

            UPDATE Customers
            SET IsVIP = 'Y'
            WHERE CustomerID = rec.CustomerID;

            DBMS_OUTPUT.PUT_LINE(
                'Customer ID '
                || rec.CustomerID
                || ' promoted to VIP'
            );

        END IF;

    END LOOP;

    COMMIT;

END;
/
--------------------------------------------------


--------------------------------------------------
-- Exercise 1 - Scenario 3
-- Print reminders for loans due
-- within next 30 days
--------------------------------------------------

DECLARE
BEGIN

    FOR rec IN (

        SELECT
            c.Name,
            l.LoanID,
            l.DueDate

        FROM Customers c

        JOIN Loans l
        ON c.CustomerID = l.CustomerID

        WHERE l.DueDate 
        BETWEEN SYSDATE 
        AND SYSDATE + 30

    )
    LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Customer '
            || rec.Name
            || ' has Loan ID '
            || rec.LoanID
            || ' due on '
            || TO_CHAR(rec.DueDate,'DD-MON-YYYY')
        );

    END LOOP;

END;
/
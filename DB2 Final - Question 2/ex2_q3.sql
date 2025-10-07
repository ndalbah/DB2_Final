CREATE OR REPLACE PROCEDURE DisplayCustOfSalesPerson (p_empid IN EMPLOYEE.EMPLOYEE_ID%TYPE)
IS
    CURSOR cust_cursor IS
        SELECT CUSTOMER.CUSTOMER_ID, CUSTOMER.NAME, CUSTOMER.CITY, CUSTOMER.STATE, CUSTOMER.PHONE_NUMBER
        FROM CUSTOMER
        WHERE CUSTOMER.SALESPERSON_ID = p_empid;

    cust_rec cust_cursor%rowtype;
BEGIN
    OPEN cust_cursor;
    DBMS_OUTPUT.PUT_LINE('========================================================================');
    DBMS_OUTPUT.PUT_LINE('Cust ID         Name                City       State       Phone Number');
    DBMS_OUTPUT.PUT_LINE('========================================================================');
    LOOP
        FETCH cust_cursor INTO cust_rec;
        
        EXIT WHEN cust_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(rpad(cust_rec.customer_id,15,' ') || 
                            rpad(cust_rec.name,20,' ') ||
                            rpad(cust_rec.city,15,' ') ||
                            rpad(cust_rec.state,15,' ') ||
                            cust_rec.phone_number);
    END LOOP;

    CLOSE cust_cursor;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No customers found for the given sales representative.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
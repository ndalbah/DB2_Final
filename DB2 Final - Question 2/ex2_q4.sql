SET SERVEROUTPUT ON;
SET VERIFY OFF;

-- Accept user input for employee ID
ACCEPT s_empid PROMPT 'Enter the employee ID: ';

DECLARE
    v_empid EMPLOYEE.EMPLOYEE_ID%TYPE := &s_empid;
    v_job_id EMPLOYEE.JOB_ID%TYPE;
    v_customer_count NUMBER;
BEGIN
    DisplayCustOfSalesPerson(v_empid);

    SELECT JOB_ID INTO v_job_id
    FROM EMPLOYEE
    WHERE EMPLOYEE_ID = v_empid;

    IF v_job_id = 670 THEN
        v_customer_count := NbCustOfSalesPerson(v_empid);
        DBMS_OUTPUT.PUT_LINE('========================================================================');
        DBMS_OUTPUT.PUT_LINE('Total number of customers: ' || v_customer_count);
        DBMS_OUTPUT.PUT_LINE('========================================================================');
    ELSE
        DBMS_OUTPUT.PUT_LINE('========================================================================');
        DBMS_OUTPUT.PUT_LINE('The employee: ' || v_empid || ' is not sale representative.');
        DBMS_OUTPUT.PUT_LINE('========================================================================');
    END IF;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Value entered must be a numeric value.');
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found with the entered ID.');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE ListOfEmpOfAMan (
    p_manager_id employee.manager_id%type
)
IS
    CURSOR emp_cursor IS
        SELECT e.last_name, e.salary, e.department_id, d.name, j.function
        FROM employee e
        JOIN department d ON e.department_id = d.department_id
        JOIN job j ON e.job_id = j.job_id
        WHERE e.manager_id = p_manager_id;

    total_salary NUMBER := 0;
    total_count  NUMBER := 0;
    emp_rec emp_cursor%rowtype;
BEGIN
    OPEN emp_cursor;
    FETCH emp_cursor INTO emp_rec;

    DBMS_OUTPUT.PUT_LINE('The employees who are under the responsibility of ' || p_manager_id || ' are: ');
    DBMS_OUTPUT.PUT_LINE('========================================================================');
    DBMS_OUTPUT.PUT_LINE('Last Name      Salary      Dept. ID       Dept. Name       Job Title');
    DBMS_OUTPUT.PUT_LINE('========================================================================');

    WHILE emp_cursor%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE(rpad(emp_rec.last_name,15,' ') || 
                            rpad(emp_rec.salary,15,' ') ||
                            rpad(emp_rec.department_id,15,' ') ||
                            rpad(emp_rec.name,15,' ') ||
                            emp_rec.name);

        total_salary := total_salary + emp_rec.salary;
        total_count := total_count + 1;
        FETCH emp_cursor INTO emp_rec;

    END LOOP;

    CLOSE emp_cursor;

    DBMS_OUTPUT.PUT_LINE('========================================================================');

    DBMS_OUTPUT.PUT_LINE('Total Employees: ' || total_count);
    DBMS_OUTPUT.PUT_LINE('Total Salary: ' || total_salary);

EXCEPTION
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('No employees found under the responsibility of the manager entered.');
    WHEN value_error THEN
        DBMS_OUTPUT.PUT_LINE('The value entered must be a number.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
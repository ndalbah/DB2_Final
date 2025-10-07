SET SERVEROUTPUT ON;
SET VERIFY OFF 

ACCEPT s_manager_id PROMPT 'Enter the manager ID: ';

DECLARE
    v_manager_id NUMBER := &s_manager_id;
BEGIN
    ListOfEmpOfAMan(v_manager_id);
END;
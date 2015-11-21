ALTER TRIGGER F15C2_auth_PK_trig DISABLE;
ALTER TABLE F15C2_emp DISABLE CONSTRAINT F15C2_emp_F15C2_auth_FK;
TRUNCATE TABLE F15C2_auth;
INSERT INTO F15C2_auth(auth_id, right) VALUES (1, 'view');
INSERT INTO F15C2_auth(auth_id, right) VALUES (2, 'edit');
INSERT INTO F15C2_auth(auth_id, right) VALUES (3, NULL);
ALTER TABLE F15C2_emp ENABLE CONSTRAINT F15C2_emp_F15C2_auth_FK;
ALTER TRIGGER F15C2_auth_PK_trig ENABLE;
--select * from f15c2_auth;

ALTER TABLE F15C2_emp DISABLE CONSTRAINT F15C2_emp_F15C2_lab_FK;
ALTER TRIGGER F15C2_lab_PK_trig DISABLE;
TRUNCATE TABLE F15C2_lab;
INSERT INTO F15C2_lab (lab_id, lab_code, lab_name) VALUES (1, 'AL', 'Administrative Laboratory');
INSERT INTO F15C2_lab (lab_id, lab_code, lab_name) VALUES (2, 'SISL', 'Signal and Information Sciences Laboratory');
INSERT INTO F15C2_lab (lab_id, lab_code, lab_name) VALUES (3, 'SGL', 'Space and Geophysics Laboratory');
ALTER TRIGGER F15C2_lab_PK_trig ENABLE;
ALTER TABLE F15C2_emp ENABLE CONSTRAINT F15C2_emp_F15C2_lab_FK;
--select * from f15c2_lab;

ALTER TABLE F15C2_approver DISABLE CONSTRAINT F15C2_approver_F15C2_emp_FK;
ALTER TABLE F15C2_rfe DISABLE CONSTRAINT F15C2_rfe_F15C2_emp_FK;
ALTER TABLE F15C2_contact DISABLE CONSTRAINT F15C2_contact_F15C2_emp_FK;
ALTER TABLE F15C2_comment DISABLE CONSTRAINT F15C2_comment_F15C2_emp_FK;
ALTER TRIGGER F15C2_emp_PK_trig DISABLE;
TRUNCATE TABLE F15C2_emp;
INSERT INTO F15C2_emp (emp_id, emp_name, f15c2_lab_lab_id, f15c2_auth_auth_id, 
  emp_email, emp_office, emp_phone, emp_status, status_eff_date, sys_admin_flag, 
  lab_dir_flag, exec_dir_flag, chairperson_flag) VALUES
    (1, 'SMITH', 2, 1, 'smith@gmail.com', 'A207', '512-0392', 'A', '17-DEC-1980', 'Y', 'N', 'N', 'N');
INSERT INTO F15C2_emp (emp_id, emp_name, f15c2_lab_lab_id, f15c2_auth_auth_id, 
  emp_email, emp_office, emp_phone, emp_status, status_eff_date, sys_admin_flag, 
  lab_dir_flag, exec_dir_flag, chairperson_flag) VALUES
    (2, 'ALLEN', 2, 1, 'allen@gmail.com', 'A701', '512-0562', 'A', '17-FEB-1990', 'N', 'Y', 'N', 'N');
INSERT INTO F15C2_emp (emp_id, emp_name, f15c2_lab_lab_id, f15c2_auth_auth_id, 
  emp_email, emp_office, emp_phone, emp_status, status_eff_date, sys_admin_flag, 
  lab_dir_flag, exec_dir_flag, chairperson_flag) VALUES
    (3, 'WARD', 1, 2, 'mard@icloud.com', 'A705', '512-7562', 'A', '28-JAN-2000', 'N', 'N', 'Y', 'N');
INSERT INTO F15C2_emp (emp_id, emp_name, f15c2_lab_lab_id, f15c2_auth_auth_id, 
  emp_email, emp_office, emp_phone, emp_status, status_eff_date, sys_admin_flag, 
  lab_dir_flag, exec_dir_flag, chairperson_flag)  VALUES
    (4, 'JONES', 1, 2, 'jones@gmail.com', 'B205', '512-7321', 'A', '02-JUL-2010', 'N', 'N', 'N', 'Y');
INSERT INTO F15C2_emp (emp_id, emp_name, f15c2_lab_lab_id, f15c2_auth_auth_id, 
  emp_email, emp_office, emp_phone, emp_status, status_eff_date, sys_admin_flag, 
  lab_dir_flag, exec_dir_flag, chairperson_flag) VALUES
    (5, 'MARTIN', 2, 3, 'martin@gmail.com', 'B705', '512-9481', 'I', '02-JUL-2010', 'N', 'N', 'N', 'N');
INSERT INTO F15C2_emp  (emp_id, emp_name, f15c2_lab_lab_id, f15c2_auth_auth_id, 
  emp_email, emp_office, emp_phone, emp_status, status_eff_date, sys_admin_flag, 
  lab_dir_flag, exec_dir_flag, chairperson_flag) VALUES
    (6, 'CHUANG', 3, 3, 'chuang@gmail.com', 'C331', '210-0392', 'I', '06-JUN-2010', 'N', 'N', 'N', 'N');
INSERT INTO F15C2_emp  (emp_id, emp_name, f15c2_lab_lab_id, f15c2_auth_auth_id, 
  emp_email, emp_office, emp_phone, emp_status, status_eff_date, sys_admin_flag, 
  lab_dir_flag, exec_dir_flag, chairperson_flag) VALUES
    (7, 'RELLENMEYER', 3, 1, 'rellenmeyer@gmail.com', 'C347', '210-7893', 'A', '17-DEC-1980', 'Y', 'N', 'N', 'N');
INSERT INTO F15C2_emp  (emp_id, emp_name, f15c2_lab_lab_id, f15c2_auth_auth_id, 
  emp_email, emp_office, emp_phone, emp_status, status_eff_date, sys_admin_flag, 
  lab_dir_flag, exec_dir_flag, chairperson_flag) VALUES
    (8, 'SCOTT', 3, 1, 'scott@gmail.com', 'C429', '210-5432', 'A', '15-MAR-1985', 'N', 'Y', 'N', 'N');
INSERT INTO F15C2_emp  (emp_id, emp_name, f15c2_lab_lab_id, f15c2_auth_auth_id, 
  emp_email, emp_office, emp_phone, emp_status, status_eff_date, sys_admin_flag, 
  lab_dir_flag, exec_dir_flag, chairperson_flag) VALUES
    (9, 'LEE', 3, 3, 'lee@gmail.com', 'C312', '210-1337', 'A', '01-AUG-1995', 'N', 'N', 'N', 'N');
INSERT INTO F15C2_emp (emp_id, emp_name, f15c2_lab_lab_id, f15c2_auth_auth_id, 
  emp_email, emp_office, emp_phone, emp_status, status_eff_date, sys_admin_flag, 
  lab_dir_flag, exec_dir_flag, chairperson_flag) VALUES
    (10, 'GUTIEREZ', 3, 3, 'gutierez@gmail.com', 'C311', '210-8736', 'A', '19-DEC-1990', 'N', 'N', 'N', 'N');
ALTER TABLE F15C2_approver ENABLE CONSTRAINT F15C2_approver_F15C2_emp_FK;
ALTER TABLE F15C2_rfe ENABLE CONSTRAINT F15C2_rfe_F15C2_emp_FK;
ALTER TABLE F15C2_contact ENABLE CONSTRAINT F15C2_contact_F15C2_emp_FK;
ALTER TABLE F15C2_comment ENABLE CONSTRAINT F15C2_comment_F15C2_emp_FK;
ALTER TRIGGER F15C2_emp_PK_trig ENABLE;
--select * from f15c2_emp;

ALTER TABLE F15C2_history DISABLE CONSTRAINT F15C2_history_F15C2_status_FK;
ALTER TABLE F15C2_rfe DISABLE CONSTRAINT F15C2_rfe_F15C2_status_FK;
ALTER TRIGGER F15C2_status_PK_trig DISABLE;
TRUNCATE TABLE F15C2_status;
INSERT INTO F15C2_status (status_id, rfe_status, description) VALUES 
    (1, 'Entered', 'The RFE has been created but has not yet been submitted for approval.');
INSERT INTO F15C2_status (status_id, rfe_status, description) VALUES 
    (2, 'Submitted', 'The RFE has been submitted to the Lab System Administrator for approval.');
INSERT INTO F15C2_status (status_id, rfe_status, description) VALUES 
    (3, 'Returned', 'The RFE has been returned for further information or clarification. Once Submitted again, it will follow the same routing as an Entered RFE.');
INSERT INTO F15C2_status (status_id, rfe_status, description) VALUES 
    (4, 'Recalled', 'The requestor has recalled an RFE that has not yet reached final approval. Once Submitted again, it will follow the same routing as an Entered RFE.');
INSERT INTO F15C2_status (status_id, rfe_status, description) VALUES 
    (5, 'Rejected', 'The RFE has been rejected and cannot be implemented.');
INSERT INTO F15C2_status (status_id, rfe_status, description) VALUES 
    (6, 'SA Approved', 'The Lab System Administrator has approved the RFE; it has been submitted for Lab Director approval.');
INSERT INTO F15C2_status (status_id, rfe_status, description) VALUES 
    (7, 'LD Approved', 'The Lab Director has approved the RFE; it has been submitted for Network Security Panel approval.');
INSERT INTO F15C2_status (status_id, rfe_status, description) VALUES 
    (8, 'CH Approved', 'The Chairperson has approved the RFE; it has been submitted to the Executive Director.');
INSERT INTO F15C2_status (status_id, rfe_status, description) VALUES 
    (9, 'Final Approval', 'The Executive Director Office has given final approval for the RFE and it may be implemented.');
ALTER TABLE F15C2_history ENABLE CONSTRAINT F15C2_history_F15C2_status_FK;
ALTER TABLE F15C2_rfe ENABLE CONSTRAINT F15C2_rfe_F15C2_status_FK;
ALTER TRIGGER F15C2_status_PK_trig ENABLE;
--select * from f15c2_status;

ALTER TABLE F15C2_contact DISABLE CONSTRAINT F15C2_contact_F15C2_role_FK;
ALTER TRIGGER F15C2_role_PK_trig DISABLE;
TRUNCATE TABLE F15C2_role;
INSERT INTO F15C2_role (role_id, emp_role, description) VALUES 
    (1, 'Requester', 'The employee who created the RFE.');
INSERT INTO F15C2_role (role_id, emp_role, description) VALUES 
    (2, 'FYI Reviewer', 'An employee with peripheral interests; will get automatically notified at certain stages.');
INSERT INTO F15C2_role (role_id, emp_role, description) VALUES 
    (3, 'Sys Admin Approver', 'First round approver for new RFEs in their lab.');
INSERT INTO F15C2_role (role_id, emp_role, description) VALUES 
    (4, 'Lab Director Approver', 'Second round approver for new RFEs in their lab.');
INSERT INTO F15C2_role (role_id, emp_role, description) VALUES 
    (5, 'Chairperson Approver', 'Network Security Panel approver.');
INSERT INTO F15C2_role (role_id, emp_role, description) VALUES 
    (6, 'Exec Dir Approver', 'Final round approver for all RFEs.');
ALTER TABLE F15C2_contact ENABLE CONSTRAINT F15C2_contact_F15C2_role_FK;
ALTER TRIGGER F15C2_role_PK_trig ENABLE;
--select * from f15c2_role;

--add some tasks
ALTER TRIGGER F15C2_task_PK_trig DISABLE;
ALTER TABLE F15C2_rfe_task DISABLE CONSTRAINT F15C2_rfe_task_F15C2_task_FK;
TRUNCATE TABLE F15C2_task;
INSERT INTO F15C2_task(task_id, task_abbreviation, task_description) 		VALUES (1, '9595-2-1-1', 'description of task 1');
INSERT INTO F15C2_task(task_id, task_abbreviation, task_description) 		VALUES (2, 'Flight Test', 'description of task 2');
INSERT INTO F15C2_task(task_id, task_abbreviation, task_description) 		VALUES (3, 'Ocean Scans', 'description of task 3');
INSERT INTO F15C2_task(task_id, task_abbreviation, task_description) 		VALUES (4, '1337-2-3-1', 'description of task 4');
INSERT INTO F15C2_task(task_id, task_abbreviation, task_description) 		VALUES (5, 'Pen Test', 'description of task 5');
ALTER TABLE F15C2_rfe_task ENABLE CONSTRAINT F15C2_rfe_task_F15C2_task_FK;
ALTER TRIGGER F15C2_task_PK_trig ENABLE;
--select * from f15c2_task;


COMMIT;

--INSERT INTO F15C2_rfe (rfe_id, f15c2_emp_emp_id, f15c2_status_status_id, status_eff_date, explanation, alt_protections) VALUES (1, 1, 1, SYSDATE, 'explanation', 'protections');
    
--UPDATE f15c2_rfe SET F15C2_STATUS_STATUS_ID = 9 WHERE rfe_id = 123;
--delete from f15c2_rfe where f15c2_emp_emp_id = 1;
--select * from f15c2_emp;
--select * from f15c2_rfe;
--select * from f15c2_history;
--select * from f15c2_contact;

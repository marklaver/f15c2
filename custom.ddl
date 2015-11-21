--Validate employee update

CREATE OR REPLACE trigger f15c2_emp_validate
BEFORE UPDATE OF sys_admin_flag, lab_dir_flag, exec_dir_flag, chairperson_flag
ON f15c2_emp
FOR EACH ROW
BEGIN
	IF :NEW.exec_dir_flag = 'Y' AND :NEW.chairperson_flag = 'Y' THEN
		RAISE_APPLICATION_ERROR(-20001, 'Cannot hold conflicting roles.');
  END IF;
END;
/

--build contact list
    
create or replace trigger F15C2_contact_list
after insert on F15C2_rfe
for each row
declare
  lab_id      INTEGER;
  requester   INTEGER;
  lab_dir     INTEGER;
  sys_admin   INTEGER;
  chair       INTEGER;
  exec_dir    INTEGER;
begin
  requester := :new.f15c2_emp_emp_id;
  select e.f15c2_lab_lab_id into lab_id from f15c2_emp e where requester = e.emp_id;
  select emp_id into lab_dir from f15c2_emp where lab_id = f15c2_lab_lab_id AND lab_dir_flag = 'Y';
  select emp_id into sys_admin from f15c2_emp where lab_id = f15c2_lab_lab_id AND sys_admin_flag = 'Y';
  select emp_id into chair from f15c2_emp where chairperson_flag = 'Y';
  select emp_id into exec_dir from f15c2_emp where exec_dir_flag = 'Y';

  insert into f15c2_contact (f15c2_rfe_rfe_id, f15c2_emp_emp_id, f15c2_role_role_id) 
    VALUES (:new.rfe_id, requester, 1);
  insert into f15c2_contact (f15c2_rfe_rfe_id, f15c2_emp_emp_id, f15c2_role_role_id) 
    VALUES (:new.rfe_id, lab_dir, 4);
  insert into f15c2_contact (f15c2_rfe_rfe_id, f15c2_emp_emp_id, f15c2_role_role_id) 
    VALUES (:new.rfe_id, sys_admin, 3);
  insert into f15c2_contact (f15c2_rfe_rfe_id, f15c2_emp_emp_id, f15c2_role_role_id) 
    VALUES (:new.rfe_id, chair, 5);
  insert into f15c2_contact (f15c2_rfe_rfe_id, f15c2_emp_emp_id, f15c2_role_role_id) 
    VALUES (:new.rfe_id, exec_dir, 6);  
end;
/

--status update triggers

create or replace trigger F15C2_emp_date
before insert or update of emp_status on F15C2_emp 
for each row 
begin 
	:new.status_eff_date := localtimestamp;
end;
/

create or replace trigger F15C2_rfe_date
before insert or update of f15c2_status_status_id on F15C2_rfe 
for each row 
begin 
  IF :NEW.f15c2_status_status_id = 9 then
    :new.approval_review_date := localtimestamp;
  end if;
	:new.status_eff_date := localtimestamp;
end;
/

create or replace trigger F15C2_rfe_task_date
before insert or update of f15c2_rfe_rfe_id on F15C2_rfe_task 
for each row 
begin 
	:new.effective_date := localtimestamp;
end;
/

create or replace trigger F15C2_contact_date
before insert or update of f15c2_emp_emp_id on F15C2_contact 
for each row 
begin 
	:new.effective_date := localtimestamp;
end;
/

--build status history

create or replace trigger F15C2_history_update_trig
after update of f15c2_status_status_id on F15C2_rfe 
for each row 
begin 
	INSERT INTO f15c2_history (f15c2_rfe_rfe_id, f15c2_status_status_id, effective_date, entered_by_emp_id)
    VALUES (:old.rfe_id, :old.f15c2_status_status_id, :old.status_eff_date, v('P1_EMP'));
end;
/


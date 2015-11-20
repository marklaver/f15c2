--build contact list

create or replace trigger F15C2_contact_list
after insert on F15C2_rfe
for each row
declare
  requester   INTEGER;
  lab_dir     INTEGER;
  sys_admin   INTEGER;
begin
  select f15c2_emp_emp_id into requester from f15c2_rfe where rfe_id = :old.rfe_id;
  --get lab director and system admin as contacts by default
  --select e.emp_id into lab_dir from f15c2_emp e, f15c2_rfe r where r.f15c2_emp_emp_id 
  --select f15c2_emp_emp_id into requester from f15c2_rfe where rfe_id = ???;
  
  --insert 3 rows into contacts table with these variables
end;
/


--status update triggers

create or replace trigger F15C2_rfe_date
before insert or update of f15c2_status_status_id on F15C2_rfe 
for each row 
begin 
	:new.status_eff_date := localtimestamp;
end;
/

create or replace trigger F15C2_rfe_date_approved
after update of f15c2_status_status_id on F15C2_rfe 
for each row 
when (new.f15c2_status_status_id = 9)
declare 
  id_var INTEGER;
begin 
  SELECT rfe_id INTO id_var FROM f15c2_rfe WHERE rfe_id IS NULL;
  
  UPDATE F15C2_rfe
  SET approval_review_date = localtimestamp
  WHERE rfe_id = id_var;
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

--other triggers

create or replace trigger F15C2_history_update_trig
after update of f15c2_status_status_id on F15C2_rfe 
for each row 
declare
	emp INTEGER;
begin 
	SELECT a.f15c2_emp_emp_id INTO emp
		FROM f15c2_rfe r JOIN f15c2_approver a 
		ON a.f15c2_rfe_rfe_id = r.rfe_id;
	
	INSERT INTO f15c2_history VALUES
	(DEFAULT, :old.rfe_id, :old.f15c2_status_status_id, :old.status_eff_date, emp);
end;
/


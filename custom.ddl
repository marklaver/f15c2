--status update triggers

create or replace trigger F15C2_rfe_status_trig1
before insert on F15C2_rfe
for each row 
begin 
	:new.status_eff_date := localtimestamp;
end;
/

create or replace trigger F15C2_rfe_status_trig2
before update of f15c2_status_status_id on F15C2_rfe 
for each row 
begin 
	:new.status_eff_date := localtimestamp;
end;
/

create or replace trigger F15C2_rfe_emp_status
before insert or update of f15c2_status_status_id on F15C2_rfe 
for each row 
begin 
	:new.status_eff_date := localtimestamp;
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


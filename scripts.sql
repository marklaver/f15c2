--approve RFE
create or replace PROCEDURE f15c2_rfe_approve 
( 
	p2_rfe INTEGER, 
	p1_emp INTEGER 
) 
AS 
  	v_status	INTEGER; 
    v_approver	INTEGER; 
BEGIN 
	select f15c2_status_status_id into v_status from f15c2_rfe 
		where rfe_id = p2_rfe; 
 
	IF v_status = 2 THEN 
		select f15c2_emp_emp_id into v_approver from f15c2_contact 
			where f15c2_rfe_rfe_id = p2_rfe AND f15c2_role_role_id = 3; 
		IF p1_emp = v_approver THEN 
			UPDATE f15c2_rfe SET f15c2_status_status_id = 6 
				WHERE rfe_id = p2_rfe; 
		END IF; 
	ELSIF v_status >= 6 AND v_status < 9 THEN 
		select f15c2_emp_emp_id into v_approver from f15c2_contact 
			where f15c2_rfe_rfe_id = p2_rfe AND f15c2_role_role_id = (v_status - 2); 
		IF p1_emp = v_approver THEN 
			UPDATE f15c2_rfe SET f15c2_status_status_id = v_status + 1 
				WHERE rfe_id = p2_rfe; 
		END IF; 
	ELSIF v_status = 5 THEN 
		RAISE_APPLICATION_ERROR(-20005, 'Cannot approve rejected RFE'); 
	END IF; 
	COMMIT; 
EXCEPTION 
	WHEN OTHERS THEN 
		ROLLBACK; 
END; 
/

--reject RFE
CREATE OR REPLACE PROCEDURE f15c2_rfe_reject
(
	p2_rfe INTEGER,
	p1_emp INTEGER
)
AS
  	v_status	INTEGER;
    v_approver	INTEGER;
    v_returner	VARCHAR(100);
BEGIN
	select f15c2_status_status_id into v_status from f15c2_rfe
		where rfe_id = p2_rfe;
  IF v_status >= 9 THEN
    RAISE_APPLICATION_ERROR(-20002, 'Cannot reject such an RFE.');
  END IF;
  select emp_name into v_returner from f15c2_emp where emp_id = p1_emp;
  
  IF v_status = 2 THEN
		select f15c2_emp_emp_id into v_approver from f15c2_contact
			where f15c2_rfe_rfe_id = p2_rfe AND f15c2_role_role_id = 3;
  ELSIF v_status >= 6 THEN
		select f15c2_emp_emp_id into v_approver from f15c2_contact
			where f15c2_rfe_rfe_id = p2_rfe AND f15c2_role_role_id = (v_status - 2);
  END IF;
  
  IF P1_emp = v_approver THEN
    UPDATE f15c2_rfe SET f15c2_status_status_id = 5
      WHERE rfe_id = p2_rfe;
    INSERT INTO f15c2_comment (f15c2_rfe_rfe_id, f15c2_emp_emp_id, comments)
      VALUES(p2_rfe, p1_emp, 'RFE has been rejected. Contact ' || v_returner || ' for details.');
  END IF;
 	COMMIT;
EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
END;
/

--return RFE
CREATE OR REPLACE PROCEDURE f15c2_rfe_return
(
	p2_rfe INTEGER,
	p1_emp INTEGER
)
AS
  	v_status	INTEGER;
    v_approver	INTEGER;
    v_returner	VARCHAR(100);
BEGIN
	select f15c2_status_status_id into v_status from f15c2_rfe
		where rfe_id = p2_rfe;
  IF v_status >= 9 THEN
    RAISE_APPLICATION_ERROR(-20002, 'Cannot return such an RFE.');
  END IF;
  select emp_name into v_returner from f15c2_emp where emp_id = p1_emp;
  
  IF v_status = 2 THEN
		select f15c2_emp_emp_id into v_approver from f15c2_contact
			where f15c2_rfe_rfe_id = p2_rfe AND f15c2_role_role_id = 3;
  ELSIF v_status >= 6 THEN
		select f15c2_emp_emp_id into v_approver from f15c2_contact
			where f15c2_rfe_rfe_id = p2_rfe AND f15c2_role_role_id = (v_status - 2);
  END IF;
  
  IF P1_emp = v_approver THEN
    UPDATE f15c2_rfe SET f15c2_status_status_id = 3
      WHERE rfe_id = p2_rfe;
    INSERT INTO f15c2_comment (f15c2_rfe_rfe_id, f15c2_emp_emp_id, comments)
      VALUES(p2_rfe, p1_emp, 'RFE is being returned to requester. Contact ' || v_returner || ' for details.');
  END IF;
 	COMMIT;
EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
END;
/

--approve RFE
CREATE OR REPLACE PROCEDURE f15c2_rfe_approve
(
	p2_rfe INTEGER,
	p1_emp INTEGER
)
AS
  	v_status	INTEGER;
    v_approver	INTEGER;
BEGIN
	select f15c2_status_status_id into v_status from f15c2_rfe
		where rfe_id = p2_rfe;

	IF v_status = 2 THEN
		select f15c2_emp_emp_id into v_approver from f15c2_contact
			where f15c2_rfe_rfe_id = p2_rfe AND f15c2_role_role_id = 3;
		IF p1_emp = v_approver THEN
			UPDATE f15c2_rfe SET f15c2_status_status_id = 6
				WHERE rfe_id = p2_rfe;
		END IF;
	ELSIF v_status >= 6 AND v_status < 9 THEN
		select f15c2_emp_emp_id into v_approver from f15c2_contact
			where f15c2_rfe_rfe_id = p2_rfe AND f15c2_role_role_id = (v_status - 2);
		IF p1_emp = v_approver THEN
			UPDATE f15c2_rfe SET f15c2_status_status_id = v_status + 1
				WHERE rfe_id = p2_rfe;
		END IF;
	ELSIF v_status = 5 THEN
		RAISE_APPLICATION_ERROR(-20005, 'Cannot approve rejected RFE');
	END IF;
	COMMIT;
EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
END;
/

--final approval
create or replace procedure F15C2_rfe_approve_final
(
  p2_rfe  INTEGER,
  p1_emp  INTEGER,
  p5_time INTEGER
)
AS
  	v_status	INTEGER;
    v_approver	INTEGER;
    v_date  DATE;
BEGIN
	select f15c2_status_status_id into v_status from f15c2_rfe
		where rfe_id = p2_rfe;
  select f15c2_emp_emp_id into v_approver from f15c2_contact
		where f15c2_rfe_rfe_id = p2_rfe AND f15c2_role_role_id = 6;
	IF v_status = 8 AND v_approver = p1_emp THEN
    select add_months(sysdate, p5_time * 12) into v_date from dual;

  	UPDATE f15c2_rfe SET f15c2_status_status_id = 9, 
      approval_review_date = v_date
      WHERE rfe_id = p2_rfe;
    --v('P5_LOCK') := 1;
  END IF;
  COMMIT;
EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;  
END;
/

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

create or replace trigger F15C2_comment_date
before insert on F15C2_comment 
for each row 
begin 
	:new.comment_entry_date := localtimestamp;
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

--new rfe
create or replace trigger F15C2_rfe_new
before insert on F15C2_rfe
for each row 
begin 
   :new.f15c2_status_status_id := 1;
end;
/

--modify pk triggers
create or replace trigger F15C2_comment_PK_trig 
before insert on F15C2_comment
for each row 
begin 
  select F15C2_comment_seq.nextval into :new.comment_id from dual; 
  :new.f15c2_emp_emp_id := v('P1_EMP');
  :new.comment_entry_date := v('P1_EMP');
end; 
/

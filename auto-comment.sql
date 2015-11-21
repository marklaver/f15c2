create or replace trigger comment_after_update
after update on F15C2_rfe
for each row
declare
  status_id number;
  n number;
  rfe_id number;
begin 
  if updating then
  	select F15C2_status_status_id into status_id from F15C2_rfe;
  	if status_id = 4 then
	    select count(*)+1 into n from F15C2_comment;
	    select rfe_id into rfe_id from F15C2_rfe;
	    insert into F15C2_comment values
	    (n, rfe_id, V('P1_EMP'), SYSDATE(), 'RFE was Recalled');
	end if;
	if status_id = 3 then
	    select count(*)+1 into n from F15C2_comment;
	    select rfe_id into rfe_id from F15C2_rfe;
	    insert into F15C2_comment values
	    (n, rfe_id, V('P1_EMP'), SYSDATE(), 'RFE was Returned');
	end if;
	if status_id = 5 then
	    select count(*)+1 into n from F15C2_comment;
	    select rfe_id into rfe_id from F15C2_rfe;
	    insert into F15C2_comment values
	    (n, rfe_id, V('P1_EMP'), SYSDATE(), 'RFE was Rejected');
	end if;
  end if;
END; 
/
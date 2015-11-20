create or replace trigger rfe_before_update
before update
on F15C2_rfe
for each row
begin 
if updating then
  if F15C2_status_status_id = 5 or F15C2_status_status_id = 9
  	rollback;
  end if;
end if;
END;
/

create or replace trigger contact_before_update
before update
on F15C2_contact
for each row
declare
  n number;
begin 
  if updating then
  select F15C2_status_status_id into n from F15C2_rfe a join F15C2_contact b
  on a.rfe_id = b.F15C2_rfe_rfe_id;
  	if n = 5 or n = 9
  		rollback;
  	end if;
  end if;
END;
/

create or replace trigger approver_before_update
before update
on F15C2_approver
for each row
declare
  n number;
begin 
  if updating then
  select F15C2_status_status_id into n from F15C2_rfe a join F15C2_approver b
  on a.rfe_id = b.F15C2_rfe_rfe_id;
  	if n = 5 or n = 9
  		rollback;
  	end if;
  end if;
END;
/

create or replace trigger history_before_update
before update
on F15C2_history
for each row
begin 
if updating then
  if F15C2_status_status_id = 5 or F15C2_status_status_id = 9
  	rollback;
  end if;
end if;
END;
/

create or replace trigger task_before_update
before update
on rfe_task
for each row
declare
  n number;
begin 
  if updating then
  select F15C2_status_status_id into n from F15C2_rfe a join rfe_task b
  on a.rfe_id = b.F15C2_rfe_rfe_id;
  	if n = 5 or n = 9
  		rollback;
  	end if;
  end if;
END;
/

create or replace trigger document_before_update
before update
on F15C2_document
for each row
declare
  n number;
begin 
  if updating then
  select F15C2_status_status_id into n from F15C2_rfe a join F15C2_document b
  on a.rfe_id = b.F15C2_rfe_rfe_id;
  	if n = 5 or n = 9
  		rollback;
  	end if;
  end if;
END;
/

create or replace trigger comment_before_update
before update
on F15C2_comment
for each row
declare
  n number;
begin 
  if updating then
  select F15C2_status_status_id into n from F15C2_rfe a join F15C2_comment b
  on a.rfe_id = b.F15C2_rfe_rfe_id;
  	if n = 5 or n = 9
  		rollback;
  	end if;
  end if;
END;
/
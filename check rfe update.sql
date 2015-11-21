create or replace trigger rfe_before_update
before update
on F15C2_rfe
for each row
begin 
if updating then
  if :old.F15C2_status_status_id = 5 or :old.F15C2_status_status_id = 9 then
    :new.RFE_ID := :old.RFE_ID;
    :new.F15C2_EMP_EMP_ID := :old.F15C2_EMP_EMP_ID;
  	:new.F15C2_STATUS_STATUS_ID := :old.F15C2_STATUS_STATUS_ID;
    :new.STATUS_EFF_DATE := :old.STATUS_EFF_DATE;
    :new.EXPLANATION := :old.EXPLANATION;
    :new.ALT_PROTECTIONS := :old.ALT_PROTECTIONS;
    :new.APPROVAL_REVIEW_DATE := :old.APPROVAL_REVIEW_DATE;
    RAISE_APPLICATION_ERROR(-20002, 'Cannot update data.');
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
  	if n = 5 or n = 9 then
  	:new.CONTACT_ID := :old.CONTACT_ID;
    :new.F15C2_RFE_RFE_ID := :old.F15C2_RFE_RFE_ID;
    :new.F15C2_EMP_EMP_ID := :old.F15C2_EMP_EMP_ID;
    :new.F15C2_ROLE_ROLE_ID := :old.F15C2_ROLE_ROLE_ID;
    :new.COMMENTS := :old.COMMENTS;
    :new.EFFECTIVE_DATE := :old.EFFECTIVE_DATE;
    RAISE_APPLICATION_ERROR(-20002, 'Cannot update data.');
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
  if :old.F15C2_status_status_id = 5 or :old.F15C2_status_status_id = 9 then
    :new.HISTORY_ID := :old.HISTORY_ID;
    :new.F15C2_RFE_RFE_ID := :old.F15C2_RFE_RFE_ID;
  	:new.EFFECTIVE_DATE := :old.EFFECTIVE_DATE;
    :new.ENTERED_BY_EMP_ID := :old.ENTERED_BY_EMP_ID;
    RAISE_APPLICATION_ERROR(-20002, 'Cannot update data.');
  end if;
end if;
END;
/

create or replace trigger task_before_update
before update
on F15C2_RFE_TASK
for each row
declare
  n number;
begin 
  if updating then
  select F15C2_status_status_id into n from F15C2_rfe a join F15C2_rfe_task b
  on a.rfe_id = b.F15C2_rfe_rfe_id;
  	if n = 5 or n = 9 then
    :new.RFE_TASK_ID := :old.RFE_TASK_ID;
    :new.F15C2_RFE_RFE_ID := :old.F15C2_RFE_RFE_ID;
  	:new.F15C2_TASK_TASK_ID := :old.F15C2_TASK_TASK_ID;
    :new.EFFECTIVE_DATE := :old.EFFECTIVE_DATE;
    RAISE_APPLICATION_ERROR(-20002, 'Cannot update data.');
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
  	if n = 5 or n = 9 then
    :new.DOC_ID := :old.DOC_ID;
    :new.F15C2_RFE_RFE_ID := :old.F15C2_RFE_RFE_ID;
  	:new.FILENAME := :old.FILENAME;
    :new.FILE_MIMETYPE := :old.FILE_MIMETYPE;
    :new.FILE_CHARSET := :old.FILE_CHARSET;
    :new.FILE_BLOB := :old.FILE_BLOB;
    :new.FILE_COMMENTS := :old.FILE_COMMENTS;
    :new.TAGS := :old.TAGS;
    RAISE_APPLICATION_ERROR(-20002, 'Cannot update data.');
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
  	if n = 5 or n = 9 then
    :new.COMMENT_ID := :old.COMMENT_ID;
    :new.F15C2_RFE_RFE_ID := :old.F15C2_RFE_RFE_ID;
  	:new.F15C2_EMP_EMP_ID := :old.F15C2_EMP_EMP_ID;
    :new.COMMENTS := :old.COMMENTS;
    :new.COMMENT_ENTRY_DATE := :old.COMMENT_ENTRY_DATE;
    RAISE_APPLICATION_ERROR(-20002, 'Cannot update data.');
  	end if;
  end if;
END;
/
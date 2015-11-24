create or replace trigger update_document before insert on F15C2_document
for each row
declare
    pos          number;
    whole_name   VARCHAR2(512);
    file_name    VARCHAR2(4000 BYTE);
    mime_type    VARCHAR2(512);
    v_charset    VARCHAR2(512);
begin
    v_charset := '';
    select UTL_RAW.CAST_TO_VARCHAR2(:new.file_blob) into whole_name from F15C2_document;
    select instrb(whole_name, '.', 1, 1) into pos from dual;
    select substr(whole_name, 1, pos-1) into file_name from dual;
    select substr(whole_name, pos+1) into mime_type from dual;
    if mime_type = 'txt' then
            v_charset := 'ASCII';
    end if;
    :new.f15c2_rfe_rfe_id := v('P2_RFE');
    :new.filename := file_name;
    :new.file_mimetype := mime_type;
    :new.file_charset := v_charset;
end;
/

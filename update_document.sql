create or replace trigger update_document after insert on F15C2_document
for each row
declare
    pos          number;
    whole_name   VARCHAR2(512);
    file_name    VARCHAR2(4000 BYTE);
    mime_type    VARCHAR2(512);
    v_charset    VARCHAR2(512);
begin
    if updating then
    select UTL_RAW.CAST_TO_VARCHAR2(:new.file_blob) into whole_name from F15C2_document;
    select instrb(whole_name, '.', 1, 1) into pos from dual;
    select substr(whole_name, 1, pos-1) into file_name from dual;
    select substr(whole_name, pos+1) into mime_type from dual;
        if mime_type = 'txt' then
            v_charset := 'ASCII';
            update F15C2_document set file_charset = 'ASCII' where doc_id = :new.doc_id;
            end if;
    update F15C2_document set filename = file_name,
                              file_mimetype = mime_type
                              where doc_id = :new.doc_id;
    end if;
end;
/

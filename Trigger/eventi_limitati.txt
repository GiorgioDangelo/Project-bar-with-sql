create or replace trigger eventi_limitati
before insert or update of data_evento on eventi
for each row
DECLARE
errore exception;

BEGIN

if current_date<(:old.data_evento + 7)
then raise errore;
end if;
exception
when errore then
raise_application_error(-20002,'MASSIMO 1 EVENTO A SETTIMANA');

end;
/


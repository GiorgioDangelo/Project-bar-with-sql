create or replace trigger incassi_non_modificabili
BEFORE update or delete of soldi_incassati on turno_di_lavoro
for each row
declare
ultima_data date;
errore exception;
BEGIN
select max(data) into ultima_data
from turno_di_lavoro;
if CURRENT_DATE>ultima_data then
raise errore;
end if;
exception
when errore then 
raise_application_error(-20001,'non puoi modificare o cancellare gli incassi dei giorni precedenti');

end;
/

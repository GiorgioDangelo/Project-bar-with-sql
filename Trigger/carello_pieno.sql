create or replace trigger carello_pieno
BEFORE insert on carello
for each row
declare
max_prodotti        exception;
conta_prodotti      number;

begin
select count(nome_prodotto) into conta_prodotti
from carello
where id_carello=:new.id_carello;

if conta_prodotti>10 then
raise max_prodotti;
end if;
exception
when max_prodotti then
raise_application_error(-20003,'Il carello è pieno');      
end; 
/
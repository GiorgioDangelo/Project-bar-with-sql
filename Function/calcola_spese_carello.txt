create or replace function calcola_spese_carello(numero_carello varchar)
return number as
soldi_spesi number;
begin
select sum(prezzo) into soldi_spesi
from carello
where id_carello=numero_carello;
return soldi_spesi;
end;
/
create or replace function calcolo_somma_incassi (data1 date,data2 date) 
return number as

totale number;
data date;
begin
select sum(soldi_incassati) into totale
from turno_di_lavoro
where data>data1 and data<data2;
return totale;
end;
/
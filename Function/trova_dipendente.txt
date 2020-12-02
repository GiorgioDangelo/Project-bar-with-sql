create or replace function trova_dipendente(datain date,fascia_oraria varchar)
return varchar is
Cursor c1 is select id_cod_dipendenti
from (contratto join contratto_turno on codice_contratto=id_codice_contratto)
join turno_di_lavoro on data=data1 and tipo_di_turno=tipo_turno
where data=datain and tipo_di_turno=fascia_oraria;
nome varchar(10);
Begin
open c1;
LOOP
fetch c1 into nome;
exit when c1%NOTFOUND;
END LOOP;
return nome;
close c1;
end trova_dipendente;
/
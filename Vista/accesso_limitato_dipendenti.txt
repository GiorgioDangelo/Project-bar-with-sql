create materialized view accesso_limitato_dipendenti as
(select data,tipo_di_turno,id_cod_dipendenti
from (contratto join contratto_turno on id_codice_contratto=codice_contratto) join turno_di_lavoro on data=data1 and tipo_di_turno=tipo_turno);

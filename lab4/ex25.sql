Select Cod_Grupa
from grupe
where Id_Grupa IN
(Select Id_Grupa
from studenti_reusita
group by Id_Grupa
having COUNT(Distinct Id_Student) > 24)
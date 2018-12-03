select * from ex14_View

update ex14_View set Nota = 10
Where Nume_Student = 'Brasovianu' and Disciplina = 'Cercetari operationale'

Insert into ex14_View 
(Nume_Student, Prenume_Student)
values
('Brasovianu', 'Roxana') 

Insert into ex14_View 
(Disciplina)
values
('Practica de licenta')

Insert into example_View
(Id_Student, Nume_Student, Prenume_Student, Data_Nastere_Student)
values
(175, 'Liviu', 'Cotofana', '2000-11-24')

Select * from example_View

delete from example_View where Nume_Student = 'Liviu'

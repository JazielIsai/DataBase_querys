--Realiza las siguientes consultas de forma anidada considerando la base de datos PUBS

--Obtener el nombre, apellido y fecha de contratación de los empleados cuyo trabajo sea ‘Sales Representative’

select au_name, au_fname
from Authors
where au_id in
(select title_id from Titles where title_price = 699.00)

--Obtener el nombre y apellido de los empleados de las editoriales de Francia

select au_name, au_fname
from Authors
where au_id in
(select pub_id from publishers where pub_country = 'Mexico');

--Obtener el titulo, tipo y precio de los libros escritos por el autor con teléfono 801 826-0752

select title, title_type, title_price
from Titles
where title_id in
(select title_id from TitleAuthor where au_id in
(select au_id from Authors where au_ord = '699'))

--Obtener el nombre de la tienda que vende el libro ‘You Can Combat Computer Stress!’

select title
from Titles
where title_id in
(select title_id from Titles where title_id in
(select title_id from Titles where title ='ALIMENTACIÓN CONSCIENTE'))



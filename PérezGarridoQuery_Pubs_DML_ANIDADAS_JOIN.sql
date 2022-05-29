use Pubs

Create table Publishers(
pub_id int not null identity (1,1) primary key,
pub_name varchar(30) not null,
pub_city varchar(30) not null,
pub_state varchar(30) not null,
pub_country varchar(30) not null, 
)

Create table Titles(
title_id int not null primary key identity(1,1),
title varchar(30) not null,
title_type varchar(20) not null,
pub_id int not null,
title_price money not null,
constraint fk_Publishers foreign key (pub_id) references Publishers(pub_id)
)

Create table Authors(
au_id int not null primary key identity (1,1),
au_name varchar(50) not null,
au_fname varchar(50) not null,
au_state varchar(20) not null
)

Create table TitleAuthor(
au_id int not null,
title_id int not null,
au_ord varchar(20) not null,
constraint fk_Titles foreign key (title_id) references Titles (title_id),
constraint fk_Authors foreign key (au_id) references Authors (au_id)
)

--Publisher						--Nombre	--city			--state				--country
insert into Publishers values('AM Editores','Miguel Hidalgo', 'Ciudad de Mexico', 'Mexico') --1
insert into Publishers values('Amate Editorial','Guadalajara', 'Jalisco', 'Mexico') --2
insert into Publishers values('Caligrama Editores','Álvaro Obregón', 'Ciudad de Mexico', 'Mexico') --3
insert into Publishers values('Ediciones el Naranjo',' San Jerónimo Aculco', 'Ciudad de Mexico', 'Mexico') --4

insert into Publishers values('AM Editores','Miguel Hidalgo', 'Ciudad de Mexico', 'Mexico') --5
insert into Publishers values('AM Editores','Miguel Hidalgo', 'Ciudad de Mexico', 'Mexico') --6
insert into Publishers values('AM Editores','Miguel Hidalgo', 'Ciudad de Mexico', 'Mexico') --7
insert into Publishers values('AM Editores','Miguel Hidalgo', 'Ciudad de Mexico', 'Mexico') --8



--Titles					--Title					--Title type  --pub_id --title price
insert into Titles values ('Sabores en la cocina','Estilo de vida',1,699)
insert into Titles values ('Espacios funcionalidad actual','Estilo de vida',1,699) --2
insert into Titles values ('Hogares reinventado espacios','Estilo de vida',1,799) --
insert into Titles values ('Casas facinantes','Arquitectura',1,899) --4
insert into Titles values ('Arquitectos evolucionando','Arquitectura',1,699) --5
insert into Titles values ('DEL AMOR Y EL UNIVERSO',' LITERATURA - Poesía',2,157)
insert into Titles values ('ARENA',' LITERATURA - Poesía',2,100)
insert into Titles values ('ALIMENTACIÓN CONSCIENTE','CIENCIAS DE LA SALUD',2,399)
insert into Titles values ('KHÁTARSIS','LITERATURA - Poesía',2,150)
insert into Titles values ('LO SAGRADO EN DOS POETAS MEXICANOS CONTEMPORÁNEOS','LITERATURA - CRÍTICA LITERARIA',2,120)
insert into Titles values ('30 Días de Noche','Novela',3,140)
insert into Titles values ('El Bulbo Bipolar','Novela',3,150) --12
insert into Titles values ('El Cadáver y el Sofá','Novela',3,140)  --13
insert into Titles values ('El velo de Helena','Novela',4,130)
insert into Titles values ('Aquí es un buen lugar','Novela',4,170)
insert into Titles values ('Fiestas del agua. Sones y leyendas de Tixtla','Cuento',4,240)


--Authors					--name		--fname		--state
insert into Authors values ('Mónica','Patiño','...')
insert into Authors values ('Gerardo','Nieto Ituarte','...')  --2
insert into Authors values ('Mariangel','Coghlan','...')
--insert into Authors values ('Gerardo','Nieto Ituarte','...') --4
--insert into Authors values ('Gerardo','Nieto Ituarte','...') --5
insert into Authors values ('JONATHAN','ORTIZ','...')
insert into Authors values ('JESÚS','RITO GARCÍA','...')
insert into Authors values ('LUCÍA','CÁRDENAS','...')
insert into Authors values ('LUIS FERNANDO','GARCÍA CASTAÑEDA','...')
insert into Authors values ('MA. ESTHER','GÓMEZ LOZA','...')
insert into Authors values ('Steve','Niles Ben','...')
insert into Authors values ('Tony','Sandoval','...') --12
--insert into Authors values ('Tony','Sandoval') --13
insert into Authors values ('María García','Esperón','...')
insert into Authors values ('Ana','Pessoa','...')
insert into Authors values ('Caterina, Héctor','Camastra, Vega','...')


insert into Authors values ('','')
insert into Authors values ('','')
insert into Authors values ('','')
insert into Authors values ('','')
insert into Authors values ('','')
insert into Authors values ('','')



							  --au_id --title id --au_ord
insert into TitleAuthor values(1,1,'699')
insert into TitleAuthor values(2,2,'699')
insert into TitleAuthor values(3,3,'799')
insert into TitleAuthor values(2,4,'899')
insert into TitleAuthor values(2,5,'699')
insert into TitleAuthor values(6,6,'157')
insert into TitleAuthor values(7,7,'100')
insert into TitleAuthor values(8,8,'399')
insert into TitleAuthor values(9,9,'150')
insert into TitleAuthor values(10,10,'120')
insert into TitleAuthor values(11,11,'140')
insert into TitleAuthor values(10,12,'150')
insert into TitleAuthor values(10,13,'140')
insert into TitleAuthor values(11,14,'130')
insert into TitleAuthor values(12,15,'170')


insert into TitleAuthor values(13,16,'240')
insert into TitleAuthor values(17,17,'')
insert into TitleAuthor values(18,18,'')



select * from Titles
select * from Publishers
select * from Authors

select * from TitleAuthor


--Obtener la clave (title_id), tipo (type) 
--y precio (price) de los libros (Titles) que cuesten entre $100 y $150 pesos.
Select title_id, title_type, title_price
from Titles
where (title_price>100)and (title_price<150)

--Obtener el nombre (au_fname), apellido (au_lname) 
--de todos los autores (Authors) ordenados por su apellido (au_lname) de la Z – A.
select au_name,au_fname
from Authors order by au_name DESC

--Obtener el nombre (title) y tipo (type) de los libros (Titles) 
--que han sido publicados por publicistas (Publishers) que sean del país (country) de Alemania.

select title, title_type
from Titles
where pub_id in
(select pub_id from Publishers where pub_country = 'Mexico')

--Obtener el nombre (pub_name), ciudad (city) y estado (state) 
--de los publicistas (Publishers) que hayan publicado un libro del autor cuyo apellido (au_lname) sea Shannon.
select pub_name, pub_city, pub_state
from Publishers
where pub_id in
(select pub_id from titles where title_id in
(select title_id from titleauthor where au_id in
(select au_id from authors where au_fname = 'Nieto Ituarte')))


--Introducir los datos de un libro (Titles) nuevo.
insert into Titles values ('Fiestas del agua y leyendas','Novela',4,250)

--Eliminar los libros (Titles) que sean del tipo (type) Ciencias Sociales.
delete from Titles
where title_type = 'CIENCIAS DE LA SALUD'

--Eliminar el publicista (Publishers) que tengan como clave (pub_id) el numero 2.
delete from TitleAuthor
where au_id = 12

--Actualizar el precio (price) a $60 de los libros (Titles) que tengan la clave del publicista (pub_id) 580.
update Titles
set title_price=100 where pub_id=2


--Actualizar el estado (state) a San Luis Potosí de los autores (Authors) que tengan el estado (state) de S.L.P.
update Publishers
set pub_state = 'Ciudad de Mexico' where pub_state = 'Ciudad de Mexico'


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



--Realiza las siguientes consultas empleando el JOIN sobre la base de datos PUBS. 

-- 1.Obtener el nombre, apellido y fecha de contratación de los empleados cuyo trabajo sea ‘Sales Representative’

select au_name, au_fname
from Authors join Titles
on Authors.au_id = Titles.title_id
where title_price= 699

-- 2.Obtener el nombre y apellido de los empleados de las editoriales de Francia

select au_name, au_fname
from Authors join Publishers
on Authors.au_id = Publishers.pub_id
where pub_country='Mexico'


-- 3.Obtener el titulo, tipo y precio de los libros escritos por el autor con teléfono 801 826-0752

select title, title_type, title_price
from Titles join TitleAuthor
on Titles.title_id = TitleAuthor.title_id
join Authors on TitleAuthor.au_id=Authors.au_id
where au_state = '...'

-- 4.Obtener el nombre de la tienda que vende el libro ‘You Can Combat Computer Stress!’

select title
from Titles join Authors
on Titles.title_id=Authors.au_id
join TitleAuthor on Titles.title_id=titles.title_id
where title= 'KHÁTARSIS'

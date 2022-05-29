Create database SoftwareSolution

use SoftwareSolution

Create table Register_User(
Id_User int not null primary key identity(1,1),
Name_User varchar(30) not null,
Last_name_User varchar(30) not null,
Years_User int not null,
Type_User varchar(20) not null,
Password_User varchar(20) not null ,
NameSchool varchar(40),
Level_User varchar(20),
Photo_User image
)


drop table Register_User

select * from Register_User

insert into Register_User
values ('Jaziel', 'Pérez Garrido', 
18, '2', 
'12345678', 'Cecyte', 
'Preparatoria', System.Byte[])


Create view Register_Login(

)

Create table TBWatch(
IdWatch int not null primary key identity(1,1),
NameWatch varchar(50) not null,
URLWatch varchar(max) not null
)

Create table TBLibrary(
IdLibrary int not null primary key identity(1,1),
NameBook varchar(MAX) not null,
DirectionBook varchar(MAX) not null,
FileBook VarBinary(MAX) not null
)

drop table TBLibrary
select * from TBLibrary
Select DirectionBook from TBLibrary where IdLibrary = 1


create table TBTeams(
)

Create table TBHome(

)



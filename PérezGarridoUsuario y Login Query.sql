

create login Iniciar_Seccion
with password = '12345678'
must_change, Check_Expiration = ON;  --La opci�n must_change exige el cambio de contrase�a la primera vez que se conecten al servidor.
go

use pubs
go
Create User Usuario
for login Iniciar_Seccion

use pubs 
go 
GRANT INSERT on titles to Usuario


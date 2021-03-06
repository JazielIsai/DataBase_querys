USE [master]
GO
/****** Object:  Database [Trenes]    Script Date: 11/03/2021 07:04:04 a. m. ******/
CREATE DATABASE [Trenes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trenes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Trenes.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Trenes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Trenes_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Trenes] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trenes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trenes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trenes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trenes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trenes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trenes] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trenes] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Trenes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trenes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trenes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trenes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trenes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trenes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trenes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trenes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trenes] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trenes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trenes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trenes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trenes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trenes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trenes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trenes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trenes] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Trenes] SET  MULTI_USER 
GO
ALTER DATABASE [Trenes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trenes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trenes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trenes] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Trenes] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Trenes]
GO
/****** Object:  Table [dbo].[acceso]    Script Date: 11/03/2021 07:04:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[acceso](
	[no_acceso] [int] NOT NULL,
	[nombre_acceso] [varchar](50) NULL,
	[no_estacion] [int] NOT NULL,
 CONSTRAINT [PK_acceso] PRIMARY KEY CLUSTERED 
(
	[no_acceso] ASC,
	[no_estacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 11/03/2021 07:04:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[ID_Cliente] [int] NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Origen] [varchar](30) NOT NULL,
	[Destino] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cochera]    Script Date: 11/03/2021 07:04:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cochera](
	[id_cochera] [int] NOT NULL,
	[tipo_cochera] [varchar](50) NULL,
	[no_estacion] [int] NOT NULL,
 CONSTRAINT [PK_cochera] PRIMARY KEY CLUSTERED 
(
	[id_cochera] ASC,
	[no_estacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[estacion]    Script Date: 11/03/2021 07:04:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[estacion](
	[no_estacion] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_estacion] PRIMARY KEY CLUSTERED 
(
	[no_estacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[linea_estacion]    Script Date: 11/03/2021 07:04:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[linea_estacion](
	[no_linea] [int] NOT NULL,
	[no_estacion] [int] NOT NULL,
 CONSTRAINT [PK_linea_estacion] PRIMARY KEY CLUSTERED 
(
	[no_linea] ASC,
	[no_estacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lineas]    Script Date: 11/03/2021 07:04:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lineas](
	[no_linea] [int] NOT NULL,
	[nombre_linea] [varchar](50) NULL,
 CONSTRAINT [PK_lineas] PRIMARY KEY CLUSTERED 
(
	[no_linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Table_1]    Script Date: 11/03/2021 07:04:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table_1](
	[no_tren] [int] NOT NULL,
	[nombre_tren] [varchar](50) NULL,
	[no_linea] [int] NOT NULL,
	[id_cochera] [int] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[no_tren] ASC,
	[no_linea] ASC,
	[id_cochera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [Trenes] SET  READ_WRITE 
GO


SELECT * FROM acceso
SELECT * FROM cochera
SELECT * FROM estacion
SELECT * FROM linea_estacion
SELECT * FROM lineas
SELECT * FROM Cliente

insert into acceso values (1,'Norte',1)

insert into cochera values (1,'Abierta',1)

insert into estacion values (1,'León')

insert into lineas values (1,'Primera')

insert into linea_estacion values (1,1)

insert into Cliente values (1,'Luis','Gutierrez','Irapuato','León')

--Creación de usuarios y password
--Create login USUARIO1 with password '1234'

Create login USUARIO1
with password = '1234'

--Eliminar login
drop login USUARIO1

--Modificación de password
alter login USUARIO1 With password = '123'

--Creación de usuarios
Create user USUARIO1 for login USUARIO1


--Permisos GRANT, REVOKE, DENY

GRANT SELECT, UPDATE ON acceso to USUARIO1 -- el grant te permite 
--Revoke select, update on nombre_tabla to USUARIO1 --el revoke para a revocar lo permitido o denegado
Deny delete on cochera to USUARIO1 --E deny es para denegar 
Revoke delete on cochera to USUARIO1

--cliente insertar datos
Grant insert on cliente to USUARIO1
deny delete, select, update on cliente to USUARIO1
--cochera ver la información 
Grant select on cochera to USUARIO1
deny insert, delete, update on cochera to USUARIO1
--estacion eliminar
grant delete on estacion to USUARIO1
deny select, insert, update on estacion to USUARIO1
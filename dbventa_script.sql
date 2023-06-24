
-- DDL
CREATE DATABASE DBVENTA;
USE [master]
GO
CREATE LOGIN [usrdbventa] WITH PASSWORD=N'123456', 
   DEFAULT_DATABASE=[DBVENTA], 
   CHECK_EXPIRATION=OFF, 
   CHECK_POLICY=ON
GO
USE [DBVENTA]
GO
CREATE USER [usrdbventa] FOR LOGIN [usrdbventa]
GO
USE [DBVENTA]
GO
ALTER ROLE [db_owner] ADD MEMBER [usrdbventa]
GO

DROP TABLE Categoria;
DROP TABLE Producto;
DROP TABLE Menu;
DROP TABLE Venta;
DROP TABLE Usuario;
DROP TABLE Rol;
DROP TABLE RolMenu;
DROP TABLE TipoDocumentoVenta;
DROP TABLE DetalleVenta;

go

CREATE TABLE Menu(
id int primary key identity(1,1),
descripcion varchar(30),
idMenuPadre int references Menu(id),
icono varchar(30),
controlador varchar(30),
paginaAccion varchar(30),
usuarioRegistro VARCHAR(100) NULL DEFAULT SUSER_SNAME(),
fechaRegistro DATETIME NULL DEFAULT GETDATE(),
registroActivo BIT NULL DEFAULT 1
)
go

CREATE TABLE Rol(
id int primary key identity(1,1),
descripcion varchar(30),
usuarioRegistro VARCHAR(100) NULL DEFAULT SUSER_SNAME(),
fechaRegistro DATETIME NULL DEFAULT GETDATE(),
registroActivo BIT NULL DEFAULT 1
)
go
 
CREATE TABLE RolMenu(
id int primary key identity(1,1),
idRol int references Rol(id),
idMenu int references Menu(id),
usuarioRegistro VARCHAR(100) NULL DEFAULT SUSER_SNAME(),
fechaRegistro DATETIME NULL DEFAULT GETDATE(),
registroActivo BIT NULL DEFAULT 1
 )
go

CREATE TABLE Usuario(
id int primary key identity(1,1),
usuario varchar(50),
correo varchar(50),
telefono varchar(50),
idRol int references Rol(id),
clave varchar(100),
usuarioRegistro VARCHAR(100) NULL DEFAULT SUSER_SNAME(),
fechaRegistro DATETIME NULL DEFAULT GETDATE(),
registroActivo BIT NULL DEFAULT 1
)
go

CREATE TABLE Categoria(
id int primary key identity(1,1),
descripcion varchar(50),
usuarioRegistro VARCHAR(100) NULL DEFAULT SUSER_SNAME(),
fechaRegistro DATETIME NULL DEFAULT GETDATE(),
registroActivo BIT NULL DEFAULT 1
)
go

CREATE TABLE Producto(
id int primary key identity(1,1),
codigoBarra varchar(50),
marca varchar(50),
descripcion varchar(100),
idCategoria int references Categoria(id),
stock int,
precio decimal(10,2),
usuarioRegistro VARCHAR(100) NULL DEFAULT SUSER_SNAME(),
fechaRegistro DATETIME NULL DEFAULT GETDATE(),
registroActivo BIT NULL DEFAULT 1
)
go

CREATE TABLE TipoDocumentoVenta(
id int primary key identity(1,1),
descripcion varchar(50),
usuarioRegistro VARCHAR(100) NULL DEFAULT SUSER_SNAME(),
fechaRegistro DATETIME NULL DEFAULT GETDATE(),
registroActivo BIT NULL DEFAULT 1
)
go

CREATE TABLE Venta(
id int primary key identity(1,1),
numeroVenta varchar(6),
idTipoDocumentoVenta int references TipoDocumentoVenta(id),
idUsuario int references Usuario(id),
documentoCliente varchar(10),
nombreCliente varchar(20),
subTotal decimal(10,2),
impuestoTotal decimal(10,2),
Total decimal(10,2),
usuarioRegistro VARCHAR(100) NULL DEFAULT SUSER_SNAME(),
fechaRegistro DATETIME NULL DEFAULT GETDATE(),
registroActivo BIT NULL DEFAULT 1
)
go

CREATE TABLE DetalleVenta(
id int primary key identity(1,1),
idVenta int references Venta(id),
idProducto int,
marcaProducto varchar(100),
descripcionProducto varchar(100),
categoriaProducto varchar(100),
cantidad int,
precio decimal(10,2),
total decimal(10,2),
usuarioRegistro VARCHAR(100) NULL DEFAULT SUSER_SNAME(),
fechaRegistro DATETIME NULL DEFAULT GETDATE(),
registroActivo BIT NULL DEFAULT 1
)
go



insert into Usuario (usuario,correo,telefono,idRol,clave)
values('sacha','sacha@gmail.com','65985632',1,'Bwk06E2GcnE7m+nHi+A3IA==')

insert into Rol (descripcion)
values('Administrador')

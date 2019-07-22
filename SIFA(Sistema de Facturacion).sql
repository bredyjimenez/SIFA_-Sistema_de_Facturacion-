--creacion de la tabla nacionalidades
create table Nacionalidades(
id int identity(1,1) primary key,
nombre varchar(40) unique,
estado bit
)
go

--Creacion de la tabla Cliente--
create table Cliente(
id int identity(1,1) primary key,
nombre varchar(40),
apellido varchar(40),
cedula char(11) unique,
fecha_nacimiento date,
telefono char(10),
direccion varchar(100),
genero char(1),
email varchar(40),
id_nacionalidad int,
estado bit,
CONSTRAINT fk_Nacionalidades FOREIGN KEY (id_nacionalidad) REFERENCES Nacionalidades (id)
)
go

--Creacion de la tabla Roles--
create table Roles(
id int identity(1,1) primary key,
nombre varchar(40) unique,
estato bit
)
go

alter table Roles
add check (nombre in ('admin', 'facturador'))
go

--Creacion de la tabla Empleado--
create table Empleado(
id int identity(1,1) primary key,
nombre varchar(40),
apellido varchar(40),
cedula char(11) unique,
fecha_nacimiento date,
telefono char(10),
direccion varchar(100),
genero char(1),
email varchar(40),
id_nacionalidad int,
id_rol int,
fecha_entrada date,
fecha_salida date,
condicion char
)
--condicion
--activo 		---> A 
--de vacaciones  	---> V
--suspendido  	---> S
--de licencia  	---> L
go

ALTER TABLE Empleado
ADD FOREIGN KEY (id_nacionalidad) REFERENCES Nacionalidades(id);
go
ALTER TABLE Empleado
ADD FOREIGN KEY (id_rol) REFERENCES Roles(id);
go
alter table Empleado
add check (condicion in ('a', 'v', 's', 'l'))
go

--Creacion de la tabla Usuario--
Create table Usuario(
id int identity(1,1) primary key,
id_empleado int,
nombre_usuario varchar(40) unique,
contrasena varchar(40),
constraint fk_Empleado foreign key (id_empleado) references Empleado (id)
)
--investiguen como encriptar la contrasena--

go

--Creacion de la tabla Suplidor--
create table Suplidor(
id int identity(1,1) primary key,
nombre_compania varchar(40) unique,
nombre_contacto varchar(40),
telefono_compania char(10),
telefono_contacto char(10),
email varchar(40)
)
go

--Creacion de la table Producto--
Create table Producto(
id int identity(1,1) primary key,
nombre varchar(40) unique,
id_suplidor int,
precio decimal,
unidad_en_almacen int,
descontinuado bit,
constraint fk_Suplidor foreign key (id_suplidor) references Suplidor (id)
)
go

--Creacion de la tabla Factura--
create table Factura(
id int identity(1,1) primary key,
id_cliente int,
id_empleado_registro int,
fecha_hora datetime,
total_factura decimal,
itbis_actual as 0.18 * total_factura
)
go

alter table Factura
add foreign key (id_cliente) references Cliente (id)
go

alter table Factura
add foreign key (id_empleado_registro) references Empleado (id)
go


--Creacion de la tabla DetalleFactura--
create table DetalleFactura(
id int identity(1,1) primary key,
id_factura int,
id_producto int,
precio decimal,
cantidad int,
constraint fk_Factura foreign key (id_factura) references Factura (id)
)
go

alter table DetalleFactura
add foreign key (id_producto) references Producto (id)



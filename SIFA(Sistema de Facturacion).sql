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
estado bit
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
go

--Crear los procedimientos almacenado--

--Crear procedimiento almacenado pa_Roles
CREATE proc pa_Roles
@opcion char(1),
@id  int = null,
@nombre varchar(40)=null,
@estado bit =null
as
if(@opcion='I')
	begin
		insert into Roles(nombre, estado)
		values (@nombre, @estado)
	end
else if(@opcion='U')
	begin
		update Roles set  nombre = @nombre, estado = @estado
		where id = @id
	end
else if(@opcion='D')
	begin
		delete from Roles where id = @id
	end
go

--Crear procedimiento almacenado pa_Usuario
CREATE proc pa_Usuario
@opcion char(1),
@id  int = null,
@id_empleado int = null,
@nombre_usuario varchar(40)=null,
@contrasena varchar(40) =null
as
if(@opcion='I')
	begin
		insert into Usuario(id_empleado, nombre_usuario, contrasena)
		values (@id_empleado, @nombre_usuario, ENCRYPTBYPASSPHRASE('password', @contrasena))
	end
else if(@opcion='U')
	begin
		update Usuario set id_empleado = @id_empleado, nombre_usuario = @nombre_usuario, contrasena = ENCRYPTBYPASSPHRASE('password', @contrasena)
		where id = @id
	end
else if(@opcion='D')
	begin
		delete from Usuario where id = @id
	end
go

--Crear procedimiento almacenado pa_Suplidor
CREATE proc pa_Suplidor
@opcion char(1),
@id  int = null,
@nombre_compania varchar(40) = null,
@nombre_contacto varchar(40) = null,
@telefono_compania char(10) = null,
@telefono_contacto char(10) = null,
@email varchar(40) = null
as
if(@opcion='I')
	begin
		insert into Suplidor(nombre_compania, nombre_contacto, telefono_compania, telefono_contacto, email)
		values (@nombre_compania, @nombre_contacto,@telefono_compania , @telefono_contacto, @email)
	end
else if(@opcion='U')
	begin
		update Suplidor set nombre_compania = @nombre_compania, nombre_contacto = @nombre_contacto,
					telefono_compania = @telefono_compania, telefono_contacto = @telefono_contacto, 
					email = @email
		where id = @id
	end
else if(@opcion='D')
	begin
		delete from Suplidor where id = @id
	end
go

--Crear procedimiento almacenado pa_Nacionalidades
CREATE proc pa_Nacionalidades
@opcion char(1),
@id  int = null,
@nombre varchar(40) = null,
@estado bit = null
as
if(@opcion='I')
	begin
		insert into Nacionalidades(nombre, estado)
		values (@nombre, @estado)
	end
else if(@opcion='U')
	begin
		update Nacionalidades set  nombre = @nombre, estado = @estado
		where id = @id
	end
else if(@opcion='D')
	begin
		delete from Nacionalidades where id = @id
	end
go

--Crear procedimiento almacenado pa_Producto
CREATE proc pa_Producto
@opcion char(1),
@id  int = null,
@nombre varchar(40) = null,
@id_suplidor  int = null,
@precio decimal(18,0) = null,
@unidad_en_almacen int = null,
@descontinuado bit = null
as
if(@opcion='I')
	begin
		insert into Producto(nombre, id_suplidor, precio, unidad_en_almacen, descontinuado)
		values (@nombre, @id_suplidor, @precio , @unidad_en_almacen, @descontinuado)
	end
else if(@opcion='U')
	begin
		update Producto set nombre = @nombre, id_suplidor = @id_suplidor, precio = @precio,
					unidad_en_almacen = @unidad_en_almacen, descontinuado = @descontinuado
		where id = @id
	end
else if(@opcion='D')
	begin
		delete from Producto where id = @id
	end
go

--Crear procedimiento almacenado pa_Empleado
CREATE proc pa_Empleado
@opcion char(1),
@id  int = null,
@nombre varchar(40) = null,
@apellido varchar(40) = null,
@cedula char(11) = null,
@fecha_nacimiento date = null,
@telefono char(10) = null,
@direccion varchar(100) = null,
@genero char(1) = null,
@email varchar(40) = null,
@id_nacionalidad  int = null,
@id_rol int = null,
@fecha_entrada date = null,
@fecha_salida date = null,
@condicion char(1) = null
as
if(@opcion='I')
	begin
		insert into Empleado(nombre, apellido, cedula, fecha_nacimiento, telefono, direccion, genero,
							email, id_nacionalidad, id_rol, fecha_entrada, condicion)
		values (@nombre, @apellido, @cedula, @fecha_nacimiento, @telefono, @direccion, @genero, @email,
				@id_nacionalidad, @id_rol, @fecha_entrada, @condicion)
	end
else if(@opcion='U')
	begin
		update Empleado set nombre = @nombre, apellido = @apellido, cedula = @cedula,
					fecha_nacimiento = @fecha_nacimiento, telefono = @telefono, direccion = @direccion,
					genero = @genero, email = @email, id_nacionalidad = @id_nacionalidad, id_rol = @id_rol, 
					fecha_entrada = @fecha_entrada, condicion = @condicion
		where id = @id
	end
else if(@opcion='D')
	begin
		delete from Empleado where id = @id
	end
go

--Crear procedimiento almacenado pa_Cliente
CREATE proc pa_Cliente
@opcion char(1),
@id  int = null,
@nombre varchar(40) = null,
@apellido varchar(40) = null,
@cedula char(11) = null,
@fecha_nacimiento date = null,
@telefono char(10) = null,
@direccion varchar(100) = null,
@genero char(1) = null,
@email varchar(40) = null,
@id_nacionalidad  int = null,
@estado bit = null
as
if(@opcion='I')
	begin
		insert into Cliente(nombre, apellido, cedula, fecha_nacimiento, telefono, direccion, genero,
							email, id_nacionalidad, estado)
		values (@nombre, @apellido, @cedula, @fecha_nacimiento, @telefono, @direccion, @genero, @email,
				@id_nacionalidad, @estado)
	end
else if(@opcion='U')
	begin
		update Cliente set nombre = @nombre, apellido = @apellido, cedula = @cedula,
					fecha_nacimiento = @fecha_nacimiento, telefono = @telefono, direccion = @direccion,
					genero = @genero, email = @email, id_nacionalidad = @id_nacionalidad, estado = @estado
		where id = @id
	end
else if(@opcion='D')
	begin
		delete from Cliente where id = @id
	end
go


-- Inserting records

-- Inserting recors in table Nacionalidades
insert into Nacionalidades(nombre, estado)
values ('Dominicana', 1)
go

-- Inserting recors in table Empleado
insert into Empleado(nombre, apellido, cedula, fecha_nacimiento, telefono, direccion, genero, email,
					id_nacionalidad, id_rol, fecha_entrada, condicion)
values('Adrian', 'Jiménez', '22301304378', '01-03-1990', '8296033232', 'Calle Marquez No. 7, El Almirante',
		'm', 'adrianjpz@hotmail.com', 1, 1, '01-11-2015', 'a')
go

-- Inserting recors in table Usuario
insert into Usuario(id_empleado, nombre_usuario, contrasena)
values(1, 'adrian', ENCRYPTBYPASSPHRASE('password', '2893'))
go








select * from Usuario

select * from Empleado

select * from roles

select * from Nacionalidades
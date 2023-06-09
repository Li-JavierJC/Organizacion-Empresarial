USE [proyecto]
GO
/****** Object:  Table [dbo].[Habilidad]    Script Date: 06/12/2019 16:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Habilidad](
	[codigo_H] [int] NOT NULL,
	[descripcion] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK__Habilida__2610F8560BC6C43E] PRIMARY KEY CLUSTERED 
(
	[codigo_H] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Habilidad] DISABLE CHANGE_TRACKING
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Habilidad] ([codigo_H], [descripcion]) VALUES (896, N'Tecnico Computacional')
INSERT [dbo].[Habilidad] ([codigo_H], [descripcion]) VALUES (897, N'Trato con el Cliente')
INSERT [dbo].[Habilidad] ([codigo_H], [descripcion]) VALUES (898, N'Operador de telefonia')
INSERT [dbo].[Habilidad] ([codigo_H], [descripcion]) VALUES (900, N'Contabilidad')
/****** Object:  StoredProcedure [dbo].[buscar_Numhijos]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
create database proyecto;


create table Habilidad(
codigo_H int PRIMARY KEY,
descripcion varchar (100)
);



create table Centro_trabajo(
codigo_CT int PRIMARY KEY,
nombre VARCHAR(50),
poblacion varchar(50),
direccion varchar(100),
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E)  ON UPDATE CASCADE
);


create table Departamento(
codigo_D int PRIMARY KEY,
nombre varchar(50),
presupuesto_anual float,
codigo_CT int,
FOREIGN KEY (codigo_CT)REFERENCES Centro_trabajo(codigo_CT)  ON UPDATE CASCADE
); 

create table Empleado(
NIF_E int PRIMARY KEY,
telefono int,
nombre varchar(50),
num_hijos int,
salario float,
fecha_alta datetime
);


Create table Habilidad_Empleado(
codigo_H int, 
NIF_E int,
FOREIGN KEY(codigo_H)REFERENCES Habilidad(codigo_H) on UPDATE CASCADE,
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E)  on UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Create table Hijo(
codigo_HE int PRIMARY KEY,
nombre varchar(50),
fecha_nacimiento datetime,
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E) ON UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Insert into Habilidad (codigo_H,descripcion)values(896,'Tecnico Computacional');
Insert into Habilidad (codigo_H,descripcion)values(897,'Trato con el Cliente');
Insert into Habilidad (codigo_H,descripcion)values (898,'Operador de telefonia');
Insert into Habilidad (codigo_H,descripcion)values (899,'Fresador');
Insert into Habilidad (codigo_H,descripcion)values (900,'Contabilidad');



Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (20,23297070,'Aaron Adoch Juarez',2,6000,'04-10-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (21,77767179,'Abisneo testa Aceton',0,7000,'28-04-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (22,23297970,'Adan Mateu Barillas',3,6765,'27-12-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (23,23297070,'Brandon AdreeChavez Gomez',2,4980,'01-08-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (24,40285960,'Carl Gonzalez Rodas',1,7990,'18-08-2018');




Insert into habilidad_empleado (codigo_H,NIF_E) values (896,20);
Insert into habilidad_empleado (codigo_H,NIF_E) values (897,21);
Insert into habilidad_empleado (codigo_H,NIF_E) values (898,22);
Insert into habilidad_empleado (codigo_H,NIF_E) values (899,23);
Insert into habilidad_empleado (codigo_H,NIF_E) values (900,24);


Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (740,'Erinque Adoch Alvarado','17-05-1994',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (741,'Ernesto Adoch Alvarado','22-11-1995',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (742,'Leonel Mateu Duran','10-10-1995',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (743,'Manuel Mateu Duran','26-12-1997',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (744,'rafael Mateu Duran','11-06-2000',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (745,'Mario Chávez Soto','09-09-2000',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (746,'Noemi Chávez Soto','07-06-2002',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (747,'carolina Gonzalez Mia','22-07-2003',24);


Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (240,'RHYVSA','Ciudad de México','Colonia la Condesa',20);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (241,'Katero CoorporativoSC',' Ciudad de México','Cuauhtémoc',21);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (242,'Tiendas de 3b S.A de CV','Puebla','Pino Suarez 5',22);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (243,'People Conection','Puebla','Cuatlasingo',23);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (244,'TYPHOON','Puebla','Cholula Rivadavia',24);





Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (677,'Departamento de Produccion',37275,240);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (678,'Departamento de Compras',73303.80,241);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (679,'Departamento de administracion',20636,242);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (680,'Departamento Finaciero',24586,243);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (681,'Departamento de Marketing',37031,244);


 insert into Empleado_Departamento (NIF_E,codigo_D) values (20,677);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (21,678);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (22,679);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (23,680);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (24,681);



CREATE PROCEDURE insertar_empleado
@nif_e int,
@Telefono int,
@Nombre int,
@Num_hijos int,
@Salario float,
@Fecha_alta datetime
as
BEGIN
INSERT INTO empleado (NIF_E,telefono,nombre,num_hijos,salario,fecha_alta)
VALUES
(@nif_e, @Telefono,@Nombre,@Num_hijos,@Salario,@Fecha_alta);
END;


CREATE PROCEDURE actualizar_empleado
@nif_e int,
@Telefono int,
@Nombre varchar(50),
@Num_hijos int,
@Salario float,
@Fecha_alta datetime

AS
BEGIN
UPDATE empleado SET
NIF_E=nif_e,
telefono=Telefono,
nombre=Nombre,
num_hijos=Num_hijos,
salario=Salario,
fecha_alta=Fecha_alta
WHERE NIF_E=nif_e;
END;




CREATE PROCEDURE eliminar_empleado
@nif_e int

as
BEGIN
DELETE FROM empleado WHERE NIF_E=nif_e;
END

CREATE PROCEDURE buscar_nombrePorEmpleado

@nombre varchar(50)
as
select *from Empleado where nombre=nombre;
*/

CREATE PROCEDURE [dbo].[buscar_Numhijos]
@Num_hijos int

as
select *from Empleado where num_hijos=Num_hijos;

/*
CREATE PROCEDURE buscar_fechaAlta
@Fecha_alta datetime

as
select *from Empleado where fecha_alta=Fecha_alta;


CREATE PROCEDURE mostra_todos
as
select *from Empleado 


CREATE PROCEDURE insertar_departamento
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
INSERT INTO departamento(codigo_D,nombre,presupuesto_anual)
VALUES(@Codigo_d,@Nombre,@Presupuesto_anual);
END;


CREATE PROCEDURE actualizar_departamento
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
UPDATE departamento SET
codigo_D=Codigo_d,
nombre=Nombre,
presupuesto_anual=Presupuesto_anual

WHERE codigo_D=Codigo_d;
END;


CREATE PROCEDURE buscar_nombrePorDepartamento
@nombre varchar(50)
as
select *from Empleado where nombre=nombre;


CREATE PROCEDURE mostra_todos_departamentos
AS
select *from departamento 

CREATE PROCEDURE eliminar_departamento
@Codigo_d int

AS
BEGIN
DELETE FROM departamento WHERE Codigo_D=Codigo_d;
END

CREATE PROCEDURE insertar_centroTrabajo
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar(50),
@Direccion varchar(50)

as
BEGIN
INSERT INTO centro_trabajo (codigo_CT,nombre,poblacion, direccion)
VALUES(@Codigo_CT,@Nombre,@Poblacion, @Direccion);
END;

CREATE PROCEDURE actualizar_centroTrabajo
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar (50),
@Direccion varchar(50)

as
BEGIN
UPDATE centro_trabajo SET
codigo_CT=Codigo_CT,
nombre=Nombre,
poblacion=Poblacion,
direccion=Direccion
WHERE codigo_CT=Codigo_CT;
END;

CREATE PROCEDURE buscar_nombreCentroTrabajo
@Nombre varchar(50)

as
select *from Empleado where nombre=Nombre;


CREATE PROCEDURE buscar_poblacionCentroTrabajo
@Poblacion varchar(50)

as
select *from centro_trabajo where poblacion=Poblacion;


CREATE PROCEDURE buscar_direccionCentroTrabajo
@Direccion  varchar(50)

as
select *from centro_trabajo  where direccion=Direccion;


CREATE PROCEDURE eliminar_centroTrabajo
@Codigo_CT int

as
BEGIN
DELETE FROM centro_trabajo  WHERE codigo_CT=Codigo_CT;
END

CREATE PROCEDURE insertar_habilidad

@Codigo_h int,
@Descripcion varchar(50)

as
BEGIN
INSERT INTO hablilidad (codigo_H,descripcion)
VALUES(@Codigo_h, @Descripcion);
END;


CREATE PROCEDURE actualizar_habilidad
@Codigo_H int,
@Descripcion varchar(50)
AS
BEGIN
UPDATE habilidad SET
codigo_H=Codigo_H,
descripcion=Descripcion
WHERE  codigo_H=Codigo_H;
END;


CREATE PROCEDURE buscar_descripcion
@Descripcion  varchar(50)
as
select *from habilidad  where descripcion=Descripcion;

CREATE PROCEDURE eliminar_Habilidad
@Codigo_h int
as
BEGIN
DELETE FROM habilidad   WHERE  codigo_H=Codigo_H;
END

*/
GO
/****** Object:  StoredProcedure [dbo].[buscar_nombrePorEmpleado]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
create database proyecto;


create table Habilidad(
codigo_H int PRIMARY KEY,
descripcion varchar (100)
);



create table Centro_trabajo(
codigo_CT int PRIMARY KEY,
nombre VARCHAR(50),
poblacion varchar(50),
direccion varchar(100),
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E)  ON UPDATE CASCADE
);


create table Departamento(
codigo_D int PRIMARY KEY,
nombre varchar(50),
presupuesto_anual float,
codigo_CT int,
FOREIGN KEY (codigo_CT)REFERENCES Centro_trabajo(codigo_CT)  ON UPDATE CASCADE
); 

create table Empleado(
NIF_E int PRIMARY KEY,
telefono int,
nombre varchar(50),
num_hijos int,
salario float,
fecha_alta datetime
);


Create table Habilidad_Empleado(
codigo_H int, 
NIF_E int,
FOREIGN KEY(codigo_H)REFERENCES Habilidad(codigo_H) on UPDATE CASCADE,
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E)  on UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Create table Hijo(
codigo_HE int PRIMARY KEY,
nombre varchar(50),
fecha_nacimiento datetime,
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E) ON UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Insert into Habilidad (codigo_H,descripcion)values(896,'Tecnico Computacional');
Insert into Habilidad (codigo_H,descripcion)values(897,'Trato con el Cliente');
Insert into Habilidad (codigo_H,descripcion)values (898,'Operador de telefonia');
Insert into Habilidad (codigo_H,descripcion)values (899,'Fresador');
Insert into Habilidad (codigo_H,descripcion)values (900,'Contabilidad');



Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (20,23297070,'Aaron Adoch Juarez',2,6000,'04-10-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (21,77767179,'Abisneo testa Aceton',0,7000,'28-04-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (22,23297970,'Adan Mateu Barillas',3,6765,'27-12-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (23,23297070,'Brandon AdreeChavez Gomez',2,4980,'01-08-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (24,40285960,'Carl Gonzalez Rodas',1,7990,'18-08-2018');




Insert into habilidad_empleado (codigo_H,NIF_E) values (896,20);
Insert into habilidad_empleado (codigo_H,NIF_E) values (897,21);
Insert into habilidad_empleado (codigo_H,NIF_E) values (898,22);
Insert into habilidad_empleado (codigo_H,NIF_E) values (899,23);
Insert into habilidad_empleado (codigo_H,NIF_E) values (900,24);


Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (740,'Erinque Adoch Alvarado','17-05-1994',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (741,'Ernesto Adoch Alvarado','22-11-1995',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (742,'Leonel Mateu Duran','10-10-1995',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (743,'Manuel Mateu Duran','26-12-1997',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (744,'rafael Mateu Duran','11-06-2000',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (745,'Mario Chávez Soto','09-09-2000',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (746,'Noemi Chávez Soto','07-06-2002',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (747,'carolina Gonzalez Mia','22-07-2003',24);


Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (240,'RHYVSA','Ciudad de México','Colonia la Condesa',20);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (241,'Katero CoorporativoSC',' Ciudad de México','Cuauhtémoc',21);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (242,'Tiendas de 3b S.A de CV','Puebla','Pino Suarez 5',22);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (243,'People Conection','Puebla','Cuatlasingo',23);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (244,'TYPHOON','Puebla','Cholula Rivadavia',24);





Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (677,'Departamento de Produccion',37275,240);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (678,'Departamento de Compras',73303.80,241);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (679,'Departamento de administracion',20636,242);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (680,'Departamento Finaciero',24586,243);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (681,'Departamento de Marketing',37031,244);


 insert into Empleado_Departamento (NIF_E,codigo_D) values (20,677);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (21,678);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (22,679);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (23,680);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (24,681);



CREATE PROCEDURE insertar_empleado
@nif_e int,
@Telefono int,
@Nombre int,
@Num_hijos int,
@Salario float,
@Fecha_alta datetime
as
BEGIN
INSERT INTO empleado (NIF_E,telefono,nombre,num_hijos,salario,fecha_alta)
VALUES
(@nif_e, @Telefono,@Nombre,@Num_hijos,@Salario,@Fecha_alta);
END;


CREATE PROCEDURE actualizar_empleado
@nif_e int,
@Telefono int,
@Nombre varchar(50),
@Num_hijos int,
@Salario float,
@Fecha_alta datetime

AS
BEGIN
UPDATE empleado SET
NIF_E=nif_e,
telefono=Telefono,
nombre=Nombre,
num_hijos=Num_hijos,
salario=Salario,
fecha_alta=Fecha_alta
WHERE NIF_E=nif_e;
END;




CREATE PROCEDURE eliminar_empleado
@nif_e int

as
BEGIN
DELETE FROM empleado WHERE NIF_E=nif_e;
END
*/
CREATE PROCEDURE [dbo].[buscar_nombrePorEmpleado]

@nombre varchar(50)
as
select *from Empleado where nombre=nombre;
/*

CREATE PROCEDURE buscar_Numhijos
@Num_hijos int

as
select *from Empleado where num_hijos=Num_hijos;


CREATE PROCEDURE buscar_fechaAlta
@Fecha_alta datetime

as
select *from Empleado where fecha_alta=Fecha_alta;


CREATE PROCEDURE mostra_todos
as
select *from Empleado 


CREATE PROCEDURE insertar_departamento
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
INSERT INTO departamento(codigo_D,nombre,presupuesto_anual)
VALUES(@Codigo_d,@Nombre,@Presupuesto_anual);
END;


CREATE PROCEDURE actualizar_departamento
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
UPDATE departamento SET
codigo_D=Codigo_d,
nombre=Nombre,
presupuesto_anual=Presupuesto_anual

WHERE codigo_D=Codigo_d;
END;


CREATE PROCEDURE buscar_nombrePorDepartamento
@nombre varchar(50)
as
select *from Empleado where nombre=nombre;


CREATE PROCEDURE mostra_todos_departamentos
AS
select *from departamento 

CREATE PROCEDURE eliminar_departamento
@Codigo_d int

AS
BEGIN
DELETE FROM departamento WHERE Codigo_D=Codigo_d;
END

CREATE PROCEDURE insertar_centroTrabajo
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar(50),
@Direccion varchar(50)

as
BEGIN
INSERT INTO centro_trabajo (codigo_CT,nombre,poblacion, direccion)
VALUES(@Codigo_CT,@Nombre,@Poblacion, @Direccion);
END;

CREATE PROCEDURE actualizar_centroTrabajo
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar (50),
@Direccion varchar(50)

as
BEGIN
UPDATE centro_trabajo SET
codigo_CT=Codigo_CT,
nombre=Nombre,
poblacion=Poblacion,
direccion=Direccion
WHERE codigo_CT=Codigo_CT;
END;

CREATE PROCEDURE buscar_nombreCentroTrabajo
@Nombre varchar(50)

as
select *from Empleado where nombre=Nombre;


CREATE PROCEDURE buscar_poblacionCentroTrabajo
@Poblacion varchar(50)

as
select *from centro_trabajo where poblacion=Poblacion;


CREATE PROCEDURE buscar_direccionCentroTrabajo
@Direccion  varchar(50)

as
select *from centro_trabajo  where direccion=Direccion;


CREATE PROCEDURE eliminar_centroTrabajo
@Codigo_CT int

as
BEGIN
DELETE FROM centro_trabajo  WHERE codigo_CT=Codigo_CT;
END

CREATE PROCEDURE insertar_habilidad

@Codigo_h int,
@Descripcion varchar(50)

as
BEGIN
INSERT INTO hablilidad (codigo_H,descripcion)
VALUES(@Codigo_h, @Descripcion);
END;


CREATE PROCEDURE actualizar_habilidad
@Codigo_H int,
@Descripcion varchar(50)
AS
BEGIN
UPDATE habilidad SET
codigo_H=Codigo_H,
descripcion=Descripcion
WHERE  codigo_H=Codigo_H;
END;


CREATE PROCEDURE buscar_descripcion
@Descripcion  varchar(50)
as
select *from habilidad  where descripcion=Descripcion;

CREATE PROCEDURE eliminar_Habilidad
@Codigo_h int
as
BEGIN
DELETE FROM habilidad   WHERE  codigo_H=Codigo_H;
END

*/
GO
/****** Object:  StoredProcedure [dbo].[buscar_nombrePorDepartamento]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
create database proyecto;


create table Habilidad(
codigo_H int PRIMARY KEY,
descripcion varchar (100)
);



create table Centro_trabajo(
codigo_CT int PRIMARY KEY,
nombre VARCHAR(50),
poblacion varchar(50),
direccion varchar(100),
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E)  ON UPDATE CASCADE
);


create table Departamento(
codigo_D int PRIMARY KEY,
nombre varchar(50),
presupuesto_anual float,
codigo_CT int,
FOREIGN KEY (codigo_CT)REFERENCES Centro_trabajo(codigo_CT)  ON UPDATE CASCADE
); 

create table Empleado(
NIF_E int PRIMARY KEY,
telefono int,
nombre varchar(50),
num_hijos int,
salario float,
fecha_alta datetime
);


Create table Habilidad_Empleado(
codigo_H int, 
NIF_E int,
FOREIGN KEY(codigo_H)REFERENCES Habilidad(codigo_H) on UPDATE CASCADE,
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E)  on UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Create table Hijo(
codigo_HE int PRIMARY KEY,
nombre varchar(50),
fecha_nacimiento datetime,
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E) ON UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Insert into Habilidad (codigo_H,descripcion)values(896,'Tecnico Computacional');
Insert into Habilidad (codigo_H,descripcion)values(897,'Trato con el Cliente');
Insert into Habilidad (codigo_H,descripcion)values (898,'Operador de telefonia');
Insert into Habilidad (codigo_H,descripcion)values (899,'Fresador');
Insert into Habilidad (codigo_H,descripcion)values (900,'Contabilidad');



Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (20,23297070,'Aaron Adoch Juarez',2,6000,'04-10-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (21,77767179,'Abisneo testa Aceton',0,7000,'28-04-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (22,23297970,'Adan Mateu Barillas',3,6765,'27-12-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (23,23297070,'Brandon AdreeChavez Gomez',2,4980,'01-08-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (24,40285960,'Carl Gonzalez Rodas',1,7990,'18-08-2018');




Insert into habilidad_empleado (codigo_H,NIF_E) values (896,20);
Insert into habilidad_empleado (codigo_H,NIF_E) values (897,21);
Insert into habilidad_empleado (codigo_H,NIF_E) values (898,22);
Insert into habilidad_empleado (codigo_H,NIF_E) values (899,23);
Insert into habilidad_empleado (codigo_H,NIF_E) values (900,24);


Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (740,'Erinque Adoch Alvarado','17-05-1994',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (741,'Ernesto Adoch Alvarado','22-11-1995',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (742,'Leonel Mateu Duran','10-10-1995',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (743,'Manuel Mateu Duran','26-12-1997',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (744,'rafael Mateu Duran','11-06-2000',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (745,'Mario Chávez Soto','09-09-2000',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (746,'Noemi Chávez Soto','07-06-2002',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (747,'carolina Gonzalez Mia','22-07-2003',24);


Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (240,'RHYVSA','Ciudad de México','Colonia la Condesa',20);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (241,'Katero CoorporativoSC',' Ciudad de México','Cuauhtémoc',21);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (242,'Tiendas de 3b S.A de CV','Puebla','Pino Suarez 5',22);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (243,'People Conection','Puebla','Cuatlasingo',23);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (244,'TYPHOON','Puebla','Cholula Rivadavia',24);





Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (677,'Departamento de Produccion',37275,240);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (678,'Departamento de Compras',73303.80,241);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (679,'Departamento de administracion',20636,242);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (680,'Departamento Finaciero',24586,243);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (681,'Departamento de Marketing',37031,244);


 insert into Empleado_Departamento (NIF_E,codigo_D) values (20,677);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (21,678);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (22,679);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (23,680);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (24,681);



CREATE PROCEDURE insertar_empleado
@nif_e int,
@Telefono int,
@Nombre int,
@Num_hijos int,
@Salario float,
@Fecha_alta datetime
as
BEGIN
INSERT INTO empleado (NIF_E,telefono,nombre,num_hijos,salario,fecha_alta)
VALUES
(@nif_e, @Telefono,@Nombre,@Num_hijos,@Salario,@Fecha_alta);
END;


CREATE PROCEDURE actualizar_empleado
@nif_e int,
@Telefono int,
@Nombre varchar(50),
@Num_hijos int,
@Salario float,
@Fecha_alta datetime

AS
BEGIN
UPDATE empleado SET
NIF_E=nif_e,
telefono=Telefono,
nombre=Nombre,
num_hijos=Num_hijos,
salario=Salario,
fecha_alta=Fecha_alta
WHERE NIF_E=nif_e;
END;




CREATE PROCEDURE eliminar_empleado
@nif_e int

as
BEGIN
DELETE FROM empleado WHERE NIF_E=nif_e;
END

CREATE PROCEDURE buscar_nombrePorEmpleado

@nombre varchar(50)
as
select *from Empleado where nombre=nombre;


CREATE PROCEDURE buscar_Numhijos
@Num_hijos int

as
select *from Empleado where num_hijos=Num_hijos;


CREATE PROCEDURE buscar_fechaAlta
@Fecha_alta datetime

as
select *from Empleado where fecha_alta=Fecha_alta;


CREATE PROCEDURE mostra_todos
as
select *from Empleado 


CREATE PROCEDURE insertar_departamento
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
INSERT INTO departamento(codigo_D,nombre,presupuesto_anual)
VALUES(@Codigo_d,@Nombre,@Presupuesto_anual);
END;


CREATE PROCEDURE actualizar_departamento
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
UPDATE departamento SET
codigo_D=Codigo_d,
nombre=Nombre,
presupuesto_anual=Presupuesto_anual

WHERE codigo_D=Codigo_d;
END;

*/
CREATE PROCEDURE [dbo].[buscar_nombrePorDepartamento]
@nombre varchar(50)
as
select *from Empleado where nombre=nombre;
/*

CREATE PROCEDURE mostra_todos_departamentos
AS
select *from departamento 

CREATE PROCEDURE eliminar_departamento
@Codigo_d int

AS
BEGIN
DELETE FROM departamento WHERE Codigo_D=Codigo_d;
END

CREATE PROCEDURE insertar_centroTrabajo
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar(50),
@Direccion varchar(50)

as
BEGIN
INSERT INTO centro_trabajo (codigo_CT,nombre,poblacion, direccion)
VALUES(@Codigo_CT,@Nombre,@Poblacion, @Direccion);
END;

CREATE PROCEDURE actualizar_centroTrabajo
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar (50),
@Direccion varchar(50)

as
BEGIN
UPDATE centro_trabajo SET
codigo_CT=Codigo_CT,
nombre=Nombre,
poblacion=Poblacion,
direccion=Direccion
WHERE codigo_CT=Codigo_CT;
END;

CREATE PROCEDURE buscar_nombreCentroTrabajo
@Nombre varchar(50)

as
select *from Empleado where nombre=Nombre;


CREATE PROCEDURE buscar_poblacionCentroTrabajo
@Poblacion varchar(50)

as
select *from centro_trabajo where poblacion=Poblacion;


CREATE PROCEDURE buscar_direccionCentroTrabajo
@Direccion  varchar(50)

as
select *from centro_trabajo  where direccion=Direccion;


CREATE PROCEDURE eliminar_centroTrabajo
@Codigo_CT int

as
BEGIN
DELETE FROM centro_trabajo  WHERE codigo_CT=Codigo_CT;
END

CREATE PROCEDURE insertar_habilidad

@Codigo_h int,
@Descripcion varchar(50)

as
BEGIN
INSERT INTO hablilidad (codigo_H,descripcion)
VALUES(@Codigo_h, @Descripcion);
END;


CREATE PROCEDURE actualizar_habilidad
@Codigo_H int,
@Descripcion varchar(50)
AS
BEGIN
UPDATE habilidad SET
codigo_H=Codigo_H,
descripcion=Descripcion
WHERE  codigo_H=Codigo_H;
END;


CREATE PROCEDURE buscar_descripcion
@Descripcion  varchar(50)
as
select *from habilidad  where descripcion=Descripcion;

CREATE PROCEDURE eliminar_Habilidad
@Codigo_h int
as
BEGIN
DELETE FROM habilidad   WHERE  codigo_H=Codigo_H;
END

*/
GO
/****** Object:  StoredProcedure [dbo].[buscar_nombreCentroTrabajo]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
create database proyecto;


create table Habilidad(
codigo_H int PRIMARY KEY,
descripcion varchar (100)
);



create table Centro_trabajo(
codigo_CT int PRIMARY KEY,
nombre VARCHAR(50),
poblacion varchar(50),
direccion varchar(100),
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E)  ON UPDATE CASCADE
);


create table Departamento(
codigo_D int PRIMARY KEY,
nombre varchar(50),
presupuesto_anual float,
codigo_CT int,
FOREIGN KEY (codigo_CT)REFERENCES Centro_trabajo(codigo_CT)  ON UPDATE CASCADE
); 

create table Empleado(
NIF_E int PRIMARY KEY,
telefono int,
nombre varchar(50),
num_hijos int,
salario float,
fecha_alta datetime
);


Create table Habilidad_Empleado(
codigo_H int, 
NIF_E int,
FOREIGN KEY(codigo_H)REFERENCES Habilidad(codigo_H) on UPDATE CASCADE,
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E)  on UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Create table Hijo(
codigo_HE int PRIMARY KEY,
nombre varchar(50),
fecha_nacimiento datetime,
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E) ON UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Insert into Habilidad (codigo_H,descripcion)values(896,'Tecnico Computacional');
Insert into Habilidad (codigo_H,descripcion)values(897,'Trato con el Cliente');
Insert into Habilidad (codigo_H,descripcion)values (898,'Operador de telefonia');
Insert into Habilidad (codigo_H,descripcion)values (899,'Fresador');
Insert into Habilidad (codigo_H,descripcion)values (900,'Contabilidad');



Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (20,23297070,'Aaron Adoch Juarez',2,6000,'04-10-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (21,77767179,'Abisneo testa Aceton',0,7000,'28-04-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (22,23297970,'Adan Mateu Barillas',3,6765,'27-12-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (23,23297070,'Brandon AdreeChavez Gomez',2,4980,'01-08-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (24,40285960,'Carl Gonzalez Rodas',1,7990,'18-08-2018');




Insert into habilidad_empleado (codigo_H,NIF_E) values (896,20);
Insert into habilidad_empleado (codigo_H,NIF_E) values (897,21);
Insert into habilidad_empleado (codigo_H,NIF_E) values (898,22);
Insert into habilidad_empleado (codigo_H,NIF_E) values (899,23);
Insert into habilidad_empleado (codigo_H,NIF_E) values (900,24);


Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (740,'Erinque Adoch Alvarado','17-05-1994',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (741,'Ernesto Adoch Alvarado','22-11-1995',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (742,'Leonel Mateu Duran','10-10-1995',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (743,'Manuel Mateu Duran','26-12-1997',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (744,'rafael Mateu Duran','11-06-2000',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (745,'Mario Chávez Soto','09-09-2000',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (746,'Noemi Chávez Soto','07-06-2002',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (747,'carolina Gonzalez Mia','22-07-2003',24);


Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (240,'RHYVSA','Ciudad de México','Colonia la Condesa',20);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (241,'Katero CoorporativoSC',' Ciudad de México','Cuauhtémoc',21);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (242,'Tiendas de 3b S.A de CV','Puebla','Pino Suarez 5',22);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (243,'People Conection','Puebla','Cuatlasingo',23);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (244,'TYPHOON','Puebla','Cholula Rivadavia',24);





Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (677,'Departamento de Produccion',37275,240);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (678,'Departamento de Compras',73303.80,241);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (679,'Departamento de administracion',20636,242);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (680,'Departamento Finaciero',24586,243);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (681,'Departamento de Marketing',37031,244);


 insert into Empleado_Departamento (NIF_E,codigo_D) values (20,677);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (21,678);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (22,679);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (23,680);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (24,681);



CREATE PROCEDURE insertar_empleado
@nif_e int,
@Telefono int,
@Nombre int,
@Num_hijos int,
@Salario float,
@Fecha_alta datetime
as
BEGIN
INSERT INTO empleado (NIF_E,telefono,nombre,num_hijos,salario,fecha_alta)
VALUES
(@nif_e, @Telefono,@Nombre,@Num_hijos,@Salario,@Fecha_alta);
END;


CREATE PROCEDURE actualizar_empleado
@nif_e int,
@Telefono int,
@Nombre varchar(50),
@Num_hijos int,
@Salario float,
@Fecha_alta datetime

AS
BEGIN
UPDATE empleado SET
NIF_E=nif_e,
telefono=Telefono,
nombre=Nombre,
num_hijos=Num_hijos,
salario=Salario,
fecha_alta=Fecha_alta
WHERE NIF_E=nif_e;
END;




CREATE PROCEDURE eliminar_empleado
@nif_e int

as
BEGIN
DELETE FROM empleado WHERE NIF_E=nif_e;
END

CREATE PROCEDURE buscar_nombrePorEmpleado

@nombre varchar(50)
as
select *from Empleado where nombre=nombre;


CREATE PROCEDURE buscar_Numhijos
@Num_hijos int

as
select *from Empleado where num_hijos=Num_hijos;


CREATE PROCEDURE buscar_fechaAlta
@Fecha_alta datetime

as
select *from Empleado where fecha_alta=Fecha_alta;


CREATE PROCEDURE mostra_todos
as
select *from Empleado 


CREATE PROCEDURE insertar_departamento
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
INSERT INTO departamento(codigo_D,nombre,presupuesto_anual)
VALUES(@Codigo_d,@Nombre,@Presupuesto_anual);
END;


CREATE PROCEDURE actualizar_departamento
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
UPDATE departamento SET
codigo_D=Codigo_d,
nombre=Nombre,
presupuesto_anual=Presupuesto_anual

WHERE codigo_D=Codigo_d;
END;


CREATE PROCEDURE buscar_nombrePorDepartamento
@nombre varchar(50)
as
select *from Empleado where nombre=nombre;


CREATE PROCEDURE mostra_todos_departamentos
AS
select *from departamento 

CREATE PROCEDURE eliminar_departamento
@Codigo_d int

AS
BEGIN
DELETE FROM departamento WHERE Codigo_D=Codigo_d;
END

CREATE PROCEDURE insertar_centroTrabajo
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar(50),
@Direccion varchar(50)

as
BEGIN
INSERT INTO centro_trabajo (codigo_CT,nombre,poblacion, direccion)
VALUES(@Codigo_CT,@Nombre,@Poblacion, @Direccion);
END;

CREATE PROCEDURE actualizar_centroTrabajo
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar (50),
@Direccion varchar(50)

as
BEGIN
UPDATE centro_trabajo SET
codigo_CT=Codigo_CT,
nombre=Nombre,
poblacion=Poblacion,
direccion=Direccion
WHERE codigo_CT=Codigo_CT;
END;
*/
CREATE PROCEDURE [dbo].[buscar_nombreCentroTrabajo]
@Nombre varchar(50)

as
select *from Empleado where nombre=Nombre;

/*
CREATE PROCEDURE buscar_poblacionCentroTrabajo
@Poblacion varchar(50)

as
select *from centro_trabajo where poblacion=Poblacion;


CREATE PROCEDURE buscar_direccionCentroTrabajo
@Direccion  varchar(50)

as
select *from centro_trabajo  where direccion=Direccion;


CREATE PROCEDURE eliminar_centroTrabajo
@Codigo_CT int

as
BEGIN
DELETE FROM centro_trabajo  WHERE codigo_CT=Codigo_CT;
END

CREATE PROCEDURE insertar_habilidad

@Codigo_h int,
@Descripcion varchar(50)

as
BEGIN
INSERT INTO hablilidad (codigo_H,descripcion)
VALUES(@Codigo_h, @Descripcion);
END;


CREATE PROCEDURE actualizar_habilidad
@Codigo_H int,
@Descripcion varchar(50)
AS
BEGIN
UPDATE habilidad SET
codigo_H=Codigo_H,
descripcion=Descripcion
WHERE  codigo_H=Codigo_H;
END;


CREATE PROCEDURE buscar_descripcion
@Descripcion  varchar(50)
as
select *from habilidad  where descripcion=Descripcion;

CREATE PROCEDURE eliminar_Habilidad
@Codigo_h int
as
BEGIN
DELETE FROM habilidad   WHERE  codigo_H=Codigo_H;
END

*/
GO
/****** Object:  StoredProcedure [dbo].[buscar_fechaAlta]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
create database proyecto;


create table Habilidad(
codigo_H int PRIMARY KEY,
descripcion varchar (100)
);



create table Centro_trabajo(
codigo_CT int PRIMARY KEY,
nombre VARCHAR(50),
poblacion varchar(50),
direccion varchar(100),
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E)  ON UPDATE CASCADE
);


create table Departamento(
codigo_D int PRIMARY KEY,
nombre varchar(50),
presupuesto_anual float,
codigo_CT int,
FOREIGN KEY (codigo_CT)REFERENCES Centro_trabajo(codigo_CT)  ON UPDATE CASCADE
); 

create table Empleado(
NIF_E int PRIMARY KEY,
telefono int,
nombre varchar(50),
num_hijos int,
salario float,
fecha_alta datetime
);


Create table Habilidad_Empleado(
codigo_H int, 
NIF_E int,
FOREIGN KEY(codigo_H)REFERENCES Habilidad(codigo_H) on UPDATE CASCADE,
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E)  on UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Create table Hijo(
codigo_HE int PRIMARY KEY,
nombre varchar(50),
fecha_nacimiento datetime,
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E) ON UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Insert into Habilidad (codigo_H,descripcion)values(896,'Tecnico Computacional');
Insert into Habilidad (codigo_H,descripcion)values(897,'Trato con el Cliente');
Insert into Habilidad (codigo_H,descripcion)values (898,'Operador de telefonia');
Insert into Habilidad (codigo_H,descripcion)values (899,'Fresador');
Insert into Habilidad (codigo_H,descripcion)values (900,'Contabilidad');



Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (20,23297070,'Aaron Adoch Juarez',2,6000,'04-10-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (21,77767179,'Abisneo testa Aceton',0,7000,'28-04-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (22,23297970,'Adan Mateu Barillas',3,6765,'27-12-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (23,23297070,'Brandon AdreeChavez Gomez',2,4980,'01-08-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (24,40285960,'Carl Gonzalez Rodas',1,7990,'18-08-2018');




Insert into habilidad_empleado (codigo_H,NIF_E) values (896,20);
Insert into habilidad_empleado (codigo_H,NIF_E) values (897,21);
Insert into habilidad_empleado (codigo_H,NIF_E) values (898,22);
Insert into habilidad_empleado (codigo_H,NIF_E) values (899,23);
Insert into habilidad_empleado (codigo_H,NIF_E) values (900,24);


Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (740,'Erinque Adoch Alvarado','17-05-1994',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (741,'Ernesto Adoch Alvarado','22-11-1995',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (742,'Leonel Mateu Duran','10-10-1995',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (743,'Manuel Mateu Duran','26-12-1997',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (744,'rafael Mateu Duran','11-06-2000',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (745,'Mario Chávez Soto','09-09-2000',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (746,'Noemi Chávez Soto','07-06-2002',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (747,'carolina Gonzalez Mia','22-07-2003',24);


Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (240,'RHYVSA','Ciudad de México','Colonia la Condesa',20);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (241,'Katero CoorporativoSC',' Ciudad de México','Cuauhtémoc',21);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (242,'Tiendas de 3b S.A de CV','Puebla','Pino Suarez 5',22);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (243,'People Conection','Puebla','Cuatlasingo',23);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (244,'TYPHOON','Puebla','Cholula Rivadavia',24);





Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (677,'Departamento de Produccion',37275,240);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (678,'Departamento de Compras',73303.80,241);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (679,'Departamento de administracion',20636,242);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (680,'Departamento Finaciero',24586,243);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (681,'Departamento de Marketing',37031,244);


 insert into Empleado_Departamento (NIF_E,codigo_D) values (20,677);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (21,678);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (22,679);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (23,680);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (24,681);



CREATE PROCEDURE insertar_empleado
@nif_e int,
@Telefono int,
@Nombre int,
@Num_hijos int,
@Salario float,
@Fecha_alta datetime
as
BEGIN
INSERT INTO empleado (NIF_E,telefono,nombre,num_hijos,salario,fecha_alta)
VALUES
(@nif_e, @Telefono,@Nombre,@Num_hijos,@Salario,@Fecha_alta);
END;


CREATE PROCEDURE actualizar_empleado
@nif_e int,
@Telefono int,
@Nombre varchar(50),
@Num_hijos int,
@Salario float,
@Fecha_alta datetime

AS
BEGIN
UPDATE empleado SET
NIF_E=nif_e,
telefono=Telefono,
nombre=Nombre,
num_hijos=Num_hijos,
salario=Salario,
fecha_alta=Fecha_alta
WHERE NIF_E=nif_e;
END;




CREATE PROCEDURE eliminar_empleado
@nif_e int

as
BEGIN
DELETE FROM empleado WHERE NIF_E=nif_e;
END

CREATE PROCEDURE buscar_nombrePorEmpleado

@nombre varchar(50)
as
select *from Empleado where nombre=nombre;


CREATE PROCEDURE buscar_Numhijos
@Num_hijos int

as
select *from Empleado where num_hijos=Num_hijos;

*/
CREATE PROCEDURE [dbo].[buscar_fechaAlta]
@Fecha_alta datetime

as
select *from Empleado where fecha_alta=Fecha_alta;
/*

CREATE PROCEDURE mostra_todos
as
select *from Empleado 


CREATE PROCEDURE insertar_departamento
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
INSERT INTO departamento(codigo_D,nombre,presupuesto_anual)
VALUES(@Codigo_d,@Nombre,@Presupuesto_anual);
END;


CREATE PROCEDURE actualizar_departamento
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
UPDATE departamento SET
codigo_D=Codigo_d,
nombre=Nombre,
presupuesto_anual=Presupuesto_anual

WHERE codigo_D=Codigo_d;
END;


CREATE PROCEDURE buscar_nombrePorDepartamento
@nombre varchar(50)
as
select *from Empleado where nombre=nombre;


CREATE PROCEDURE mostra_todos_departamentos
AS
select *from departamento 

CREATE PROCEDURE eliminar_departamento
@Codigo_d int

AS
BEGIN
DELETE FROM departamento WHERE Codigo_D=Codigo_d;
END

CREATE PROCEDURE insertar_centroTrabajo
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar(50),
@Direccion varchar(50)

as
BEGIN
INSERT INTO centro_trabajo (codigo_CT,nombre,poblacion, direccion)
VALUES(@Codigo_CT,@Nombre,@Poblacion, @Direccion);
END;

CREATE PROCEDURE actualizar_centroTrabajo
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar (50),
@Direccion varchar(50)

as
BEGIN
UPDATE centro_trabajo SET
codigo_CT=Codigo_CT,
nombre=Nombre,
poblacion=Poblacion,
direccion=Direccion
WHERE codigo_CT=Codigo_CT;
END;

CREATE PROCEDURE buscar_nombreCentroTrabajo
@Nombre varchar(50)

as
select *from Empleado where nombre=Nombre;


CREATE PROCEDURE buscar_poblacionCentroTrabajo
@Poblacion varchar(50)

as
select *from centro_trabajo where poblacion=Poblacion;


CREATE PROCEDURE buscar_direccionCentroTrabajo
@Direccion  varchar(50)

as
select *from centro_trabajo  where direccion=Direccion;


CREATE PROCEDURE eliminar_centroTrabajo
@Codigo_CT int

as
BEGIN
DELETE FROM centro_trabajo  WHERE codigo_CT=Codigo_CT;
END

CREATE PROCEDURE insertar_habilidad

@Codigo_h int,
@Descripcion varchar(50)

as
BEGIN
INSERT INTO hablilidad (codigo_H,descripcion)
VALUES(@Codigo_h, @Descripcion);
END;


CREATE PROCEDURE actualizar_habilidad
@Codigo_H int,
@Descripcion varchar(50)
AS
BEGIN
UPDATE habilidad SET
codigo_H=Codigo_H,
descripcion=Descripcion
WHERE  codigo_H=Codigo_H;
END;


CREATE PROCEDURE buscar_descripcion
@Descripcion  varchar(50)
as
select *from habilidad  where descripcion=Descripcion;

CREATE PROCEDURE eliminar_Habilidad
@Codigo_h int
as
BEGIN
DELETE FROM habilidad   WHERE  codigo_H=Codigo_H;
END

*/
GO
/****** Object:  StoredProcedure [dbo].[buscar_descripcion]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
create database proyecto;


create table Habilidad(
codigo_H int PRIMARY KEY,
descripcion varchar (100)
);



create table Centro_trabajo(
codigo_CT int PRIMARY KEY,
nombre VARCHAR(50),
poblacion varchar(50),
direccion varchar(100),
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E)  ON UPDATE CASCADE
);


create table Departamento(
codigo_D int PRIMARY KEY,
nombre varchar(50),
presupuesto_anual float,
codigo_CT int,
FOREIGN KEY (codigo_CT)REFERENCES Centro_trabajo(codigo_CT)  ON UPDATE CASCADE
); 

create table Empleado(
NIF_E int PRIMARY KEY,
telefono int,
nombre varchar(50),
num_hijos int,
salario float,
fecha_alta datetime
);


Create table Habilidad_Empleado(
codigo_H int, 
NIF_E int,
FOREIGN KEY(codigo_H)REFERENCES Habilidad(codigo_H) on UPDATE CASCADE,
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E)  on UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Create table Hijo(
codigo_HE int PRIMARY KEY,
nombre varchar(50),
fecha_nacimiento datetime,
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E) ON UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Insert into Habilidad (codigo_H,descripcion)values(896,'Tecnico Computacional');
Insert into Habilidad (codigo_H,descripcion)values(897,'Trato con el Cliente');
Insert into Habilidad (codigo_H,descripcion)values (898,'Operador de telefonia');
Insert into Habilidad (codigo_H,descripcion)values (899,'Fresador');
Insert into Habilidad (codigo_H,descripcion)values (900,'Contabilidad');



Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (20,23297070,'Aaron Adoch Juarez',2,6000,'04-10-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (21,77767179,'Abisneo testa Aceton',0,7000,'28-04-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (22,23297970,'Adan Mateu Barillas',3,6765,'27-12-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (23,23297070,'Brandon AdreeChavez Gomez',2,4980,'01-08-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (24,40285960,'Carl Gonzalez Rodas',1,7990,'18-08-2018');




Insert into habilidad_empleado (codigo_H,NIF_E) values (896,20);
Insert into habilidad_empleado (codigo_H,NIF_E) values (897,21);
Insert into habilidad_empleado (codigo_H,NIF_E) values (898,22);
Insert into habilidad_empleado (codigo_H,NIF_E) values (899,23);
Insert into habilidad_empleado (codigo_H,NIF_E) values (900,24);


Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (740,'Erinque Adoch Alvarado','17-05-1994',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (741,'Ernesto Adoch Alvarado','22-11-1995',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (742,'Leonel Mateu Duran','10-10-1995',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (743,'Manuel Mateu Duran','26-12-1997',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (744,'rafael Mateu Duran','11-06-2000',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (745,'Mario Chávez Soto','09-09-2000',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (746,'Noemi Chávez Soto','07-06-2002',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (747,'carolina Gonzalez Mia','22-07-2003',24);


Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (240,'RHYVSA','Ciudad de México','Colonia la Condesa',20);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (241,'Katero CoorporativoSC',' Ciudad de México','Cuauhtémoc',21);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (242,'Tiendas de 3b S.A de CV','Puebla','Pino Suarez 5',22);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (243,'People Conection','Puebla','Cuatlasingo',23);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (244,'TYPHOON','Puebla','Cholula Rivadavia',24);





Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (677,'Departamento de Produccion',37275,240);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (678,'Departamento de Compras',73303.80,241);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (679,'Departamento de administracion',20636,242);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (680,'Departamento Finaciero',24586,243);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (681,'Departamento de Marketing',37031,244);


 insert into Empleado_Departamento (NIF_E,codigo_D) values (20,677);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (21,678);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (22,679);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (23,680);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (24,681);



CREATE PROCEDURE insertar_empleado
@nif_e int,
@Telefono int,
@Nombre int,
@Num_hijos int,
@Salario float,
@Fecha_alta datetime
as
BEGIN
INSERT INTO empleado (NIF_E,telefono,nombre,num_hijos,salario,fecha_alta)
VALUES
(@nif_e, @Telefono,@Nombre,@Num_hijos,@Salario,@Fecha_alta);
END;


CREATE PROCEDURE actualizar_empleado
@nif_e int,
@Telefono int,
@Nombre varchar(50),
@Num_hijos int,
@Salario float,
@Fecha_alta datetime

AS
BEGIN
UPDATE empleado SET
NIF_E=nif_e,
telefono=Telefono,
nombre=Nombre,
num_hijos=Num_hijos,
salario=Salario,
fecha_alta=Fecha_alta
WHERE NIF_E=nif_e;
END;




CREATE PROCEDURE eliminar_empleado
@nif_e int

as
BEGIN
DELETE FROM empleado WHERE NIF_E=nif_e;
END

CREATE PROCEDURE buscar_nombrePorEmpleado

@nombre varchar(50)
as
select *from Empleado where nombre=nombre;


CREATE PROCEDURE buscar_Numhijos
@Num_hijos int

as
select *from Empleado where num_hijos=Num_hijos;


CREATE PROCEDURE buscar_fechaAlta
@Fecha_alta datetime

as
select *from Empleado where fecha_alta=Fecha_alta;


CREATE PROCEDURE mostra_todos
as
select *from Empleado 


CREATE PROCEDURE insertar_departamento
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
INSERT INTO departamento(codigo_D,nombre,presupuesto_anual)
VALUES(@Codigo_d,@Nombre,@Presupuesto_anual);
END;


CREATE PROCEDURE actualizar_departamento
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
UPDATE departamento SET
codigo_D=Codigo_d,
nombre=Nombre,
presupuesto_anual=Presupuesto_anual

WHERE codigo_D=Codigo_d;
END;


CREATE PROCEDURE buscar_nombrePorDepartamento
@nombre varchar(50)
as
select *from Empleado where nombre=nombre;


CREATE PROCEDURE mostra_todos_departamentos
AS
select *from departamento 

CREATE PROCEDURE eliminar_departamento
@Codigo_d int

AS
BEGIN
DELETE FROM departamento WHERE Codigo_D=Codigo_d;
END

CREATE PROCEDURE insertar_centroTrabajo
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar(50),
@Direccion varchar(50)

as
BEGIN
INSERT INTO centro_trabajo (codigo_CT,nombre,poblacion, direccion)
VALUES(@Codigo_CT,@Nombre,@Poblacion, @Direccion);
END;

CREATE PROCEDURE actualizar_centroTrabajo
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar (50),
@Direccion varchar(50)

as
BEGIN
UPDATE centro_trabajo SET
codigo_CT=Codigo_CT,
nombre=Nombre,
poblacion=Poblacion,
direccion=Direccion
WHERE codigo_CT=Codigo_CT;
END;

CREATE PROCEDURE buscar_nombreCentroTrabajo
@Nombre varchar(50)

as
select *from Empleado where nombre=Nombre;


CREATE PROCEDURE buscar_poblacionCentroTrabajo
@Poblacion varchar(50)

as
select *from centro_trabajo where poblacion=Poblacion;

CREATE PROCEDURE buscar_direccionCentroTrabajo
@Direccion  varchar(50)

as
select *from centro_trabajo  where direccion=Direccion;

CREATE PROCEDURE eliminar_centroTrabajo
@Codigo_CT int

as
BEGIN
DELETE FROM centro_trabajo  WHERE codigo_CT=Codigo_CT;
END

CREATE PROCEDURE insertar_habilidad

@Codigo_h int,
@Descripcion varchar(50)

as
BEGIN
INSERT INTO hablilidad (codigo_H,descripcion)
VALUES(@Codigo_h, @Descripcion);
END;


CREATE PROCEDURE actualizar_habilidad
@Codigo_H int,
@Descripcion varchar(50)
AS
BEGIN
UPDATE habilidad SET
codigo_H=Codigo_H,
descripcion=Descripcion
WHERE  codigo_H=Codigo_H;
END;

*/
CREATE PROCEDURE [dbo].[buscar_descripcion]
@Descripcion  varchar(50)
as
select *from habilidad  where descripcion=Descripcion;
/*
CREATE PROCEDURE eliminar_Habilidad
@Codigo_h int
as
BEGIN
DELETE FROM habilidad   WHERE  codigo_H=Codigo_H;
END

*/
GO
/****** Object:  Table [dbo].[Hijo]    Script Date: 06/12/2019 16:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hijo](
	[codigo_HE] [int] NOT NULL,
	[nombre] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[fecha_nacimiento] [datetime] NULL,
	[NIF_E] [int] NULL,
 CONSTRAINT [PK__Hijo__7576F96C108B795B] PRIMARY KEY CLUSTERED 
(
	[codigo_HE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Hijo] DISABLE CHANGE_TRACKING
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Hijo] ([codigo_HE], [nombre], [fecha_nacimiento], [NIF_E]) VALUES (1, N'hjahjshjas', CAST(0x0000AB2100000000 AS DateTime), 90)
INSERT [dbo].[Hijo] ([codigo_HE], [nombre], [fecha_nacimiento], [NIF_E]) VALUES (2, N'Juan', CAST(0xFFFF6E6600000000 AS DateTime), 90)
INSERT [dbo].[Hijo] ([codigo_HE], [nombre], [fecha_nacimiento], [NIF_E]) VALUES (12, N'fghghgh', CAST(0x00008BBE00000000 AS DateTime), 234)
INSERT [dbo].[Hijo] ([codigo_HE], [nombre], [fecha_nacimiento], [NIF_E]) VALUES (90, N'Juan Perez Fernandez', CAST(0x0000818200000000 AS DateTime), 1)
INSERT [dbo].[Hijo] ([codigo_HE], [nombre], [fecha_nacimiento], [NIF_E]) VALUES (745, N'Mario Chávez Soto', CAST(0x00008FA800000000 AS DateTime), 23)
INSERT [dbo].[Hijo] ([codigo_HE], [nombre], [fecha_nacimiento], [NIF_E]) VALUES (746, N'Noemi Chávez Soto', CAST(0x0000922400000000 AS DateTime), 23)
/****** Object:  Table [dbo].[Habilidad_Empleado]    Script Date: 06/12/2019 16:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habilidad_Empleado](
	[codigo_H] [int] NULL,
	[NIF_E] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Habilidad_Empleado] DISABLE CHANGE_TRACKING
GO
INSERT [dbo].[Habilidad_Empleado] ([codigo_H], [NIF_E]) VALUES (897, 123)
INSERT [dbo].[Habilidad_Empleado] ([codigo_H], [NIF_E]) VALUES (897, 21)
INSERT [dbo].[Habilidad_Empleado] ([codigo_H], [NIF_E]) VALUES (897, 1212)
INSERT [dbo].[Habilidad_Empleado] ([codigo_H], [NIF_E]) VALUES (900, 1)
INSERT [dbo].[Habilidad_Empleado] ([codigo_H], [NIF_E]) VALUES (897, 99)
INSERT [dbo].[Habilidad_Empleado] ([codigo_H], [NIF_E]) VALUES (897, 100)
INSERT [dbo].[Habilidad_Empleado] ([codigo_H], [NIF_E]) VALUES (897, 100)
INSERT [dbo].[Habilidad_Empleado] ([codigo_H], [NIF_E]) VALUES (900, 98)
INSERT [dbo].[Habilidad_Empleado] ([codigo_H], [NIF_E]) VALUES (900, 98)
INSERT [dbo].[Habilidad_Empleado] ([codigo_H], [NIF_E]) VALUES (900, 46)
INSERT [dbo].[Habilidad_Empleado] ([codigo_H], [NIF_E]) VALUES (900, 37)
INSERT [dbo].[Habilidad_Empleado] ([codigo_H], [NIF_E]) VALUES (900, 38)
INSERT [dbo].[Habilidad_Empleado] ([codigo_H], [NIF_E]) VALUES (900, 38)
INSERT [dbo].[Habilidad_Empleado] ([codigo_H], [NIF_E]) VALUES (900, 39)
INSERT [dbo].[Habilidad_Empleado] ([codigo_H], [NIF_E]) VALUES (900, 59)
INSERT [dbo].[Habilidad_Empleado] ([codigo_H], [NIF_E]) VALUES (897, 84)
INSERT [dbo].[Habilidad_Empleado] ([codigo_H], [NIF_E]) VALUES (900, 90)
INSERT [dbo].[Habilidad_Empleado] ([codigo_H], [NIF_E]) VALUES (896, 234)
INSERT [dbo].[Habilidad_Empleado] ([codigo_H], [NIF_E]) VALUES (900, 47)
INSERT [dbo].[Habilidad_Empleado] ([codigo_H], [NIF_E]) VALUES (900, 48)
INSERT [dbo].[Habilidad_Empleado] ([codigo_H], [NIF_E]) VALUES (900, 58)
INSERT [dbo].[Habilidad_Empleado] ([codigo_H], [NIF_E]) VALUES (900, 23)
INSERT [dbo].[Habilidad_Empleado] ([codigo_H], [NIF_E]) VALUES (900, 89)
/****** Object:  StoredProcedure [dbo].[actualizar_habilidad]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[actualizar_habilidad]
@Codigo_H int,
@Descripcion varchar(50)
AS
BEGIN
UPDATE habilidad SET
codigo_H=@Codigo_H,
descripcion=@Descripcion
WHERE  codigo_H=@Codigo_H;
END;
GO
/****** Object:  StoredProcedure [dbo].[insertar_habilidad]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[insertar_habilidad]
@Codigo_h int,
@Descripcion varchar(50)
as
BEGIN
INSERT INTO Habilidad (codigo_H,descripcion)
VALUES(@Codigo_h, @Descripcion);
END;
GO
/****** Object:  StoredProcedure [dbo].[mostra_todos_habilidad]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mostra_todos_habilidad]
as
select *from Habilidad
GO
/****** Object:  StoredProcedure [dbo].[mostrar_habilidad]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[mostrar_habilidad]
@Codigo_h int,
@Descripcion varchar(50) output
as
BEGIN
select
@Descripcion=descripcion

from Habilidad
where
codigo_H =@Codigo_h
END
GO
/****** Object:  StoredProcedure [dbo].[mostrar_todos_CT]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[mostrar_todos_CT]
as 
begin
select  nombre from Centro_trabajo
end
GO
/****** Object:  StoredProcedure [dbo].[mostrar_hijo]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[mostrar_hijo]
@Codigo_he int,
@Nombre varchar(50) output,
@Fecha_nacimiento datetime output,
@nif_e int
as
begin
select
@Nombre=nombre,
@Fecha_nacimiento=fecha_nacimiento
from Hijo where NIF_E=@nif_e and codigo_HE=@Codigo_he
end
GO
/****** Object:  StoredProcedure [dbo].[mostrar_CentroTrabajo]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[mostrar_CentroTrabajo]
@Codigo_CT int,
@Nombre varchar(50) output,
@Poblacion varchar(50) output,
@Direccion varchar(50) output
as
BEGIN
select
@Nombre=nombre,
@Poblacion= poblacion,
@Direccion=direccion
from Centro_trabajo
where
codigo_CT =@Codigo_CT
END
GO
/****** Object:  StoredProcedure [dbo].[insertar_hijo]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertar_hijo]
@Codigo_he int,
@Nombre varchar(50),
@Fecha_nacimiento datetime,
@nif_e int
as
begin
INSERT INTO Hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E)
VALUES (@Codigo_he,@Nombre,@Fecha_nacimiento,@nif_e)
end
GO
/****** Object:  StoredProcedure [dbo].[buscar_direccionCentroTrabajo]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
create database proyecto;


create table Habilidad(
codigo_H int PRIMARY KEY,
descripcion varchar (100)
);



create table Centro_trabajo(
codigo_CT int PRIMARY KEY,
nombre VARCHAR(50),
poblacion varchar(50),
direccion varchar(100),
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E)  ON UPDATE CASCADE
);


create table Departamento(
codigo_D int PRIMARY KEY,
nombre varchar(50),
presupuesto_anual float,
codigo_CT int,
FOREIGN KEY (codigo_CT)REFERENCES Centro_trabajo(codigo_CT)  ON UPDATE CASCADE
); 

create table Empleado(
NIF_E int PRIMARY KEY,
telefono int,
nombre varchar(50),
num_hijos int,
salario float,
fecha_alta datetime
);


Create table Habilidad_Empleado(
codigo_H int, 
NIF_E int,
FOREIGN KEY(codigo_H)REFERENCES Habilidad(codigo_H) on UPDATE CASCADE,
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E)  on UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Create table Hijo(
codigo_HE int PRIMARY KEY,
nombre varchar(50),
fecha_nacimiento datetime,
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E) ON UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Insert into Habilidad (codigo_H,descripcion)values(896,'Tecnico Computacional');
Insert into Habilidad (codigo_H,descripcion)values(897,'Trato con el Cliente');
Insert into Habilidad (codigo_H,descripcion)values (898,'Operador de telefonia');
Insert into Habilidad (codigo_H,descripcion)values (899,'Fresador');
Insert into Habilidad (codigo_H,descripcion)values (900,'Contabilidad');



Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (20,23297070,'Aaron Adoch Juarez',2,6000,'04-10-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (21,77767179,'Abisneo testa Aceton',0,7000,'28-04-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (22,23297970,'Adan Mateu Barillas',3,6765,'27-12-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (23,23297070,'Brandon AdreeChavez Gomez',2,4980,'01-08-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (24,40285960,'Carl Gonzalez Rodas',1,7990,'18-08-2018');




Insert into habilidad_empleado (codigo_H,NIF_E) values (896,20);
Insert into habilidad_empleado (codigo_H,NIF_E) values (897,21);
Insert into habilidad_empleado (codigo_H,NIF_E) values (898,22);
Insert into habilidad_empleado (codigo_H,NIF_E) values (899,23);
Insert into habilidad_empleado (codigo_H,NIF_E) values (900,24);


Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (740,'Erinque Adoch Alvarado','17-05-1994',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (741,'Ernesto Adoch Alvarado','22-11-1995',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (742,'Leonel Mateu Duran','10-10-1995',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (743,'Manuel Mateu Duran','26-12-1997',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (744,'rafael Mateu Duran','11-06-2000',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (745,'Mario Chávez Soto','09-09-2000',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (746,'Noemi Chávez Soto','07-06-2002',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (747,'carolina Gonzalez Mia','22-07-2003',24);


Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (240,'RHYVSA','Ciudad de México','Colonia la Condesa',20);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (241,'Katero CoorporativoSC',' Ciudad de México','Cuauhtémoc',21);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (242,'Tiendas de 3b S.A de CV','Puebla','Pino Suarez 5',22);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (243,'People Conection','Puebla','Cuatlasingo',23);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (244,'TYPHOON','Puebla','Cholula Rivadavia',24);





Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (677,'Departamento de Produccion',37275,240);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (678,'Departamento de Compras',73303.80,241);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (679,'Departamento de administracion',20636,242);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (680,'Departamento Finaciero',24586,243);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (681,'Departamento de Marketing',37031,244);


 insert into Empleado_Departamento (NIF_E,codigo_D) values (20,677);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (21,678);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (22,679);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (23,680);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (24,681);



CREATE PROCEDURE insertar_empleado
@nif_e int,
@Telefono int,
@Nombre int,
@Num_hijos int,
@Salario float,
@Fecha_alta datetime
as
BEGIN
INSERT INTO empleado (NIF_E,telefono,nombre,num_hijos,salario,fecha_alta)
VALUES
(@nif_e, @Telefono,@Nombre,@Num_hijos,@Salario,@Fecha_alta);
END;


CREATE PROCEDURE actualizar_empleado
@nif_e int,
@Telefono int,
@Nombre varchar(50),
@Num_hijos int,
@Salario float,
@Fecha_alta datetime

AS
BEGIN
UPDATE empleado SET
NIF_E=nif_e,
telefono=Telefono,
nombre=Nombre,
num_hijos=Num_hijos,
salario=Salario,
fecha_alta=Fecha_alta
WHERE NIF_E=nif_e;
END;




CREATE PROCEDURE eliminar_empleado
@nif_e int

as
BEGIN
DELETE FROM empleado WHERE NIF_E=nif_e;
END

CREATE PROCEDURE buscar_nombrePorEmpleado

@nombre varchar(50)
as
select *from Empleado where nombre=nombre;


CREATE PROCEDURE buscar_Numhijos
@Num_hijos int

as
select *from Empleado where num_hijos=Num_hijos;


CREATE PROCEDURE buscar_fechaAlta
@Fecha_alta datetime

as
select *from Empleado where fecha_alta=Fecha_alta;


CREATE PROCEDURE mostra_todos
as
select *from Empleado 


CREATE PROCEDURE insertar_departamento
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
INSERT INTO departamento(codigo_D,nombre,presupuesto_anual)
VALUES(@Codigo_d,@Nombre,@Presupuesto_anual);
END;


CREATE PROCEDURE actualizar_departamento
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
UPDATE departamento SET
codigo_D=Codigo_d,
nombre=Nombre,
presupuesto_anual=Presupuesto_anual

WHERE codigo_D=Codigo_d;
END;


CREATE PROCEDURE buscar_nombrePorDepartamento
@nombre varchar(50)
as
select *from Empleado where nombre=nombre;


CREATE PROCEDURE mostra_todos_departamentos
AS
select *from departamento 

CREATE PROCEDURE eliminar_departamento
@Codigo_d int

AS
BEGIN
DELETE FROM departamento WHERE Codigo_D=Codigo_d;
END

CREATE PROCEDURE insertar_centroTrabajo
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar(50),
@Direccion varchar(50)

as
BEGIN
INSERT INTO centro_trabajo (codigo_CT,nombre,poblacion, direccion)
VALUES(@Codigo_CT,@Nombre,@Poblacion, @Direccion);
END;

CREATE PROCEDURE actualizar_centroTrabajo
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar (50),
@Direccion varchar(50)

as
BEGIN
UPDATE centro_trabajo SET
codigo_CT=Codigo_CT,
nombre=Nombre,
poblacion=Poblacion,
direccion=Direccion
WHERE codigo_CT=Codigo_CT;
END;

CREATE PROCEDURE buscar_nombreCentroTrabajo
@Nombre varchar(50)

as
select *from Empleado where nombre=Nombre;


CREATE PROCEDURE buscar_poblacionCentroTrabajo
@Poblacion varchar(50)

as
select *from centro_trabajo where poblacion=Poblacion;
*/

CREATE PROCEDURE [dbo].[buscar_direccionCentroTrabajo]
@Direccion  varchar(50)

as
select *from centro_trabajo  where direccion=Direccion;

/*
CREATE PROCEDURE eliminar_centroTrabajo
@Codigo_CT int

as
BEGIN
DELETE FROM centro_trabajo  WHERE codigo_CT=Codigo_CT;
END

CREATE PROCEDURE insertar_habilidad

@Codigo_h int,
@Descripcion varchar(50)

as
BEGIN
INSERT INTO hablilidad (codigo_H,descripcion)
VALUES(@Codigo_h, @Descripcion);
END;


CREATE PROCEDURE actualizar_habilidad
@Codigo_H int,
@Descripcion varchar(50)
AS
BEGIN
UPDATE habilidad SET
codigo_H=Codigo_H,
descripcion=Descripcion
WHERE  codigo_H=Codigo_H;
END;


CREATE PROCEDURE buscar_descripcion
@Descripcion  varchar(50)
as
select *from habilidad  where descripcion=Descripcion;

CREATE PROCEDURE eliminar_Habilidad
@Codigo_h int
as
BEGIN
DELETE FROM habilidad   WHERE  codigo_H=Codigo_H;
END

*/
GO
/****** Object:  StoredProcedure [dbo].[actualizar_hijo]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[actualizar_hijo]
@Codigo_he int,
@Nombre varchar(50),
@Fecha_nacimiento datetime
as
begin
update Hijo set
nombre=@Nombre,
fecha_nacimiento=@Fecha_nacimiento
where codigo_HE=@Codigo_he
end
GO
/****** Object:  StoredProcedure [dbo].[insertar_centroTrabajo]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
create database proyecto;


create table Habilidad(
codigo_H int PRIMARY KEY,
descripcion varchar (100)
);



create table Centro_trabajo(
codigo_CT int PRIMARY KEY,
nombre VARCHAR(50),
poblacion varchar(50),
direccion varchar(100),
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E)  ON UPDATE CASCADE
);


create table Departamento(
codigo_D int PRIMARY KEY,
nombre varchar(50),
presupuesto_anual float,
codigo_CT int,
FOREIGN KEY (codigo_CT)REFERENCES Centro_trabajo(codigo_CT)  ON UPDATE CASCADE
); 

create table Empleado(
NIF_E int PRIMARY KEY,
telefono int,
nombre varchar(50),
num_hijos int,
salario float,
fecha_alta datetime
);


Create table Habilidad_Empleado(
codigo_H int, 
NIF_E int,
FOREIGN KEY(codigo_H)REFERENCES Habilidad(codigo_H) on UPDATE CASCADE,
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E)  on UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Create table Hijo(
codigo_HE int PRIMARY KEY,
nombre varchar(50),
fecha_nacimiento datetime,
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E) ON UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Insert into Habilidad (codigo_H,descripcion)values(896,'Tecnico Computacional');
Insert into Habilidad (codigo_H,descripcion)values(897,'Trato con el Cliente');
Insert into Habilidad (codigo_H,descripcion)values (898,'Operador de telefonia');
Insert into Habilidad (codigo_H,descripcion)values (899,'Fresador');
Insert into Habilidad (codigo_H,descripcion)values (900,'Contabilidad');



Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (20,23297070,'Aaron Adoch Juarez',2,6000,'04-10-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (21,77767179,'Abisneo testa Aceton',0,7000,'28-04-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (22,23297970,'Adan Mateu Barillas',3,6765,'27-12-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (23,23297070,'Brandon AdreeChavez Gomez',2,4980,'01-08-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (24,40285960,'Carl Gonzalez Rodas',1,7990,'18-08-2018');




Insert into habilidad_empleado (codigo_H,NIF_E) values (896,20);
Insert into habilidad_empleado (codigo_H,NIF_E) values (897,21);
Insert into habilidad_empleado (codigo_H,NIF_E) values (898,22);
Insert into habilidad_empleado (codigo_H,NIF_E) values (899,23);
Insert into habilidad_empleado (codigo_H,NIF_E) values (900,24);


Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (740,'Erinque Adoch Alvarado','17-05-1994',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (741,'Ernesto Adoch Alvarado','22-11-1995',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (742,'Leonel Mateu Duran','10-10-1995',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (743,'Manuel Mateu Duran','26-12-1997',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (744,'rafael Mateu Duran','11-06-2000',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (745,'Mario Chávez Soto','09-09-2000',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (746,'Noemi Chávez Soto','07-06-2002',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (747,'carolina Gonzalez Mia','22-07-2003',24);


Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (240,'RHYVSA','Ciudad de México','Colonia la Condesa',20);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (241,'Katero CoorporativoSC',' Ciudad de México','Cuauhtémoc',21);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (242,'Tiendas de 3b S.A de CV','Puebla','Pino Suarez 5',22);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (243,'People Conection','Puebla','Cuatlasingo',23);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (244,'TYPHOON','Puebla','Cholula Rivadavia',24);





Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (677,'Departamento de Produccion',37275,240);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (678,'Departamento de Compras',73303.80,241);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (679,'Departamento de administracion',20636,242);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (680,'Departamento Finaciero',24586,243);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (681,'Departamento de Marketing',37031,244);


 insert into Empleado_Departamento (NIF_E,codigo_D) values (20,677);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (21,678);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (22,679);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (23,680);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (24,681);



CREATE PROCEDURE insertar_empleado
@nif_e int,
@Telefono int,
@Nombre int,
@Num_hijos int,
@Salario float,
@Fecha_alta datetime
as
BEGIN
INSERT INTO empleado (NIF_E,telefono,nombre,num_hijos,salario,fecha_alta)
VALUES
(@nif_e, @Telefono,@Nombre,@Num_hijos,@Salario,@Fecha_alta);
END;


CREATE PROCEDURE actualizar_empleado
@nif_e int,
@Telefono int,
@Nombre varchar(50),
@Num_hijos int,
@Salario float,
@Fecha_alta datetime

AS
BEGIN
UPDATE empleado SET
NIF_E=nif_e,
telefono=Telefono,
nombre=Nombre,
num_hijos=Num_hijos,
salario=Salario,
fecha_alta=Fecha_alta
WHERE NIF_E=nif_e;
END;




CREATE PROCEDURE eliminar_empleado
@nif_e int

as
BEGIN
DELETE FROM empleado WHERE NIF_E=nif_e;
END

CREATE PROCEDURE buscar_nombrePorEmpleado

@nombre varchar(50)
as
select *from Empleado where nombre=nombre;


CREATE PROCEDURE buscar_Numhijos
@Num_hijos int

as
select *from Empleado where num_hijos=Num_hijos;


CREATE PROCEDURE buscar_fechaAlta
@Fecha_alta datetime

as
select *from Empleado where fecha_alta=Fecha_alta;


CREATE PROCEDURE mostra_todos
as
select *from Empleado 


CREATE PROCEDURE insertar_departamento
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
INSERT INTO departamento(codigo_D,nombre,presupuesto_anual)
VALUES(@Codigo_d,@Nombre,@Presupuesto_anual);
END;


CREATE PROCEDURE actualizar_departamento
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
UPDATE departamento SET
codigo_D=Codigo_d,
nombre=Nombre,
presupuesto_anual=Presupuesto_anual

WHERE codigo_D=Codigo_d;
END;


CREATE PROCEDURE buscar_nombrePorDepartamento
@nombre varchar(50)
as
select *from Empleado where nombre=nombre;


CREATE PROCEDURE mostra_todos_departamentos
AS
select *from departamento 

CREATE PROCEDURE eliminar_departamento
@Codigo_d int

AS
BEGIN
DELETE FROM departamento WHERE Codigo_D=Codigo_d;
END
*/
CREATE PROCEDURE [dbo].[insertar_centroTrabajo]
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar(50),
@Direccion varchar(50)

as
BEGIN
INSERT INTO centro_trabajo (codigo_CT,nombre,poblacion, direccion)
VALUES(@Codigo_CT,@Nombre,@Poblacion, @Direccion);
END;
/*
CREATE PROCEDURE actualizar_centroTrabajo
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar (50),
@Direccion varchar(50)

as
BEGIN
UPDATE centro_trabajo SET
codigo_CT=Codigo_CT,
nombre=Nombre,
poblacion=Poblacion,
direccion=Direccion
WHERE codigo_CT=Codigo_CT;
END;

CREATE PROCEDURE buscar_nombreCentroTrabajo
@Nombre varchar(50)

as
select *from Empleado where nombre=Nombre;


CREATE PROCEDURE buscar_poblacionCentroTrabajo
@Poblacion varchar(50)

as
select *from centro_trabajo where poblacion=Poblacion;


CREATE PROCEDURE buscar_direccionCentroTrabajo
@Direccion  varchar(50)

as
select *from centro_trabajo  where direccion=Direccion;


CREATE PROCEDURE eliminar_centroTrabajo
@Codigo_CT int

as
BEGIN
DELETE FROM centro_trabajo  WHERE codigo_CT=Codigo_CT;
END

CREATE PROCEDURE insertar_habilidad

@Codigo_h int,
@Descripcion varchar(50)

as
BEGIN
INSERT INTO hablilidad (codigo_H,descripcion)
VALUES(@Codigo_h, @Descripcion);
END;


CREATE PROCEDURE actualizar_habilidad
@Codigo_H int,
@Descripcion varchar(50)
AS
BEGIN
UPDATE habilidad SET
codigo_H=Codigo_H,
descripcion=Descripcion
WHERE  codigo_H=Codigo_H;
END;


CREATE PROCEDURE buscar_descripcion
@Descripcion  varchar(50)
as
select *from habilidad  where descripcion=Descripcion;

CREATE PROCEDURE eliminar_Habilidad
@Codigo_h int
as
BEGIN
DELETE FROM habilidad   WHERE  codigo_H=Codigo_H;
END

*/
GO
/****** Object:  StoredProcedure [dbo].[eliminar_Habilidad]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eliminar_Habilidad]
@Codigo_h int
as
BEGIN
DELETE FROM Habilidad_Empleado WHERE codigo_H=@Codigo_h
DELETE FROM Habilidad   WHERE  codigo_H=@Codigo_h;
END
GO
/****** Object:  StoredProcedure [dbo].[buscar_poblacionCentroTrabajo]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
create database proyecto;


create table Habilidad(
codigo_H int PRIMARY KEY,
descripcion varchar (100)
);



create table Centro_trabajo(
codigo_CT int PRIMARY KEY,
nombre VARCHAR(50),
poblacion varchar(50),
direccion varchar(100),
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E)  ON UPDATE CASCADE
);


create table Departamento(
codigo_D int PRIMARY KEY,
nombre varchar(50),
presupuesto_anual float,
codigo_CT int,
FOREIGN KEY (codigo_CT)REFERENCES Centro_trabajo(codigo_CT)  ON UPDATE CASCADE
); 

create table Empleado(
NIF_E int PRIMARY KEY,
telefono int,
nombre varchar(50),
num_hijos int,
salario float,
fecha_alta datetime
);


Create table Habilidad_Empleado(
codigo_H int, 
NIF_E int,
FOREIGN KEY(codigo_H)REFERENCES Habilidad(codigo_H) on UPDATE CASCADE,
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E)  on UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Create table Hijo(
codigo_HE int PRIMARY KEY,
nombre varchar(50),
fecha_nacimiento datetime,
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E) ON UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Insert into Habilidad (codigo_H,descripcion)values(896,'Tecnico Computacional');
Insert into Habilidad (codigo_H,descripcion)values(897,'Trato con el Cliente');
Insert into Habilidad (codigo_H,descripcion)values (898,'Operador de telefonia');
Insert into Habilidad (codigo_H,descripcion)values (899,'Fresador');
Insert into Habilidad (codigo_H,descripcion)values (900,'Contabilidad');



Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (20,23297070,'Aaron Adoch Juarez',2,6000,'04-10-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (21,77767179,'Abisneo testa Aceton',0,7000,'28-04-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (22,23297970,'Adan Mateu Barillas',3,6765,'27-12-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (23,23297070,'Brandon AdreeChavez Gomez',2,4980,'01-08-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (24,40285960,'Carl Gonzalez Rodas',1,7990,'18-08-2018');




Insert into habilidad_empleado (codigo_H,NIF_E) values (896,20);
Insert into habilidad_empleado (codigo_H,NIF_E) values (897,21);
Insert into habilidad_empleado (codigo_H,NIF_E) values (898,22);
Insert into habilidad_empleado (codigo_H,NIF_E) values (899,23);
Insert into habilidad_empleado (codigo_H,NIF_E) values (900,24);


Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (740,'Erinque Adoch Alvarado','17-05-1994',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (741,'Ernesto Adoch Alvarado','22-11-1995',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (742,'Leonel Mateu Duran','10-10-1995',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (743,'Manuel Mateu Duran','26-12-1997',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (744,'rafael Mateu Duran','11-06-2000',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (745,'Mario Chávez Soto','09-09-2000',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (746,'Noemi Chávez Soto','07-06-2002',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (747,'carolina Gonzalez Mia','22-07-2003',24);


Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (240,'RHYVSA','Ciudad de México','Colonia la Condesa',20);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (241,'Katero CoorporativoSC',' Ciudad de México','Cuauhtémoc',21);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (242,'Tiendas de 3b S.A de CV','Puebla','Pino Suarez 5',22);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (243,'People Conection','Puebla','Cuatlasingo',23);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (244,'TYPHOON','Puebla','Cholula Rivadavia',24);





Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (677,'Departamento de Produccion',37275,240);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (678,'Departamento de Compras',73303.80,241);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (679,'Departamento de administracion',20636,242);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (680,'Departamento Finaciero',24586,243);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (681,'Departamento de Marketing',37031,244);


 insert into Empleado_Departamento (NIF_E,codigo_D) values (20,677);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (21,678);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (22,679);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (23,680);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (24,681);



CREATE PROCEDURE insertar_empleado
@nif_e int,
@Telefono int,
@Nombre int,
@Num_hijos int,
@Salario float,
@Fecha_alta datetime
as
BEGIN
INSERT INTO empleado (NIF_E,telefono,nombre,num_hijos,salario,fecha_alta)
VALUES
(@nif_e, @Telefono,@Nombre,@Num_hijos,@Salario,@Fecha_alta);
END;


CREATE PROCEDURE actualizar_empleado
@nif_e int,
@Telefono int,
@Nombre varchar(50),
@Num_hijos int,
@Salario float,
@Fecha_alta datetime

AS
BEGIN
UPDATE empleado SET
NIF_E=nif_e,
telefono=Telefono,
nombre=Nombre,
num_hijos=Num_hijos,
salario=Salario,
fecha_alta=Fecha_alta
WHERE NIF_E=nif_e;
END;




CREATE PROCEDURE eliminar_empleado
@nif_e int

as
BEGIN
DELETE FROM empleado WHERE NIF_E=nif_e;
END

CREATE PROCEDURE buscar_nombrePorEmpleado

@nombre varchar(50)
as
select *from Empleado where nombre=nombre;


CREATE PROCEDURE buscar_Numhijos
@Num_hijos int

as
select *from Empleado where num_hijos=Num_hijos;


CREATE PROCEDURE buscar_fechaAlta
@Fecha_alta datetime

as
select *from Empleado where fecha_alta=Fecha_alta;


CREATE PROCEDURE mostra_todos
as
select *from Empleado 


CREATE PROCEDURE insertar_departamento
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
INSERT INTO departamento(codigo_D,nombre,presupuesto_anual)
VALUES(@Codigo_d,@Nombre,@Presupuesto_anual);
END;


CREATE PROCEDURE actualizar_departamento
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
UPDATE departamento SET
codigo_D=Codigo_d,
nombre=Nombre,
presupuesto_anual=Presupuesto_anual

WHERE codigo_D=Codigo_d;
END;


CREATE PROCEDURE buscar_nombrePorDepartamento
@nombre varchar(50)
as
select *from Empleado where nombre=nombre;


CREATE PROCEDURE mostra_todos_departamentos
AS
select *from departamento 

CREATE PROCEDURE eliminar_departamento
@Codigo_d int

AS
BEGIN
DELETE FROM departamento WHERE Codigo_D=Codigo_d;
END

CREATE PROCEDURE insertar_centroTrabajo
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar(50),
@Direccion varchar(50)

as
BEGIN
INSERT INTO centro_trabajo (codigo_CT,nombre,poblacion, direccion)
VALUES(@Codigo_CT,@Nombre,@Poblacion, @Direccion);
END;

CREATE PROCEDURE actualizar_centroTrabajo
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar (50),
@Direccion varchar(50)

as
BEGIN
UPDATE centro_trabajo SET
codigo_CT=Codigo_CT,
nombre=Nombre,
poblacion=Poblacion,
direccion=Direccion
WHERE codigo_CT=Codigo_CT;
END;

CREATE PROCEDURE buscar_nombreCentroTrabajo
@Nombre varchar(50)

as
select *from Empleado where nombre=Nombre;

*/
CREATE PROCEDURE [dbo].[buscar_poblacionCentroTrabajo]
@Poblacion varchar(50)

as
select *from centro_trabajo where poblacion=Poblacion;
/*

CREATE PROCEDURE buscar_direccionCentroTrabajo
@Direccion  varchar(50)

as
select *from centro_trabajo  where direccion=Direccion;


CREATE PROCEDURE eliminar_centroTrabajo
@Codigo_CT int

as
BEGIN
DELETE FROM centro_trabajo  WHERE codigo_CT=Codigo_CT;
END

CREATE PROCEDURE insertar_habilidad

@Codigo_h int,
@Descripcion varchar(50)

as
BEGIN
INSERT INTO hablilidad (codigo_H,descripcion)
VALUES(@Codigo_h, @Descripcion);
END;


CREATE PROCEDURE actualizar_habilidad
@Codigo_H int,
@Descripcion varchar(50)
AS
BEGIN
UPDATE habilidad SET
codigo_H=Codigo_H,
descripcion=Descripcion
WHERE  codigo_H=Codigo_H;
END;


CREATE PROCEDURE buscar_descripcion
@Descripcion  varchar(50)
as
select *from habilidad  where descripcion=Descripcion;

CREATE PROCEDURE eliminar_Habilidad
@Codigo_h int
as
BEGIN
DELETE FROM habilidad   WHERE  codigo_H=Codigo_H;
END

*/
GO
/****** Object:  StoredProcedure [dbo].[actualizar_centroTrabajo]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[actualizar_centroTrabajo]
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar (50),
@Direccion varchar(50)

as
BEGIN
UPDATE centro_trabajo SET

nombre=@Nombre,
poblacion=@Poblacion,
direccion=@Direccion
WHERE codigo_CT=@Codigo_CT;
END;
GO
/****** Object:  StoredProcedure [dbo].[ insertar_centro_trabajo]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
create database proyecto;


create table Habilidad(
codigo_H int PRIMARY KEY,
descripcion varchar (100)
);



create table Centro_trabajo(
codigo_CT int PRIMARY KEY,
nombre VARCHAR(50),
poblacion varchar(50),
direccion varchar(100),
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E)  ON UPDATE CASCADE
);


create table Departamento(
codigo_D int PRIMARY KEY,
nombre varchar(50),
presupuesto_anual float,
codigo_CT int,
FOREIGN KEY (codigo_CT)REFERENCES Centro_trabajo(codigo_CT)  ON UPDATE CASCADE
); 

create table Empleado(
NIF_E int PRIMARY KEY,
telefono int,
nombre varchar(50),
num_hijos int,
salario float,
fecha_alta datetime
);


Create table Habilidad_Empleado(
codigo_H int, 
NIF_E int,
FOREIGN KEY(codigo_H)REFERENCES Habilidad(codigo_H) on UPDATE CASCADE,
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E)  on UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Create table Hijo(
codigo_HE int PRIMARY KEY,
nombre varchar(50),
fecha_nacimiento datetime,
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E) ON UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Insert into Habilidad (codigo_H,descripcion)values(896,'Tecnico Computacional');
Insert into Habilidad (codigo_H,descripcion)values(897,'Trato con el Cliente');
Insert into Habilidad (codigo_H,descripcion)values (898,'Operador de telefonia');
Insert into Habilidad (codigo_H,descripcion)values (899,'Fresador');
Insert into Habilidad (codigo_H,descripcion)values (900,'Contabilidad');



Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (20,23297070,'Aaron Adoch Juarez',2,6000,'04-10-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (21,77767179,'Abisneo testa Aceton',0,7000,'28-04-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (22,23297970,'Adan Mateu Barillas',3,6765,'27-12-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (23,23297070,'Brandon AdreeChavez Gomez',2,4980,'01-08-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (24,40285960,'Carl Gonzalez Rodas',1,7990,'18-08-2018');




Insert into habilidad_empleado (codigo_H,NIF_E) values (896,20);
Insert into habilidad_empleado (codigo_H,NIF_E) values (897,21);
Insert into habilidad_empleado (codigo_H,NIF_E) values (898,22);
Insert into habilidad_empleado (codigo_H,NIF_E) values (899,23);
Insert into habilidad_empleado (codigo_H,NIF_E) values (900,24);


Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (740,'Erinque Adoch Alvarado','17-05-1994',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (741,'Ernesto Adoch Alvarado','22-11-1995',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (742,'Leonel Mateu Duran','10-10-1995',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (743,'Manuel Mateu Duran','26-12-1997',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (744,'rafael Mateu Duran','11-06-2000',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (745,'Mario Chávez Soto','09-09-2000',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (746,'Noemi Chávez Soto','07-06-2002',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (747,'carolina Gonzalez Mia','22-07-2003',24);


Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (240,'RHYVSA','Ciudad de México','Colonia la Condesa',20);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (241,'Katero CoorporativoSC',' Ciudad de México','Cuauhtémoc',21);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (242,'Tiendas de 3b S.A de CV','Puebla','Pino Suarez 5',22);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (243,'People Conection','Puebla','Cuatlasingo',23);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (244,'TYPHOON','Puebla','Cholula Rivadavia',24);





Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (677,'Departamento de Produccion',37275,240);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (678,'Departamento de Compras',73303.80,241);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (679,'Departamento de administracion',20636,242);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (680,'Departamento Finaciero',24586,243);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (681,'Departamento de Marketing',37031,244);


 insert into Empleado_Departamento (NIF_E,codigo_D) values (20,677);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (21,678);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (22,679);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (23,680);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (24,681);



CREATE PROCEDURE insertar_empleado
@nif_e int,
@Telefono int,
@Nombre int,
@Num_hijos int,
@Salario float,
@Fecha_alta datetime
as
BEGIN
INSERT INTO empleado (NIF_E,telefono,nombre,num_hijos,salario,fecha_alta)
VALUES
(@nif_e, @Telefono,@Nombre,@Num_hijos,@Salario,@Fecha_alta);
END;


CREATE PROCEDURE actualizar_empleado
@nif_e int,
@Telefono int,
@Nombre varchar(50),
@Num_hijos int,
@Salario float,
@Fecha_alta datetime

AS
BEGIN
UPDATE empleado SET
NIF_E=nif_e,
telefono=Telefono,
nombre=Nombre,
num_hijos=Num_hijos,
salario=Salario,
fecha_alta=Fecha_alta
WHERE NIF_E=nif_e;
END;




CREATE PROCEDURE eliminar_empleado
@nif_e int

as
BEGIN
DELETE FROM empleado WHERE NIF_E=nif_e;
END

CREATE PROCEDURE buscar_nombrePorEmpleado

@nombre varchar(50)
as
select *from Empleado where nombre=nombre;


CREATE PROCEDURE buscar_Numhijos
@Num_hijos int

as
select *from Empleado where num_hijos=Num_hijos;


CREATE PROCEDURE buscar_fechaAlta
@Fecha_alta datetime

as
select *from Empleado where fecha_alta=Fecha_alta;


CREATE PROCEDURE mostra_todos
as
select *from Empleado 


CREATE PROCEDURE insertar_departamento
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
INSERT INTO departamento(codigo_D,nombre,presupuesto_anual)
VALUES(@Codigo_d,@Nombre,@Presupuesto_anual);
END;


CREATE PROCEDURE actualizar_departamento
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
UPDATE departamento SET
codigo_D=Codigo_d,
nombre=Nombre,
presupuesto_anual=Presupuesto_anual

WHERE codigo_D=Codigo_d;
END;


CREATE PROCEDURE buscar_nombrePorDepartamento
@nombre varchar(50)
as
select *from Empleado where nombre=nombre;


CREATE PROCEDURE mostra_todos_departamentos
AS
select *from departamento 

CREATE PROCEDURE eliminar_departamento
@Codigo_d int

AS
BEGIN
DELETE FROM departamento WHERE Codigo_D=Codigo_d;
END
*/
CREATE PROCEDURE [dbo].[ insertar_centro_trabajo]
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar(50),
@Direccion varchar(50)

as
BEGIN
INSERT INTO centro_trabajo (codigo_CT,nombre,poblacion, direccion)
VALUES(@Codigo_CT,@Nombre,@Poblacion, @Direccion);
END;
/*
CREATE PROCEDURE actualizar_centroTrabajo
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar (50),
@Direccion varchar(50)

as
BEGIN
UPDATE centro_trabajo SET
codigo_CT=Codigo_CT,
nombre=Nombre,
poblacion=Poblacion,
direccion=Direccion
WHERE codigo_CT=Codigo_CT;
END;

CREATE PROCEDURE buscar_nombreCentroTrabajo
@Nombre varchar(50)

as
select *from Empleado where nombre=Nombre;


CREATE PROCEDURE buscar_poblacionCentroTrabajo
@Poblacion varchar(50)

as
select *from centro_trabajo where poblacion=Poblacion;


CREATE PROCEDURE buscar_direccionCentroTrabajo
@Direccion  varchar(50)

as
select *from centro_trabajo  where direccion=Direccion;


CREATE PROCEDURE eliminar_centroTrabajo
@Codigo_CT int

as
BEGIN
DELETE FROM centro_trabajo  WHERE codigo_CT=Codigo_CT;
END

CREATE PROCEDURE insertar_habilidad

@Codigo_h int,
@Descripcion varchar(50)

as
BEGIN
INSERT INTO hablilidad (codigo_H,descripcion)
VALUES(@Codigo_h, @Descripcion);
END;


CREATE PROCEDURE actualizar_habilidad
@Codigo_H int,
@Descripcion varchar(50)
AS
BEGIN
UPDATE habilidad SET
codigo_H=Codigo_H,
descripcion=Descripcion
WHERE  codigo_H=Codigo_H;
END;


CREATE PROCEDURE buscar_descripcion
@Descripcion  varchar(50)
as
select *from habilidad  where descripcion=Descripcion;

CREATE PROCEDURE eliminar_Habilidad
@Codigo_h int
as
BEGIN
DELETE FROM habilidad   WHERE  codigo_H=Codigo_H;
END

*/
GO
/****** Object:  StoredProcedure [dbo].[buscar_departamento_Presupuesto]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[buscar_departamento_Presupuesto] 
@Presupuesto_anual float,
@Nombre varchar(50)output,
@Codigo_d int output
as
BEGIN
select 
@Codigo_d=codigo_D,
@Nombre= nombre,
@Presupuesto_anual =presupuesto_anual
from Departamento
where
presupuesto_anual =@Presupuesto_anual
END
GO
/****** Object:  StoredProcedure [dbo].[buscar_departamento_Nombre]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[buscar_departamento_Nombre] 
@Nombre varchar(50),
@Codigo_d int output,
@Presupuesto_anual float output
as
BEGIN
select 
@Codigo_d=codigo_D,
@Nombre= nombre,
@Presupuesto_anual =presupuesto_anual
from Departamento
where
nombre =@Nombre
END
GO
/****** Object:  StoredProcedure [dbo].[buscar_departamento_Codigo]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[buscar_departamento_Codigo] 
@Codigo_d int,
@Nombre varchar(50)output,
@Presupuesto_anual float output
as
BEGIN
select 
@Nombre= nombre,
@Presupuesto_anual =presupuesto_anual
from Departamento
where
codigo_D =@Codigo_d
END
GO
/****** Object:  StoredProcedure [dbo].[actualizar_departamento1]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[actualizar_departamento1]
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float,
@cadena_CT varchar(50)
as
BEGIN
declare @codigo_CentroT int;

set @codigo_CentroT=( select codigo_CT FROM Centro_trabajo where nombre=@cadena_CT)

UPDATE departamento SET
codigo_CT=@codigo_CentroT,
nombre=@Nombre,
presupuesto_anual=@Presupuesto_anual


WHERE codigo_D=@Codigo_d;
END;
GO
/****** Object:  StoredProcedure [dbo].[actualizar_departamento]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[actualizar_departamento]
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float
as
BEGIN
UPDATE departamento SET

nombre=@Nombre,
presupuesto_anual=@Presupuesto_anual

WHERE codigo_D=@Codigo_d;
END;
GO
/****** Object:  Table [dbo].[Empleado_Departamento]    Script Date: 06/12/2019 16:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado_Departamento](
	[NIF_E] [int] NULL,
	[codigo_D] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Empleado_Departamento] DISABLE CHANGE_TRACKING
GO
INSERT [dbo].[Empleado_Departamento] ([NIF_E], [codigo_D]) VALUES (123, 680)
INSERT [dbo].[Empleado_Departamento] ([NIF_E], [codigo_D]) VALUES (1212, 679)
INSERT [dbo].[Empleado_Departamento] ([NIF_E], [codigo_D]) VALUES (1, 680)
INSERT [dbo].[Empleado_Departamento] ([NIF_E], [codigo_D]) VALUES (23, 680)
INSERT [dbo].[Empleado_Departamento] ([NIF_E], [codigo_D]) VALUES (99, 681)
INSERT [dbo].[Empleado_Departamento] ([NIF_E], [codigo_D]) VALUES (100, 679)
INSERT [dbo].[Empleado_Departamento] ([NIF_E], [codigo_D]) VALUES (100, 679)
INSERT [dbo].[Empleado_Departamento] ([NIF_E], [codigo_D]) VALUES (98, 681)
INSERT [dbo].[Empleado_Departamento] ([NIF_E], [codigo_D]) VALUES (98, 681)
INSERT [dbo].[Empleado_Departamento] ([NIF_E], [codigo_D]) VALUES (46, 681)
INSERT [dbo].[Empleado_Departamento] ([NIF_E], [codigo_D]) VALUES (37, 677)
INSERT [dbo].[Empleado_Departamento] ([NIF_E], [codigo_D]) VALUES (38, 681)
INSERT [dbo].[Empleado_Departamento] ([NIF_E], [codigo_D]) VALUES (38, 681)
INSERT [dbo].[Empleado_Departamento] ([NIF_E], [codigo_D]) VALUES (39, 681)
INSERT [dbo].[Empleado_Departamento] ([NIF_E], [codigo_D]) VALUES (59, 681)
INSERT [dbo].[Empleado_Departamento] ([NIF_E], [codigo_D]) VALUES (84, NULL)
INSERT [dbo].[Empleado_Departamento] ([NIF_E], [codigo_D]) VALUES (90, 681)
INSERT [dbo].[Empleado_Departamento] ([NIF_E], [codigo_D]) VALUES (234, 677)
INSERT [dbo].[Empleado_Departamento] ([NIF_E], [codigo_D]) VALUES (47, 681)
INSERT [dbo].[Empleado_Departamento] ([NIF_E], [codigo_D]) VALUES (48, 681)
INSERT [dbo].[Empleado_Departamento] ([NIF_E], [codigo_D]) VALUES (58, 681)
INSERT [dbo].[Empleado_Departamento] ([NIF_E], [codigo_D]) VALUES (23, 681)
INSERT [dbo].[Empleado_Departamento] ([NIF_E], [codigo_D]) VALUES (89, 681)
/****** Object:  StoredProcedure [dbo].[insertar_departamento1]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertar_departamento1]
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float,

@cadena_CT varchar(50)
as
BEGIN
declare @codigo_CentroT int;

set @codigo_CentroT=( select codigo_CT FROM Centro_trabajo where nombre=@cadena_CT)

INSERT INTO Departamento (codigo_D,nombre,presupuesto_anual,codigo_CT)
VALUES (@Codigo_d,@Nombre,@Presupuesto_anual,@codigo_CentroT)
end
GO
/****** Object:  StoredProcedure [dbo].[insertar_departamento]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
create database proyecto;


create table Habilidad(
codigo_H int PRIMARY KEY,
descripcion varchar (100)
);



create table Centro_trabajo(
codigo_CT int PRIMARY KEY,
nombre VARCHAR(50),
poblacion varchar(50),
direccion varchar(100),
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E)  ON UPDATE CASCADE
);


create table Departamento(
codigo_D int PRIMARY KEY,
nombre varchar(50),
presupuesto_anual float,
codigo_CT int,
FOREIGN KEY (codigo_CT)REFERENCES Centro_trabajo(codigo_CT)  ON UPDATE CASCADE
); 

create table Empleado(
NIF_E int PRIMARY KEY,
telefono int,
nombre varchar(50),
num_hijos int,
salario float,
fecha_alta datetime
);


Create table Habilidad_Empleado(
codigo_H int, 
NIF_E int,
FOREIGN KEY(codigo_H)REFERENCES Habilidad(codigo_H) on UPDATE CASCADE,
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E)  on UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Create table Hijo(
codigo_HE int PRIMARY KEY,
nombre varchar(50),
fecha_nacimiento datetime,
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E) ON UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Insert into Habilidad (codigo_H,descripcion)values(896,'Tecnico Computacional');
Insert into Habilidad (codigo_H,descripcion)values(897,'Trato con el Cliente');
Insert into Habilidad (codigo_H,descripcion)values (898,'Operador de telefonia');
Insert into Habilidad (codigo_H,descripcion)values (899,'Fresador');
Insert into Habilidad (codigo_H,descripcion)values (900,'Contabilidad');



Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (20,23297070,'Aaron Adoch Juarez',2,6000,'04-10-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (21,77767179,'Abisneo testa Aceton',0,7000,'28-04-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (22,23297970,'Adan Mateu Barillas',3,6765,'27-12-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (23,23297070,'Brandon AdreeChavez Gomez',2,4980,'01-08-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (24,40285960,'Carl Gonzalez Rodas',1,7990,'18-08-2018');




Insert into habilidad_empleado (codigo_H,NIF_E) values (896,20);
Insert into habilidad_empleado (codigo_H,NIF_E) values (897,21);
Insert into habilidad_empleado (codigo_H,NIF_E) values (898,22);
Insert into habilidad_empleado (codigo_H,NIF_E) values (899,23);
Insert into habilidad_empleado (codigo_H,NIF_E) values (900,24);


Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (740,'Erinque Adoch Alvarado','17-05-1994',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (741,'Ernesto Adoch Alvarado','22-11-1995',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (742,'Leonel Mateu Duran','10-10-1995',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (743,'Manuel Mateu Duran','26-12-1997',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (744,'rafael Mateu Duran','11-06-2000',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (745,'Mario Chávez Soto','09-09-2000',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (746,'Noemi Chávez Soto','07-06-2002',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (747,'carolina Gonzalez Mia','22-07-2003',24);


Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (240,'RHYVSA','Ciudad de México','Colonia la Condesa',20);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (241,'Katero CoorporativoSC',' Ciudad de México','Cuauhtémoc',21);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (242,'Tiendas de 3b S.A de CV','Puebla','Pino Suarez 5',22);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (243,'People Conection','Puebla','Cuatlasingo',23);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (244,'TYPHOON','Puebla','Cholula Rivadavia',24);





Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (677,'Departamento de Produccion',37275,240);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (678,'Departamento de Compras',73303.80,241);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (679,'Departamento de administracion',20636,242);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (680,'Departamento Finaciero',24586,243);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (681,'Departamento de Marketing',37031,244);


 insert into Empleado_Departamento (NIF_E,codigo_D) values (20,677);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (21,678);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (22,679);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (23,680);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (24,681);



CREATE PROCEDURE insertar_empleado
@nif_e int,
@Telefono int,
@Nombre int,
@Num_hijos int,
@Salario float,
@Fecha_alta datetime
as
BEGIN
INSERT INTO empleado (NIF_E,telefono,nombre,num_hijos,salario,fecha_alta)
VALUES
(@nif_e, @Telefono,@Nombre,@Num_hijos,@Salario,@Fecha_alta);
END;


CREATE PROCEDURE actualizar_empleado
@nif_e int,
@Telefono int,
@Nombre varchar(50),
@Num_hijos int,
@Salario float,
@Fecha_alta datetime

AS
BEGIN
UPDATE empleado SET
NIF_E=nif_e,
telefono=Telefono,
nombre=Nombre,
num_hijos=Num_hijos,
salario=Salario,
fecha_alta=Fecha_alta
WHERE NIF_E=nif_e;
END;




CREATE PROCEDURE eliminar_empleado
@nif_e int

as
BEGIN
DELETE FROM empleado WHERE NIF_E=nif_e;
END

CREATE PROCEDURE buscar_nombrePorEmpleado

@nombre varchar(50)
as
select *from Empleado where nombre=nombre;


CREATE PROCEDURE buscar_Numhijos
@Num_hijos int

as
select *from Empleado where num_hijos=Num_hijos;


CREATE PROCEDURE buscar_fechaAlta
@Fecha_alta datetime

as
select *from Empleado where fecha_alta=Fecha_alta;


CREATE PROCEDURE mostra_todos
as
select *from Empleado 
*/

CREATE PROCEDURE [dbo].[insertar_departamento]
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
INSERT INTO departamento(codigo_D,nombre,presupuesto_anual)
VALUES(@Codigo_d,@Nombre,@Presupuesto_anual);
END;

/*
CREATE PROCEDURE actualizar_departamento
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
UPDATE departamento SET
codigo_D=Codigo_d,
nombre=Nombre,
presupuesto_anual=Presupuesto_anual

WHERE codigo_D=Codigo_d;
END;


CREATE PROCEDURE buscar_nombrePorDepartamento
@nombre varchar(50)
as
select *from Empleado where nombre=nombre;


CREATE PROCEDURE mostra_todos_departamentos
AS
select *from departamento 

CREATE PROCEDURE eliminar_departamento
@Codigo_d int

AS
BEGIN
DELETE FROM departamento WHERE Codigo_D=Codigo_d;
END

CREATE PROCEDURE insertar_centroTrabajo
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar(50),
@Direccion varchar(50)

as
BEGIN
INSERT INTO centro_trabajo (codigo_CT,nombre,poblacion, direccion)
VALUES(@Codigo_CT,@Nombre,@Poblacion, @Direccion);
END;

CREATE PROCEDURE actualizar_centroTrabajo
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar (50),
@Direccion varchar(50)

as
BEGIN
UPDATE centro_trabajo SET
codigo_CT=Codigo_CT,
nombre=Nombre,
poblacion=Poblacion,
direccion=Direccion
WHERE codigo_CT=Codigo_CT;
END;

CREATE PROCEDURE buscar_nombreCentroTrabajo
@Nombre varchar(50)

as
select *from Empleado where nombre=Nombre;


CREATE PROCEDURE buscar_poblacionCentroTrabajo
@Poblacion varchar(50)

as
select *from centro_trabajo where poblacion=Poblacion;


CREATE PROCEDURE buscar_direccionCentroTrabajo
@Direccion  varchar(50)

as
select *from centro_trabajo  where direccion=Direccion;


CREATE PROCEDURE eliminar_centroTrabajo
@Codigo_CT int

as
BEGIN
DELETE FROM centro_trabajo  WHERE codigo_CT=Codigo_CT;
END

CREATE PROCEDURE insertar_habilidad

@Codigo_h int,
@Descripcion varchar(50)

as
BEGIN
INSERT INTO hablilidad (codigo_H,descripcion)
VALUES(@Codigo_h, @Descripcion);
END;


CREATE PROCEDURE actualizar_habilidad
@Codigo_H int,
@Descripcion varchar(50)
AS
BEGIN
UPDATE habilidad SET
codigo_H=Codigo_H,
descripcion=Descripcion
WHERE  codigo_H=Codigo_H;
END;


CREATE PROCEDURE buscar_descripcion
@Descripcion  varchar(50)
as
select *from habilidad  where descripcion=Descripcion;

CREATE PROCEDURE eliminar_Habilidad
@Codigo_h int
as
BEGIN
DELETE FROM habilidad   WHERE  codigo_H=Codigo_H;
END

*/
GO
/****** Object:  StoredProcedure [dbo].[eliminar_centroTrabajo]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eliminar_centroTrabajo]
@Codigo_CT int

as
BEGIN
UPDATE Departamento SET codigo_CT=null where codigo_CT=@Codigo_CT
DELETE FROM centro_trabajo  WHERE codigo_CT=@Codigo_CT;
END
GO
/****** Object:  StoredProcedure [dbo].[mostrar_departamento1]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[mostrar_departamento1] 
@Codigo_d int,
@Nombre varchar(50)output,
@Presupuesto_anual float output
as
BEGIN
select 
@Nombre= nombre,
@Presupuesto_anual =presupuesto_anual
from Departamento
where
codigo_D =@Codigo_d
END
GO
/****** Object:  StoredProcedure [dbo].[mostrar_departamento]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mostrar_departamento]
@Codigo_d int,
@Nombre varchar(50) OUTPUT,
@Presupuesto_anual float OUTPUT

as
BEGIN
select 
@Nombre=nombre,
@Presupuesto_anual=presupuesto_anual
FROM Departamento
WHERE codigo_D=Codigo_d;
END;

select *from Departamento;
GO
/****** Object:  StoredProcedure [dbo].[mostra_todos_departamentos]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
create database proyecto;


create table Habilidad(
codigo_H int PRIMARY KEY,
descripcion varchar (100)
);



create table Centro_trabajo(
codigo_CT int PRIMARY KEY,
nombre VARCHAR(50),
poblacion varchar(50),
direccion varchar(100),
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E)  ON UPDATE CASCADE
);


create table Departamento(
codigo_D int PRIMARY KEY,
nombre varchar(50),
presupuesto_anual float,
codigo_CT int,
FOREIGN KEY (codigo_CT)REFERENCES Centro_trabajo(codigo_CT)  ON UPDATE CASCADE
); 

create table Empleado(
NIF_E int PRIMARY KEY,
telefono int,
nombre varchar(50),
num_hijos int,
salario float,
fecha_alta datetime
);


Create table Habilidad_Empleado(
codigo_H int, 
NIF_E int,
FOREIGN KEY(codigo_H)REFERENCES Habilidad(codigo_H) on UPDATE CASCADE,
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E)  on UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Create table Hijo(
codigo_HE int PRIMARY KEY,
nombre varchar(50),
fecha_nacimiento datetime,
NIF_E int,
FOREIGN KEY (NIF_E)REFERENCES Empleado(NIF_E) ON UPDATE CASCADE);



create table Empleado_Departamento(
NIF_E int,
codigo_D int,
FOREIGN KEY(codigo_D)REFERENCES Departamento(codigo_D),
FOREIGN KEY(NIF_E) REFERENCES Empleado(NIF_E));


Insert into Habilidad (codigo_H,descripcion)values(896,'Tecnico Computacional');
Insert into Habilidad (codigo_H,descripcion)values(897,'Trato con el Cliente');
Insert into Habilidad (codigo_H,descripcion)values (898,'Operador de telefonia');
Insert into Habilidad (codigo_H,descripcion)values (899,'Fresador');
Insert into Habilidad (codigo_H,descripcion)values (900,'Contabilidad');



Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (20,23297070,'Aaron Adoch Juarez',2,6000,'04-10-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (21,77767179,'Abisneo testa Aceton',0,7000,'28-04-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (22,23297970,'Adan Mateu Barillas',3,6765,'27-12-2017');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (23,23297070,'Brandon AdreeChavez Gomez',2,4980,'01-08-2018');
Insert into Empleado(NIF_E,telefono,nombre,num_hijos,salario,fecha_alta) values (24,40285960,'Carl Gonzalez Rodas',1,7990,'18-08-2018');




Insert into habilidad_empleado (codigo_H,NIF_E) values (896,20);
Insert into habilidad_empleado (codigo_H,NIF_E) values (897,21);
Insert into habilidad_empleado (codigo_H,NIF_E) values (898,22);
Insert into habilidad_empleado (codigo_H,NIF_E) values (899,23);
Insert into habilidad_empleado (codigo_H,NIF_E) values (900,24);


Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (740,'Erinque Adoch Alvarado','17-05-1994',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (741,'Ernesto Adoch Alvarado','22-11-1995',20);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (742,'Leonel Mateu Duran','10-10-1995',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (743,'Manuel Mateu Duran','26-12-1997',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (744,'rafael Mateu Duran','11-06-2000',22);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (745,'Mario Chávez Soto','09-09-2000',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (746,'Noemi Chávez Soto','07-06-2002',23);
Insert into hijo (codigo_HE,nombre,fecha_nacimiento,NIF_E) values (747,'carolina Gonzalez Mia','22-07-2003',24);


Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (240,'RHYVSA','Ciudad de México','Colonia la Condesa',20);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (241,'Katero CoorporativoSC',' Ciudad de México','Cuauhtémoc',21);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (242,'Tiendas de 3b S.A de CV','Puebla','Pino Suarez 5',22);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (243,'People Conection','Puebla','Cuatlasingo',23);
Insert into Centro_trabajo (codigo_CT, nombre, poblacion, direccion,NIF_E) values (244,'TYPHOON','Puebla','Cholula Rivadavia',24);





Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (677,'Departamento de Produccion',37275,240);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (678,'Departamento de Compras',73303.80,241);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (679,'Departamento de administracion',20636,242);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (680,'Departamento Finaciero',24586,243);
Insert into Departamento (codigo_D, nombre, presupuesto_anual, codigo_CT) values (681,'Departamento de Marketing',37031,244);


 insert into Empleado_Departamento (NIF_E,codigo_D) values (20,677);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (21,678);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (22,679);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (23,680);
 insert into Empleado_Departamento (NIF_E,codigo_D) values (24,681);



CREATE PROCEDURE insertar_empleado
@nif_e int,
@Telefono int,
@Nombre int,
@Num_hijos int,
@Salario float,
@Fecha_alta datetime
as
BEGIN
INSERT INTO empleado (NIF_E,telefono,nombre,num_hijos,salario,fecha_alta)
VALUES
(@nif_e, @Telefono,@Nombre,@Num_hijos,@Salario,@Fecha_alta);
END;


CREATE PROCEDURE actualizar_empleado
@nif_e int,
@Telefono int,
@Nombre varchar(50),
@Num_hijos int,
@Salario float,
@Fecha_alta datetime

AS
BEGIN
UPDATE empleado SET
NIF_E=nif_e,
telefono=Telefono,
nombre=Nombre,
num_hijos=Num_hijos,
salario=Salario,
fecha_alta=Fecha_alta
WHERE NIF_E=nif_e;
END;




CREATE PROCEDURE eliminar_empleado
@nif_e int

as
BEGIN
DELETE FROM empleado WHERE NIF_E=nif_e;
END

CREATE PROCEDURE buscar_nombrePorEmpleado

@nombre varchar(50)
as
select *from Empleado where nombre=nombre;


CREATE PROCEDURE buscar_Numhijos
@Num_hijos int

as
select *from Empleado where num_hijos=Num_hijos;


CREATE PROCEDURE buscar_fechaAlta
@Fecha_alta datetime

as
select *from Empleado where fecha_alta=Fecha_alta;


CREATE PROCEDURE mostra_todos
as
select *from Empleado 


CREATE PROCEDURE insertar_departamento
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
INSERT INTO departamento(codigo_D,nombre,presupuesto_anual)
VALUES(@Codigo_d,@Nombre,@Presupuesto_anual);
END;


CREATE PROCEDURE actualizar_departamento
@Codigo_d int,
@Nombre varchar(50),
@Presupuesto_anual float

as
BEGIN
UPDATE departamento SET
codigo_D=Codigo_d,
nombre=Nombre,
presupuesto_anual=Presupuesto_anual

WHERE codigo_D=Codigo_d;
END;


CREATE PROCEDURE buscar_nombrePorDepartamento
@nombre varchar(50)
as
select *from Empleado where nombre=nombre;
*/

CREATE PROCEDURE [dbo].[mostra_todos_departamentos]
AS
select *from departamento 
/*
CREATE PROCEDURE eliminar_departamento
@Codigo_d int

AS
BEGIN
DELETE FROM departamento WHERE Codigo_D=Codigo_d;
END

CREATE PROCEDURE insertar_centroTrabajo
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar(50),
@Direccion varchar(50)

as
BEGIN
INSERT INTO centro_trabajo (codigo_CT,nombre,poblacion, direccion)
VALUES(@Codigo_CT,@Nombre,@Poblacion, @Direccion);
END;

CREATE PROCEDURE actualizar_centroTrabajo
@Codigo_CT int,
@Nombre varchar(50),
@Poblacion varchar (50),
@Direccion varchar(50)

as
BEGIN
UPDATE centro_trabajo SET
codigo_CT=Codigo_CT,
nombre=Nombre,
poblacion=Poblacion,
direccion=Direccion
WHERE codigo_CT=Codigo_CT;
END;

CREATE PROCEDURE buscar_nombreCentroTrabajo
@Nombre varchar(50)

as
select *from Empleado where nombre=Nombre;


CREATE PROCEDURE buscar_poblacionCentroTrabajo
@Poblacion varchar(50)

as
select *from centro_trabajo where poblacion=Poblacion;


CREATE PROCEDURE buscar_direccionCentroTrabajo
@Direccion  varchar(50)

as
select *from centro_trabajo  where direccion=Direccion;


CREATE PROCEDURE eliminar_centroTrabajo
@Codigo_CT int

as
BEGIN
DELETE FROM centro_trabajo  WHERE codigo_CT=Codigo_CT;
END

CREATE PROCEDURE insertar_habilidad

@Codigo_h int,
@Descripcion varchar(50)

as
BEGIN
INSERT INTO hablilidad (codigo_H,descripcion)
VALUES(@Codigo_h, @Descripcion);
END;


CREATE PROCEDURE actualizar_habilidad
@Codigo_H int,
@Descripcion varchar(50)
AS
BEGIN
UPDATE habilidad SET
codigo_H=Codigo_H,
descripcion=Descripcion
WHERE  codigo_H=Codigo_H;
END;


CREATE PROCEDURE buscar_descripcion
@Descripcion  varchar(50)
as
select *from habilidad  where descripcion=Descripcion;

CREATE PROCEDURE eliminar_Habilidad
@Codigo_h int
as
BEGIN
DELETE FROM habilidad   WHERE  codigo_H=Codigo_H;
END

*/
GO
/****** Object:  StoredProcedure [dbo].[mostrar_empleado]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[mostrar_empleado]
@nif_e int,
@Telefono int output,
@Nombre varchar(50) output,
@Num_hijos int output,
@Salario float output,
@Fecha_alta datetime output,

@cadena_CT varchar(50) output,
@cadena_habilidad varchar(50)output,
@cadena_departamento varchar(50)output

as
BEGIN
declare @codigo_Ha int;
declare @codigo_De int;
declare @Codigo_ctr int;
select
@Telefono= telefono,
@nif_e= NIF_E,
@Nombre =nombre,
@Num_hijos= num_hijos,
@Salario= salario,
@Fecha_alta= fecha_alta
from Empleado
where
NIF_E =@nif_e

set @codigo_Ha=( select codigo_H FROM Habilidad_Empleado where NIF_E=@nif_e)
set @codigo_De=(select codigo_D FROM Empleado_Departamento WHERE NIF_E=@nif_e)
set @Codigo_ctr=(select codigo_CT FROM Centro_trabajo where NIF_E=@nif_e)


select
@cadena_habilidad=descripcion 
FROM Habilidad where codigo_H=@codigo_Ha

select 
@cadena_departamento=nombre 
FROM Departamento WHERE codigo_D=@codigo_De

select 
@cadena_CT=nombre FROM Centro_trabajo where codigo_CT=@Codigo_ctr
END
GO
/****** Object:  StoredProcedure [dbo].[insertar_empleado]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertar_empleado]
@nif_e int,
@Telefono int,
@Nombre varchar(50),
@Num_hijos int,
@Salario float,
@Fecha_alta datetime,

@bandera int output,
@cadena_CT varchar(50),
@cadena_habilidad varchar(50),
@cadena_departamento varchar(50)


as
BEGIN
declare @codigo_Ha int;
declare @codigo_De int;
declare @nif_em int;
INSERT INTO empleado (NIF_E,telefono,nombre,num_hijos,salario,fecha_alta)
VALUES (@nif_e,@Telefono,@Nombre,@Num_hijos,@Salario,@Fecha_alta)


set @codigo_Ha=( select codigo_H FROM Habilidad where descripcion=@cadena_habilidad)
set @codigo_De=(select codigo_D FROM Departamento WHERE nombre=@cadena_departamento)
set @nif_em=(select codigo_CT FROM Centro_trabajo where nombre=@cadena_CT)


INSERT INTO Habilidad_Empleado (codigo_H,NIF_E)
VALUES (@codigo_Ha,@nif_e)

INSERT INTO Empleado_Departamento (codigo_D,NIF_E)
VALUES (@codigo_De,@nif_e)

update Centro_trabajo set NIF_E=@nif_e where codigo_CT=@nif_em

END;
GO
/****** Object:  StoredProcedure [dbo].[actualizar_empleado]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[actualizar_empleado]
@nif_e int,
@Telefono int,
@Nombre varchar(50),
@Num_hijos int,
@Salario float,
@Fecha_alta datetime,

@cadena_CT varchar(50),
@cadena_habilidad varchar(50),
@cadena_departamento varchar(50)

AS
BEGIN
declare @codigo_Ha int;
declare @codigo_De int;
declare @nif_em int;
UPDATE empleado SET

telefono=@Telefono,
nombre=@Nombre,
num_hijos=@Num_hijos,
salario=@Salario,
fecha_alta=@Fecha_alta
where NIF_E=@nif_e

set @codigo_Ha=( select codigo_H FROM Habilidad where descripcion=@cadena_habilidad)
set @codigo_De=(select codigo_D FROM Departamento WHERE nombre=@cadena_departamento)
set @nif_em=(select codigo_CT FROM Centro_trabajo where nombre=@cadena_CT)

update Habilidad_Empleado set codigo_H=@codigo_Ha where NIF_E=@nif_e
update Empleado_Departamento set codigo_D=@codigo_De where NIF_E=@nif_e
update Centro_trabajo set NIF_E=@nif_e where codigo_CT=@nif_em

END;
GO
/****** Object:  StoredProcedure [dbo].[eliminar_empleado]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eliminar_empleado]
@nif_e int
as
BEGIN

UPDATE Centro_trabajo SET NIF_E=null where NIF_E=@nif_e
DELETE Hijo WHERE NIF_E=@nif_e
DELETE Habilidad_Empleado where NIF_E=@nif_e
DELETE Empleado_Departamento where NIF_E=@nif_e
DELETE FROM empleado WHERE NIF_E=@nif_e
END
GO
/****** Object:  StoredProcedure [dbo].[eliminar_departamento]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eliminar_departamento]
@Codigo_d int

AS
BEGIN

DELETE FROM Empleado_Departamento WHERE codigo_D=@Codigo_d
DELETE FROM departamento WHERE codigo_D=@Codigo_d;
END
GO
/****** Object:  StoredProcedure [dbo].[Buscar_empleado_Telefono]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Buscar_empleado_Telefono]
@Telefono int,
@Salario float output,
@nif_e int output,
@Nombre varchar(50)output,
@Num_hijos int output,
@Fecha_alta datetime output,

@cadena_CT varchar(50) output,
@cadena_habilidad varchar(50)output,
@cadena_departamento varchar(50)output

as
BEGIN
declare @codigo_Ha int;
declare @codigo_De int;
declare @Codigo_ctr int;
declare @nif_Empleado int;
select
@Telefono= telefono,
@nif_e= NIF_E,
@Nombre =nombre,
@Num_hijos= num_hijos,
@Salario= salario,
@Fecha_alta= fecha_alta
from Empleado
where
telefono =@Telefono
set @nif_Empleado=( select NIF_E FROM Empleado where telefono=@Telefono)

set @codigo_Ha=( select codigo_H FROM Habilidad_Empleado where NIF_E=@nif_Empleado)
set @codigo_De=(select codigo_D FROM Empleado_Departamento WHERE NIF_E=@nif_Empleado)
set @Codigo_ctr=(select codigo_CT FROM Centro_trabajo where NIF_E=@nif_Empleado)


select
@cadena_habilidad=descripcion 
FROM Habilidad where codigo_H=@codigo_Ha

select 
@cadena_departamento=nombre 
FROM Departamento WHERE codigo_D=@codigo_De

select 
@cadena_CT=nombre FROM Centro_trabajo where codigo_CT=@Codigo_ctr
END
GO
/****** Object:  StoredProcedure [dbo].[Buscar_empleado_Salario]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Buscar_empleado_Salario]
@Salario float,
@nif_e int output,
@Nombre varchar(50)output,
@Telefono int output,
@Num_hijos int output,
@Fecha_alta datetime output,

@cadena_CT varchar(50) output,
@cadena_habilidad varchar(50)output,
@cadena_departamento varchar(50)output

as
BEGIN
declare @codigo_Ha int;
declare @codigo_De int;
declare @Codigo_ctr int;
declare @nif_Empleado int;
select
@Telefono= telefono,
@nif_e= NIF_E,
@Nombre =nombre,
@Num_hijos= num_hijos,
@Salario= salario,
@Fecha_alta= fecha_alta
from Empleado
where
salario =@Salario
set @nif_Empleado=( select NIF_E FROM Empleado where salario=@Salario)

set @codigo_Ha=( select codigo_H FROM Habilidad_Empleado where NIF_E=@nif_Empleado)
set @codigo_De=(select codigo_D FROM Empleado_Departamento WHERE NIF_E=@nif_Empleado)
set @Codigo_ctr=(select codigo_CT FROM Centro_trabajo where NIF_E=@nif_Empleado)


select
@cadena_habilidad=descripcion 
FROM Habilidad where codigo_H=@codigo_Ha

select 
@cadena_departamento=nombre 
FROM Departamento WHERE codigo_D=@codigo_De

select 
@cadena_CT=nombre FROM Centro_trabajo where codigo_CT=@Codigo_ctr
END
GO
/****** Object:  StoredProcedure [dbo].[Buscar_empleado_NumHijos]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Buscar_empleado_NumHijos]
@Num_hijos int,
@Telefono int output,
@Salario float output,
@nif_e int output,
@Nombre varchar(50)output,
@Fecha_alta datetime output,

@cadena_CT varchar(50) output,
@cadena_habilidad varchar(50)output,
@cadena_departamento varchar(50)output

as
BEGIN
declare @codigo_Ha int;
declare @codigo_De int;
declare @Codigo_ctr int;
declare @nif_Empleado int;
select
@Telefono= telefono,
@nif_e= NIF_E,
@Nombre =nombre,
@Num_hijos= num_hijos,
@Salario= salario,
@Fecha_alta= fecha_alta
from Empleado
where
num_hijos =@Num_hijos
set @nif_Empleado=( select NIF_E FROM Empleado where num_hijos=@Num_hijos)

set @codigo_Ha=( select codigo_H FROM Habilidad_Empleado where NIF_E=@nif_Empleado)
set @codigo_De=(select codigo_D FROM Empleado_Departamento WHERE NIF_E=@nif_Empleado)
set @Codigo_ctr=(select codigo_CT FROM Centro_trabajo where NIF_E=@nif_Empleado)


select
@cadena_habilidad=descripcion 
FROM Habilidad where codigo_H=@codigo_Ha

select 
@cadena_departamento=nombre 
FROM Departamento WHERE codigo_D=@codigo_De

select 
@cadena_CT=nombre FROM Centro_trabajo where codigo_CT=@Codigo_ctr
END
GO
/****** Object:  StoredProcedure [dbo].[Buscar_empleado_Nombre]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Buscar_empleado_Nombre]
@Nombre varchar(50),
@nif_e int output,
@Telefono int output,
@Num_hijos int output,
@Salario float output,
@Fecha_alta datetime output,

@cadena_CT varchar(50) output,
@cadena_habilidad varchar(50)output,
@cadena_departamento varchar(50)output

as
BEGIN
declare @codigo_Ha int;
declare @codigo_De int;
declare @Codigo_ctr int;
declare @nif_Empleado int;
select
@Telefono= telefono,
@nif_e= NIF_E,
@Nombre =nombre,
@Num_hijos= num_hijos,
@Salario= salario,
@Fecha_alta= fecha_alta
from Empleado
where
nombre =@Nombre
set @nif_Empleado=( select NIF_E FROM Empleado where nombre=@Nombre)

set @codigo_Ha=( select codigo_H FROM Habilidad_Empleado where NIF_E=@nif_Empleado)
set @codigo_De=(select codigo_D FROM Empleado_Departamento WHERE NIF_E=@nif_Empleado)
set @Codigo_ctr=(select codigo_CT FROM Centro_trabajo where NIF_E=@nif_Empleado)


select
@cadena_habilidad=descripcion 
FROM Habilidad where codigo_H=@codigo_Ha

select 
@cadena_departamento=nombre 
FROM Departamento WHERE codigo_D=@codigo_De

select 
@cadena_CT=nombre FROM Centro_trabajo where codigo_CT=@Codigo_ctr
END
GO
/****** Object:  StoredProcedure [dbo].[Buscar_empleado_NIF]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Buscar_empleado_NIF]
@nif_e int,
@Telefono int output,
@Nombre varchar(50) output,
@Num_hijos int output,
@Salario float output,
@Fecha_alta datetime output,

@cadena_CT varchar(50) output,
@cadena_habilidad varchar(50)output,
@cadena_departamento varchar(50)output

as
BEGIN
declare @codigo_Ha int;
declare @codigo_De int;
declare @Codigo_ctr int;
select
@Telefono= telefono,
@nif_e= NIF_E,
@Nombre =nombre,
@Num_hijos= num_hijos,
@Salario= salario,
@Fecha_alta= fecha_alta
from Empleado
where
NIF_E =@nif_e

set @codigo_Ha=( select codigo_H FROM Habilidad_Empleado where NIF_E=@nif_e)
set @codigo_De=(select codigo_D FROM Empleado_Departamento WHERE NIF_E=@nif_e)
set @Codigo_ctr=(select codigo_CT FROM Centro_trabajo where NIF_E=@nif_e)


select
@cadena_habilidad=descripcion 
FROM Habilidad where codigo_H=@codigo_Ha

select 
@cadena_departamento=nombre 
FROM Departamento WHERE codigo_D=@codigo_De

select 
@cadena_CT=nombre FROM Centro_trabajo where codigo_CT=@Codigo_ctr
END
GO
/****** Object:  StoredProcedure [dbo].[Buscar_empleado_FechaAlta]    Script Date: 06/12/2019 16:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Buscar_empleado_FechaAlta]
@Fecha_alta datetime,
@Num_hijos int output,
@Telefono int output,
@Salario float output,
@nif_e int output,
@Nombre varchar(50)output,


@cadena_CT varchar(50) output,
@cadena_habilidad varchar(50)output,
@cadena_departamento varchar(50)output

as
BEGIN
declare @codigo_Ha int;
declare @codigo_De int;
declare @Codigo_ctr int;
declare @nif_Empleado int;
select
@Telefono= telefono,
@nif_e= NIF_E,
@Nombre =nombre,
@Num_hijos= num_hijos,
@Salario= salario,
@Fecha_alta= fecha_alta
from Empleado
where
fecha_alta =@Fecha_alta
set @nif_Empleado=( select NIF_E FROM Empleado where fecha_alta=@Fecha_alta)

set @codigo_Ha=( select codigo_H FROM Habilidad_Empleado where NIF_E=@nif_Empleado)
set @codigo_De=(select codigo_D FROM Empleado_Departamento WHERE NIF_E=@nif_Empleado)
set @Codigo_ctr=(select codigo_CT FROM Centro_trabajo where NIF_E=@nif_Empleado)


select
@cadena_habilidad=descripcion 
FROM Habilidad where codigo_H=@codigo_Ha

select 
@cadena_departamento=nombre 
FROM Departamento WHERE codigo_D=@codigo_De

select 
@cadena_CT=nombre FROM Centro_trabajo where codigo_CT=@Codigo_ctr
END
GO
/****** Object:  ForeignKey [FK__Centro_tr__NIF_E__1273C1CD]    Script Date: 06/12/2019 16:11:21 ******/
ALTER TABLE [dbo].[Centro_trabajo]  WITH CHECK ADD  CONSTRAINT [FK__Centro_tr__NIF_E__1273C1CD] FOREIGN KEY([NIF_E])
REFERENCES [dbo].[Empleado] ([NIF_E])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Centro_trabajo] CHECK CONSTRAINT [FK__Centro_tr__NIF_E__1273C1CD]
GO
/****** Object:  ForeignKey [FK__Departame__codig__1367E606]    Script Date: 06/12/2019 16:11:21 ******/
ALTER TABLE [dbo].[Departamento]  WITH CHECK ADD  CONSTRAINT [FK__Departame__codig__1367E606] FOREIGN KEY([codigo_CT])
REFERENCES [dbo].[Centro_trabajo] ([codigo_CT])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Departamento] CHECK CONSTRAINT [FK__Departame__codig__1367E606]
GO
/****** Object:  ForeignKey [FK__Empleado___codig__145C0A3F]    Script Date: 06/12/2019 16:11:21 ******/
ALTER TABLE [dbo].[Empleado_Departamento]  WITH CHECK ADD  CONSTRAINT [FK__Empleado___codig__145C0A3F] FOREIGN KEY([codigo_D])
REFERENCES [dbo].[Departamento] ([codigo_D])
GO
ALTER TABLE [dbo].[Empleado_Departamento] CHECK CONSTRAINT [FK__Empleado___codig__145C0A3F]
GO
/****** Object:  ForeignKey [FK__Empleado___codig__3B75D760]    Script Date: 06/12/2019 16:11:21 ******/
ALTER TABLE [dbo].[Empleado_Departamento]  WITH CHECK ADD  CONSTRAINT [FK__Empleado___codig__3B75D760] FOREIGN KEY([codigo_D])
REFERENCES [dbo].[Departamento] ([codigo_D])
GO
ALTER TABLE [dbo].[Empleado_Departamento] CHECK CONSTRAINT [FK__Empleado___codig__3B75D760]
GO
/****** Object:  ForeignKey [FK__Empleado___NIF_E__15502E78]    Script Date: 06/12/2019 16:11:21 ******/
ALTER TABLE [dbo].[Empleado_Departamento]  WITH CHECK ADD  CONSTRAINT [FK__Empleado___NIF_E__15502E78] FOREIGN KEY([NIF_E])
REFERENCES [dbo].[Empleado] ([NIF_E])
GO
ALTER TABLE [dbo].[Empleado_Departamento] CHECK CONSTRAINT [FK__Empleado___NIF_E__15502E78]
GO
/****** Object:  ForeignKey [FK__Empleado___NIF_E__3C69FB99]    Script Date: 06/12/2019 16:11:21 ******/
ALTER TABLE [dbo].[Empleado_Departamento]  WITH CHECK ADD  CONSTRAINT [FK__Empleado___NIF_E__3C69FB99] FOREIGN KEY([NIF_E])
REFERENCES [dbo].[Empleado] ([NIF_E])
GO
ALTER TABLE [dbo].[Empleado_Departamento] CHECK CONSTRAINT [FK__Empleado___NIF_E__3C69FB99]
GO
/****** Object:  ForeignKey [FK__Habilidad__codig__164452B1]    Script Date: 06/12/2019 16:11:21 ******/
ALTER TABLE [dbo].[Habilidad_Empleado]  WITH CHECK ADD  CONSTRAINT [FK__Habilidad__codig__164452B1] FOREIGN KEY([codigo_H])
REFERENCES [dbo].[Habilidad] ([codigo_H])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Habilidad_Empleado] CHECK CONSTRAINT [FK__Habilidad__codig__164452B1]
GO
/****** Object:  ForeignKey [FK__Habilidad__NIF_E__173876EA]    Script Date: 06/12/2019 16:11:21 ******/
ALTER TABLE [dbo].[Habilidad_Empleado]  WITH CHECK ADD  CONSTRAINT [FK__Habilidad__NIF_E__173876EA] FOREIGN KEY([NIF_E])
REFERENCES [dbo].[Empleado] ([NIF_E])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Habilidad_Empleado] CHECK CONSTRAINT [FK__Habilidad__NIF_E__173876EA]
GO
/****** Object:  ForeignKey [FK__Hijo__NIF_E__182C9B23]    Script Date: 06/12/2019 16:11:21 ******/
ALTER TABLE [dbo].[Hijo]  WITH CHECK ADD  CONSTRAINT [FK__Hijo__NIF_E__182C9B23] FOREIGN KEY([NIF_E])
REFERENCES [dbo].[Empleado] ([NIF_E])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Hijo] CHECK CONSTRAINT [FK__Hijo__NIF_E__182C9B23]
GO

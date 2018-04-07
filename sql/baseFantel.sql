create database fantel
use fantel
create table programa_beca(
id int not null primary key,
codigo varchar(4) not null unique,
nombre varchar(100) not null,
descripcion varchar(250) not null
);
create table carrera(
id int not null primary key,
nombre varchar(100) not null,
estado int not null
);
create table universidad(
id int not null primary key,
nombre varchar(100) not null,
estado int not null
);
create table nivel_educativo(
id int not null primary key,
nivel varchar(50) not null,
estado int not null
);
create table ciclo(
id int not null primary key,
nombre varchar(6) not null
);
create table becario(
id int not null primary key,
codigo varchar(16) not null UNIQUE,
nombres varchar(150) not null,
apellidoos varchar(150) not null,
dui varchar(9) not null unique,
fecha_nacimiento date not null,
direccion varchar(250) not null,
telefono varchar(8) not null,
correo varchar(250) not null unique,
contra varchar(200) not null,
id_programaBeca int not null foreign key references programa_beca(id),
id_universidad int not null foreign key references universidad(id),
id_carrera int not null foreign key references carrera(id),
id_nivelEducativo int not null foreign key references nivel_educativo(id),
duracion_programa varchar(100) not null,
fecha_inicio date not null,
fecha_final date not null,
estado int not null,
);
create table aspecto(
id int not null primary key,
nombre varchar(100) not null
);
create table presupuesto_maestro(
id int not null primary key,
id_becario int not null foreign key references becario(id)
);
create table presupuesto_detalle(
id int not null primary key,
id_maestro int not null foreign key references presupuesto_maestro(id),
id_aspecto int not null foreign key references aspecto(id),
monto decimal(10,2) not null
);
create table notas(
id int not null primary key,
id_becario int not null foreign key references becario(id),
nombre_materia varchar(100) not null,
nota_materia decimal(5,2) not null,
estado_tercioS int not null,
id_ciclo int not null foreign key references ciclo(id)
);
create table desembolso(
id int not null primary key,
id_presupuestoD int not null foreign key references presupuesto_detalle(id),
monto decimal(10,2) not null,
fecha date
);
create table tipo_usuario(
id int not null primary key,
tipo varchar(100) not null
);
create table usuario(
id int not null primary key,
nombres varchar(150) not null,
apellidos varchar(150) not null,
correo varchar(250) not null UNIQUE,
contra varchar(250) not null,
id_tipo int not null foreign key references tipo_usuario(id)
);
create table incidentes(
id int not null primary key,
detalle varchar(300) not null,
id_becario int not null foreign key references becario(id),
id_usuario int not null foreign key references usuario(id)
);

--------------------DATOS POR DEFECTO PARA INICIOS DE SESION EN EL DASHBOARD---------------------
insert into usuario (nombres,apellidos,correo,contra,id_tipo) values('Fernando Ernesto', 'Carranza Guardado', 'mkfzzhatb@emltmp.com','uheKfqK33VZchpArOozrthK0Fv8=',1)
insert into usuario (nombres,apellidos,correo,contra,id_tipo) values('Fernando Ernesto', 'Carranza Guardado', 'rstgcfog@10mail.org','5RA+dNGELR25iGLcyKApo5IPi7I=',3)
insert into usuario (nombres,apellidos,correo,contra,id_tipo) values('Fernando Ernesto', 'Carranza Guardado', 'rpkgarfdzoie@dropmail.me','lMAIpQa1ezZwNKSDtNmY74P53nA=',2)
select * from usuario
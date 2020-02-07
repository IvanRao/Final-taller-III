CREATE DATABASE GeekGames;
GRANT USAGE ON *.* TO GeekGames@localhost IDENTIFIED BY 'GeekGames';
GRANT ALL PRIVILEGES ON GeekGames.* TO GeekGames@localhost ;
USE GeekGames;

-- CREATE TABLE Consolas(
--        id INT NOT NULL AUTO_INCREMENT,
--        nombre VARCHAR(30) NOT NULL,
--        precio FLOAT NOT NULL,
--        PRIMARY KEY (id)
-- );

-- CREATE TABLE Juegos(
--        id INT NOT NULL AUTO_INCREMENT,
--        nombre VARCHAR(30) NOT NULL,
--        precio FLOAT NOT NULL,
--        consolas_id int not null,
--        PRIMARY KEY (id),
--        constraint fk_consola foreign key (consolas_id)
--        references Consolas(id)
--        on delete restrict
-- );

CREATE TABLE Productos(
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(30) NOT NULL,
	descripcion varchar(500),
	modelo varchar(100)
	precio FLOAT NOT NULL,
	activo int NOT null,
	puntaje int,
	marca_id int not null,
	categoria_id int not null,
	PRIMARY KEY (id),
	constraint fk_categoria foreign key (categoria_id)
	references Categorias(id)
	on delete restrict,
	constraint fk_marca foreign key (marca_id)
	references Marcas(id)
	on delete restrict
);

CREATE TABLE Categorias(
	id INT NOT NULL AUTO_INCREMENT,
	nombreCategoria VARCHAR(30) NOT NULL,
	activo int NOT null,
	categoriaPadre int,
	PRIMARY KEY (id)
);

CREATE TABLE Marcas(
	id INT NOT NULL AUTO_INCREMENT,
	nombreMarca VARCHAR(30) NOT NULL,
	activo int NOT null,
	PRIMARY KEY (id)
);

CREATE TABLE Comentarios(
	id INT NOT NULL AUTO_INCREMENT,
	email VARCHAR(100) NOT NULL,
	puntaje int not null,
	comentario varchar(8000),
	aprobado int not null,
	PRIMARY KEY (id)
);

CREATE TABLE Usuarios(
       id INT NOT NULL AUTO_INCREMENT,
       usuario VARCHAR(30) NOT NULL,
       pass VARCHAR(30) NOT NULL,
       role INT NOT NULL,
       PRIMARY KEY (id)
);

-- insert into Consolas (nombre, precio) values ('Play Station 4', 10000);
-- insert into Juegos (nombre, precio, consolas_id) values ('GTA 5', 1500, 1);

insert into productos (id, nombre, descripcion, modelo, precio, activo, puntaje, marca_id, categoria_id) values (1, '', '', '', 1500.00, 1, 5, 2, 1)

INSERT INTO Usuarios (usuario,pass,role) VALUES ('admin','admin',1);
INSERT INTO Usuarios (usuario,pass,role) VALUES ('user','password',0);

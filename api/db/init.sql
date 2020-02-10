CREATE DATABASE GeekGames;
GRANT USAGE ON *.* TO GeekGames@localhost IDENTIFIED BY 'GeekGames';
GRANT ALL PRIVILEGES ON GeekGames.* TO GeekGames@localhost ;
USE GeekGames;

CREATE TABLE Categorias(
	id INT NOT NULL AUTO_INCREMENT,
	nombreCategoria VARCHAR(30) NOT NULL,
	activo int NOT null,
	PRIMARY KEY (id)
);

CREATE TABLE SubCategorias(
	id INT NOT NULL AUTO_INCREMENT,
	nombreSubCategoria VARCHAR(30) NOT NULL,
	activo int NOT null,
	categoria_id int NOT null,
	PRIMARY KEY (id),	
	constraint fk_subCategoria foreign key (categoria_id)
	references Categorias(id)
	on delete restrict
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

CREATE TABLE Productos(
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(30) NOT NULL,
	descripcion varchar(500),
	modelo varchar(100),
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

INSERT INTO Categorias (id,nombreCategoria,activo) VALUES (1,'PS4',1);
INSERT INTO SubCategorias (id,nombreSubCategoria,activo,categoria_id) VALUES (1,'Acción',1,1);

INSERT INTO Marcas (id, nombreMarca, activo) VALUES (1,'Sony',1);

insert into productos (id, nombre, descripcion, modelo, precio, activo, puntaje, marca_id, categoria_id) values (1, 'Juego de prueba', 'Un jueguito para jugar', 'No tiene modelo, voy a eliminar este campo', 1500.00, 1, 5, 1, 1);

INSERT INTO Usuarios (usuario, pass, role) VALUES ('admin','admin',1);
INSERT INTO Usuarios (usuario, pass, role) VALUES ('user','password',0);

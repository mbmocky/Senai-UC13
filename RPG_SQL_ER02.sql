---DDL---
CREATE DATABASE RpgOnlineFst1
GO

USE RpgOnlineFst1
GO

//Criar tabela de Usuarios
CREATE TABLE Usuarios(
	UsuarioId INT PRIMARY KEY IDENTITY,
	Email VARCHAR(100) UNIQUE NOT NULL,
	Senha VARCHAR(50) NOT NULL
)
GO

//Criar tabela das Classes
CREATE TABLE Classes(
	ClasseId INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(50) UNIQUE NOT NULL,
	Descricao VARCHAR(255)
)
GO

//Criar tabela de personagens
CREATE TABLE Personagens(
	PersonagemId INT PRIMARY KEY IDENTITY,
	NomePersonagem VARCHAR(30) UNIQUE NOT NULL,
	UsuarioId INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioId),
	ClasseId INT FOREIGN KEY REFERENCES Classes(ClasseId)
)
GO

//Criar tabela com as Habilidades
CREATE TABLE Habilidades(
	HabilidadeId INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50) UNIQUE NOT NULL
)
GO

CREATE TABLE ClasseHabilidade(
	ClasseId INT FOREIGN KEY REFERENCES Classes(ClasseId),
	HabilidadeId INT FOREIGN KEY REFERENCES Habilidades(HabilidadeId)
)
GO

--DML
INSERT INTO Usuarios VALUES ('email01@email.com', '123456')
INSERT INTO Classes VALUES ('Bárbaro', 'Guerreiro Mortal.')
INSERT INTO Habilidades VALUES ('Lança Mortal'), ('Escudo Supremo')
INSERT INTO Personagens (NomePersonagem, UsuarioId, ClasseId) VALUES ('DeuBug', 1, 1)
INSERT INTO ClasseHabilidade(ClasseId, HabilidadeId) VALUES (1, 1), (1, 2)

INSERT INTO Usuarios VALUES ('email02@email.com', '123456')
INSERT INTO Classes VALUES ('Monge', 'Monge Necromante.')
INSERT INTO Habilidades VALUES ('Hadouken')
INSERT INTO Personagens (NomePersonagem, UsuarioId, ClasseId) VALUES ('BitBug', 2, 2)
INSERT INTO ClasseHabilidade(ClasseId, HabilidadeId) VALUES (2, 2), (2, 3)

UPDATE Usuarios
SET Senha = '123456'
WHERE UsuarioId = 1

--DQL

SELECT * FROM Habilidades
SELECT * FROM ClasseHabilidade
SELECT * FROM Personagens
SELECT * FROM Classes

SELECT P.NomePersonagem, C.Nome 'Classe', C.Descricao FROM Personagens AS P JOIN Classes C
ON P.ClasseId = C.ClasseId

SELECT P.NomePersonagem, C.Nome 'Nome da Classe', C.Descricao, U.Email, U.Senha FROM Personagens AS P JOIN Classes AS C ON P.ClasseId = C.ClasseId join Usuarios AS U on P.UsuarioId = U.UsuarioId
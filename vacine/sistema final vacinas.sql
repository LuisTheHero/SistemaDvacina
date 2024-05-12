CREATE DATABASE SistemaDVacinas;
-- DROP DATABASE SistemaDVacinas;
use SistemaDVacinas;

CREATE TABLE funcionarios(
    id int PRIMARY KEY auto_increment NOT NULL,
    unome varchar(255) NOT NULL,
    pnome varchar(255) NOT NULL
);
create table Enderecofun(
id int primary key auto_increment,
provincia varchar(60) NOT NULL,
municipio varchar(60) NOT NULL,
bairro varchar(60) NOT NULL,
id_funcionarios int NOT NULL,
FOREIGN KEY(id_funcionarios) 
REFERENCES funcionarios(id)
);
CREATE TABLE telefonefun(
    ID int PRIMARY KEY auto_increment NOT NULL,
    BI_funcionario int NOT NULL,
    Telefone int NOT NULL,
	id_funcionarios int NOT NULL,
	FOREIGN KEY(id_funcionarios) 
	REFERENCES funcionarios(id)
);

CREATE TABLE Supervisor(
    id int PRIMARY KEY NOT NULL,
    unome varchar(255)NOT NULL,
    pnome varchar(255)NOT NULL,
	id_funcionarios int NOT NULL,
    FOREIGN KEY(id_funcionarios) 
	REFERENCES funcionarios(id)
);
create table EnderecoSuper(
id int primary key auto_increment NOT NULL,
provincia varchar(60) NOT NULL,
municipio varchar(60) NOT NULL,
bairro varchar(60) NOT NULL,
id_Supervisor int NOT NULL,
FOREIGN KEY(id_Supervisor) 
REFERENCES Supervisor(id)
);
CREATE TABLE telefoneSuper(
    ID int PRIMARY KEY auto_increment NOT NULL,
    telefone int NOT NULL,
	id_Supervisor int NOT NULL,
	FOREIGN KEY(id_Supervisor) 
	REFERENCES Supervisor(id)
);

CREATE TABLE Posto(
	id int PRIMARY KEY auto_increment NOT NULL,
    Nome varchar(255) NOT NULL,
    Capacidade int NOT NULL,
    Supervisor_id INT NOT NULL,
    FOREIGN KEY (Supervisor_id) 
    REFERENCES Supervisor(id)
);
create table EnderecoPosto(
ID int primary key auto_increment NOT NULL,
provincia varchar(60) NOT NULL,
municipio varchar(60) NOT NULL,
bairro varchar(60) NOT NULL,
id_Posto int NOT NULL,
FOREIGN KEY(id_Posto) 
REFERENCES Posto(id)
);
CREATE TABLE telefonePosto(
    ID int PRIMARY KEY auto_increment NOT NULL,
    telefone int NOT NULL,
	id_Posto int NOT NULL,
	FOREIGN KEY(id_Posto) 
	REFERENCES Posto(id)
);

CREATE TABLE Campanha(
	id int PRIMARY KEY auto_increment NOT NULL,
	hora time NOT NULL,
    Data date NOT NULL
);

CREATE TABLE Paciente(
	bi int PRIMARY KEY auto_increment NOT NULL,
    unome varchar(30) NOT NULL,
    pnome varchar(255) NOT NULL,
    Idade int NOT NULL
);

CREATE TABLE Vacina(
	ID int PRIMARY KEY auto_increment NOT NULL,
	Nome varchar(255) NOT NULL,
	Data_de_EXP datetime NOT NULL,
    Data_de_FAB datetime NOT NULL,
    Quantidade_disponível int NOT NULL
);

CREATE TABLE paciente_vacina(
	id_pv int PRIMARY KEY auto_increment NOT NULL,
	id_vacina int NOT NULL,    
    FOREIGN KEY (id_vacina) REFERENCES vacina(id),
    bi_paciente int NOT NULL,
    FOREIGN KEY (bi_paciente) REFERENCES paciente(bi)
);


Show tables;
select * from funcionarios; 
select * from Supervisor;
describe Posto;
select * from Vacina; 
SELECT * FROM telefonefun;
SELECT * FROM enderecofun;
SELECT * FROM Supervisor;
SELECT * FROM Posto;
Delete from funcionarios;

INSERT INTO funcionarios (id, unome, pnome) 
VALUES (1, 'Jorgina','Dinis') ,
	   (default, 'Gracieth','Tony'),
       (default, 'Luís','Carvalho') ,
	   (default, 'Maria','Santos'),
       (default, 'Deogracia','Paulo'),
       (default, 'Satoro','Gojo') ,
	   (default, 'Sung','Jin-Woo');
       
SELECT * FROM funcionarios;

INSERT INTO Enderecofun (id, provincia, municipio, bairro, id_funcionarios)	
VALUES (1, 'Luanda', 'Kifica', 'Multiperfil', 1),
	   (default, 'Luanda', 'Rangel', 'CTTT', 2),
       (default, 'Luanda', 'Belas', 'Benfica', 3),
       (default, 'Luanda', 'Luanda', 'Mutamba;', 4),
       (default, 'Luanda', 'Luanda', 'Ingombotas', 5),
       (default, 'Luanda', 'Luanda', 'NevesBandinha', 6),
       (default, 'Luanda', 'Cacuaco', 'BairroCimangola', 7);
       
SELECT * FROM Enderecofun;
       
INSERT INTO telefonefun (id_funcionarios, Telefone) 
VALUES (1, 998256003),
	   (2, 952351990),
       (3, 927797111),
	   (4, 937621776),
       (5, 927664558),
	   (6, 934208399),
	   (7, 927978614);
       
       
-- Supervisor
INSERT INTO Supervisor (id, unome, pnome, id_funcionarios) 
VALUES (1, 'Jorgina','Dinis', 1),
	   (2, 'Gracieth','Tony', 2),
       (3, 'Luís','Carvalho', 3);

INSERT INTO EnderecoSuper (id,provincia, municipio, bairro, id_Supervisor) 
VALUES (1, 'Luanda', 'Kifica', 'Multiperfil', 1),
	   (default, 'Luanda', 'Rangel', 'CTTT', 2),
       (default, 'Luanda', 'Belas', 'Benfica', 3);

INSERT INTO telefoneSuper (id, telefone, id_Supervisor) 
VALUES (1, 998256003 ,1),
	   (default, 952351990 ,2),
       (default, 927797111 ,3);

-- POSTO 
INSERT INTO Posto (id, Nome, Capacidade, Supervisor_id) 
VALUES (1, 'Posto 1', 100, 1),
	   (2, 'Posto 2', 200, 2),   
       (3, 'Posto 3', 300, 3);

INSERT INTO EnderecoPosto (provincia, municipio, bairro, id_Posto) 
VALUES ('Luanda', 'Luanda', 'ingombotas', 1),
	   ('Luanda', 'Luanda', 'Mutamba', 2),
       ('Luanda', 'Cacuaco', 'BairroCimangola', 3);
       
INSERT INTO telefonePosto (id, telefone ,id_Posto) 
VALUES (1, 923232323 ,1),
	   (default, 925134234 ,2),
	   (default, 927777121 ,3);

INSERT INTO Campanha (id, hora, Data) 
VALUES (1, '12:00:00', '2024-02-28'),
	   (2, '10:00:00', '2024-03-10'),
       (3, '08:00:00', '2024-03-20');

INSERT INTO Paciente (bi, unome, pnome, Idade) 
VALUES (1, 'Ana','Oliveira', 20),
	   (2, 'Sain','Silveiro', 25),
       (3, 'Luke','Tyson', 30);

INSERT INTO Vacina ( Nome, Data_de_EXP, Data_de_FAB, Quantidade_disponível) 
VALUES ( 'Vacina_Raiva', '2025-11-29', '2024-01-01', 500),
	   ( 'Vacina_Malária', '2025-12-31', '2024-02-02', 600),
	   ( 'Vacina_Colera', '2024-12-31', '2024-03-03', 700);

INSERT INTO paciente_vacina ( id_pv, id_vacina, bi_paciente) 
VALUES ( 1,1,1),
	   ( 2,2,1),
	   ( 3,3,2),
       ( 4,2,3),
	   ( 5,2,3);

select * from paciente_vacina;
-- CONSULTAS AVANÇADAS

select f.id, f.unome from funcionarios as f;
-- Chamar todos os funcionarios q temos

select c.id,c.unome,c.pnome, e.id, e.bairro from Supervisor as c inner join enderecoSuper as e on c.id=e.id_Supervisor  where c.id='1'; 
-- Selecionar o nome do Supervisor e o id do posto e trazer a sua localização do devido posto.

select a.id,a.nome, b.id_posto, b.municipio, b.provincia from posto as a inner join enderecoPosto as b on a.id=b.id_Posto;
-- Selecionar o id e o nome do supervisor com id igual a 1 e o seu bairro.

select c.id,c.unome,c.pnome, e.id, e.bairro, e.provincia from Supervisor as c inner join enderecoSuper as e on c.id=e.id_Supervisor  where e.provincia='Luanda';
-- Selecionar o id, primeiro e ultimo nome do supervisor bem como o id do seu bairro e provincia(fazendo o innner join entre as tabelas Supervisor e enderecoSuper).

select a.id,a.nome, d.BI,d.unome,d.pnome,d.idade from posto as a inner join paciente as d on a.id=d.Bi;
-- selecionar o id,nome do posto,primeiro e ultimo nome bem como a idade do paciente(fazendo inner join entre posto e paciente).

select d.BI,d.unome,d.pnome,d.idade,a.id,a.municipio, a.provincia, a.bairro,  e.id as id_vaci,e.nome from paciente as d inner join vacina as e inner join enderecoPosto as a  on a.id_Posto=e.id and a.id_Posto=d.Bi;
-- seleciona elementos das tabelas paciente,vacina,enderecoPosto. Juntando os pacientes ao devidas localizações dos postos onde eles irão apanhar a vacina dada.
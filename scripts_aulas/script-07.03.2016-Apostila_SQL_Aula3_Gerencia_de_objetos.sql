CREATE TABLE Cliente(
  cli_id number,
  cli_nome VARCHAR2(10),
  CONSTRAINT pk_cliente PRIMARY KEY (cli_id)
);

CREATE TABLE pedido(
  ped_id NUMBER,
  ped_preco NUMBER(7,2),
  ped_id_cli NUMBER,
  CONSTRAINT pk_pedido PRIMARY KEY (ped_id),
  CONSTRAINT fk_pedido FOREIGN KEY (ped_id_cli) --foreign pode receber null
    REFERENCES cliente ON DELETE CASCADE
);

--se nao define o references sem colocar set null e cascade,
--quando vai apagar um cliente o banco nao vai deixar apagar o pedido 
--vai ter que definir na unha o campo de foreign key no pedido pra entao apagar o cliente


INSERT INTO CLIENTE VALUES (1,'João');
INSERT INTO CLIENTE VALUES (2, 'Marcia');
INSERT INTO CLIENTE VALUES (3, 'Maria');

INSERT INTO Pedido VALUES (1, 450.65, 2);
INSERT INTO Pedido VALUES (2, 380.90, 1);
INSERT INTO Pedido VALUES (3, 100, 2);
INSERT INTO Pedido VALUES (4, 100, NULL); --aceita null na foreign

SELECT * FROM Cliente;
SELECT * FROM Pedido;

DELETE FROM CLIENTE WHERE cli_id = 2; --o cliente 2 tem dois pedidos, esse comando,

--Modelo Conceitual (DER)
--Modelo Logico (Relacionar)
--Modelo Fisico (SQL)

--EXERCICIO

CREATE TABLE Curso(
  CodCurso NUMBER,
  Nome VARCHAR2(65),
  Valor NUMBER(9,2),
  CONSTRAINT pk_curso PRIMARY KEY (CodCurso)
);

CREATE TABLE Aluno(
  RA NUMBER,
  Aluno_CodCurso NUMBER,
  Nome VARCHAR2(65),
  Endereco VARCHAR2(100),
  CONSTRAINT pk_aluno PRIMARY KEY (RA),
  CONSTRAINT fk_aluno_curso FOREIGN KEY (Aluno_CodCurso) REFERENCES Curso --ON DELETE CASCADE
);



CREATE TABLE Coordenador(
  Cod_Coord NUMBER,
  Coord_CodCurso NUMBER,
  Nome VARCHAR2(65),
  CONSTRAINT pk_coord PRIMARY KEY (Cod_Coord),
  CONSTRAINT fk_coord_codcurso FOREIGN KEY (Coord_CodCurso) REFERENCES Curso --ON DELETE CASCADE
);

INSERT INTO Curso VALUES(1,'Analise e Desenvolvimento de Sistemas', 900.00);
INSERT INTO Aluno VALUES(123, 1, 'Lucas Basseti', 'Centro');
INSERT INTO Coordenador VALUES(1, 1, 'Evandro');

SELECT * FROM Curso;
SELECT * FROM Aluno;
SELECT * FROM Coordenador;

SELECT c.CodCurso, c.Nome, a.RA, a.Nome, Coord.Nome
FROM Curso c
JOIN Aluno a ON (c.CodCurso = a.Aluno_CodCurso)
JOIN Coordenador coord ON (coord.Coord_CodCurso = c.CodCurso)

--Auto incremento no Oracle
--a sequence é um objeto do banco de dados e pertence ao schema do usuario
--a sequencia nao é vinculada a tabela
CREATE SEQUENCE sid_cliente;

alter sequence sid_cliente increment by 10;

INSERT INTO Cliente VALUES(sid_cliente.nextval, 'João');
SELECT * FROM Cliente;


/* Apostila_SQL_Aula2_Tipo_de_Dados.pdf */

CREATE TABLE Teste (
  idteste NUMBER,
  nome1 CHAR(15),
  nome2 VARCHAR(15),
  nome3 VARCHAR(15),
  PRIMARY KEY (idteste)
);

/*
 999999,99  na declara��o do NUMER � 8 digitos no total e 2 casas decimais
 NUMER(8,2)
 
 se passar apenas NUMER � como o integer
 
*/

INSERT INTO Teste VALUES (1, 'JO�O1', 'JO�O2', 'JO�O3'); --insere dados
INSERT INTO Teste VALUES (2, 'JO�O21', 'JO�O22', 'JO�O23'); --insere dados

UPDATE Teste SET Nome2 = 'JO�O2 DA SILVA' WHERE idTeste = 1; --altera os dados do registro de idTeste = 1

/*
 Quando � aplicado o comando UPDATE: 
 1- o registro 2 foi movido para frente (OP��O INVALIDA)
 2- o SBBD reserva alguns espa�os sem o usu�rio saber
 3- o SGBD utiliza ponteiros e armazena os dados novos em outra parte do HD

PCTFREE deixa 10% de espa�o free para altera��es de cada campo
se a alteracao for maior que 10% ele usa ponteiro
antes de criar a tabela eu posso passar o PCTFREE 10 (� a tabela como um todo)

*/

SELECT * FROM Teste;

--------------------------------------------------------------------------------
CREATE TABLE Teste2 (
  IDTeste2 NUMBER,
  Nome VARCHAR2(40),
  DataNasc DATE, --o DATE aceita Data e Hora
  PRIMARY KEY (IDTeste2)
);

INSERT INTO Teste2 VALUES (1, 'Jo�o', '30/10/1990'); 
INSERT INTO Teste2 VALUES (2, 'Maria', '20/11/1990 19:30:22'); --erro date format picture ends before converting entire input string
--01830. 00000 -  "date format picture ends before converting entire input string"

INSERT INTO Teste2 VALUES (2, 'Pedro', TO_DATE('30/10/1990 19:40:22','dd/mm/yyyy hh24:mi:ss')); 
INSERT INTO Teste2 VALUES (3, 'Pedro2', TO_DATE('30/10/1990 19:40:22','DD/MM/YYYY HH24:MI:SS')); 
INSERT INTO Teste2 VALUES (4, 'Igor', TO_DATE('30/10/1990 19:40:22','dd/mm/yyyy hh24:mi:ss')); 


SELECT * FROM Teste2;

SELECT idteste2, nome, TO_CHAR(datanasc, 'MM-DD-YYYY HH24:MI:SS') datanasc FROM Teste2;

--------------------------------------------------------------------------------

/* Apostila_SQL_Aula3_Gerencia_de_objetos.pdf */

/*
 Objetos de BD
 
  DDL - Data Definition Language ou Linguagem de Definição de Dados 
  (create, alter, drop, view, procedures)
  
  o principal objeto do banco de dados é a Tabela
    dividia em Colunas e Linhas
*/

CREATE TABLE Teste3 (
  IDTeste NUMBER NULL,  --o oracle vai colocar NOT NULL pq foi definido PRIMARY KEY(IDTeste)
  NOME VARCHAR(40),
  PRIMARY KEY(IDTeste)
);


/*
Create Table
– Exemplo: Criando a tabela empregado:
*/

CREATE TABLE Empregado (
  EmpNum NUMBER NOT NULL,
  EmpNome VARCHAR(30) NOT NULL,
  EmpDataNasc DATE,
  EmpServ CHAR(20),
  EmpAdmi DATE NOT NULL,
  EmpSalario NUMBER(10,2),
  EmpComicao NUMBER(10,2)
);

/*
 Restricoes de Integridate:
  NOT NULL
  CONSTRAINT pk_cliente (para nomear restricoes)
*/

/*
  -uma tabela nao pode ter 2 chaves primarias apenas uma, mas ela pode ser composta
  
  CONSTRAINT fk_pedido_cliente FOREIGN KEY (codigo_cliente) REFERENCES cliente
*/




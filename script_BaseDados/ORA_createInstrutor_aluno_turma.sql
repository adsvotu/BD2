CREATE TABLE Instrutor (
  CodInst NUMBER   NOT NULL ,
  NomeInst varchar2(40)    ,
  TelefInst varchar2(15)    ,
  DataAdmissaoInst DATE      ,
PRIMARY KEY(CodInst));


/*Inserindo Instrutores */
insert into Instrutor
 values (1, 'Maria Carolina', '344-8788', '1/2/1997');
  
insert into Instrutor
  values (2, 'Pedro Paula', '274-9018', '8/3/1996');
  
insert into Instrutor
  values (3, 'Augusto Lemos', '722-1300', '12/11/1998');
  
insert into Instrutor
  values (4, 'Monica Silveira', '212-7938', '30/11/1997');

commit;




CREATE TABLE Curso (
  CodCur NUMBER   NOT NULL ,
  NomeCur VARCHAR2(40)    ,
  CargaHorariaCur NUMBER(5,2)    ,
  ValorCursoCur NUMBER(7,2)    ,
  PreRequisitoCur NUMBER      ,
PRIMARY KEY(CodCur));


/*Inserindo cursos */
insert into Curso
 values (1, 'Introducao a Logica de Programacao', 32, 800, null); 
insert into Curso
 values (2, 'Fundamentos de Modelagem de Dados', 40, 950, null); 
insert into Curso
 values (3, 'Redes I',null ,null , null); 
insert into Curso
 values (4, 'Introducao a Sistemas Operacionais',null ,null , null); 
insert into Curso
 values (5, 'Análise Orientada por Objetos',null ,null , null);
insert into Curso
 values (6, 'Delphi:Recurso Basicos', 24,400 , 1);
insert into Curso
 values (7, 'Delphi: Acesso a Banco de Dados',24 ,400, 1);
insert into Curso
 values (8, 'Oracle:SQL*PLUS e SQL', 32,750 , null);
insert into Curso
 values (9, 'Oracle:PL/SQL', 24, 750, null);
insert into Curso
 values (10, 'Redes II', null,null , 3);

commit;




CREATE TABLE Aluno (
  MatriculaAlu NUMBER   NOT NULL ,
  NomeAlu varchar2(40)    ,
  TelAlu varchar2(15)    ,
  EnderAlu varchar2(40)    ,
  CidadeAlu varchar2(30)    ,
  UFAlu CHAR(2)    ,
  DataNascAlu DATE      ,
PRIMARY KEY(MatriculaAlu));


/*Inserindo Alunos */
insert into Aluno
 values (1, 'Zebedeu Silva Hydra', '3474-2318', 'R. Adolfo Lutz, 27/902', 'São Paulo', 'SP', '10/03/1983');
insert into Aluno
 values (2, 'Yamandu Ramos Centaurus', '399-1490', 'R. Albert Einsten, 13', 'Campinas', 'SP', '12/05/1983');
insert into Aluno
 values (3, 'Wellington', '655-1138', 'Av. do Contorno', 'Linhares', 'ES', null);
insert into Aluno
 values (4, 'Tadeu Perseu', '311-4671', 'T. Orquideas', 'Barbacena', 'MG' ,null);
insert into Aluno
 values (5, 'Luis Eridanus Rios', '211-6600', 'Av. Conceicao Silva', 'Uberaba', 'MG', null);

commit;




CREATE TABLE Turma (
  CodTur NUMBER   NOT NULL ,
  fk_CodCur NUMBER   NOT NULL ,
  fk_CodInst NUMBER   NOT NULL ,
  PrecoHoraTur NUMERIC(4,2)    ,
  SalaTur INTEGER      ,
PRIMARY KEY(CodTur),
  FOREIGN KEY(fk_CodCur)
    REFERENCES Curso(CodCur),
  FOREIGN KEY(fk_CodInst)
    REFERENCES Instrutor(CodInst));


/*Inserindo Turmas*/
insert into Turma
 values (1,1,1,20,2);
insert into Turma
 values (2,1,2,20,5);
insert into Turma
 values (3,2,3,25,4);
insert into Turma
 values (4,3,4,20,4);
insert into Turma
 values (5,3,3,20,6);
insert into Turma
 values (7,7,3,25,1);
insert into Turma
 values (8,5,4,40,8);

commit;

CREATE TABLE Historico (
  fk_MatriculaAlu NUMBER   NOT NULL ,
  fk_CodTur NUMBER   NOT NULL ,
  NotaBim1Hist NUMBER(3,1)    ,
  NotaBim2Hist NUMBER(3,1)    ,
  PresencaHist NUMBER(3,1)      ,
PRIMARY KEY(fk_MatriculaAlu, fk_CodTur),
  FOREIGN KEY(fk_MatriculaAlu)
    REFERENCES Aluno(MatriculaAlu),
  FOREIGN KEY(fk_CodTur)
    REFERENCES Turma(CodTur));


/*Inserindo Historico*/
insert into Historico
 values (1,1,7.5);
insert into Historico
 values (5,2,7);
insert into Historico
 values (1,5,6);
insert into Historico
 values (1,4,9);
insert into Historico
 values (4,2,3);
insert into Historico
 values (3,2,5.5);

commit;




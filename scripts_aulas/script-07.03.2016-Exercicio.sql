--Exercicio criando ambiente exemplo para materia LP1

create tablespace LP1
datafile 'C:\oraclexe\app\oracle\oradata\XE\LP1.dbf ' size 10 M
autoextend on next 10 M
extent management local;

create user alunoLP1
identified by oradba
default tablespace LP1
quota unlimited on LP1;

GRANT create session, alter session, create table, create procedure, create view, 
create materialized view, create trigger, create sequence, create any directory, 
create type, create synonym TO alunoLP1;


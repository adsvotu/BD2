

/* Tabela Cliente */
create table cliente (
codigo_cliente number not null,
nome_cliente varchar2(40),
endereco varchar2(40),
cidade varchar2(20),
cep varchar2(9),
uf varchar2(2),
cnpj varchar2(20),
ie varchar2(20));

alter table cliente add constraint pk_cliente primary key (codigo_cliente);

/* Tabela vendedor */
create table vendedor (
codigo_vendedor number not null,
nome_vendedor varchar2(40) not null,
salario_fixo number(10,2),
faixa_comissao varchar2(1));

alter table vendedor add constraint pk_vendedor primary key (codigo_vendedor);


/* Tabela pedido
Note: Uma vez que a tabela pedido faz referencia as tabelas CLIENTE e VENDEDOR, eu a
criei depois de criar as tabelas referenciadas */

create table pedido(
num_pedido number not null,
prazo_entrega number(5) not null,
codigo_cliente number not null,
codigo_vendedor number,
data_pedido date);

alter table pedido add constraint pk_pedido primary key (num_pedido);

alter table pedido add constraint fk_pedido_cliente foreign key (codigo_cliente)
                                              references cliente on delete cascade;

alter table pedido add constraint fk_pedido_vendedor foreign key (codigo_vendedor)
                                              references vendedor on delete set null;
                                              
/* Tabela produto */
create table produto (
codigo_produto number not null,
unidade varchar2(3),
descricao varchar2(30),
val_unit  number(10,2),
quantidade number (4));

alter table produto add constraint pk_produto primary key (codigo_produto);

/*  Tabela Item_Pedido
Note: mesmo caso da tabela pedido */

create table item_pedido (
num_pedido number not null,
codigo_produto number not null,
quantidade number(4));

alter table item_pedido add constraint pk_item_pedido primary key (num_pedido,codigo_produto);

alter table item_pedido add constraint fk_item_pedido_pedido foreign key (num_pedido)
                                              references pedido on delete cascade;
alter table item_pedido add constraint fk_item_pedido_produto foreign key (codigo_produto)
                                              references produto;

/* Fim das tabelas */

/*Inserido dados na tabela cliente*/

insert into cliente 
  values (720, 'Ana', 'Rua 17 n. 19', 'Niteroi', '24358310', 'RJ', '12113231/0001-34', '2134');

insert into cliente 
  values (870, 'Flávio', 'Av. Pres. Vargas 10', 'São Paulo', '22763931', 'SP', '22534126/9387-9', '4631');

insert into cliente 
  values (110, 'Jorge', 'Rua Caiapo 13', 'Curitiba', '30078500', 'PR', '14512764/9834-9', null);

insert into cliente 
  values (222, 'Lúcia', 'Rua Itabira 123 Loja 9', 'Belo Horizonte', '221243491', 'MG', '28315213/9348-8', '2985');

insert into cliente 
  values (830, 'Maurício', 'Av. Paulista 1236', 'São Paulo', '3012683', 'SP', '32816985/7465-6', '9343');

insert into cliente 
  values (130, 'Edmar', 'Rua da Praia sn', 'Salvador', '30079300', 'BA', '23463284/234-9', '7121');

insert into cliente 
  values (410, 'Rodolfo', 'Largo da lapa 27 sobrado', 'Rio de Janeiro', '30078900', 'RJ', '12835128/2346-9', '7431');

insert into cliente 
  values (20, 'Beth', 'Av. Climério n.45', 'São Paulo', '25679300', 'SP', '3248126/7326-8', '9280');

insert into cliente 
  values (157, 'Paulo', 'T. Moraes c/3', 'Londrina', null, 'PR', '3284223/324-2', '1923');

insert into cliente 
  values (180, 'Lívio', 'Av. Beira Mar n. 1256', 'Florianópolis', '30077500', 'SC', '12736571/2347', null);

insert into cliente 
  values (260, 'Susana', 'Rua Lopes Mendes 12', 'Niterói', '30046500', 'RJ', '21763571/232-9', '2530');

insert into cliente 
  values (290, 'Renato', 'Rua Meireles n. 123 bl. sl.345', 'São Paulo', '30225900', 'SP', '13276547/213-3', '9071');

insert into cliente 
  values (390, 'Sebastião', 'Rua da Igreja n.10', 'Uberaba', '30438700', 'MG', '32176547/213-3', '9071');

insert into cliente 
  values (234, 'José', 'Quadra 3 bl. 3 sl. 1003', 'Brasilia', '22841650', 'DF', '21763576/1232-3', '2931');

insert into cliente 
  values (1001, 'Rodolfo', 'Largo do São Francisco 27 sobrado', 'São Paulo', '77841650','SP', '41763576/1232-3', '2131');

/*Inserido dados na tabela Vendedor*/

insert into vendedor
  values (209, 'José', 1800.00, 'C');

insert into vendedor
  values (111, 'Carlos', 2490.00, 'A');

insert into vendedor
  values (11, 'João', 2780.00, 'C');

insert into vendedor
  values (240, 'Antônio', 9500.00, 'C');

insert into vendedor
  values (720, 'Felipe', 4600.00, 'A');

insert into vendedor
  values (213, 'Jonas', 2300.00, 'A');

insert into vendedor
  values (101, 'João', 2650.00, 'C');

insert into vendedor
  values (310, 'Josias', 870.00, 'B');

insert into vendedor
  values (250, 'Maurício', 2930.00, 'B');

insert into vendedor
  values (550, 'Antonio Cezar da Silva', 1930.00, 'B');

insert into vendedor
  values (5150, 'Josué Texeira', 930.00, 'C');


/*Inserido dados na tabela Pedido
Nota: So podemos inserir dados nesta tabela, depois de inserir dados nas tabelas Cliente e Vendedor*/

insert into pedido
  values (121,20,410,209, '23/02/2001');

insert into pedido
  values (97,20,720,101, '25/02/2001');

insert into pedido
  values (101,15,720,101, '09/04/2003');

insert into pedido
  values (137,20,720,720, '09/04/2003');

insert into pedido
  values (148,20,720,101, '01/05/2003');

insert into pedido
  values (189,15,870,213, '17/08/2003');

insert into pedido
  values (104,30,110,101, '21/09/2003');

insert into pedido
  values (203,30,830,250, '15/01/2005');

insert into pedido
  values (98,20,410,209, '03/02/2005');

insert into pedido
  values (143,30,20,111, '08/03/2005');

insert into pedido
  values (105,15,180,240, '12/05/2005');

insert into pedido
  values (111,20,260,240,'15/06/2005');

insert into pedido
  values (103,20,260,240, '20/12/2005');

insert into pedido
  values (91,20,260,11, '26/04/2006');

insert into pedido
  values (138,20,260,11, '14/05/2006');

insert into pedido
  values (108,15,290,310, '27/05/2007');

insert into pedido
  values (119,30,390,250, '26/07/2007');

insert into pedido
  values (127,10,410,11, '01/08/2007');


/*Inserido dados na tabela Produto*/

insert into produto
  values (25,'Kg','Queijo',0.97, 10);

insert into produto
  values (31,'BAR','Chocolate',0.87, 25);

insert into produto
  values (78,'L','Vinho', 2, 11);

insert into produto
  values (22,'M','Linho',0.11, 130);

insert into produto
  values (30,'SAC','Açúcar',0.30, 9);

insert into produto
  values (53,'M','Linha',1.80, 200);

insert into produto
  values (13,'G','Ouro',6.18, 100);

insert into produto
  values (45,'M','Madeira',0.25, 45);

insert into produto
  values (87,'M','Cano',1.97, 30);

insert into produto
  values (77,'M','Papel',1.05, 76);


/*Inserido dados na tabela Item_Pedido
Nota: So podemos inserir dados nesta tabela, depois de inserir dados nas tabelas Pedido e Produto*/

insert into item_pedido
  values (101,78,18);

insert into item_pedido
  values (101,13,5);

insert into item_pedido
  values (98,77,5);

insert into item_pedido
  values (148,45,8);

insert into item_pedido
  values (148,31,7);

insert into item_pedido
  values (148,77,3);

insert into item_pedido
  values (148,25,10);

insert into item_pedido
  values (148,78,30);

insert into item_pedido
  values (104,53,32);

insert into item_pedido
  values (203,31,6);

insert into item_pedido
  values (189,78,45);

insert into item_pedido
  values (143,31,20);

insert into item_pedido
  values (105,78,10);

insert into item_pedido
  values (111,25,10);

insert into item_pedido
  values (111,78,70);

insert into item_pedido
  values (103,53,37);

insert into item_pedido
  values (91,77,40);

insert into item_pedido
  values (138,22,10);

insert into item_pedido
  values (138,77,35);

insert into item_pedido
  values (138,53,18);

insert into item_pedido
  values (108,13,17);

insert into item_pedido
  values (119,77,40);

insert into item_pedido
  values (119,13,6);

insert into item_pedido
  values (119,22,10);

insert into item_pedido
  values (119,53,43);

insert into item_pedido
  values (137,13,8);

/* Fim inserts */

/* Confirmando alterações */

commit;

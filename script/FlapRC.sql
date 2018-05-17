/*==============================================================*/
/* dbms name:      mysql 5.0                                    */
/* created on:     19/09/2017 12:24:52                          */
/*==============================================================*/


drop table if exists alcadas;

drop table if exists andamento_entrega;

drop table if exists carrinho;

drop table if exists carrinho_produto;

drop table if exists categoria;

drop table if exists classificacao_usuario;

drop table if exists combo;

drop table if exists email;

drop table if exists endereco;

drop table if exists estoque;

drop table if exists forma_pagamento;

drop table if exists fornecedor;

drop table if exists historico;

drop table if exists imagem;

drop table if exists indicacao;

drop table if exists item_produto;

drop table if exists itencao_produto;

drop table if exists mensagem;

drop table if exists pagamento;

drop table if exists pedido;

drop table if exists pontos;

drop table if exists pontos_usuario;

drop table if exists produto;

drop table if exists produto_fornecedor;

drop table if exists produto_item_produto;

drop table if exists qualificacao_produto;

drop table if exists status;

drop table if exists sub_categoria;

drop table if exists tipo_andamento_entrega;

drop table if exists tipo_transporte;

drop table if exists transportadora;

drop table if exists transportador_tipo_transporte;

drop table if exists uf;

drop table if exists unidade;

drop table if exists usuario;

drop table if exists usuario_alcada;

/*==============================================================*/
/* table: alcadas                                               */
/*==============================================================*/
create table alcadas
(
   id_alcadas           smallint not null auto_increment,
   id_alcadas_pai       smallint,
   sigla                char(3),
   descricao            varchar(300),
   primary key (id_alcadas)
)
auto_increment = 1;

/*==============================================================*/
/* table: andamento_entrega                                     */
/*==============================================================*/
create table andamento_entrega
(
   id_andamento_entrega smallint not null auto_increment,
   id_tipo_andamento_entrega smallint,
   observacao           varchar(200),
   cod_rastreamento     varchar(100),
   primary key (id_andamento_entrega)
)
auto_increment = 1;

/*==============================================================*/
/* table: carrinho                                              */
/*==============================================================*/
create table carrinho
(
   id_carrinho          smallint not null auto_increment,
   id_usuario           smallint,
   id_imagem            smallint,
   primary key (id_carrinho)
);

/*==============================================================*/
/* table: carrinho_produto                                      */
/*==============================================================*/
create table carrinho_produto
(
   id_carrinho          smallint not null,
   id_produto           smallint not null,
   quantidade           smallint(6),
   primary key (id_carrinho, id_produto)
);

/*==============================================================*/
/* table: categoria                                             */
/*==============================================================*/
create table categoria
(
   id_categoria         smallint not null auto_increment,
   descricao            varchar(200),
   ativo                boolean,
   primary key (id_categoria)
)
auto_increment = 1;

/*==============================================================*/
/* table: classificacao_usuario                                 */
/*==============================================================*/
create table classificacao_usuario
(
   id_classificacao_usuario smallint not null auto_increment,
   sigla                varchar(4),
   descricao            varchar(200),
   primary key (id_classificacao_usuario)
)
auto_increment = 1;

/*==============================================================*/
/* table: combo                                                 */
/*==============================================================*/
create table combo
(
   id_combo             smallint not null auto_increment,
   id_produto           smallint,
   observacao           varchar(300),
   ativo                boolean,
   primary key (id_combo)
)
auto_increment = 1;

/*==============================================================*/
/* table: email                                                 */
/*==============================================================*/
create table email
(
   id_email             smallint not null auto_increment,
   id_usuario           smallint,
   email                varchar(100),
   ativo                boolean,
   primary key (id_email)
)
auto_increment = 1;

/*==============================================================*/
/* table: endereco                                              */
/*==============================================================*/
create table endereco
(
   id_endereco          smallint not null auto_increment,
   id_uf                smallint,
   id_usuario           smallint,
   descricao            varchar(300),
   complemento          varchar(100),
   cep                  varchar(8),
   entrega              boolean,
   primary key (id_endereco)
)
auto_increment = 1;

/*==============================================================*/
/* table: estoque                                               */
/*==============================================================*/
create table estoque
(
   id_estoque           smallint not null auto_increment,
   valor_entrada        double(12,2),
   data_entrada         date,
   data_expiracao       date,
   quantidade           smallint,
   prec_desconto        float(4,2),
   estimativa_venda     smallint,
   primary key (id_estoque)
)
auto_increment = 1;

/*==============================================================*/
/* table: forma_pagamento                                       */
/*==============================================================*/
create table forma_pagamento
(
   id_forma_pagamento   smallint not null auto_increment,
   descricao            varchar(100),
   primary key (id_forma_pagamento)
)
auto_increment = 1;

/*==============================================================*/
/* table: fornecedor                                            */
/*==============================================================*/
create table fornecedor
(
   id_fornecedor        smallint not null auto_increment,
   nome_fantasia        varchar(200),
   cnpj                 smallint(14),
   descricao            varchar(200),
   observacao           varchar(300),
   primary key (id_fornecedor)
)
auto_increment = 1;

/*==============================================================*/
/* table: historico                                             */
/*==============================================================*/
create table historico
(
   id_historico         smallint not null auto_increment,
   id_pedido            smallint,
   observacao           varchar(300),
   primary key (id_historico)
)
auto_increment = 1;

/*==============================================================*/
/* table: imagem                                                */
/*==============================================================*/
create table imagem
(
   id_imagem            smallint not null auto_increment,
   imagem               blob,
   descricao            varchar(200),
   primary key (id_imagem)
);

/*==============================================================*/
/* table: indicacao                                             */
/*==============================================================*/
create table indicacao
(
   id_indicacao         smallint not null auto_increment,
   id_usuario           smallint,
   id_produto           smallint,
   id_combo             smallint,
   id_email             smallint,
   observacao           varchar(300),
   primary key (id_indicacao)
)
auto_increment = 1;

/*==============================================================*/
/* table: item_produto                                          */
/*==============================================================*/
create table item_produto
(
   id_item_produto      smallint not null auto_increment,
   id_unidade           smallint,
   id_imagem            smallint,
   descricao            varchar(300),
   data_vencimento      date,
   valor                double(12,2),
   primary key (id_item_produto)
)
auto_increment = 1;

/*==============================================================*/
/* table: itencao_produto                                       */
/*==============================================================*/
create table itencao_produto
(
   id_intencao_produto  smallint not null auto_increment,
   id_usuario           smallint,
   id_produto           smallint,
   primary key (id_intencao_produto)
)
auto_increment = 1;

/*==============================================================*/
/* table: mensagem                                              */
/*==============================================================*/
create table mensagem
(
   id_mensagem          smallint not null auto_increment,
   id_usuario           smallint,
   descricao            varchar(300),
   primary key (id_mensagem)
)
auto_increment = 1;

/*==============================================================*/
/* table: pagamento                                             */
/*==============================================================*/
create table pagamento
(
   id_pagamento         smallint not null auto_increment,
   id_forma_pagamento   smallint,
   id_imagem            smallint,
   id_pedido            smallint,
   id_status            smallint,
   primary key (id_pagamento)
)
auto_increment = 1;

/*==============================================================*/
/* table: pedido                                                */
/*==============================================================*/
create table pedido
(
   id_pedido            smallint not null auto_increment,
   id_usuario           smallint,
   id_transportadora    smallint,
   id_carrinho          smallint,
   id_andamento_entrega smallint,
   data_finalizacao     datetime,
   valor_frete          float(5,2),
   valor_total          double(12,2),
   data_abertura        datetime,
   data_entrega         datetime,
   num_pedido           varchar(100),
   primary key (id_pedido)
)
auto_increment = 1;

/*==============================================================*/
/* table: pontos                                                */
/*==============================================================*/
create table pontos
(
   id_pontos            smallint not null auto_increment,
   qtd_pontos_valor     float(4,2),
   qtd_pontos_pedido    smallint,
   descricao            varchar(200),
   pedido               boolean,
   valor                boolean,
   primary key (id_pontos)
)
auto_increment = 1;

/*==============================================================*/
/* table: pontos_usuario                                        */
/*==============================================================*/
create table pontos_usuario
(
   id_pontos_usuario    smallint not null auto_increment,
   id_pontos            smallint,
   id_pedido            smallint,
   qtd_pontos           smallint,
   primary key (id_pontos_usuario)
)
auto_increment = 1;

/*==============================================================*/
/* table: produto                                               */
/*==============================================================*/
create table produto
(
   id_produto           smallint not null auto_increment,
   id_unidade           smallint,
   id_imagem            smallint,
   id_categoria         smallint,
   id_estoque           smallint,
   descricao            varchar(200),
   valor                double(12,2),
   ativo                boolean,
   primary key (id_produto)
)
auto_increment = 1;

/*==============================================================*/
/* table: produto_fornecedor                                    */
/*==============================================================*/
create table produto_fornecedor
(
   id_produto_fornecedor smallint not null auto_increment,
   id_produto           smallint,
   id_fornecedor        smallint,
   valor                double(12,2),
   perc_desconto        float(4,2),
   qtd_desconto         smallint,
   primary key (id_produto_fornecedor)
)
auto_increment = 1;

/*==============================================================*/
/* table: produto_item_produto                                  */
/*==============================================================*/
create table produto_item_produto
(
   id_item_produto      smallint not null,
   id_produto           smallint not null,
   primary key (id_item_produto, id_produto)
);

/*==============================================================*/
/* table: qualificacao_produto                                  */
/*==============================================================*/
create table qualificacao_produto
(
   id_qualificacao_produto smallint not null auto_increment,
   id_usuario           smallint,
   id_produto           smallint,
   qtd_estrelas         smallint(5),
   observacao           varchar(200),
   primary key (id_qualificacao_produto)
)
auto_increment = 1;

/*==============================================================*/
/* table: status                                                */
/*==============================================================*/
create table status
(
   id_status            smallint not null auto_increment,
   descricao            varchar(200),
   primary key (id_status)
)
auto_increment = 1;

/*==============================================================*/
/* table: sub_categoria                                         */
/*==============================================================*/
create table sub_categoria
(
   id_sub_categoria     smallint not null auto_increment,
   id_categoria         smallint,
   descricao            varchar(100),
   primary key (id_sub_categoria)
)
auto_increment = 1;

/*==============================================================*/
/* table: tipo_andamento_entrega                                */
/*==============================================================*/
create table tipo_andamento_entrega
(
   id_tipo_andamento_entrega smallint not null auto_increment,
   descricao            varchar(200),
   primary key (id_tipo_andamento_entrega)
)
auto_increment = 1;

/*==============================================================*/
/* table: tipo_transporte                                       */
/*==============================================================*/
create table tipo_transporte
(
   id_tipo_transporte   smallint not null auto_increment,
   id_unidade           smallint,
   descricao            varchar(200),
   sigla                char(2),
   valor_unidade        float(4,2),
   primary key (id_tipo_transporte)
)
auto_increment = 1;

/*==============================================================*/
/* table: transportadora                                        */
/*==============================================================*/
create table transportadora
(
   id_transportadora    smallint not null auto_increment,
   id_endereco          smallint,
   nome_fantasia        varchar(200),
   cnpj                 varchar(14),
   descricao            varchar(200),
   primary key (id_transportadora)
)
auto_increment = 1;

/*==============================================================*/
/* table: transportador_tipo_transporte                         */
/*==============================================================*/
create table transportador_tipo_transporte
(
   id_transportadora    smallint not null,
   id_tipo_transporte   smallint not null,
   primary key (id_transportadora, id_tipo_transporte)
);

/*==============================================================*/
/* table: uf                                                    */
/*==============================================================*/
create table uf
(
   id_uf                smallint not null auto_increment,
   sigla                char(2),
   primary key (id_uf)
);

/*==============================================================*/
/* table: unidade                                               */
/*==============================================================*/
create table unidade
(
   id_unidade           smallint not null auto_increment,
   sigla                char(2),
   descricao            varchar(100),
   valor                smallint,
   primary key (id_unidade)
);

/*==============================================================*/
/* table: usuario                                               */
/*==============================================================*/
create table usuario
(
   id_usuario           smallint not null auto_increment,
   id_classificacao_usuario smallint,
   id_imagem            smallint,
   nome                 varchar(300),
   login                varchar(20),
   ativo                boolean,
   senha                varchar(20),
   cpf                  varchar(11),
   data_nascimento      date,
   qtd_pedidos          smallint,
   primary key (id_usuario)
)
auto_increment = 1;

alter table usuario comment 'tabela com os usuários do sistema flaprc.';

/*==============================================================*/
/* table: usuario_alcada                                        */
/*==============================================================*/
create table usuario_alcada
(
   id_alcadas           smallint not null,
   id_usuario           smallint not null,
   primary key (id_alcadas, id_usuario)
);

alter table alcadas add constraint fk_reference_32 foreign key (id_alcadas_pai)
      references alcadas (id_alcadas) on delete restrict on update restrict;

alter table andamento_entrega add constraint fk_reference_39 foreign key (id_tipo_andamento_entrega)
      references tipo_andamento_entrega (id_tipo_andamento_entrega) on delete restrict on update restrict;

alter table carrinho add constraint fk_reference_48 foreign key (id_usuario)
      references usuario (id_usuario) on delete restrict on update restrict;

alter table carrinho add constraint fk_reference_49 foreign key (id_imagem)
      references imagem (id_imagem) on delete restrict on update restrict;

alter table carrinho_produto add constraint fk_reference_46 foreign key (id_carrinho)
      references carrinho (id_carrinho) on delete restrict on update restrict;

alter table carrinho_produto add constraint fk_reference_47 foreign key (id_produto)
      references produto (id_produto) on delete restrict on update restrict;

alter table combo add constraint fk_reference_12 foreign key (id_produto)
      references produto (id_produto) on delete restrict on update restrict;

alter table email add constraint fk_reference_20 foreign key (id_usuario)
      references usuario (id_usuario) on delete restrict on update restrict;

alter table endereco add constraint fk_reference_3 foreign key (id_uf)
      references uf (id_uf) on delete restrict on update restrict;

alter table endereco add constraint fk_reference_4 foreign key (id_usuario)
      references usuario (id_usuario) on delete restrict on update restrict;

alter table historico add constraint fk_reference_31 foreign key (id_pedido)
      references pedido (id_pedido) on delete restrict on update restrict;

alter table indicacao add constraint fk_reference_17 foreign key (id_usuario)
      references usuario (id_usuario) on delete restrict on update restrict;

alter table indicacao add constraint fk_reference_18 foreign key (id_produto)
      references produto (id_produto) on delete restrict on update restrict;

alter table indicacao add constraint fk_reference_19 foreign key (id_combo)
      references combo (id_combo) on delete restrict on update restrict;

alter table indicacao add constraint fk_reference_21 foreign key (id_email)
      references email (id_email) on delete restrict on update restrict;

alter table item_produto add constraint fk_reference_5 foreign key (id_unidade)
      references unidade (id_unidade) on delete restrict on update restrict;

alter table item_produto add constraint fk_reference_6 foreign key (id_imagem)
      references imagem (id_imagem) on delete restrict on update restrict;

alter table itencao_produto add constraint fk_reference_22 foreign key (id_usuario)
      references usuario (id_usuario) on delete restrict on update restrict;

alter table itencao_produto add constraint fk_reference_23 foreign key (id_produto)
      references produto (id_produto) on delete restrict on update restrict;

alter table mensagem add constraint fk_reference_24 foreign key (id_usuario)
      references usuario (id_usuario) on delete restrict on update restrict;

alter table pagamento add constraint fk_reference_35 foreign key (id_forma_pagamento)
      references forma_pagamento (id_forma_pagamento) on delete restrict on update restrict;

alter table pagamento add constraint fk_reference_36 foreign key (id_imagem)
      references imagem (id_imagem) on delete restrict on update restrict;

alter table pagamento add constraint fk_reference_37 foreign key (id_pedido)
      references pedido (id_pedido) on delete restrict on update restrict;

alter table pagamento add constraint fk_reference_38 foreign key (id_status)
      references status (id_status) on delete restrict on update restrict;

alter table pedido add constraint fk_reference_27 foreign key (id_usuario)
      references usuario (id_usuario) on delete restrict on update restrict;

alter table pedido add constraint fk_reference_28 foreign key (id_transportadora)
      references transportadora (id_transportadora) on delete restrict on update restrict;

alter table pedido add constraint fk_reference_29 foreign key (id_carrinho)
      references carrinho (id_carrinho) on delete restrict on update restrict;

alter table pedido add constraint fk_reference_30 foreign key (id_andamento_entrega)
      references andamento_entrega (id_andamento_entrega) on delete restrict on update restrict;

alter table pontos_usuario add constraint fk_reference_25 foreign key (id_pontos)
      references pontos (id_pontos) on delete restrict on update restrict;

alter table pontos_usuario add constraint fk_reference_26 foreign key (id_pedido)
      references pedido (id_pedido) on delete restrict on update restrict;

alter table produto add constraint fk_reference_10 foreign key (id_estoque)
      references estoque (id_estoque) on delete restrict on update restrict;

alter table produto add constraint fk_reference_7 foreign key (id_unidade)
      references unidade (id_unidade) on delete restrict on update restrict;

alter table produto add constraint fk_reference_8 foreign key (id_imagem)
      references imagem (id_imagem) on delete restrict on update restrict;

alter table produto add constraint fk_reference_9 foreign key (id_categoria)
      references categoria (id_categoria) on delete restrict on update restrict;

alter table produto_fornecedor add constraint fk_reference_13 foreign key (id_produto)
      references produto (id_produto) on delete restrict on update restrict;

alter table produto_fornecedor add constraint fk_reference_14 foreign key (id_fornecedor)
      references fornecedor (id_fornecedor) on delete restrict on update restrict;

alter table produto_item_produto add constraint fk_reference_15 foreign key (id_item_produto)
      references item_produto (id_item_produto) on delete restrict on update restrict;

alter table produto_item_produto add constraint fk_reference_16 foreign key (id_produto)
      references produto (id_produto) on delete restrict on update restrict;

alter table qualificacao_produto add constraint fk_reference_40 foreign key (id_usuario)
      references usuario (id_usuario) on delete restrict on update restrict;

alter table qualificacao_produto add constraint fk_reference_41 foreign key (id_produto)
      references produto (id_produto) on delete restrict on update restrict;

alter table sub_categoria add constraint fk_reference_11 foreign key (id_categoria)
      references categoria (id_categoria) on delete restrict on update restrict;

alter table tipo_transporte add constraint fk_reference_44 foreign key (id_unidade)
      references unidade (id_unidade) on delete restrict on update restrict;

alter table transportadora add constraint fk_reference_45 foreign key (id_endereco)
      references endereco (id_endereco) on delete restrict on update restrict;

alter table transportador_tipo_transporte add constraint fk_reference_42 foreign key (id_transportadora)
      references transportadora (id_transportadora) on delete restrict on update restrict;

alter table transportador_tipo_transporte add constraint fk_reference_43 foreign key (id_tipo_transporte)
      references tipo_transporte (id_tipo_transporte) on delete restrict on update restrict;

alter table usuario add constraint fk_reference_1 foreign key (id_classificacao_usuario)
      references classificacao_usuario (id_classificacao_usuario) on delete restrict on update restrict;

alter table usuario add constraint fk_reference_2 foreign key (id_imagem)
      references imagem (id_imagem) on delete restrict on update restrict;

alter table usuario_alcada add constraint fk_reference_33 foreign key (id_alcadas)
      references alcadas (id_alcadas) on delete restrict on update restrict;

alter table usuario_alcada add constraint fk_reference_34 foreign key (id_usuario)
      references usuario (id_usuario) on delete restrict on update restrict;

/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     18/09/2017 21:37:17                          */
/*==============================================================*/


alter table ALCADAS
   drop primary key;

drop table if exists ALCADAS;

alter table ANDAMENTO_ENTREGA
   drop primary key;

drop table if exists ANDAMENTO_ENTREGA;

alter table CARRINHO
   drop primary key;

drop table if exists CARRINHO;

alter table CARRINHO_PRODUTO
   drop primary key;

drop table if exists CARRINHO_PRODUTO;

alter table CATEGORIA
   drop primary key;

drop table if exists CATEGORIA;

alter table CLASSIFICACAO_USUARIO
   drop primary key;

drop table if exists CLASSIFICACAO_USUARIO;

alter table COMBO
   drop primary key;

drop table if exists COMBO;

alter table EMAIL
   drop primary key;

drop table if exists EMAIL;

alter table ENDERECO
   drop primary key;

drop table if exists ENDERECO;

alter table ESTOQUE
   drop primary key;

drop table if exists ESTOQUE;

alter table FORMA_PAGAMENTO
   drop primary key;

drop table if exists FORMA_PAGAMENTO;

alter table FORNECEDOR
   drop primary key;

drop table if exists FORNECEDOR;

alter table HISTORICO
   drop primary key;

drop table if exists HISTORICO;

alter table IMAGEM
   drop primary key;

drop table if exists IMAGEM;

alter table INDICACAO
   drop primary key;

drop table if exists INDICACAO;

alter table ITEM_PRODUTO
   drop primary key;

drop table if exists ITEM_PRODUTO;

alter table ITENCAO_PRODUTO
   drop primary key;

drop table if exists ITENCAO_PRODUTO;

alter table MENSAGEM
   drop primary key;

drop table if exists MENSAGEM;

alter table PAGAMENTO
   drop primary key;

drop table if exists PAGAMENTO;

alter table PEDIDO
   drop primary key;

drop table if exists PEDIDO;

alter table PONTOS
   drop primary key;

drop table if exists PONTOS;

alter table PONTOS_USUARIO
   drop primary key;

drop table if exists PONTOS_USUARIO;

alter table PRODUTO
   drop primary key;

drop table if exists PRODUTO;

alter table PRODUTO_FORNECEDOR
   drop primary key;

drop table if exists PRODUTO_FORNECEDOR;

alter table PRODUTO_ITEM_PRODUTO
   drop primary key;

drop table if exists PRODUTO_ITEM_PRODUTO;

alter table QUALIFICACAO_PRODUTO
   drop primary key;

drop table if exists QUALIFICACAO_PRODUTO;

alter table STATUS
   drop primary key;

drop table if exists STATUS;

alter table SUB_CATEGORIA
   drop primary key;

drop table if exists SUB_CATEGORIA;

alter table TIPO_ANDAMENTO_ENTREGA
   drop primary key;

drop table if exists TIPO_ANDAMENTO_ENTREGA;

alter table TIPO_TRANSPORTE
   drop primary key;

drop table if exists TIPO_TRANSPORTE;

alter table TRANSPORTADORA
   drop primary key;

drop table if exists TRANSPORTADORA;

alter table TRANSPORTADOR_TIPO_TRANSPORTE
   drop primary key;

drop table if exists TRANSPORTADOR_TIPO_TRANSPORTE;

alter table UF
   drop primary key;

drop table if exists UF;

alter table UNIDADE
   drop primary key;

drop table if exists UNIDADE;

alter table USUARIO
   drop primary key;

drop table if exists USUARIO;

alter table USUARIO_ALCADA
   drop primary key;

drop table if exists USUARIO_ALCADA;

/*==============================================================*/
/* Table: ALCADAS                                               */
/*==============================================================*/
create table ALCADAS
(
   ID_ALCADAS           smallint not null,
   ID_ALCADAS_PAI       smallint,
   SIGLA                char(3),
   DESCRICAO            varchar(300)
);

alter table ALCADAS
   add primary key (ID_ALCADAS);

/*==============================================================*/
/* Table: ANDAMENTO_ENTREGA                                     */
/*==============================================================*/
create table ANDAMENTO_ENTREGA
(
   ID_ANDAMENTO_ENTREGA smallint not null,
   ID_TIPO_ANDAMENTO_ENTREGA smallint,
   OBSERVACAO           varchar(200),
   COD_RASTREAMENTO     varchar(100)
);

alter table ANDAMENTO_ENTREGA
   add primary key (ID_ANDAMENTO_ENTREGA);

/*==============================================================*/
/* Table: CARRINHO                                              */
/*==============================================================*/
create table CARRINHO
(
   ID_CARRINHO          smallint not null,
   ID_USUARIO           smallint,
   ID_IMAGEM            smallint
);

alter table CARRINHO
   add primary key (ID_CARRINHO);

/*==============================================================*/
/* Table: CARRINHO_PRODUTO                                      */
/*==============================================================*/
create table CARRINHO_PRODUTO
(
   ID_CARRINHO          smallint not null,
   ID_PRODUTO           smallint not null,
   QUANTIDADE           smallint(6)
);

alter table CARRINHO_PRODUTO
   add primary key (ID_CARRINHO, ID_PRODUTO);

/*==============================================================*/
/* Table: CATEGORIA                                             */
/*==============================================================*/
create table CATEGORIA
(
   ID_CATEGORIA         smallint not null,
   DESCRICAO            varchar(200),
   ATIVO                boolean
);

alter table CATEGORIA
   add primary key (ID_CATEGORIA);

/*==============================================================*/
/* Table: CLASSIFICACAO_USUARIO                                 */
/*==============================================================*/
create table CLASSIFICACAO_USUARIO
(
   ID_CLASSIFICACAO_USUARIO smallint not null,
   SIGLA                varchar(4),
   DESCRICAO            varchar(200)
);

alter table CLASSIFICACAO_USUARIO
   add primary key (ID_CLASSIFICACAO_USUARIO);

/*==============================================================*/
/* Table: COMBO                                                 */
/*==============================================================*/
create table COMBO
(
   ID_COMBO             smallint not null,
   ID_PRODUTO           smallint,
   OBSERVACAO           varchar(300),
   ATIVO                boolean
);

alter table COMBO
   add primary key (ID_COMBO);

/*==============================================================*/
/* Table: EMAIL                                                 */
/*==============================================================*/
create table EMAIL
(
   ID_EMAIL             smallint not null,
   ID_USUARIO           smallint,
   EMAIL                varchar(100),
   ATIVO                boolean
);

alter table EMAIL
   add primary key (ID_EMAIL);

/*==============================================================*/
/* Table: ENDERECO                                              */
/*==============================================================*/
create table ENDERECO
(
   ID_ENDERECO          smallint not null,
   ID_UF                smallint,
   ID_USUARIO           smallint,
   DESCRICAO            varchar(300),
   COMPLEMENTO          varchar(100),
   CEP                  varchar(8),
   ENTREGA              boolean
);

alter table ENDERECO
   add primary key (ID_ENDERECO);

/*==============================================================*/
/* Table: ESTOQUE                                               */
/*==============================================================*/
create table ESTOQUE
(
   ID_ESTOQUE           smallint not null,
   VALOR_ENTRADA        double(12,2),
   DATA_ENTRADA         date,
   DATA_EXPIRACAO       date,
   QUANTIDADE           smallint,
   PREC_DESCONTO        float(4,2),
   ESTIMATIVA_VENDA     smallint
);

alter table ESTOQUE
   add primary key (ID_ESTOQUE);

/*==============================================================*/
/* Table: FORMA_PAGAMENTO                                       */
/*==============================================================*/
create table FORMA_PAGAMENTO
(
   ID_FORMA_PAGAMENTO   smallint not null,
   DESCRICAO            varchar(100)
);

alter table FORMA_PAGAMENTO
   add primary key (ID_FORMA_PAGAMENTO);

/*==============================================================*/
/* Table: FORNECEDOR                                            */
/*==============================================================*/
create table FORNECEDOR
(
   ID_FORNECEDOR        smallint not null,
   NOME_FANTASIA        varchar(200),
   CNPJ                 smallint(14),
   DESCRICAO            varchar(200),
   OBSERVACAO           varchar(300)
);

alter table FORNECEDOR
   add primary key (ID_FORNECEDOR);

/*==============================================================*/
/* Table: HISTORICO                                             */
/*==============================================================*/
create table HISTORICO
(
   ID_HISTORICO         smallint not null,
   ID_PEDIDO            smallint,
   OBSERVACAO           varchar(300)
);

alter table HISTORICO
   add primary key (ID_HISTORICO);

/*==============================================================*/
/* Table: IMAGEM                                                */
/*==============================================================*/
create table IMAGEM
(
   ID_IMAGEM            smallint not null,
   IMAGEM               blob,
   DESCRICAO            varchar(200)
);

alter table IMAGEM
   add primary key (ID_IMAGEM);

/*==============================================================*/
/* Table: INDICACAO                                             */
/*==============================================================*/
create table INDICACAO
(
   ID_INDICACAO         smallint not null,
   ID_USUARIO           smallint,
   ID_PRODUTO           smallint,
   ID_COMBO             smallint,
   ID_EMAIL             smallint,
   OBSERVACAO           varchar(300)
);

alter table INDICACAO
   add primary key (ID_INDICACAO);

/*==============================================================*/
/* Table: ITEM_PRODUTO                                          */
/*==============================================================*/
create table ITEM_PRODUTO
(
   ID_ITEM_PRODUTO      smallint not null,
   ID_UNIDADE           smallint,
   ID_IMAGEM            smallint,
   DESCRICAO            varchar(300),
   DATA_VENCIMENTO      date,
   VALOR                double(12,2)
);

alter table ITEM_PRODUTO
   add primary key (ID_ITEM_PRODUTO);

/*==============================================================*/
/* Table: ITENCAO_PRODUTO                                       */
/*==============================================================*/
create table ITENCAO_PRODUTO
(
   ID_INTENCAO_PRODUTO  smallint not null,
   ID_USUARIO           smallint,
   ID_PRODUTO           smallint
);

alter table ITENCAO_PRODUTO
   add primary key (ID_INTENCAO_PRODUTO);

/*==============================================================*/
/* Table: MENSAGEM                                              */
/*==============================================================*/
create table MENSAGEM
(
   ID_MENSAGEM          smallint not null,
   ID_USUARIO           smallint,
   DESCRICAO            varchar(300)
);

alter table MENSAGEM
   add primary key (ID_MENSAGEM);

/*==============================================================*/
/* Table: PAGAMENTO                                             */
/*==============================================================*/
create table PAGAMENTO
(
   ID_PAGAMENTO         smallint not null,
   ID_FORMA_PAGAMENTO   smallint,
   ID_IMAGEM            smallint,
   ID_PEDIDO            smallint,
   ID_STATUS            smallint
);

alter table PAGAMENTO
   add primary key (ID_PAGAMENTO);

/*==============================================================*/
/* Table: PEDIDO                                                */
/*==============================================================*/
create table PEDIDO
(
   ID_PEDIDO            smallint not null,
   ID_USUARIO           smallint,
   ID_TRANSPORTADORA    smallint,
   ID_CARRINHO          smallint,
   ID_ANDAMENTO_ENTREGA smallint,
   DATA_FINALIZACAO     datetime,
   VALOR_FRETE          float(5,2),
   VALOR_TOTAL          double(12,2),
   DATA_ABERTURA        datetime,
   DATA_ENTREGA         datetime,
   NUM_PEDIDO           varchar(100)
);

alter table PEDIDO
   add primary key (ID_PEDIDO);

/*==============================================================*/
/* Table: PONTOS                                                */
/*==============================================================*/
create table PONTOS
(
   ID_PONTOS            smallint not null,
   QTD_PONTOS_VALOR     float(4,2),
   QTD_PONTOS_PEDIDO    smallint,
   DESCRICAO            varchar(200),
   PEDIDO               boolean,
   VALOR                boolean
);

alter table PONTOS
   add primary key (ID_PONTOS);

/*==============================================================*/
/* Table: PONTOS_USUARIO                                        */
/*==============================================================*/
create table PONTOS_USUARIO
(
   ID_PONTOS_USUARIO    smallint not null,
   ID_PONTOS            smallint,
   ID_PEDIDO            smallint,
   QTD_PONTOS           smallint
);

alter table PONTOS_USUARIO
   add primary key (ID_PONTOS_USUARIO);

/*==============================================================*/
/* Table: PRODUTO                                               */
/*==============================================================*/
create table PRODUTO
(
   ID_PRODUTO           smallint not null,
   ID_UNIDADE           smallint,
   ID_IMAGEM            smallint,
   ID_CATEGORIA         smallint,
   ID_ESTOQUE           smallint,
   DESCRICAO            varchar(200),
   VALOR                double(12,2),
   ATIVO                boolean
);

alter table PRODUTO
   add primary key (ID_PRODUTO);

/*==============================================================*/
/* Table: PRODUTO_FORNECEDOR                                    */
/*==============================================================*/
create table PRODUTO_FORNECEDOR
(
   ID_PRODUTO_FORNECEDOR smallint not null,
   ID_PRODUTO           smallint,
   ID_FORNECEDOR        smallint,
   VALOR                double(12,2),
   PERC_DESCONTO        float(4,2),
   QTD_DESCONTO         smallint
);

alter table PRODUTO_FORNECEDOR
   add primary key (ID_PRODUTO_FORNECEDOR);

/*==============================================================*/
/* Table: PRODUTO_ITEM_PRODUTO                                  */
/*==============================================================*/
create table PRODUTO_ITEM_PRODUTO
(
   ID_ITEM_PRODUTO      smallint not null,
   ID_PRODUTO           smallint not null
);

alter table PRODUTO_ITEM_PRODUTO
   add primary key (ID_ITEM_PRODUTO, ID_PRODUTO);

/*==============================================================*/
/* Table: QUALIFICACAO_PRODUTO                                  */
/*==============================================================*/
create table QUALIFICACAO_PRODUTO
(
   ID_QUALIFICACAO_PRODUTO smallint not null,
   ID_USUARIO           smallint,
   ID_PRODUTO           smallint,
   QTD_ESTRELAS         smallint(5),
   OBSERVACAO           varchar(200)
);

alter table QUALIFICACAO_PRODUTO
   add primary key (ID_QUALIFICACAO_PRODUTO);

/*==============================================================*/
/* Table: STATUS                                                */
/*==============================================================*/
create table STATUS
(
   ID_STATUS            smallint not null,
   DESCRICAO            varchar(200)
);

alter table STATUS
   add primary key (ID_STATUS);

/*==============================================================*/
/* Table: SUB_CATEGORIA                                         */
/*==============================================================*/
create table SUB_CATEGORIA
(
   ID_SUB_CATEGORIA     smallint not null,
   ID_CATEGORIA         smallint,
   DESCRICAO            varchar(100)
);

alter table SUB_CATEGORIA
   add primary key (ID_SUB_CATEGORIA);

/*==============================================================*/
/* Table: TIPO_ANDAMENTO_ENTREGA                                */
/*==============================================================*/
create table TIPO_ANDAMENTO_ENTREGA
(
   ID_TIPO_ANDAMENTO_ENTREGA smallint not null,
   DESCRICAO            varchar(200)
);

alter table TIPO_ANDAMENTO_ENTREGA
   add primary key (ID_TIPO_ANDAMENTO_ENTREGA);

/*==============================================================*/
/* Table: TIPO_TRANSPORTE                                       */
/*==============================================================*/
create table TIPO_TRANSPORTE
(
   ID_TIPO_TRANSPORTE   smallint not null,
   ID_UNIDADE           smallint,
   DESCRICAO            varchar(200),
   SIGLA                char(2),
   VALOR_UNIDADE        float(4,2)
);

alter table TIPO_TRANSPORTE
   add primary key (ID_TIPO_TRANSPORTE);

/*==============================================================*/
/* Table: TRANSPORTADORA                                        */
/*==============================================================*/
create table TRANSPORTADORA
(
   ID_TRANSPORTADORA    smallint not null,
   ID_ENDERECO          smallint,
   NOME_FANTASIA        varchar(200),
   CNPJ                 varchar(14),
   DESCRICAO            varchar(200)
);

alter table TRANSPORTADORA
   add primary key (ID_TRANSPORTADORA);

/*==============================================================*/
/* Table: TRANSPORTADOR_TIPO_TRANSPORTE                         */
/*==============================================================*/
create table TRANSPORTADOR_TIPO_TRANSPORTE
(
   ID_TRANSPORTADORA    smallint not null,
   ID_TIPO_TRANSPORTE   smallint not null
);

alter table TRANSPORTADOR_TIPO_TRANSPORTE
   add primary key (ID_TRANSPORTADORA, ID_TIPO_TRANSPORTE);

/*==============================================================*/
/* Table: UF                                                    */
/*==============================================================*/
create table UF
(
   ID_UF                smallint not null,
   SIGLA                char(2)
);

alter table UF
   add primary key (ID_UF);

/*==============================================================*/
/* Table: UNIDADE                                               */
/*==============================================================*/
create table UNIDADE
(
   ID_UNIDADE           smallint not null,
   SIGLA                char(2),
   DESCRICAO            varchar(100),
   VALOR                smallint
);

alter table UNIDADE
   add primary key (ID_UNIDADE);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO
(
   ID_USUARIO           smallint not null,
   ID_CLASSIFICACAO_USUARIO smallint,
   ID_IMAGEM            smallint,
   NOME                 varchar(300),
   LOGIN                varchar(20),
   ATIVO                boolean,
   SENHA                varchar(20),
   CPF                  varchar(11),
   DATA_NASCIMENTO      date,
   QTD_PEDIDOS          smallint
);

alter table USUARIO comment 'Tabela com os usuários do sistema FlapRC.';

alter table USUARIO
   add primary key (ID_USUARIO);

/*==============================================================*/
/* Table: USUARIO_ALCADA                                        */
/*==============================================================*/
create table USUARIO_ALCADA
(
   ID_ALCADAS           smallint not null,
   ID_USUARIO           smallint not null
);

alter table USUARIO_ALCADA
   add primary key (ID_ALCADAS, ID_USUARIO);

alter table ALCADAS add constraint FK_REFERENCE_32 foreign key (ID_ALCADAS_PAI)
      references ALCADAS (ID_ALCADAS) on delete restrict on update restrict;

alter table ANDAMENTO_ENTREGA add constraint FK_REFERENCE_39 foreign key (ID_TIPO_ANDAMENTO_ENTREGA)
      references TIPO_ANDAMENTO_ENTREGA (ID_TIPO_ANDAMENTO_ENTREGA) on delete restrict on update restrict;

alter table CARRINHO add constraint FK_REFERENCE_48 foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO) on delete restrict on update restrict;

alter table CARRINHO add constraint FK_REFERENCE_49 foreign key (ID_IMAGEM)
      references IMAGEM (ID_IMAGEM) on delete restrict on update restrict;

alter table CARRINHO_PRODUTO add constraint FK_REFERENCE_46 foreign key (ID_CARRINHO)
      references CARRINHO (ID_CARRINHO) on delete restrict on update restrict;

alter table CARRINHO_PRODUTO add constraint FK_REFERENCE_47 foreign key (ID_PRODUTO)
      references PRODUTO (ID_PRODUTO) on delete restrict on update restrict;

alter table COMBO add constraint FK_REFERENCE_12 foreign key (ID_PRODUTO)
      references PRODUTO (ID_PRODUTO) on delete restrict on update restrict;

alter table EMAIL add constraint FK_REFERENCE_20 foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO) on delete restrict on update restrict;

alter table ENDERECO add constraint FK_REFERENCE_3 foreign key (ID_UF)
      references UF (ID_UF) on delete restrict on update restrict;

alter table ENDERECO add constraint FK_REFERENCE_4 foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO) on delete restrict on update restrict;

alter table HISTORICO add constraint FK_REFERENCE_31 foreign key (ID_PEDIDO)
      references PEDIDO (ID_PEDIDO) on delete restrict on update restrict;

alter table INDICACAO add constraint FK_REFERENCE_17 foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO) on delete restrict on update restrict;

alter table INDICACAO add constraint FK_REFERENCE_18 foreign key (ID_PRODUTO)
      references PRODUTO (ID_PRODUTO) on delete restrict on update restrict;

alter table INDICACAO add constraint FK_REFERENCE_19 foreign key (ID_COMBO)
      references COMBO (ID_COMBO) on delete restrict on update restrict;

alter table INDICACAO add constraint FK_REFERENCE_21 foreign key (ID_EMAIL)
      references EMAIL (ID_EMAIL) on delete restrict on update restrict;

alter table ITEM_PRODUTO add constraint FK_REFERENCE_5 foreign key (ID_UNIDADE)
      references UNIDADE (ID_UNIDADE) on delete restrict on update restrict;

alter table ITEM_PRODUTO add constraint FK_REFERENCE_6 foreign key (ID_IMAGEM)
      references IMAGEM (ID_IMAGEM) on delete restrict on update restrict;

alter table ITENCAO_PRODUTO add constraint FK_REFERENCE_22 foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO) on delete restrict on update restrict;

alter table ITENCAO_PRODUTO add constraint FK_REFERENCE_23 foreign key (ID_PRODUTO)
      references PRODUTO (ID_PRODUTO) on delete restrict on update restrict;

alter table MENSAGEM add constraint FK_REFERENCE_24 foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO) on delete restrict on update restrict;

alter table PAGAMENTO add constraint FK_REFERENCE_35 foreign key (ID_FORMA_PAGAMENTO)
      references FORMA_PAGAMENTO (ID_FORMA_PAGAMENTO) on delete restrict on update restrict;

alter table PAGAMENTO add constraint FK_REFERENCE_36 foreign key (ID_IMAGEM)
      references IMAGEM (ID_IMAGEM) on delete restrict on update restrict;

alter table PAGAMENTO add constraint FK_REFERENCE_37 foreign key (ID_PEDIDO)
      references PEDIDO (ID_PEDIDO) on delete restrict on update restrict;

alter table PAGAMENTO add constraint FK_REFERENCE_38 foreign key (ID_STATUS)
      references STATUS (ID_STATUS) on delete restrict on update restrict;

alter table PEDIDO add constraint FK_REFERENCE_27 foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO) on delete restrict on update restrict;

alter table PEDIDO add constraint FK_REFERENCE_28 foreign key (ID_TRANSPORTADORA)
      references TRANSPORTADORA (ID_TRANSPORTADORA) on delete restrict on update restrict;

alter table PEDIDO add constraint FK_REFERENCE_29 foreign key (ID_CARRINHO)
      references CARRINHO (ID_CARRINHO) on delete restrict on update restrict;

alter table PEDIDO add constraint FK_REFERENCE_30 foreign key (ID_ANDAMENTO_ENTREGA)
      references ANDAMENTO_ENTREGA (ID_ANDAMENTO_ENTREGA) on delete restrict on update restrict;

alter table PONTOS_USUARIO add constraint FK_REFERENCE_25 foreign key (ID_PONTOS)
      references PONTOS (ID_PONTOS) on delete restrict on update restrict;

alter table PONTOS_USUARIO add constraint FK_REFERENCE_26 foreign key (ID_PEDIDO)
      references PEDIDO (ID_PEDIDO) on delete restrict on update restrict;

alter table PRODUTO add constraint FK_REFERENCE_10 foreign key (ID_ESTOQUE)
      references ESTOQUE (ID_ESTOQUE) on delete restrict on update restrict;

alter table PRODUTO add constraint FK_REFERENCE_7 foreign key (ID_UNIDADE)
      references UNIDADE (ID_UNIDADE) on delete restrict on update restrict;

alter table PRODUTO add constraint FK_REFERENCE_8 foreign key (ID_IMAGEM)
      references IMAGEM (ID_IMAGEM) on delete restrict on update restrict;

alter table PRODUTO add constraint FK_REFERENCE_9 foreign key (ID_CATEGORIA)
      references CATEGORIA (ID_CATEGORIA) on delete restrict on update restrict;

alter table PRODUTO_FORNECEDOR add constraint FK_REFERENCE_13 foreign key (ID_PRODUTO)
      references PRODUTO (ID_PRODUTO) on delete restrict on update restrict;

alter table PRODUTO_FORNECEDOR add constraint FK_REFERENCE_14 foreign key (ID_FORNECEDOR)
      references FORNECEDOR (ID_FORNECEDOR) on delete restrict on update restrict;

alter table PRODUTO_ITEM_PRODUTO add constraint FK_REFERENCE_15 foreign key (ID_ITEM_PRODUTO)
      references ITEM_PRODUTO (ID_ITEM_PRODUTO) on delete restrict on update restrict;

alter table PRODUTO_ITEM_PRODUTO add constraint FK_REFERENCE_16 foreign key (ID_PRODUTO)
      references PRODUTO (ID_PRODUTO) on delete restrict on update restrict;

alter table QUALIFICACAO_PRODUTO add constraint FK_REFERENCE_40 foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO) on delete restrict on update restrict;

alter table QUALIFICACAO_PRODUTO add constraint FK_REFERENCE_41 foreign key (ID_PRODUTO)
      references PRODUTO (ID_PRODUTO) on delete restrict on update restrict;

alter table SUB_CATEGORIA add constraint FK_REFERENCE_11 foreign key (ID_CATEGORIA)
      references CATEGORIA (ID_CATEGORIA) on delete restrict on update restrict;

alter table TIPO_TRANSPORTE add constraint FK_REFERENCE_44 foreign key (ID_UNIDADE)
      references UNIDADE (ID_UNIDADE) on delete restrict on update restrict;

alter table TRANSPORTADORA add constraint FK_REFERENCE_45 foreign key (ID_ENDERECO)
      references ENDERECO (ID_ENDERECO) on delete restrict on update restrict;

alter table TRANSPORTADOR_TIPO_TRANSPORTE add constraint FK_REFERENCE_42 foreign key (ID_TRANSPORTADORA)
      references TRANSPORTADORA (ID_TRANSPORTADORA) on delete restrict on update restrict;

alter table TRANSPORTADOR_TIPO_TRANSPORTE add constraint FK_REFERENCE_43 foreign key (ID_TIPO_TRANSPORTE)
      references TIPO_TRANSPORTE (ID_TIPO_TRANSPORTE) on delete restrict on update restrict;

alter table USUARIO add constraint FK_REFERENCE_1 foreign key (ID_CLASSIFICACAO_USUARIO)
      references CLASSIFICACAO_USUARIO (ID_CLASSIFICACAO_USUARIO) on delete restrict on update restrict;

alter table USUARIO add constraint FK_REFERENCE_2 foreign key (ID_IMAGEM)
      references IMAGEM (ID_IMAGEM) on delete restrict on update restrict;

alter table USUARIO_ALCADA add constraint FK_REFERENCE_33 foreign key (ID_ALCADAS)
      references ALCADAS (ID_ALCADAS) on delete restrict on update restrict;

alter table USUARIO_ALCADA add constraint FK_REFERENCE_34 foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO) on delete restrict on update restrict;

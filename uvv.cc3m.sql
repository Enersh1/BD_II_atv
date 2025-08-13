CREATE DATABASE UVV_CC3M;

USE UVV_CC3M;

create table if not exists empresas (
	  empresa_id int primary key auto_increment,
    empresa_nome varchar(40) not null,
    empresa_tel varchar(20) not null,
    empresa_tipo tinyint not null, -- cliente(0), fornecedor(1) ou cliente E fornecedor(2)
    empresa_cnpj_cpf varchar(50) not null,
    empresa_rua varchar(50) not null,
    empresa_cidade varchar(50) not null,
    empresa_estado varchar(50) not null,
    empresa_bairro varchar(50) not null,
    empresa_cep varchar(50) not null,
    empresa_complemento varchar(50)
);

create table if not exists bancos (
	  banco_id int primary key auto_increment,
    banco_cod varchar(3) not null,
    banco_agencia varchar(50) not null,
    banco_saldo_conta decimal(7,2) not null
);

create table if not exists contas_receber (
    id_conta_rec int primary key auto_increment,
    rec_data_rec date not null,
    rec_data_venc date not null,
    id_banco int not null,
    id_empresa int not null,
    foreign key (id_banco) references bancos(id_banco), -- FK
    foreign key (id_empresa) references empresas(id_empresa) -- FK
);

create table if not exists contas_pagar (
	  id_pag int primary key auto_increment,
    pag_valor float not null,
    pag_data_pag date,
    id_empresa int not null,
    id_banco int not null,
    foreign key (id_empresa) references empresas(id_empresa), -- FK
    foreign key (id_banco) references bancos(id_banco) -- FK
);

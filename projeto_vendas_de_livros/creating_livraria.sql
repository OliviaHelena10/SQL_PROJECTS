CREATE DATABASE Livraria;

--  Livros_logico: 
USE Livraria;

CREATE TABLE Lojas_Filiais (
    cod_loja INTEGER PRIMARY KEY,
    loja_fone INTEGER,
    loja_endereco VARCHAR(80)
);

CREATE TABLE Livros (
    cod_livro INTEGER PRIMARY KEY,
    livro_genero VARCHAR(15),
    livro_autor VARCHAR(20),
    livro_titulo VARCHAR(50),
    livro_edicao INTEGER,
    livro_preco NUMERIC
);

CREATE TABLE Colaboradores (
    id_colaborador INTEGER PRIMARY KEY,
    colab_cpf INTEGER,
    colab_nome VARCHAR(50),
    colab_tel INTEGER,
    colab_dt_admissao DATE,
    colab_status VARCHAR(10)
);

CREATE TABLE Clientes (
    id_cliente INTEGER PRIMARY KEY,
    cliente_cpf INTEGER,
    cliente_nome VARCHAR(50),
    cliente_endereco VARCHAR(80)
);

CREATE TABLE Livro_Filial_disponibilizam (
    liv_fil_estoque INTEGER,
    fk_Livros_cod_livro INTEGER,
    fk_Lojas_Filiais_cod_loja INTEGER
);

CREATE TABLE Pedidos_Clientes_Livros_compram (
    cod_pedido INTEGER PRIMARY KEY,
    pedido_data DATE,
    pedido_valor NUMERIC,
    pedido_status VARCHAR(10),
    fk_Livros_cod_livro INTEGER,
    fk_Clientes_id_cliente INTEGER
);

CREATE TABLE trabalham_com (
    fk_Lojas_Filiais_cod_loja INTEGER,
    fk_Colaboradores_id_colaborador INTEGER
);
 
ALTER TABLE Livro_Filial_disponibilizam ADD CONSTRAINT FK_Livro_Filial_disponibilizam_1
    FOREIGN KEY (fk_Livros_cod_livro)
    REFERENCES Livros (cod_livro);
 
ALTER TABLE Livro_Filial_disponibilizam ADD CONSTRAINT FK_Livro_Filial_disponibilizam_2
    FOREIGN KEY (fk_Lojas_Filiais_cod_loja)
    REFERENCES Lojas_Filiais (cod_loja);
 
ALTER TABLE Pedidos_Clientes_Livros_compram ADD CONSTRAINT FK_Pedidos_Clientes_Livros_compram_2
    FOREIGN KEY (fk_Livros_cod_livro)
    REFERENCES Livros (cod_livro);
 
ALTER TABLE Pedidos_Clientes_Livros_compram ADD CONSTRAINT FK_Pedidos_Clientes_Livros_compram_3
    FOREIGN KEY (fk_Clientes_id_cliente)
    REFERENCES Clientes (id_cliente);
 
ALTER TABLE trabalham_com ADD CONSTRAINT FK_trabalham_com_1
    FOREIGN KEY (fk_Lojas_Filiais_cod_loja)
    REFERENCES Lojas_Filiais (cod_loja)
    ON DELETE SET NULL;
 
ALTER TABLE trabalham_com ADD CONSTRAINT FK_trabalham_com_2
    FOREIGN KEY (fk_Colaboradores_id_colaborador)
    REFERENCES Colaboradores (id_colaborador)
    ON DELETE SET NULL;
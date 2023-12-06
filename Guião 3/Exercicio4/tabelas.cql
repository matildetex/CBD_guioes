CREATE KEYSPACE inventario_papelaria WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 3};

CREATE TABLE Produtos(
    product_id UUID,
    product_name TEXT,
    product_description TEXT,
    stock_quantity INT,
    price DECIMAL,
    categorias SET<TEXT>,
    PRIMARY KEY ((product_name), stock_quantity)
)WITH CLUSTERING ORDER BY (stock_quantity ASC);

CREATE TABLE Fornecedores(
    fornecedor_id UUID,
    nome TEXT,
    contacto VARCHAR,
    lista_produtos SET<TEXT>,
    PRIMARY KEY(nome, fornecedor_id)
);

CREATE TABLE Vendas(
    venda_id UUID, 
    data TIMESTAMP,
    lista_vendidos MAP<TEXT, INT>,
    total_venda DECIMAL,
    PRIMARY KEY(venda_id, data)
)WITH CLUSTERING ORDER BY (data DESC);

CREATE TABLE Clientes(
    cliente_id UUID,
    nome TEXT,
    email TEXT,
    produtos_comprados LIST<TEXT>,
    PRIMARY KEY(nome, cliente_id)
);

CREATE TABLE ProdutosAEncomendar(
    product_id UUID,
    product_name TEXT,
    fornecedor_id UUID,
    fornecedor_name TEXT,
    contacto_fornecedor VARCHAR,
    quantity INT,
    PRIMARY KEY((contacto_fornecedor, fornecedor_name), product_id)
);

CREATE TABLE Devolucoes (
    devolucao_id UUID,
    client_name TEXT,
    product_id UUID,
    product_name TEXT,
    data_devolucao TIMESTAMP,
    motivo TEXT,
    PRIMARY KEY(product_name, data_devolucao)
)WITH CLUSTERING ORDER BY (data_devolucao DESC);


CREATE INDEX ON Produtos(categorias);
CREATE INDEX ON Fornecedores(lista_produtos);
CREATE INDEX ON Clientes(produtos_comprados);
CREATE INDEX ON Vendas(data);





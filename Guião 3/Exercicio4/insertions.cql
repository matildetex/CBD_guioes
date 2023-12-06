##INSERTIONS
##PRODUTOS
INSERT INTO Produtos (product_id, product_name, product_description, stock_quantity, price, categorias)
VALUES (uuid(), 'Caneta Azul', 'Caneta esferográfica azul de ponta fina', 100, 1.5, {'Escrita', 'Material Escolar'});

INSERT INTO Produtos (product_id, product_name, product_description, stock_quantity, price, categorias)
VALUES (uuid(), 'Bloco de Notas A5', 'Bloco de notas pautado, tamanho A5', 50, 3.0, {'Papelaria', 'Material Escolar'});

INSERT INTO Produtos (product_id, product_name, product_description, stock_quantity, price, categorias)
VALUES (uuid(), 'Lápis HB', 'Lápis grafite padrão HB', 200, 0.8, {'Escrita', 'Material Escolar'});

INSERT INTO Produtos (product_id, product_name, product_description, stock_quantity, price, categorias)
VALUES (uuid(), 'Marcadores Coloridos', 'Conjunto de marcadores coloridos', 80, 4.5, {'Material de Arte', 'Material Escolar'});

INSERT INTO Produtos (product_id, product_name, product_description, stock_quantity, price, categorias)
VALUES (uuid(), 'Fita Corretiva', 'Fita corretiva para correção de texto', 120, 2.2, {'Material de Escritório', 'Material Escolar'});

INSERT INTO Produtos (product_id, product_name, product_description, stock_quantity, price, categorias)
VALUES (uuid(), 'Tesoura Escolar', 'Tesoura de ponta redonda para uso escolar', 40, 3.8, {'Material de Arte', 'Material Escolar'});

INSERT INTO Produtos (product_id, product_name, product_description, stock_quantity, price, categorias)
VALUES (uuid(), 'Agenda 2024', 'Agenda semanal com capa dura', 30, 8.0, {'Material de Escritório', 'Organização'});

INSERT INTO Produtos (product_id, product_name, product_description, stock_quantity, price, categorias)
VALUES (uuid(), 'Borracha Branca', 'Borracha branca de qualidade', 150, 1.0, {'Material de Arte', 'Material Escolar'});

INSERT INTO Produtos (product_id, product_name, product_description, stock_quantity, price, categorias)
VALUES (uuid(), 'Grampo Metálico', 'Conjunto de grampos metálicos', 100, 1.5, {'Material de Escritório', 'Organização'});

INSERT INTO Produtos (product_id, product_name, product_description, stock_quantity, price, categorias)
VALUES (uuid(), 'Caneta Marca-Texto', 'Caneta marca-texto fluorescente', 60, 2.5, {'Escrita', 'Material Escolar'});

INSERT INTO Produtos (product_id, product_name, product_description, stock_quantity, price, categorias)
VALUES (uuid(), 'Pasta de Arquivo', 'Pasta de arquivo com elástico', 45, 4.0, {'Material de Escritório', 'Organização'});

INSERT INTO Produtos (product_id, product_name, product_description, stock_quantity, price, categorias)
VALUES (uuid(), 'Réguas Transparentes', 'Conjunto de réguas transparentes', 75, 3.5, {'Material de Arte', 'Material Escolar'});

##FORNECEDORES
INSERT INTO Fornecedores (fornecedor_id, nome, contacto, lista_produtos)
VALUES (uuid(), 'Papelaria Moderna', '123456789', {'Caneta Azul', 'Lápis HB', 'Bloco de Notas'});

INSERT INTO Fornecedores (fornecedor_id, nome, contacto, lista_produtos)
VALUES (uuid(), 'Suprimentos de Escritório Ltda.', '987654321', {'Marcadores Coloridos', 'Caderno Pautado', 'Tesoura Escolar'});

INSERT INTO Fornecedores (fornecedor_id, nome, contacto, lista_produtos)
VALUES (uuid(), 'Inova Papelaria', '111222333', {'Grampeador', 'Tesoura Escolar', 'Fita Adesiva'});

INSERT INTO Fornecedores (fornecedor_id, nome, contacto, lista_produtos)
VALUES (uuid(), 'Materiais Escolares S.A.', '444555666', {'Borracha', 'Post-its', 'Lapiseira'});

INSERT INTO Fornecedores (fornecedor_id, nome, contacto, lista_produtos)
VALUES (uuid(), 'Escritório Completo', '777888999', {'Agenda Anual', 'Borracha', 'Fita Adesiva'});

INSERT INTO Fornecedores (fornecedor_id, nome, contacto, lista_produtos)
VALUES (uuid(), 'Papel & Canetas Ltda.', '101112131', {'Lapiseira', 'Fita Adesiva', 'Lápis HB'});

INSERT INTO Fornecedores (fornecedor_id, nome, contacto, lista_produtos)
VALUES (uuid(), 'Papelaria Artística', '141516171', {'Tesoura Escolar', 'Caderno Pautado', 'Marcadores Coloridos'});

INSERT INTO Fornecedores (fornecedor_id, nome, contacto, lista_produtos)
VALUES (uuid(), 'Material Escolar Expresso', '181920212', {'Post-its', 'Borracha', 'Fita Adesiva'});

INSERT INTO Fornecedores (fornecedor_id, nome, contacto, lista_produtos)
VALUES (uuid(), 'Papel & Tinta', '222324252', {'Caneta Azul', 'Agenda Anual', 'Marcadores Coloridos'});

INSERT INTO Fornecedores (fornecedor_id, nome, contacto, lista_produtos)
VALUES (uuid(), 'Livraria e Papelaria Nacional', '262728293', {'Lapiseira', 'Agenda Anual', 'Borracha'});

##CLIENTES
INSERT INTO Clientes (cliente_id, nome, email, produtos_comprados)
VALUES (
    uuid(),
    'João Silva',
    'joao.silva@example.com',
    ['Canetas Gel', 'Pasta de Arquivo']
);

INSERT INTO Clientes (cliente_id, nome, email, produtos_comprados)
VALUES (
    uuid(),
    'Ana Oliveira',
    'ana.oliveira@example.com',
    ['Canetas Gel', 'Tesoura Ergonómica']
);

INSERT INTO Clientes (cliente_id, nome, email, produtos_comprados)
VALUES (
    uuid(),
    'Carlos Pereira',
    'carlos.pereira@example.com',
    ['Pasta de Arquivo']
);

INSERT INTO Clientes (cliente_id, nome, email, produtos_comprados)
VALUES (
    uuid(),
    'Marta Rodrigues',
    'marta.rodrigues@example.com',
    ['Tesoura Ergonómica']
);

INSERT INTO Clientes (cliente_id, nome, email, produtos_comprados)
VALUES (
    uuid(),
    'Pedro Sousa',
    'pedro.sousa@example.com',
    ['Calculadora Científica']
);

INSERT INTO Clientes (cliente_id, nome, email, produtos_comprados)
VALUES (
    uuid(),
    'Rita Pereira',
    'rita.pereira@example.com',
    ['Post-its', 'Canetas Gel']
);

INSERT INTO Clientes (cliente_id, nome, email, produtos_comprados)
VALUES (
    uuid(),
    'Hugo Costa',
    'hugo.costa@example.com',
    ['Mochila']
);

INSERT INTO Clientes (cliente_id, nome, email, produtos_comprados)
VALUES (
    uuid(),
    'Inês Oliveira',
    'ines.oliveira@example.com',
    ['Bloco de Notas']
);

INSERT INTO Clientes (cliente_id, nome, email, produtos_comprados)
VALUES (
    uuid(),
    'Luis Fernandes',
    'luis.fernandes@example.com',
    ['Agrafador', 'Bloco de Notas']
);


INSERT INTO Clientes (cliente_id, nome, email, produtos_comprados)
VALUES (
    uuid(),
    'Sofia Almeida',
    'sofia.almeida@example.com',
    ['Canetas Esferográficas']
);

##VENDAS
INSERT INTO Vendas (venda_id, data, lista_vendidos, total_venda)
VALUES (
    uuid(),
    '2023-12-01 14:30:00',
    {'Canetas Esferográficas': 10, 'Post-its': 5},
    25.50
);

INSERT INTO Vendas (venda_id, data, lista_vendidos, total_venda)
VALUES (
    uuid(),
    '2023-12-05 12:15:00',
    {'Bloco de Notas': 3, 'Agrafador': 2},
    18.75
);

INSERT INTO Vendas (venda_id, data, lista_vendidos, total_venda)
VALUES (
    uuid(),
    '2023-12-10 16:45:00',
    {'Mochila': 1, 'Canetas Gel': 2},
    42.90
);

INSERT INTO Vendas (venda_id, data, lista_vendidos, total_venda)
VALUES (
    uuid(),
    '2023-12-15 09:00:00',
    {'Post-its': 8, 'Bloco de Notas': 5},
    30.20
);

INSERT INTO Vendas (venda_id, data, lista_vendidos, total_venda)
VALUES (
    uuid(),
    '2023-12-20 11:30:00',
    {'Agrafador': 1, 'Canetas Esferográficas': 4},
    15.80
);

INSERT INTO Vendas (venda_id, data, lista_vendidos, total_venda)
VALUES (
    uuid(),
    '2023-12-25 14:30:00',
    {'Mochila': 2, 'Cadernos': 3},
    65.90
);

INSERT INTO Vendas (venda_id, data, lista_vendidos, total_venda)
VALUES (
    uuid(),
    '2023-12-28 10:15:00',
    {'Canetas Gel': 5, 'Bloco de Notas': 2},
    28.40
);

INSERT INTO Vendas (venda_id, data, lista_vendidos, total_venda)
VALUES (
    uuid(),
    '2024-01-02 16:45:00',
    {'Agrafador': 1, 'Canetas Esferográficas': 6},
    21.30
);

-- Inserção para a venda de 2024-01-05
INSERT INTO Vendas (venda_id, data, lista_vendidos, total_venda)
VALUES (
    uuid(),
    '2024-01-05 09:00:00',
    {'Mochila': 1, 'Cadernos': 4},
    49.80
);

INSERT INTO Vendas (venda_id, data, lista_vendidos, total_venda)
VALUES (
    uuid(),
    '2024-01-10 11:30:00',
    {'Canetas Gel': 3, 'Agrafador': 2},
    35.20
);

INSERT INTO Vendas (venda_id, data, lista_vendidos, total_venda)
VALUES (
    uuid(),
    '2024-01-15 14:30:00',
    {'Canetas Esferográficas': 7, 'Post-its': 3},
    19.90
);

##PRODUTOS A ENCOMENDAR
INSERT INTO ProdutosAEncomendar (product_id, product_name, fornecedor_id, fornecedor_name, contacto_fornecedor, quantity)
VALUES (uuid(), 'Lápis HB', uuid(), 'Blocos e Companhia', '123456789', 100);

INSERT INTO ProdutosAEncomendar (product_id, product_name, fornecedor_id, fornecedor_name, contacto_fornecedor, quantity)
VALUES (uuid(), 'Caneta Azul', uuid(), 'Navigator', '987654321', 50);

INSERT INTO ProdutosAEncomendar (product_id, product_name, fornecedor_id, fornecedor_name, contacto_fornecedor, quantity)
VALUES (uuid(), 'Borracha', uuid(), 'Papelaria Silva', '555666777', 200);

INSERT INTO ProdutosAEncomendar (product_id, product_name, fornecedor_id, fornecedor_name, contacto_fornecedor, quantity)
VALUES (uuid(), 'Caderno Pautado', uuid(), 'Blocos e Companhia', '123456789', 75);

INSERT INTO ProdutosAEncomendar (product_id, product_name, fornecedor_id, fornecedor_name, contacto_fornecedor, quantity)
VALUES (uuid(), 'Caneta Vermelha', uuid(), 'Navigator', '987654321', 30);

INSERT INTO ProdutosAEncomendar (product_id, product_name, fornecedor_id, fornecedor_name, contacto_fornecedor, quantity)
VALUES (uuid(), 'Post-its', uuid(), 'Papelaria Silva', '555666777', 150);

INSERT INTO ProdutosAEncomendar (product_id, product_name, fornecedor_id, fornecedor_name, contacto_fornecedor, quantity)
VALUES (uuid(), 'Marcadores Coloridos', uuid(), 'Blocos e Companhia', '123456789', 80);

INSERT INTO ProdutosAEncomendar (product_id, product_name, fornecedor_id, fornecedor_name, contacto_fornecedor, quantity)
VALUES (uuid(), 'Clips Metálicos', uuid(), 'Papelaria Silva', '555666777', 120);

INSERT INTO ProdutosAEncomendar (product_id, product_name, fornecedor_id, fornecedor_name, contacto_fornecedor, quantity)
VALUES (uuid(), 'Agenda 2024', uuid(), 'Navigator', '987654321', 40);

INSERT INTO ProdutosAEncomendar (product_id, product_name, fornecedor_id, fornecedor_name, contacto_fornecedor, quantity)
VALUES (uuid(), 'Tesoura de Papel', uuid(), 'Blocos e Companhia', '123456789', 25);

INSERT INTO ProdutosAEncomendar (product_id, product_name, fornecedor_id, fornecedor_name, contacto_fornecedor, quantity)
VALUES (uuid(), 'Canetas Gel', uuid(), 'Papelaria Silva', '555666777', 100);

INSERT INTO ProdutosAEncomendar (product_id, product_name, fornecedor_id, fornecedor_name, contacto_fornecedor, quantity)
VALUES (uuid(), 'Borrachas', uuid(), 'Blocos e Companhia', '123456789', 60);

##DEVOLUÇÕES
INSERT INTO Devolucoes (devolucao_id, client_name, product_id, product_name, data_devolucao, motivo)
VALUES (
    uuid(), 
    'João Silva', 
    60171c6e-7066-41fb-88f6-6da20d2bf6fa, 
    'Caneta Azul', 
    toTimestamp(now()), 
    'Defeito na tinta. Demasiado Azul.'
);

INSERT INTO Devolucoes (devolucao_id, client_name, product_id, product_name, data_devolucao, motivo)
VALUES (
    uuid(), 
    'Ana Oliveira', 
    e0384107-f162-4352-959b-02af35e4f2e2, 
    'Tesoura Escolar', 
    toTimestamp(now()), 
    'Não atendeu às expectativas'
);

INSERT INTO Devolucoes (devolucao_id, client_name, product_id, product_name, data_devolucao, motivo)
VALUES (
    uuid(), 
    'Carlos Pereira', 
    31ea80e3-a023-46ef-a93b-ea4419b03523, 
    'Pasta de Arquivo', 
    toTimestamp(now()), 
    'Produto danificado'
);

INSERT INTO Devolucoes (devolucao_id, client_name, product_id, product_name, data_devolucao, motivo)
VALUES (
    uuid(), 
    'Marta Rodrigues', 
    e0384107-f162-4352-959b-02af35e4f2e2, 
    'Tesoura Escolar', 
    toTimestamp(now()), 
    'Corta muito pouco.'
);

INSERT INTO Devolucoes (devolucao_id, client_name, product_id, product_name, data_devolucao, motivo)
VALUES (
    uuid(), 
    'Pedro Sousa', 
    2862c33c-9c76-4ef7-a065-6b8c7d96931e, 
    'Fita Corretiva', 
    toTimestamp(now()), 
    'Problema Técnico'
);

INSERT INTO Devolucoes (devolucao_id, client_name, product_id, product_name, data_devolucao, motivo)
VALUES (
    uuid(), 
    'Rita Pereira', 
    e0663536-cf24-4c46-a6e8-c92ff43e642e, 
    'Grampo Metálico', 
    toTimestamp(now()), 
    'Troca por defeito de fábrica'
);

INSERT INTO Devolucoes (devolucao_id, client_name, product_id, product_name, data_devolucao, motivo)
VALUES (
    uuid(), 
    'Hugo Costa', 
    28d2b153-4563-4ca5-bba6-8af8a18837bd, 
    'Agenda 2024', 
    toTimestamp(now()), 
    'Não gostei da cor'
);

INSERT INTO Devolucoes (devolucao_id, client_name, product_id, product_name, data_devolucao, motivo)
VALUES (
    uuid(), 
    'Inês Oliveira', 
    f1b51b08-22d5-4da8-8629-b597bc6d13c9, 
    'Bloco de Notas A5', 
    toTimestamp(now()), 
    'Troca por outro produto'
);

INSERT INTO Devolucoes (devolucao_id, client_name, product_id, product_name, data_devolucao, motivo)
VALUES (
    uuid(), 
    'Luis Fernandes', 
    e0663536-cf24-4c46-a6e8-c92ff43e642e,
    'Grampo Metálico', 
    toTimestamp(now()), 
    'Não atendeu às expectativas'
);

INSERT INTO Devolucoes (devolucao_id, client_name, product_id, product_name, data_devolucao, motivo)
VALUES (
    uuid(), 
    'Sofia Almeida', 
    a5495e9f-2d76-4c35-bbcc-eb5c2f014649, 
    'Caneta Marca-Texto', 
    toTimestamp(now()), 
    'Produto danificado'
);




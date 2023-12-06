#UPDATES########################################################################

UPDATE Produtos SET stock_quantity = 150 WHERE product_name = 'Caneta Azul' AND price=1.5;

UPDATE Produtos SET categorias = categorias + {'Escrita'} WHERE product_name = 'Borracha Branca' AND price=1.0;

UPDATE Clientes SET produtos_comprados = produtos_comprados - ['Canetas Gel'] WHERE nome = 'João Silva' AND cliente_id=2c7af612-47e2-46cd-afe3-8907386ce74a;

UPDATE Fornecedores SET lista_produtos = lista_produtos - {'Grampeador'} WHERE nome = 'Inova Papelaria' AND fornecedor_id = 6829af68-eb12-4aaa-8ebd-1e6ebf5c2d1a;

UPDATE Vendas SET lista_vendidos['Canetas Gel'] = 15 WHERE venda_id = b381b520-111c-416d-b182-46a2a1ed3a05 AND data = '2023-12-10 16:45:00.000000+0000';

##DELETES##########################################################################

DELETE FROM ProdutosAEncomendar WHERE contacto_fornecedor ='987654321' AND fornecedor_name='Navigator';

DELETE lista_produtos['Caderno Pautado'] FROM Fornecedores WHERE nome = 'Papelaria Artística' AND fornecedor_id = 58e4d2ca-6748-47cf-b5a7-a5e78f1347ae;

DELETE FROM Vendas WHERE venda_id = b381b520-111c-416d-b182-46a2a1ed3a05 AND data='2023-12-10 16:45:00.000000+0000';

DELETE produtos_comprados FROM Clientes WHERE nome = 'Ana Oliveira' AND cliente_id = 848d169a-b3b8-467b-9b4e-c8a7fdbfe2c6;

DELETE FROM Devolucoes WHERE devolucao_id=edf3a460-f284-47d3-96dd-66bbb3dcff19;





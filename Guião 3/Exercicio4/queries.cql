1.Listar Todos os Produtos de uma Categoria Específica
SELECT * FROM Produtos WHERE categorias CONTAINS 'Escrita';

 product_name       | price | categorias                                          | product_description                     | product_id                           | stock_quantity
--------------------+-------+-----------------------------------------------------+-----------------------------------------+--------------------------------------+----------------
           Lápis HB |   0.8 |                     {'Escrita', 'Material Escolar'} |                 Lápis grafite padrão HB | e791ac94-58a8-40a0-841c-72525c9a73d2 |            200
    Borracha Branca |   1.0 | {'Escrita', 'Material Escolar', 'Material de Arte'} |            Borracha branca de qualidade | 7c6eaf5b-00e1-48d5-98ac-1a3ef6f8fb24 |            150
 Caneta Marca-Texto |   2.5 |                     {'Escrita', 'Material Escolar'} |         Caneta marca-texto fluorescente | a5495e9f-2d76-4c35-bbcc-eb5c2f014649 |             60
        Caneta Azul |   1.5 |                     {'Escrita', 'Material Escolar'} | Caneta esferográfica azul de ponta fina | 60171c6e-7066-41fb-88f6-6da20d2bf6fa |            150

2. Ordenar todas as vendas com canetas esferográficas por ordem de venda decrescente.
SELECT * FROM Vendas WHERE lista_vendidos CONTAINS KEY 'Canetas Esferográficas' ALLOW FILTERING;

 venda_id                             | data                            | lista_vendidos                                | total_venda
--------------------------------------+---------------------------------+-----------------------------------------------+-------------
 ebcda8a6-3d5f-4fbd-99c0-d09bdb2858fc | 2024-01-15 14:30:00.000000+0000 |  {'Canetas Esferográficas': 7, 'Post-its': 3} |       19.90
 4b32f662-1d71-4712-bb22-f7df2541f90a | 2023-12-01 14:30:00.000000+0000 | {'Canetas Esferográficas': 10, 'Post-its': 5} |       25.50
 9bf6aea4-dd1b-4bff-b065-9bb22ba4319c | 2023-12-20 11:30:00.000000+0000 | {'Agrafador': 1, 'Canetas Esferográficas': 4} |       15.80
 02191cdc-2217-47b3-802c-ee76c519ec92 | 2024-01-15 14:30:00.000000+0000 |  {'Canetas Esferográficas': 7, 'Post-its': 3} |       19.90
 66267dfa-73a1-4f2c-b560-04b2fe5c83a1 | 2024-01-02 16:45:00.000000+0000 | {'Agrafador': 1, 'Canetas Esferográficas': 6} |       21.30
 bb407011-0ea1-4461-abb2-1034be91b2f8 | 2023-12-01 14:30:00.000000+0000 | {'Canetas Esferográficas': 10, 'Post-its': 5} |       25.50
 e2ce1cbc-a8a3-404a-8166-382cffd86b7d | 2024-01-02 16:45:00.000000+0000 | {'Agrafador': 1, 'Canetas Esferográficas': 6} |       21.30
 e1bf4619-a67b-40a0-b17a-90dd8f3b14de | 2023-12-20 11:30:00.000000+0000 | {'Agrafador': 1, 'Canetas Esferográficas': 4} |       15.80

3. Preço total de todos os produtos na Papelaria
SELECT SUM(price) AS total_price FROM Produtos;

 total_price
-------------
        36.3


4. Número de produtos comprados por cada cliente na loja;
SELECT nome, COUNT(produtos_comprados) AS numero_produtos_comprados
FROM Clientes
GROUP BY nome;

 nome            | numero_produtos_comprados
-----------------+---------------------------
     Pedro Sousa |                         1
  Carlos Pereira |                         1
      João Silva |                         1
    Rita Pereira |                         1
      Hugo Costa |                         1
  Luis Fernandes |                         1
   Inês Oliveira |                         1
    Ana Oliveira |                         0
 Marta Rodrigues |                         1
   Sofia Almeida |                         1

5. Total da venda dos produtos
SELECT SUM(total_venda) AS Total_Venda FROM Vendas;

 total_venda
-------------
      353.65

6. Apenas 2 dos fornecedores de um produto específico;
SELECT * FROM Fornecedores WHERE lista_produtos CONTAINS 'Agenda Anual' LIMIT 2;

 nome                          | fornecedor_id                        | contacto  | lista_produtos
-------------------------------+--------------------------------------+-----------+----------------------------------------------
           Escritório Completo | 2d95e9a6-bd6b-46e1-b3b2-483d143ce135 | 777888999 | {'Agenda Anual', 'Borracha', 'Fita Adesiva'}
 Livraria e Papelaria Nacional | 1e52161c-4dcb-4515-9ef9-493c5e57f7c3 | 262728293 |    {'Agenda Anual', 'Borracha', 'Lapiseira'}

7. Todos os clientes que compraram um produto específico
SELECT * FROM Clientes WHERE produtos_comprados CONTAINS 'Bloco de Notas';

 nome           | cliente_id                           | email                      | produtos_comprados
----------------+--------------------------------------+----------------------------+---------------------------------
 Luis Fernandes | 461dd5bb-ef64-4060-82aa-185756665f50 | luis.fernandes@example.com | ['Agrafador', 'Bloco de Notas']
  Inês Oliveira | 28977f3c-fd4c-4912-b472-72d8976cd095 |  ines.oliveira@example.com |              ['Bloco de Notas']

8. Reclamações por Artigo
SELECT     product_name,     COUNT(*) AS total_devolucoes FROM     Devolucoes GROUP BY     product_name;

 product_name       | total_devolucoes
--------------------+------------------
    Grampo Metálico |                2
        Agenda 2024 |                1
    Tesoura Escolar |                2
 Caneta Marca-Texto |                1
   Pasta de Arquivo |                1
        Caneta Azul |                1
  Bloco de Notas A5 |                1
     Fita Corretiva |                1

9. Produtos em baixo stock (menos de 50 unidades):
SELECT * FROM Produtos WHERE stock_quantity < 50 ALLOW FILTERING;

 product_name     | stock_quantity | categorias                                | price | product_description                       | product_id
------------------+----------------+-------------------------------------------+-------+-------------------------------------------+--------------------------------------
      Agenda 2024 |             30 | {'Material de Escritório', 'Organização'} |   8.0 |              Agenda semanal com capa dura | 7b656e79-2ca0-4e43-bca0-7c82e317a097
  Tesoura Escolar |             40 |  {'Material Escolar', 'Material de Arte'} |   3.8 | Tesoura de ponta redonda para uso escolar | d5657fb1-6367-41dd-9ac3-387d530ef57c
 Pasta de Arquivo |             45 | {'Material de Escritório', 'Organização'} |   4.0 |             Pasta de arquivo com elástico | a8d6c21c-e327-45a6-8b77-575d9dd043cc

10. Total de vendas num determinado mês:
SELECT * FROM Vendas WHERE data>'2023-12-01 00:00:00.000000+0000' AND data<'2023-12-31 23:59:59.000000+0000' ALLOW FILTERING;

 venda_id                             | data                            | lista_vendidos                                | total_venda
--------------------------------------+---------------------------------+-----------------------------------------------+-------------
 c0449241-a682-4fe7-ab10-d3a0ca0f1854 | 2023-12-28 10:15:00.000000+0000 |       {'Bloco de Notas': 2, 'Canetas Gel': 5} |       28.40
 4e3bf6a7-2e6d-4d6b-867c-ba3288fe5f6c | 2023-12-10 16:45:00.000000+0000 |              {'Canetas Gel': 2, 'Mochila': 1} |       42.90
 4b32f662-1d71-4712-bb22-f7df2541f90a | 2023-12-01 14:30:00.000000+0000 | {'Canetas Esferográficas': 10, 'Post-its': 5} |       25.50
 9bf6aea4-dd1b-4bff-b065-9bb22ba4319c | 2023-12-20 11:30:00.000000+0000 | {'Agrafador': 1, 'Canetas Esferográficas': 4} |       15.80
 2b5d25d5-0b04-483f-9891-00061f88eb9e | 2023-12-05 12:15:00.000000+0000 |         {'Agrafador': 2, 'Bloco de Notas': 3} |       18.75
 19dc2a77-5046-4a08-8865-5515e53ffeaf | 2023-12-15 09:00:00.000000+0000 |          {'Bloco de Notas': 5, 'Post-its': 8} |       30.20
 110e7302-ea05-4f4d-9599-1c29f8df8fb3 | 2023-12-25 14:30:00.000000+0000 |                 {'Cadernos': 3, 'Mochila': 2} |       65.90
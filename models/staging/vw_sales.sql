/*
UTILIZANDO SOURCE DW_VENDAS E CORRIGINDO OS CAMPOS NUMERICOS,
CODIGO DO CLIENTE E
SUBSTITUINDO NOME DO CLIENTE POR UM ID 
*/

SELECT 
  cl.N_CLIENTE                             AS ID 
, sa.CLIENTE                               AS CLIENTE
, cl.COD_CLIENTE        
, sa.COD_POSTAL                    
, sa.COD_DOC                       
, sa.NO_INTERNO_DOC                        AS NO_DOC
, CONVERT(DATE, sa.DATA)                   AS DATA  
, CONVERT(NUMERIC(18,2) , sa.VALOR)        AS VALOR_VENDA
, sa.COD_ARTIGO
, CONVERT(INT, FLOOR(sa.QUANTIDADE_VENDA)) AS QTT
FROM {{source('sources', 'fact_vendas')}} sa
LEFT JOIN {{source('sources', 'dim_cliente')}} cl   ON sa.CLIENTE = cl.NOME

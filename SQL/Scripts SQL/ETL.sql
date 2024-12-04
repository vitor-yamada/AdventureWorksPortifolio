USE AdventureWorksDW2022

-- Estrutura das tabelas 
SELECT 
	TABLE_NAME
	,COLUMN_NAME
	,DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME IN ('DimProduct', 'DimProductSubcategory', 'DimProductCategory', 'FactInternetSales')

-- Volume de dados
SELECT 
'DimProduct' AS TABLE_NAME, COUNT(*) AS CONTAGEM FROM DimProduct
UNION ALL
SELECT 'DimProductSubcategory', COUNT(*) FROM DimProductSubcategory
UNION ALL
SELECT 'DimProductCategory', COUNT(*) FROM DimProductCategory
UNION ALL
SELECT 'FactInternetSales', COUNT(*) FROM FactInternetSales

-- Verificar valores ausentes ou inconsistentes nas tabelas dimensões
SELECT * 
FROM DimProduct
WHERE EnglishProductName IS NULL OR ProductSubcategoryKey IS NULL

SELECT * 
FROM DimProductSubcategory
WHERE ProductSubcategoryKey IS NULL OR EnglishProductSubcategoryName IS NULL 

SELECT * 
FROM DimProductCategory
WHERE ProductCategoryKey IS NULL OR EnglishProductCategoryName IS NULL

-- Verificar duplicatas em chaves únicas
SELECT 
	ProductKey
	,COUNT(*) 
FROM DimProduct
GROUP BY ProductKey
HAVING COUNT(*) > 1

-- Distribuição de vendas ao longo do tempo
SELECT
	YEAR (fs.OrderDate) as Ano
	,SUM (fs.SalesAmount) as Faturamento
FROM FactInternetSales fs
GROUP BY YEAR (fs.OrderDate)
ORDER BY Ano

-- Verificar os registros de venda mais antigos e mais recentes
SELECT
	MIN (OrderDate) AS DataMaisAntiga
	,MAX (OrderDate) AS DataMaisRecente
FROM FactInternetSales

-- Excluir registros na tabela FactInternetSalesReason
DELETE FROM [AdventureWorksDW2022].[dbo].[FactInternetSalesReason]
WHERE SalesOrderNumber IN (
	SELECT SalesOrderNumber
	FROM [AdventureWorksDW2022].[dbo].[FactInternetSales]
	WHERE YEAR(OrderDate) < 2011 or YEAR(OrderDate) > 2013

-- Excluir registros de 2010 e 2014
DELETE FROM [AdventureWorksDW2022].[dbo].[FactInternetSales]
WHERE YEAR(OrderDate) < 2011 or YEAR(OrderDate) > 2013

-- Validar se os registros foram excluidos
SELECT
	MIN (OrderDate) AS DataMaisAntiga
	,MAX (OrderDate) AS DataMaisRecente
FROM FactInternetSales

-- Identificar valores nulos em chaves estrangeiras na tabela FactInternetSales
SELECT 
    SUM(CASE WHEN ProductKey IS NULL THEN 1 ELSE 0 END) AS ProductKey_Null
   ,SUM(CASE WHEN OrderDateKey IS NULL THEN 1 ELSE 0 END) AS OrderDateKey_Null
   ,SUM(CASE WHEN DueDateKey IS NULL THEN 1 ELSE 0 END) AS DueDateKey_Null
   ,SUM(CASE WHEN ShipDateKey IS NULL THEN 1 ELSE 0 END) AS ShipDateKey_Null
   ,SUM(CASE WHEN CustomerKey IS NULL THEN 1 ELSE 0 END) AS CustomerKey_Null
   ,SUM(CASE WHEN PromotionKey IS NULL THEN 1 ELSE 0 END) AS PromotionKey_Null
   ,SUM(CASE WHEN CurrencyKey IS NULL THEN 1 ELSE 0 END) AS CurrencyKey_Null
   ,SUM(CASE WHEN SalesTerritoryKey IS NULL THEN 1 ELSE 0 END) AS SalesTerritoryKey_Null
FROM 
    FactInternetSales

--Identificar valores nulos em chaves estrangeiras na tabela DimProduct
SELECT 
    SUM(CASE WHEN ProductKey IS NULL THEN 1 ELSE 0 END) AS ProductKey_Null
   ,SUM(CASE WHEN ProductSubcategoryKey IS NULL THEN 1 ELSE 0 END) AS ProductSubcategoryKey_Null
FROM 
    DimProduct;

-- Validação se todos os produtos têm subcategorias e categorias associadas:
SELECT 
	p.ProductKey
	,p.EnglishProductName
	,s.ProductSubcategoryKey
	,c.ProductCategoryKey
FROM DimProduct p
LEFT JOIN DimProductSubcategory s ON p.ProductSubcategoryKey = s.ProductSubcategoryKey
LEFT JOIN DimProductCategory c ON s.ProductCategoryKey = c.ProductCategoryKey
WHERE s.ProductSubcategoryKey IS NULL OR c.ProductCategoryKey IS NULL
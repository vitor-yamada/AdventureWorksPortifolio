USE AdventureWorksDW2022

-- Avaliar a distribuição dos produtos em subcategorias
SELECT 
	s.EnglishProductSubcategoryName
	,COUNT(p.ProductKey) AS Contagem
FROM DimProduct p
INNER JOIN DimProductSubcategory s ON p.ProductSubcategoryKey = s.ProductSubcategoryKey
GROUP BY s.EnglishProductSubcategoryName

-- Produtos com maior volume de vendas
SELECT TOP 10 
	p.EnglishProductName AS Produto
	,SUM(fs.OrderQuantity) AS QtdeTotal
FROM FactInternetSales fs
INNER JOIN DimProduct p ON fs.ProductKey = p.ProductKey
GROUP BY p.EnglishProductName
ORDER BY QtdeTotal DESC

-- Produtos com maior faturamento
SELECT TOP 10 
	p.EnglishProductName AS Produto
	,SUM(fs.SalesAmount) AS Faturamento
FROM FactInternetSales fs
INNER JOIN DimProduct p ON fs.ProductKey = p.ProductKey
GROUP BY p.EnglishProductName
ORDER BY Faturamento DESC

-- Faturamento por subcategoria e categoria
SELECT 
	c.EnglishProductCategoryName AS Categoria
	,s.EnglishProductSubcategoryName AS Subcategoria
	,SUM(fs.SalesAmount) AS Faturamento
FROM FactInternetSales fs
INNER JOIN DimProduct p ON fs.ProductKey = p.ProductKey
INNER JOIN DimProductSubcategory s ON p.ProductSubcategoryKey = s.ProductSubcategoryKey
INNER JOIN DimProductCategory c ON s.ProductCategoryKey = c.ProductCategoryKey
GROUP BY c.EnglishProductCategoryName, s.EnglishProductSubcategoryName
ORDER BY Faturamento DESC

-- Preço mínimo, máximo e média de produtos vendidos
SELECT 
	MIN(UnitPrice) AS Mínimo
	,MAX(UnitPrice) AS Máximo
	,AVG(UnitPrice) AS Média
FROM FactInternetSales;

-- Número de produtos distintos 
SELECT 
    COUNT(DISTINCT ProductKey) AS ContagemProdutosDistintos
FROM 
    DimProduct;

-- Número de produtos distintos vendidos
SELECT 
    COUNT(DISTINCT ProductKey) AS ContagemProdutosDistintosVendidos
FROM 
    FactInternetSales;

-- Produtos mais vendidos em cada país com base na quantidade total de pedidos

WITH VendasProdutosQuantidade (País, Produto, QuantidadeTotal)
AS 
(
	SELECT 
		t.SalesTerritoryCountry AS País,
		p.EnglishProductName AS Produto,
		SUM(fs.OrderQuantity) AS QuantidadeTotal
	FROM 
		FactInternetSales fs
	INNER JOIN 
		DimSalesTerritory t ON fs.SalesTerritoryKey = t.SalesTerritoryKey
	INNER JOIN 
		DimProduct p ON fs.ProductKey = p.ProductKey
	GROUP BY 
		t.SalesTerritoryCountry, p.EnglishProductName
)

SELECT 
    País,
    Produto,
    QuantidadeTotal
FROM 
    VendasProdutosQuantidade
WHERE 
    QuantidadeTotal = 
		(
		SELECT 
			MAX(QuantidadeTotal)
		FROM 
			VendasProdutosQuantidade ps2
		WHERE 
			ps2.País = VendasProdutosQuantidade.País
		)
ORDER BY 
    QuantidadeTotal DESC;


-- Produtos mais vendidos em cada país com base no faturamento total

WITH VendasProdutosQuantidade (País, Produto, FaturamentoTotal)
AS 
(
	SELECT 
		t.SalesTerritoryCountry AS País,
		p.EnglishProductName AS Produto,
		SUM(fs.SalesAmount) AS FaturamentoTotal
	FROM 
		FactInternetSales fs
	INNER JOIN 
		DimSalesTerritory t ON fs.SalesTerritoryKey = t.SalesTerritoryKey
	INNER JOIN 
		DimProduct p ON fs.ProductKey = p.ProductKey
	GROUP BY 
		t.SalesTerritoryCountry, p.EnglishProductName
)

SELECT 
    País,
    Produto,
    FaturamentoTotal
FROM 
    VendasProdutosQuantidade
WHERE 
    FaturamentoTotal = 
		(
		SELECT 
			MAX(FaturamentoTotal)
		FROM 
			VendasProdutosQuantidade ps2
		WHERE 
			ps2.País = VendasProdutosQuantidade.País
		)
ORDER BY 
    FaturamentoTotal DESC
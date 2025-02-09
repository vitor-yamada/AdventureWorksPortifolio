# Análise de Produtos de E-commerce: AdventureWorks22
O banco de dados AdventureWorksDW2022 oferece um ótimo cenário para análises estratégicas e financeiras, como por exemplo análise temporal de vendas, desempenho de produtos, análise geográfica e métricas financeiras. Ele simula um ambiente corporativo com dados de uma empresa fictícia chamada Adventure Works, que opera no setor de vendas de produtos, com foco em canais de e-commerce e operações globais.<br>

Com isso, o objetivo deste projeto é realizar uma análise exploratória dos dados utilizando as ferramentas Microsoft SQL Server e Microsoft Power BI, envolvendo etapas de: Coleta e entendimento dos dados, limpeza e tratamento dos dados, criação de um modelo de dados e, posteriormente, construção de relatórios financeiros no Power BI, oferecendo insights estratégicos sobre vendas e, principalmente, desempenho de produtos.
<br> <br>
<img align="center" width="800"  src="https://github.com/vitor-yamada/AdventureWorksPortifolio/blob/main/Design/CAPA.png">
<br><br>

## Metodologias e Ferramentas
- **Microsoft SQL Server:** Foi utilizado como a plataforma principal para armazenamento, gerenciamento e preparação dos dados. A etapa de análise exploratória incluiu a identificação de tabelas e colunas relevantes, bem como a verificação de consistência e qualidade dos dados. Posteriormente, foi implementado um processo de ETL (Extração, Transformação e Carregamento), ajustando e otimizando os dados para o uso em relatórios no Power BI. <br> 

- **Microsoft Power BI:** Após a preparação dos dados no SQL Server, o Power BI foi utilizado para importação, modelagem e visualização dos dados. Com o auxílio do Power Query e da linguagem M, os dados foram tratados e otimizados para garantir um modelo eficiente e bem estruturado. Em seguida, foram criadas medidas personalizadas utilizando a linguagem DAX para cálculos específicos, como análises temporais. Por fim, foi desenvolvido um dashboard interativo, com foco em indicadores financeiro e desempenho de produtois, para facilitar a interpretação e a tomada de decisões estratégicas. <br>

## Estrutura das Tabelas de Venda
Nesta etapa, foi realizada uma análise exploratória da estrutura do banco de dados no softwarte **SQL SERVER**, com o objetivo de compreender as tabelas e os relacionamentos que compõem o modelo de dados. O banco AdventureWorksDW2022 apresenta duas tabelas fato principais: FactInternetSales e FactResellerSales. Ambas são fontes de dados para análises de vendas, porém com focos distintos. <br> 

- **FactInternetSales:** Contém informações relacionadas às vendas realizadas através do canal de e-commerce da empresa Adventure Works. <br> 

- **FactResellerSales:** Esta tabela armazena dados de vendas realizadas através de revendedores (resellers). Inclui informações semelhantes à tabela FactInternetSales, mas voltadas para canais B2B (business-to-business). <br>

Para este projeto, optou-se por focar nas análises baseadas na tabela **FactInternetSales**, uma vez que ela é mais indicada para explorar os indicadores financeiros associados às vendas online.<br>

## Coleta e Entendimento dos Dados
<img align="right" width="500"  src="https://github.com/vitor-yamada/AdventureWorksPortifolio/blob/main/Imagens/script%20sql%20etl.png">
Após a investigação da estrutura da tabela fato, seguimos para uma maior compreensão dos dados para posterior limpeza e tratamento, a fim de remover ou tratar valores nulos, duplicatas e inconsistências. <br> <br>

Nesta etapa o objetivo foi compreender a estrutura e os dados presentes nas tabelas que compõem o banco de dados. 
Após identificar a tabela de vendas, desenvolvemos os scripts em SQL para explorar os dados e extrair algumas informações essenciais durante a análise exploratória de dados. Como por exemplo: <br> <br>

- Estrutura das tabelas fato e dimensão (índices, chaves e relacionamentos);<br>
- Volume de dados;<br>
- Verificar valores ausentes ou inconsistentes;<br>
- Distribuição de vendas ao longo do tempo;<br>
- Registros mais antigos e mais recentes.<br> <br>

Através destas informações, foi possível identificar algumas inconsistências que deverão passar pelo processo de limpeza e tratamento. <br>

<a href="https://github.com/vitor-yamada/AdventureWorksPortifolio/blob/main/SQL/Scripts%20SQL/ETL.sql" target="_blank">Clique aqui</a> e acesse o script SQL no GitHub 
<br><br>

## Limpeza dos Dados
**1) Registros Incompletos de Venda** <br> <br>
Após analisar a distribuição de vendas ao longo dos anos, foi identificado períodos com uma redução nas vendas, especificamente em 2010 e 2014. Esses resultados indicam possíveis lacunas nos dados. Para garantir a consistência das análises futuras para este projeto, optamos por excluir os registros desses dois anos, mantendo apenas os anos com dados completos: 2011, 2012 e 2013. <br>

Vale ressaltar que, a abordagem adotada nesta situação foi a remoção permanente, diretamente no banco de dados, dos registros correspondentes aos anos com dados incompletos. Porém, antes de executar essa ação, é fundamental garantir que a exclusão desses dados não irá comprometer o projeto ou outras análises relacionadas. <br> <br>

**2) Registros com Valores Nulos** <br> <br>
Foi verificado que o campo 'ProductSubcategoryKey' possui 209 registros com valores nulos. Para este caso específico, neste projeto foi optado por realizar o tratamento dos valores nulos do campo 'ProductSubcategoryKey' diretamente no Power Query. <br>

Como dito anteriormente, existem diferentes abordagens que devem considerar os requisitos do projeto e a preservação da integridade do banco de dados. 
<br>

<a href="https://github.com/vitor-yamada/AdventureWorksPortifolio/blob/main/SQL/Scripts%20SQL/ETL.sql" target="_blank">Clique aqui</a> e acesse o script SQL no GitHub 
<br><br>


## Análise Exploratória dos dados
<img align="right" width="500"  src="https://github.com/vitor-yamada/AdventureWorksPortifolio/blob/main/Imagens/script%20sql%20analise%20exploratoria.png">
Após uma compreensão da estrutra das tabelas e campos, identificação de relacionamentos e chaves estrangeiras e limpeza e tratamento dos dados, esta etapa teve como objetivo desenvolver scripts em SQL para explorar os dados e extrair os primeiros insights durante a análise exploratória de dados. Como por exemplo: <br><br>

- Produtos com maior faturamento; <br>
- Produtos com maior volume de vendas; <br>
- Faturamento por subcategoria e categoria;<br>
- Preço mínimo, máximo e média de produtos vendidos; <br>
- Distribuição dos produtos em subcategorias e categorias; <br>
- Faturamento por subcategoria e categoria;<br>
- Ticket Médio; <br>
- Número de produtos distintos vendidos;<br>
- Produtos mais vendidos por páis; <br>
<br><br>

<a href="https://github.com/vitor-yamada/AdventureWorksPortifolio/blob/main/SQL/Scripts%20SQL/An%C3%A1lise%20Explorat%C3%B3ria%20Produtos.sql" target="_blank">Clique aqui</a> e acesse o script SQL no GitHub 

<br><br><br><br><br>


## Importação dos Dados: Power BI
Após concluir as etapas de análise, limpeza e preparação dos dados no SQL Server, as tabelas pertinentes foram importadas diretamente para o Power BI, através da opção de conexão ao banco de dados SQL Server, fornecendo o endereço do servidor e o nome do banco de dados AdventureWorksDW2022. <br>

Foram selecionadas as seguintes tabelas para o projeto: <br>

- FactInternetSales;
- DimProduct;
- DimProductSubcategory;
- DimProductCategory;
- DimSalesTerritory;
<br> <br>

## Transformações com Power Query
Após a importação dos dados, utilizou-se o Power Query para aplicar algumas transformações adicionais: <br>

- **Remoção de Colunas Desnecessárias:** Foram eliminadas colunas que não eram relevantes para a análise, simplificando o modelo de dados;<br>

- **Verificação e Ajuste de Tipos de Dados:** Os tipos de dados das colunas foram revisados e ajustados para garantir consistência nas análises;<br>

- **Aplicação de Filtro em Valores Nulos no Campo ProductSubcategoryKey da Tabela DimProduct:** Foi aplicado um filtro para remover registros com valores nulos no campo ProductSubcategoryKey, assegurando a integridade e a qualidade das análises baseadas em produtos e suas subcategorias.<br><br>

## Tabela Dimensão Calendário
Com base nos registros de venda da tabela 'FactInternetSales', foi construída uma tabela dimensão calendário diretamente no Power Query. Para isso, utilizou-se parâmetros de data mínima e data máxima provenientes da tabela fato e as seguintes funções na linguagem M: <br>

- **Duration.Days:** Para calcular a quantidade total de dias entre a data mínima e a data <br>

- **List.Dates:** Para gerar uma lista de datas contínuas dentro do intervalo calculado <br>

Como resultado, foi criada uma tabela contendo uma coluna chamada 'Date', que abrange todas as datas entre a data mínima e a data máxima dos registros de venda. Após gerar a coluna 'Date', foram utilizados os recursos nativos do Power Query para adicionar novas colunas baseadas na data.

## Modelo de Dados
Após a importação e tratamentos, os relacionamentos entre as tabelas foram realizados no Power BI, replicando o modelo de dados do SQL Server. Chaves primárias e estrangeiras foram revisadas para garantir integridade e funcionalidade nos relatórios. <br>

<img align="centre" width="800"  src="https://github.com/vitor-yamada/AdventureWorksPortifolio/blob/main/Imagens/modelo%20de%20dados.png">

Com os dados importados e modelados no Power BI, o próximo passo foi a criação de medidas personalizadas com DAX e a construção de visualizações interativas focadas nos objetivos do projeto, como análises de vendas, tendências temporais e desempenho de produtos. 

## Medidas
Abaixo, uma lista com as principais medidas criadas: <br>

- **Receita Total:** Soma o valor total das vendas ('SalesAmount') na tabela 'FactInternetSales'. Representa a receita gerada pela empresa com base nas vendas realizadas.<br>

- **Custo Total:** Soma o custo total dos produtos vendidos ('TotalProductCost'). Permite analisar o valor total dos custos associados às vendas realizadas.<br>

- **Lucro Bruto:** Calcula a diferença entre a receita total e o custo total. Representa o lucro bruto gerado pelas vendas antes de outras deduções, como despesas operacionais e impostos.<br>

- **Margem Bruta:** Calcula a margem bruta, representada pela razão entre o lucro bruto e a receita total. Essa métrica expressa a lucratividade das vendas como uma porcentagem.<br>

- **Sales Last Month (LM):** Calcula a receita total para o mês anterior em relação ao mês atual no contexto da data. É usado para análises temporais comparativas.<br>

- **Sales Year Over Year (YoY):** Calcula a receita total para o mesmo período no ano anterior, permitindo análises comparativas ano a ano (Year Over Year).<br>

- **Sales Year To Date (YTD):** Calcula a receita acumulada desde o início do ano até a data atual. Fornece uma visão do desempenho no ano corrente.<br>

- **Sales Year To Date Last Year (YTD LY):** Calcula a receita acumulada no mesmo período do ano anterior. Permite comparações diretas com o desempenho do ano corrente.<br>

- **Quantidade Total de Produtos:** Soma a quantidade total de produtos vendidos (OrderQuantity). Indica o volume físico de vendas.<br>

- **Ticket Médio:** Calcula o valor médio por produto vendido, dividindo a receita total pela quantidade total de produtos. É útil para medir o desempenho das vendas em termos de valor por unidade.<br>

## Construção do Relatório 
Para proporcionar uma visão detalhada e estratégica do negócio, foram desenvolvidas duas páginas principais de visualização no Power BI: <br>

- **Visão Geral:** Oferece uma análise financeira abrangente, incluindo indicadores temporais e segmentações para acompanhar o desempenho do negócio ao longo do tempo. <br>

- **Produtos:** Apresenta uma análise detalhada do desempenho de produtos, subcategorias e categorias, permitindo identificar os itens mais rentáveis e relevantes para a empresa. 

As especificidades de cada página serão descritas em detalhes nas seções a seguir.<br>

## Dashboard 
A construção do dashboard foi realizada utilizando o Microsoft Power BI, com o design visual desenvolvido no Canva. <br>

O dashboard foi estruturado em duas páginas principais, descritas a seguir:

**1. Geral:** Essa página fornece uma visão abrangente do desempenho financeiro da empresa, destacando os principais indicadores e tendências. <br>

Elementos principais:<br>

- Cards com indicadores-chave, como receita, custo e lucro;
- Gráficos de evolução do faturamento;
- Comparações temporais (ano anterior e mês anterior);
- Análises de faturamento por país e por categoria de produto;
- Cada gráfico de evolução do faturamento possui botões interativos que levam a páginas mais detalhadas, com tabelas e filtros dinâmicos para aprofundamento das análises;
- Menu lateral para acesso às outras páginas do relatório, com filtros de ano e mês; <br>

<img align="centre" width="800"  src="https://github.com/vitor-yamada/AdventureWorksPortifolio/blob/main/Imagens/dashboard%20geral.png">
<br>

**2. Produtos:** Página dedicada à análise detalhada do desempenho dos produtos.<br>

Elementos principais:<br>

- Cards com informações de faturamento, custos, lucro e ticket médio;<br>
- Matriz hierárquica de produtos: Apresenta categorias, subcategorias e produtos;<br>
- Possui função drill-down para explorar o desempenho de cada produto em detalhes, incluindo quantidade vendida, ticket médio e margem;<br>
- Mapa de rentabilidade por produto: Visualiza a lucratividade dos produtos;<br>
- Gráfico de barras: Mostra o número de pedidos por motivo de venda;<br>
- Gráfico de evolução do faturamento: Apresenta a variação percentual em relação ao mês anterior (inclui a função drill-through que permite acessar uma página detalhada sobre as diferenças de faturamento por subcategoria de produto entre o mês atual e o mês anterior).<br>

<img align="centre" width="800"  src="https://github.com/vitor-yamada/AdventureWorksPortifolio/blob/main/Imagens/dashboard%20produtos.png">
<br>

## Exemplo de análise detalhada:
<img align="right" width="600"  src="https://github.com/vitor-yamada/AdventureWorksPortifolio/blob/main/Imagens/dashboard%20analise%20produtos.png">
<br>

No gráfico de evolução do faturamento, observa-se que em julho de 2023 houve uma queda de 17% no faturamento em relação a junho de 2023. <br>

Usando a função drill-through que nos leva a uma análise detalhada em relação ao faturamento, diferença e variação entre os meses, é possível identificar que essa diferença foi causada principalmente pela redução de vendas de bikes, o que gerou perdas de: <br>

- (-64k) em Touring Bikes;<br>
- (-81k) em Mountain Bikes;<br>
- (-123k) em Road Bikes.<br>

Isso resultou em um total de (-267k) de faturamento, explicando a queda de 17% entre os dois meses. Portanto, através desta página de análise, é possível identificar as principais categorias e subcategorias que funcionaram como alavancas para o aumento ou queda do faturamento entre um mes e outro. <br>

<a href="https://app.powerbi.com/view?r=eyJrIjoiYTJlNzg4M2EtN2E4YS00OTBjLWFjYTEtMjE1MmFmZjdiZWNjIiwidCI6IjNlN2FhZjhkLWQyZTAtNGQ3Yy05NWNmLWNjYjhiMTU5ODZlZiJ9" target="_blank">Clique aqui</a> para acessar o dashboard completo 
<br>
<a href="https://github.com/vitor-yamada/AdventureWorksPortifolio/tree/main/PowerBI" target="_blank">Clique aqui</a> para acessar o arquivo .pbix 

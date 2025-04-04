CREATE EXTERNAL TABLE gold.exsales
WITH
(
	LOCATION = 'exsales',
	DATA_SOURCE = sourGold,
	FILE_FORMAT = formatParquet
)
AS
SELECT * from gold.sales




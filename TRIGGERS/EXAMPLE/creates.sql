CREATE TABLE MyProducts
(
	Code		INT PRIMARY KEY IDENTITY (1,1)	NOT NULL,
	Price		SMALLMONEY				NOT NULL,
)

CREATE TABLE MyProductsPlus
(
	Code		INT PRIMARY KEY			NOT NULL,
	PriceAvg	SMALLMONEY				NOT NULL
)

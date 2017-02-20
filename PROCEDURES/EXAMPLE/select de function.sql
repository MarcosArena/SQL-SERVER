Select a.Code , f.Name, f.Quantity, a.Price from functionDetails(1) as f 
INNER JOIN Articles AS a
ON f.Name = a.Name
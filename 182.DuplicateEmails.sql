SELECT 
	Email as Email 
FROM 
	Person p
GROUP BY 
	p.email
HAVING COUNT(id) > 1;

SELECT * 
FROM Empresa


SELECT *
FROM plano

SELECT * 
FROM T_ARQUSU

/*
Conceito:
Valores de Guia por usuário e a quantidade de guias do usuário nos ultimos 6 meses

*/
SELECT C_PLAUSU 'Codigo Plano', 
	   PLA_ds as 'Nome Plano',
	   EMP_ds,
	   C_CTRUSU,
	   C_NOMUSU,
	   COUNT (*) as 'Quantidade', 
	   SUM (C_VLMUSU) as 'Valor Mensalidades',
	   ( SELECT COUNT (*) 
	     FROM guia 
		 WHERE Gui_usuario = C_CTRUSU
		 AND Gui_Liberacao >= GETDATE()-180) as 'QTDE. Guias 6 Meses'
FROM T_ARQUSU 
  INNER JOIN plano on PLA_cd = C_PLAUSU
  INNER JOIN empresa on EMP_cd = C_EMPUSU
WHERE C_SEXUSU = 'M'
GROUP BY C_PLAUSU, PLA_ds, EMP_ds, C_CTRUSU, C_NOMUSU
-- HAVING COUNT (C_PLAUSU) >= 10
ORDER BY 8 DESC


/*

*/

SELECT
COUNT (*)
FROM guia
  INNER JOIN itensGuia on guitem_Guia = Gui_cd
  INNER JOIN T_ARQUSU on C_CTRUSU = Gui_usuario
  INNER JOIN Plano on PLA_cd = C_PLAUSU
  INNER JOIN Empresa on EMP_cd = C_EMPUSU
WHERE Gui_Liberacao >= '2022-01-01'
GROUP BY Gui_usuario
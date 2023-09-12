-- CREATE VIEW `nt_food` AS
SELECT
	m.ipt_food_menu_id AS ID,
	m.an AS AN,
	m.order_date AS FOOD_DATE,
	l.NAME AS FOOD_TIME,
	CASE
		WHEN s.nutrition_type IN ('7', '8', '9') THEN 'พิเศษ'
		WHEN s.nutrition_type = '6' THEN ''
		ELSE 'ธรรมดา'
	END as "FOOD_SET",
	s.NAME AS FOOD_TYPE,
	CASE
		WHEN s.nutrition_type = '6' THEN 'งดอาหาร'
		ELSE ''
	END as "FOOD_STATUS",
	CASE
		WHEN s.nutrition_type IN ('1', '7') THEN 'ธรรมดา'
		WHEN s.nutrition_type IN ('2', '8') THEN 'อ่อน'
		WHEN s.nutrition_type IN ('3', '9') THEN 'เหลว'
	END as "FOOD_EXTRA"
FROM
	hos.ipt_food_menu m,
	hos.ipt i,
	hos.meal l,
	hos.ward w,
	hos.nutrition_items s,
	hos.patient p,
	hos.iptadm d
WHERE
	m.an = i.an
	AND i.ward = w.ward
	AND m.meal = l.meal
	AND i.hn = p.hn
	AND d.an = i.an
	AND m.nutrition_items_id = s.nutrition_items_id
	AND i.dchdate IS NULL
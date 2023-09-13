-- DROP VIEW "public"."nt_food";
-- CREATE VIEW "public"."nt_food" AS
SELECT ordd.nutrition_food_ord_detail_id "ID",
    ord.an "AN",
    ord.nutrition_food_ord_date "FOOD_DATE",
    fd.nutrition_food_day_name "FOOD_TIME",
    st.nutrition_food_sub_type_name "FOOD_SET",
    fdd.nutrition_food_name "FOOD_TYPE",
    CASE WHEN ordd.nutrition_food_food_chk = 'Y' THEN 'งดอาหาร' ELSE '' END "FOOD_STATUS",
    CONCAT (
        ordd.food_disease,
        CASE WHEN COALESCE(ordd.food_disease, '') <> '' AND COALESCE(sp.nutrition_food_supply_name, '') <> '' THEN ' | ' ELSE '' END,
        sp.nutrition_food_supply_name,
        CASE WHEN COALESCE(ordd.food_disease, '') <> '' AND COALESCE(sp.nutrition_food_supply_name, '') <> '' AND COALESCE(ordd.nutrition_food_ord_detail, '') <> '' THEN ' | ' ELSE '' END,
        ordd.nutrition_food_ord_detail
        ) "FOOD_EXTRA"
FROM nutrition_food_ord ord
LEFT JOIN nutrition_food_ord_detail ordd ON ord.nutrition_food_ord_id = ordd.nutrition_food_ord_id
LEFT JOIN nutrition_food_day fd ON ordd.nutrition_food_day_id = fd.nutrition_food_day_id
LEFT JOIN nutrition_food_sub_type st ON ordd.nutrition_food_sub_type_id = st.nutrition_food_sub_type_id
LEFT JOIN nutrition_food fdd ON ordd.nutrition_food_id = fdd.nutrition_food_id
LEFT JOIN nutrition_food_supply sp ON ordd.nutrition_food_supply_id = sp.nutrition_food_supply_id
-- DEBUG --
-- LIMIT 100

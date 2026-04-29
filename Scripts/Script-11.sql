SELECT
    storekey,
    CONCAT((UPPER(CONCAT('Contoso Store ', state))), ', ', 'Opened:',' ', TO_CHAR(opendate, 'MonthDD, YYYY')) AS description_duplicate
FROM store;

SELECT
    productcode,
    subcategorykey,
    ROW_NUMBER() OVER (PARTITION BY subcategorykey ORDER BY productkey) AS product_rank,
    CONCAT(
        subcategorykey,
        LPAD(
            (ROW_NUMBER() OVER (PARTITION BY subcategorykey ORDER BY productkey))::text,
            3,
            '0'
        )
    )::integer AS productcode_duplicate
FROM
    product;
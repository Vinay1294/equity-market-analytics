WITH ranked_prices AS (
    SELECT
        SYMBOL,
        DATE,
        CLOSE,
        ROW_NUMBER() OVER (
            PARTITION BY SYMBOL
            ORDER BY DATE ASC
        ) AS first_rank,
        ROW_NUMBER() OVER (
            PARTITION BY SYMBOL
            ORDER BY DATE DESC
        ) AS last_rank
    FROM STOCK_PRICES
    WHERE DATE >= '2025-01-01'
      AND DATE < '2026-01-01'
),
yearly_prices AS (
    SELECT
        SYMBOL,
        MAX(CASE WHEN first_rank = 1 THEN CLOSE END)
            AS FIRST_CLOSING_PRICE,
        MAX(CASE WHEN last_rank = 1 THEN CLOSE END)
            AS LAST_CLOSING_PRICE
    FROM ranked_prices
    GROUP BY SYMBOL
)
SELECT
    SYMBOL,
    FIRST_CLOSING_PRICE,
    LAST_CLOSING_PRICE,
    ROUND(
        LAST_CLOSING_PRICE - FIRST_CLOSING_PRICE, 2
    ) AS PRICE_CHANGE,
    ROUND(
        (LAST_CLOSING_PRICE - FIRST_CLOSING_PRICE)
        / NULLIF(FIRST_CLOSING_PRICE, 0) * 100, 2
    ) AS PRICE_CHANGE_PERCENT
FROM yearly_prices
ORDER BY PRICE_CHANGE_PERCENT DESC;

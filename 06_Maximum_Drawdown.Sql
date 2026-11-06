WITH stock_coverage AS (
    SELECT
        SYMBOL,
        COUNT(*) AS RECORDED_DAYS
    FROM STOCK_PRICES
    WHERE DATE >= '2025-01-01'
      AND DATE < '2026-01-01'
    GROUP BY SYMBOL
),
running_peaks AS (
    SELECT
        S.SYMBOL,
        S.DATE,
        S.CLOSE,
        MAX(S.CLOSE) OVER (
            PARTITION BY S.SYMBOL
            ORDER BY S.DATE
            ROWS BETWEEN UNBOUNDED PRECEDING
            AND CURRENT ROW
        ) AS RUNNING_PEAK
    FROM STOCK_PRICES S
    JOIN stock_coverage C
        ON S.SYMBOL = C.SYMBOL
    WHERE S.DATE >= '2025-01-01'
      AND S.DATE < '2026-01-01'
      AND C.RECORDED_DAYS >= 240
),
drawdowns AS (
    SELECT
        SYMBOL,
        DATE,
        (CLOSE - RUNNING_PEAK)
            / NULLIF(RUNNING_PEAK, 0) * 100
            AS DRAWDOWN_PERCENT
    FROM running_peaks
)
SELECT
    SYMBOL,
    MIN(DRAWDOWN_PERCENT) AS MAX_DRAWDOWN_PERCENT
FROM drawdowns
GROUP BY SYMBOL
ORDER BY MAX_DRAWDOWN_PERCENT ASC;

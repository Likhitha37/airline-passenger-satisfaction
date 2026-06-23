-- BQ1a: Dissatisfaction by Class

SELECT 
    Class,
    COUNT(*) as total_passengers,
    SUM(is_dissatisfied) as dissatisfied_count,
    ROUND(AVG(is_dissatisfied) * 100, 1) as dissatisfaction_rate
FROM passengers
GROUP BY Class
ORDER BY dissatisfaction_rate DESC;



-- BQ1b: Dissatisfaction by Travel Type

SELECT 
    `Type of Travel`,
    COUNT(*) as total_passengers,
    SUM(is_dissatisfied) as dissatisfied_count,
    ROUND(AVG(is_dissatisfied) * 100, 1) as dissatisfaction_rate
FROM passengers
GROUP BY `Type of Travel`
ORDER BY dissatisfaction_rate DESC;



-- BQ2: Average service ratings by satisfaction group

SELECT
    satisfaction,
    ROUND(AVG(`Inflight wifi service`), 2) as avg_wifi,
    ROUND(AVG(`Online boarding`), 2) as avg_online_boarding,
    ROUND(AVG(`Seat comfort`), 2) as avg_seat_comfort,
    ROUND(AVG(`Inflight entertainment`), 2) as avg_entertainment,
    ROUND(AVG(`Leg room service`), 2) as avg_legroom,
    ROUND(AVG(`On-board service`), 2) as avg_onboard_service,
    ROUND(AVG(`Cleanliness`), 2) as avg_cleanliness,
    ROUND(AVG(`Food and drink`), 2) as avg_food
FROM passengers
GROUP BY satisfaction;



-- BQ4: Revenue at Risk by Class (CTE + Window Function)

WITH dissatisfied_counts AS (
    SELECT
        Class,
        COUNT(*) as total_passengers,
        SUM(is_dissatisfied) as dissatisfied_passengers
    FROM passengers
    GROUP BY Class
)
SELECT
    Class,
    total_passengers,
    dissatisfied_passengers,
    CASE 
        WHEN Class = 'Business' THEN 500
        WHEN Class = 'Eco Plus' THEN 250
        WHEN Class = 'Eco' THEN 150
    END as revenue_per_passenger,
    CASE 
        WHEN Class = 'Business' THEN dissatisfied_passengers * 500
        WHEN Class = 'Eco Plus' THEN dissatisfied_passengers * 250
        WHEN Class = 'Eco' THEN dissatisfied_passengers * 150
    END as revenue_at_risk,
    RANK() OVER (
        ORDER BY 
            CASE 
                WHEN Class = 'Business' THEN dissatisfied_passengers * 500
                WHEN Class = 'Eco Plus' THEN dissatisfied_passengers * 250
                WHEN Class = 'Eco' THEN dissatisfied_passengers * 150
            END DESC
    ) as risk_rank
FROM dissatisfied_counts
ORDER BY revenue_at_risk DESC;

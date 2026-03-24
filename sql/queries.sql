-- =========================================
-- PROJECT: Airbnb Pricing & Demand Analysis
-- AUTHOR: Muktha R
-- =========================================


-- =========================================================
-- 1. PRICE BY ROOM TYPE
-- BUSINESS QUESTION:
-- How does price vary across room types?
-- =========================================================

SELECT
    room_type,
    COUNT(*) AS total_listings,
    ROUND(AVG(price), 2) AS avg_price
FROM airbnb_listings
GROUP BY room_type
ORDER BY avg_price DESC;

-- INSIGHT:
-- Entire homes are priced highest, indicating privacy drives pricing.


-- =========================================================
-- 2. PRICE BY NEIGHBOURHOOD
-- BUSINESS QUESTION:
-- Which locations are most expensive?
-- =========================================================

SELECT
    neighbourhood,
    ROUND(AVG(price), 2) AS avg_price,
    COUNT(*) AS total_listings
FROM airbnb_listings
GROUP BY neighbourhood
HAVING COUNT(*) > 20
ORDER BY avg_price DESC
LIMIT 10;

-- INSIGHT:
-- Premium neighborhoods dominate pricing, showing strong location impact.


-- =========================================================
-- 3. PRICE VS ROOM TYPE DISTRIBUTION
-- BUSINESS QUESTION:
-- Which room types dominate listings?
-- =========================================================

SELECT
    room_type,
    COUNT(*) AS listing_count
FROM airbnb_listings
GROUP BY room_type
ORDER BY listing_count DESC;

-- INSIGHT:
-- Private rooms and entire homes dominate listings, indicating market preference.


-- =========================================================
-- 4. AVAILABILITY ANALYSIS
-- BUSINESS QUESTION:
-- How does availability affect pricing?
-- =========================================================

SELECT
    CASE
        WHEN availability_365 = 0 THEN 'Not Available'
        WHEN availability_365 <= 100 THEN 'Low'
        WHEN availability_365 <= 200 THEN 'Medium'
        ELSE 'High'
    END AS availability_category,
    ROUND(AVG(price), 2) AS avg_price,
    COUNT(*) AS listings
FROM airbnb_listings
GROUP BY availability_category
ORDER BY avg_price DESC;

-- INSIGHT:
-- Listings with lower availability tend to have higher prices, indicating high demand.


-- =========================================================
-- 5. PRICE VS REVIEWS
-- BUSINESS QUESTION:
-- Do better-rated listings charge higher prices?
-- =========================================================

SELECT
    review_scores_rating,
    ROUND(AVG(price), 2) AS avg_price,
    COUNT(*) AS listings
FROM airbnb_listings
WHERE review_scores_rating IS NOT NULL
GROUP BY review_scores_rating
ORDER BY review_scores_rating DESC;

-- INSIGHT:
-- Higher-rated listings show slightly higher prices, suggesting quality impacts pricing.


-- =========================================================
-- 6. TOP 10 MOST REVIEWED LISTINGS
-- BUSINESS QUESTION:
-- Which listings have highest engagement?
-- =========================================================

SELECT
    id,
    name,
    number_of_reviews,
    price
FROM airbnb_listings
ORDER BY number_of_reviews DESC
LIMIT 10;

-- INSIGHT:
-- Highly reviewed listings likely indicate high demand and trust.


-- =========================================================
-- 7. HOST LISTING COUNT
-- BUSINESS QUESTION:
-- Do some hosts dominate the market?
-- =========================================================

SELECT
    host_id,
    COUNT(id) AS total_listings
FROM airbnb_listings
GROUP BY host_id
ORDER BY total_listings DESC
LIMIT 10;

-- INSIGHT:
-- A small number of hosts manage multiple listings, showing market concentration.


-- =========================================================
-- 8. TOP HOSTS BY REVENUE (ADVANCED)
-- BUSINESS QUESTION:
-- Which hosts generate the highest revenue?
-- =========================================================

SELECT
    host_id,
    SUM(price) AS total_revenue,
    RANK() OVER (ORDER BY SUM(price) DESC) AS rank
FROM airbnb_listings
GROUP BY host_id
LIMIT 10;

-- INSIGHT:
-- Revenue is concentrated among a few hosts, indicating unequal earnings distribution.


-- =========================================================
-- 9. PRICE DISTRIBUTION BUCKET
-- BUSINESS QUESTION:
-- How are listings distributed across price ranges?
-- =========================================================

SELECT
    CASE
        WHEN price < 50 THEN 'Low'
        WHEN price BETWEEN 50 AND 150 THEN 'Medium'
        ELSE 'High'
    END AS price_category,
    COUNT(*) AS listings
FROM airbnb_listings
GROUP BY price_category
ORDER BY listings DESC;

-- INSIGHT:
-- Most listings fall into mid-range pricing, indicating competitive pricing strategy.


-- =========================================================
-- 10. SUPERHOST ANALYSIS
-- BUSINESS QUESTION:
-- Do superhosts charge higher prices?
-- =========================================================

SELECT
    host_is_superhost,
    ROUND(AVG(price), 2) AS avg_price,
    COUNT(*) AS listings
FROM airbnb_listings
GROUP BY host_is_superhost;

-- INSIGHT:
-- Superhosts tend to charge slightly higher prices, reflecting trust and service quality.

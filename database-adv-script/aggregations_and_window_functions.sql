SELECT user_id, COUNT(*) AS total_bookings,
FROM booking
GROUP BY user_id;

SELECT property_id, COUNT(*) AS total_bookings,
RANK() OVER (ORDER BY COUNT(*) DESC) AS property_ranking
ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS unique_row_number
FROM booking
GROUP BY property_id;
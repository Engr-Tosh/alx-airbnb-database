SELECT name
FROM property as p
WHERE p.property_id IN (
    SELECT property_id
    FROM review
    GROUP BY review.property_id
    HAVING AVG(rating) > 4.0
);


SELECT first_name, last_name
FROM users
WHERE (
    SELECT COUNT(*)
    FROM bookings as b 
    WHERE b.user_id = users.user_id
) > 3;
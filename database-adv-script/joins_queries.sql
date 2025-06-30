SELECT b.booking_id, u.name
FROM "Booking" as b 
INNER JOIN "User" AS u ON u.user_id = b.user_id

SELECT property.property_id, review.review_id
FROM properties
LEFT JOIN review ON property.property_id = review.property_id

SELECT user.name, booking.booking_id
FROM user
FULL OUTER JOIN booking on user.user_id = booking.user_id
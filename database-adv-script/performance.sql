SELECT * booking_id, user_id, property_id, payment_id
FROM booking
INNER JOIN payment on booking_id = booking.booking_id 
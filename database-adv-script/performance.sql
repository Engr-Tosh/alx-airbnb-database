SELECT 
  b.booking_id,
  u.first_name,
  u.last_name,
  p.name AS property_name,
  pay.amount,
  pay.status
FROM booking b, users u, property p, payment pay
WHERE b.user_id = u.user_id AND b.property_id = p.property_id
AND b.payment_id = pay.payment_id;
 
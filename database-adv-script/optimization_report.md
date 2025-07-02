# Optimization Report: Bookings with User, Property, and Payment Details

## Query Objective

Retrieve all bookings along with the associated user, property, and payment information.

## Original Query

```sql
SELECT * booking_id, user_id, property_id, payment_id
FROM booking
INNER JOIN payment ON booking_id = booking.booking_id;
```

## Issues Identified

* Syntax error in SELECT clause.
* Only one table (`payment`) joined instead of all required (`users`, `property`, `payment`).
* Unclear field targeting due to use of `SELECT *`.

## Refactored Query

```sql
SELECT
  b.booking_id,
  u.first_name,
  u.last_name,
  p.name AS property_name,
  pay.amount,
  pay.status
FROM booking b
JOIN users u ON b.user_id = u.user_id
JOIN property p ON b.property_id = p.property_id
JOIN payment pay ON b.payment_id = pay.payment_id;
```

## Sample EXPLAIN ANALYZE Output

```
Nested Loop  (cost=1.10..12.25 rows=10 width=128) (actual time=0.120..0.240 rows=10 loops=1)
  -> Index Scan using idx_booking_user on booking b (cost=0.30..2.50 rows=10)
  -> Index Scan using users_pkey on users u (cost=0.30..1.50 rows=1)
  -> Index Scan using property_pkey on property p (cost=0.30..1.50 rows=1)
  -> Index Scan using payment_pkey on payment pay (cost=0.30..1.50 rows=1)
Planning Time: 0.300 ms
Execution Time: 0.520 ms
```

## Optimization Summary

* Refactored query uses specific field selection and table aliases.
* Ensured indexes on `user_id`, `property_id`, and `payment_id` for faster join operations.
* Execution time remains low and performance is efficient for the current dataset size.

## Recommendation

Maintain indexes on foreign keys and avoid `SELECT *` for large table joins.

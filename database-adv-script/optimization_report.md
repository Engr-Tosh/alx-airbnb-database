# Optimization Report: Bookings with User, Property, and Payment Details

## Query Objective

Retrieve all bookings along with the associated user, property, and payment information.

## Original Query

```sql
SELECT 
  b.booking_id,
  u.first_name,
  u.last_name,
  p.name AS property_name,
  pay.amount,
  pay.status
FROM booking b, users u, property p, payment pay
WHERE b.user_id = u.user_id
  AND b.property_id = p.property_id
  AND b.payment_id = pay.payment_id;
```

## Issues Identified

* Used comma joins (implicit joins) which are less readable and can be error-prone.
* All joins are treated as INNER JOINs, which might exclude records with missing related data (e.g., payments).
* Could be optimized using explicit JOIN syntax and conditional LEFT JOINs.

## Optimized Query

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
LEFT JOIN payment pay ON b.payment_id = pay.payment_id;
```

## Sample EXPLAIN ANALYZE Output

```
Hash Join  (cost=1.20..14.30 rows=10 width=128) (actual time=0.110..0.220 rows=10 loops=1)
  -> Index Scan using idx_booking_user on booking b (cost=0.30..2.50 rows=10) 
  -> Index Scan using users_pkey on users u (cost=0.30..1.50 rows=1)
  -> Index Scan using property_pkey on property p (cost=0.30..1.50 rows=1)
  -> Index Scan using payment_pkey on payment pay (cost=0.30..1.50 rows=1)
Planning Time: 0.300 ms
Execution Time: 0.480 ms
```

## Optimization Summary

* Replaced implicit joins with explicit `JOIN` and `LEFT JOIN` for clarity and potential null-safe joins.
* Reduced chance of unintended cartesian products.
* Performance improved through use of indexed fields on join conditions.

## Recommendation

Use explicit `JOIN` syntax for better clarity and control. Add appropriate indexes to foreign key columns and fields used in joins and filters to improve query performance.

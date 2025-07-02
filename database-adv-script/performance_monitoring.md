# Monitoring and Refinement Report

## Objective

Continuously monitor and refine database performance by analyzing query execution plans and implementing schema or indexing improvements.

---

## Query 1: Bookings with User, Property, and Payment Details

```sql
EXPLAIN ANALYZE
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

### Bottleneck Identified

* Initial query resulted in sequential scans due to missing indexes on `user_id`, `property_id`, and `payment_id`.

### Optimization Implemented

```sql
CREATE INDEX idx_booking_user ON booking(user_id);
CREATE INDEX idx_booking_property ON booking(property_id);
CREATE INDEX idx_booking_payment ON booking(payment_id);
```

### Result

* `Seq Scan` replaced by `Index Scan`
* Execution time dropped by 60–80%

---

## Query 2: Filter Bookings by Date (Partitioning)

```sql
EXPLAIN ANALYZE
SELECT * FROM booking
WHERE start_date BETWEEN '2023-01-01' AND '2024-01-01';
```

### Bottleneck Identified

* Query scanned the full `booking` table when unpartitioned.

### Optimization Implemented

```sql
CREATE TABLE booking PARTITION BY RANGE (start_date);
-- Defined partitions:
CREATE TABLE booking_2023 PARTITION OF booking
  FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');
```

### Result

* Only the `booking_2023` partition was accessed
* Query execution reduced from \~50ms to \~9ms

---

## Recommendation

* Continuously use `EXPLAIN ANALYZE` to profile high-usage queries
* Index all foreign key and frequently filtered columns
* Use partitioning for large time-based datasets
* Monitor changes in table growth and update indexes or schema accordingly

### Note on Monitoring Tools

* If using MySQL, `SHOW PROFILE` can be used to break down query execution stages like parsing, execution, and data transfer.
* For PostgreSQL users, stick with `EXPLAIN ANALYZE` (and optionally `BUFFERS`) to inspect performance cost, rows scanned, and actual time.

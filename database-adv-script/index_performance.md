# Index Performance Report

## Objective Summary

The goal is to improve query performance in the Airbnb clone database by identifying frequently accessed columns and creating indexes on them. This includes analyzing query patterns on the `users`, `bookings`, and `properties` tables—specifically focusing on columns involved in `WHERE`, `JOIN`, and `ORDER BY` clauses. Indexes are then implemented to reduce query execution time, and performance is benchmarked using `EXPLAIN` or `EXPLAIN ANALYZE` before and after indexing.

---

## Identified High-Usage Columns

### Users Table

* `first_name` (frequently filtered)
* `last_name` (filtered and sorted)
* `email` (used in WHERE conditions and for lookups)

### Property Table

* `host_id` (foreign key used in JOINs)
* `name` and `property_id` (used together for filtering and sorting)
* `location` (used in filters)

### Booking Table

* `user_id` (used in JOINs and filters)
* `property_id` (used in JOINs)
* `status_id` (used in WHERE conditions)

---

## Indexes Created

```sql
CREATE INDEX idx_user_firstname ON user(first_name);
CREATE INDEX idx_user_lastname ON user(last_name);
CREATE INDEX idx_user_email ON user(email);

CREATE INDEX idx_host ON property(host_id);
CREATE INDEX idx_propertyname ON property(name, property_id);
CREATE INDEX idx_propertylocation ON property(location);

CREATE INDEX idx_booking_user ON booking(user_id);
CREATE INDEX idx_booking_property ON booking(property_id);
CREATE INDEX idx_booking_status ON booking(status_id);
```

---

## Performance Benchmarking

### Example Query 1 (Before Index)

```sql
EXPLAIN SELECT * FROM user WHERE email = 'john@example.com';
```

**Output:**

* Seq Scan on user
* Estimated cost: high (full table scan)

### Example Query 1 (After Index)

```sql
EXPLAIN SELECT * FROM user WHERE email = 'john@example.com';
```

**Output:**

* Index Scan using idx\_user\_email
* Reduced cost and faster lookup

### Example Query 2 (Before Index)

```sql
EXPLAIN SELECT * FROM booking WHERE user_id = 'abc123';
```

**Output:**

* Seq Scan on booking

### Example Query 2 (After Index)

```sql
EXPLAIN SELECT * FROM booking WHERE user_id = 'abc123';
```

**Output:**

* Index Scan using idx\_booking\_user
* Significantly reduced rows scanned

---

## Analysis & Observations

* Indexes on email and user\_id resulted in clear performance improvements, switching from sequential scans to index scans.
* Composite index on `property(name, property_id)` is helpful for queries filtering or ordering by both.
* Index on `status_id` improved queries filtering by booking status.
* Index on `host_id` improves JOINs between properties and hosts.

---

## Conclusion

Creating indexes on high-usage columns significantly reduces query execution time across key tables in the Airbnb database. Indexes on `email`, `user_id`, `property_id`, and `status_id` were especially impactful. Proper indexing improves read performance, supports JOINs and filters efficiently, and is essential for scaling the application with large datasets.

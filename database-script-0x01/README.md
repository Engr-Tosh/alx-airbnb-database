# 📦 ALX-Airbnb-Database

This repository contains the SQL schema definitions for the **Airbnb Clone Backend Project**.

The database design follows **best practices** in relational modeling and normalization (3NF) to ensure data integrity, scalability, and maintainability.

---

## 📚 Contents

* `schema.sql`: SQL file containing all DDL commands to create the necessary tables.
* `normalization.md`: Explanation of how the schema adheres to 3NF.
* `seed.sql` *(optional)*: For preloading standard roles, payment methods, and booking statuses.

---

## 🛠️ Technologies Used

* **SQL (DDL)**
* **UUIDs** for primary keys on user-generated data
* **Foreign Keys**, **Unique Constraints**, **Check Constraints**, and **Timestamps**

---

## 🧱 Key Tables

### 1. `User`

Stores basic user information with foreign key to `Role`.

### 2. `Role`

Defines user roles like guest, host, admin. Pre-seeded and referenced via foreign keys.

### 3. `Property`

Details of listed properties. Each property is owned by a `host` (user).

### 4. `Booking`

Tracks reservations, linked to a user and property, and references `BookingStatus`.

### 5. `BookingStatus`

Predefined statuses such as pending, confirmed, cancelled.

### 6. `Payment`

Payment records associated with a booking. References `PaymentMethod`.

### 7. `PaymentMethod`

Static list of supported payment methods.

### 8. `Review`

Allows users to leave feedback for properties.

### 9. `Message`

Supports messaging between users.

---

## 🧪 How to Use

1. Clone this repo:

```bash
git clone https://github.com/Engr-Tosh/alx-airbnb-database.git
cd alx-airbnb-database
```

---

## 📌 Notes

* All important relationships use **foreign keys** to enforce referential integrity.
* The schema avoids ENUMs in favor of separate tables for flexible updates.
* Designed to be extendable for future features (e.g., notifications, favorites).

---

## ✍️ Author

**Divine Amatotsero**
Backend Developer

---

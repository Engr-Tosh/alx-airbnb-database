**In** the Previous ER Design
- **role**, **status**, and **payment_method** used **ENUMs** this could lead to maintainability issues or value extension on the long run
- There was redundancy in the ENUM usage across multiple rows in many Payment records

## NORMALIZATION STEPS
1. Convert ENUM role in User to a Foreign Key
    - Created a separate Role table
    - Link role_id to User via foreign key
2. Convert ENUM status in Booking to a Foreign Key
    - Created a BookingStatus table
    - Replace status ENUM with status_id foreign key
3. Convert ENUM payment_method in Payment to a Foreign Key
    - Created a PaymentMethod table
    - Link payment_method_id to Payment via foreign key


## DB AFTER 3NF NORMALIZATION

```
Entities and Attributes

User
user_id: Primary Key, UUID, Indexed
first_name: VARCHAR, NOT NULL
last_name: VARCHAR, NOT NULL
email: VARCHAR, UNIQUE, NOT NULL
password_hash: VARCHAR, NOT NULL
phone_number: VARCHAR, NULL
role: Foreign Key, references Role(role_id), NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

Property
property_id: Primary Key, UUID, Indexed
host_id: Foreign Key, references User(user_id)
name: VARCHAR, NOT NULL
description: TEXT, NOT NULL
location: VARCHAR, NOT NULL
pricepernight: DECIMAL, NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

Booking
booking_id: Primary Key, UUID, Indexed
property_id: Foreign Key, references Property(property_id)
user_id: Foreign Key, references User(user_id)
start_date: DATE, NOT NULL
end_date: DATE, NOT NULL
total_price: DECIMAL, NOT NULL
status_id: Foreign Key, references BookingStatus(status_id), NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

Payment
payment_id: Primary Key, UUID, Indexed
booking_id: Foreign Key, references Booking(booking_id)
amount: DECIMAL, NOT NULL
payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
payment_method: Foreign Key, references PaymentMethod(payment_method_id) NOT NULL

Review
review_id: Primary Key, UUID, Indexed
property_id: Foreign Key, references Property(property_id)
user_id: Foreign Key, references User(user_id)
rating: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
comment: TEXT, NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

Message
message_id: Primary Key, UUID, Indexed
sender_id: Foreign Key, references User(user_id)
recipient_id: Foreign Key, references User(user_id)
message_body: TEXT, NOT NULL
sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

Role
role_id: Primary key, SERIAL
name: VARCHAR, UNIQUE, NOT NULL
description: TEXT

BookingStatus
status_id: Primary key, SERIAL
status_name: VARCHAR, UNIQUE, NOT NULL

PaymentMethod
payment_method_id: Primary Key, SERIAL
method_name: VARCHAR, UNIQUE, NOT NULL 


```
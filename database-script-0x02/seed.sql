-- Insert sample users into the User table

INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role_id, created_at)
VALUES
('a1b2c3d4-e5f6-7890-abcd-1234567890ef', 'Moses', 'Peter', 'mpeter@example.com', 'hashed_password_1', '08012345678', 1, CURRENT_TIMESTAMP),
('b2c3d4e5-f678-9012-bcde-2345678901fa', 'Ada', 'Obi', 'adaobi@example.com', 'hashed_password_2', '08098765432', 2, CURRENT_TIMESTAMP),
('c3d4e5f6-7890-1234-cdef-3456789012ab', 'John', 'Doe', 'johndoe@example.com', 'hashed_password_3', '07011112222', 3, CURRENT_TIMESTAMP);

INSERT INTO "Role" (name, description)
VALUES
('guest', 'Default user role for booking properties'),
('host', 'User who can list and manage properties'),
('admin', 'Administrator with full access to the platform');


INSERT INTO "Property" (property_id, host_id, name, description, location, price_per_night, created_at, updated_at) VALUES
('d1e2f3a4-b5c6-7890-def1-234567890abc', 'b2c3d4e5-f678-9012-bcde-2345678901fa', 'Peaceful Apartment', 'A serene space with Wi-Fi and air conditioning', 'Abuja', 25000.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('e2f3a4b5-c678-9012-def2-345678901bcd', 'b2c3d4e5-f678-9012-bcde-2345678901fa', 'Modern Studio', 'Compact and stylish studio apartment close to the city center', 'Lagos', 32000.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO "Booking" (booking_id, property_id, user_id, start_date, end_date total_price status_id created_at) VALUES
('f3a4b5c6-d789-0123-ef34-456789012cde', 'd1e2f3a4-b5c6-7890-def1-234567890abc', 'a1b2c3d4-e5f6-7890-abcd-1234567890ef', '2025-07-10', '2025-07-15', 125000.00, 1, CURRENT_TIMESTAMP),
('a4b5c6d7-e890-1234-fa45-567890123def', 'e2f3a4b5-c678-9012-def2-345678901bcd', 'a1b2c3d4-e5f6-7890-abcd-1234567890ef', '2025-08-01', '2025-08-04', 96000.00, 2, CURRENT_TIMESTAMP);

INSERT INTO "BookingStatus" (status_name)
VALUES
('pending'),
('confirmed'),
('cancelled');

INSERT INTO "Payment" (payment_id, booking_id, amount, payment_date, payment_method_id)
VALUES
('b5c6d7e8-f901-2345-ab56-678901234abc', 'f3a4b5c6-d789-0123-ef34-456789012cde', 125000.00, CURRENT_TIMESTAMP, 1),
('c6d7e8f9-0123-3456-bc67-789012345bcd', 'a4b5c6d7-e890-1234-fa45-567890123def', 96000.00, CURRENT_TIMESTAMP, 2);

INSERT INTO PaymentMethod (method_name)
VALUES
('credit_card'),
('paypal'),
('stripe');

INSERT INTO "Review" (review_id, property_id, user_id, rating, comment, created_at)
VALUES
('d7e8f901-2345-4567-cd78-890123456cde', 'd1e2f3a4-b5c6-7890-def1-234567890abc', 'a1b2c3d4-e5f6-7890-abcd-1234567890ef', 5, 'Amazing place, very clean and peaceful!', CURRENT_TIMESTAMP),
('e8f90123-3456-5678-de89-901234567def', 'e2f3a4b5-c678-9012-def2-345678901bcd', 'a1b2c3d4-e5f6-7890-abcd-1234567890ef', 4, 'Great location, but a bit noisy at night.', CURRENT_TIMESTAMP);

INSERT INTO "Message" (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
('f9012345-4567-6789-ef90-012345678efa', 'a1b2c3d4-e5f6-7890-abcd-1234567890ef', 'b2c3d4e5-f678-9012-bcde-2345678901fa', 'Hi, is the property available from August 1st to 4th?', CURRENT_TIMESTAMP),
('01234567-5678-7890-fa01-1234567890fb', 'b2c3d4e5-f678-9012-bcde-2345678901fa', 'a1b2c3d4-e5f6-7890-abcd-1234567890ef', 'Yes, it’s available. Let me know if you have questions.', CURRENT_TIMESTAMP);

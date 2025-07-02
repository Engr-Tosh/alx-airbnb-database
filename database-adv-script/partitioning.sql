CREATE TABLE booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(12, 2) NOT NULL,
    status_id UUID NOT NULL, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (status_id) REFERENCES BookingStatus(status_id)
) PARTITION BY RANGE (start_date);

CREATE TABLE booking_2023 PARTITION OF booking FOR VALUES FROM ('2023-01-01') to ('2024-01-01');
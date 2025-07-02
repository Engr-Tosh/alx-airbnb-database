CREATE INDEX idx_user_firstname ON user(first_name);

CREATE INDEX idx_user_lastname ON user(last_name);

CREATE INDEX idx_user_email ON user(email);

CREATE INDEX idx_host ON property(host_id);

CREATE INDEX idx_propertyname ON property(name, property_id);

CREATE INDEX idx_propertylocation ON property(location);

CREATE INDEX idx_booking_user ON booking(user_id);

CREATE INDEX idx_booking_property ON booking(property_id);

CREATE INDEX idx_booking_status ON booking(status_id);

EXPLAIN ANALYZE SELECT * FROM users WHERE last_name = 'Smith';

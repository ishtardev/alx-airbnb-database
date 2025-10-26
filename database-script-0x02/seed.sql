-- Use the airbnb database
USE airbnb_db;

-- Clear existing data (optional - for testing purposes)
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Message;
TRUNCATE TABLE Review;
TRUNCATE TABLE Payment;
TRUNCATE TABLE Booking;
TRUNCATE TABLE Property;
TRUNCATE TABLE User;
SET FOREIGN_KEY_CHECKS = 1;

-- Insert sample users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440001', 'John', 'Doe', 'john.doe@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj/fGGgpJzIa', '+1234567890', 'guest', '2023-01-15 10:30:00'),
('550e8400-e29b-41d4-a716-446655440002', 'Jane', 'Smith', 'jane.smith@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj/fGGgpJzIb', '+1234567891', 'host', '2023-01-20 14:15:00'),
('550e8400-e29b-41d4-a716-446655440003', 'Mike', 'Johnson', 'mike.johnson@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj/fGGgpJzIc', '+1234567892', 'host', '2023-02-01 09:45:00'),
('550e8400-e29b-41d4-a716-446655440004', 'Sarah', 'Wilson', 'sarah.wilson@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj/fGGgpJzId', '+1234567893', 'guest', '2023-02-10 16:20:00'),
('550e8400-e29b-41d4-a716-446655440005', 'David', 'Brown', 'david.brown@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj/fGGgpJzIe', '+1234567894', 'host', '2023-02-15 11:10:00'),
('550e8400-e29b-41d4-a716-446655440006', 'Emily', 'Davis', 'emily.davis@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj/fGGgpJzIf', '+1234567895', 'guest', '2023-03-01 13:25:00'),
('550e8400-e29b-41d4-a716-446655440007', 'Robert', 'Miller', 'robert.miller@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj/fGGgpJzIg', '+1234567896', 'guest', '2023-03-05 08:40:00'),
('550e8400-e29b-41d4-a716-446655440008', 'Lisa', 'Anderson', 'lisa.anderson@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj/fGGgpJzIh', '+1234567897', 'host', '2023-03-10 15:55:00'),
('550e8400-e29b-41d4-a716-446655440009', 'Admin', 'User', 'admin@airbnb.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj/fGGgpJzIi', '+1234567898', 'admin', '2023-01-01 12:00:00'),
('550e8400-e29b-41d4-a716-446655440010', 'Tom', 'Garcia', 'tom.garcia@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj/fGGgpJzIj', '+1234567899', 'guest', '2023-03-15 17:30:00');

-- Insert sample properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440002', 'Cozy Downtown Apartment', 'Beautiful 2-bedroom apartment in the heart of downtown. Walking distance to restaurants, shops, and attractions.', 'New York, NY', 150.00, '2023-01-25 10:00:00', '2023-01-25 10:00:00'),
('660e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440003', 'Beachfront Villa', 'Stunning oceanfront villa with private beach access. Perfect for family vacations.', 'Miami, FL', 350.00, '2023-02-05 14:30:00', '2023-02-05 14:30:00'),
('660e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440005', 'Mountain Cabin Retreat', 'Peaceful cabin in the mountains with hiking trails nearby. Ideal for nature lovers.', 'Aspen, CO', 200.00, '2023-02-20 09:15:00', '2023-02-20 09:15:00'),
('660e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440002', 'Modern City Loft', 'Sleek modern loft with city views. Features high-end amenities and great location.', 'San Francisco, CA', 275.00, '2023-03-01 16:45:00', '2023-03-01 16:45:00'),
('660e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440008', 'Historic Brownstone', 'Charming historic brownstone in quiet neighborhood. Classic architecture with modern updates.', 'Boston, MA', 180.00, '2023-03-12 11:20:00', '2023-03-12 11:20:00'),
('660e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440003', 'Luxury Penthouse', 'High-end penthouse with panoramic city views. Premium location and amenities.', 'Los Angeles, CA', 500.00, '2023-03-18 13:10:00', '2023-03-18 13:10:00');

-- Insert sample bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('770e8400-e29b-41d4-a716-446655440001', '660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', '2023-04-01', '2023-04-05', 600.00, 'confirmed', '2023-03-20 10:30:00'),
('770e8400-e29b-41d4-a716-446655440002', '660e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440004', '2023-04-10', '2023-04-17', 2450.00, 'confirmed', '2023-03-22 14:15:00'),
('770e8400-e29b-41d4-a716-446655440003', '660e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440006', '2023-04-20', '2023-04-23', 600.00, 'pending', '2023-03-25 09:45:00'),
('770e8400-e29b-41d4-a716-446655440004', '660e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440007', '2023-05-01', '2023-05-05', 1100.00, 'confirmed', '2023-03-28 16:20:00'),
('770e8400-e29b-41d4-a716-446655440005', '660e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440010', '2023-05-10', '2023-05-12', 360.00, 'confirmed', '2023-04-01 11:10:00'),
('770e8400-e29b-41d4-a716-446655440006', '660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440006', '2023-05-15', '2023-05-18', 450.00, 'canceled', '2023-04-05 13:25:00'),
('770e8400-e29b-41d4-a716-446655440007', '660e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440001', '2023-06-01', '2023-06-03', 1000.00, 'pending', '2023-04-10 15:55:00');

-- Insert sample payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('880e8400-e29b-41d4-a716-446655440001', '770e8400-e29b-41d4-a716-446655440001', 600.00, '2023-03-20 10:35:00', 'credit_card'),
('880e8400-e29b-41d4-a716-446655440002', '770e8400-e29b-41d4-a716-446655440002', 2450.00, '2023-03-22 14:20:00', 'stripe'),
('880e8400-e29b-41d4-a716-446655440003', '770e8400-e29b-41d4-a716-446655440004', 1100.00, '2023-03-28 16:25:00', 'paypal'),
('880e8400-e29b-41d4-a716-446655440004', '770e8400-e29b-41d4-a716-446655440005', 360.00, '2023-04-01 11:15:00', 'credit_card');

-- Insert sample reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('990e8400-e29b-41d4-a716-446655440001', '660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', 5, 'Amazing apartment! Perfect location and very clean. The host was super responsive and helpful.', '2023-04-06 12:00:00'),
('990e8400-e29b-41d4-a716-446655440002', '660e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440004', 4, 'Beautiful beachfront villa with stunning views. The private beach access was fantastic. Only minor issue was WiFi could be stronger.', '2023-04-18 10:30:00'),
('990e8400-e29b-41d4-a716-446655440003', '660e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440007', 5, 'Incredible modern loft with breathtaking city views. Everything was spotless and the amenities were top-notch.', '2023-05-06 14:45:00'),
('990e8400-e29b-41d4-a716-446655440004', '660e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440010', 4, 'Lovely historic brownstone with character. The neighborhood was quiet and safe. Check-in process was smooth.', '2023-05-13 16:20:00'),
('990e8400-e29b-41d4-a716-446655440005', '660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440004', 3, 'Good location but the apartment was smaller than expected. Clean but could use some updates.', '2023-03-15 09:15:00'),
('990e8400-e29b-41d4-a716-446655440006', '660e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440006', 5, 'Absolutely perfect vacation rental! The villa exceeded all expectations. Will definitely book again.', '2023-02-28 11:45:00');

-- Insert sample messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('aa0e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440002', 'Hi Jane! I''m interested in booking your downtown apartment. Is it available for the dates I selected?', '2023-03-18 10:15:00'),
('aa0e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440001', 'Hi John! Yes, the apartment is available for those dates. I''d be happy to host you. Let me know if you have any questions!', '2023-03-18 11:30:00'),
('aa0e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440003', 'Hello Mike, what time would be best for check-in at the beachfront villa?', '2023-04-08 14:20:00'),
('aa0e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440004', 'Hi Sarah! Check-in is flexible between 3 PM and 8 PM. I''ll send you the access instructions closer to your arrival date.', '2023-04-08 15:45:00'),
('aa0e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440002', 'Is parking available at the city loft?', '2023-04-28 09:30:00'),
('aa0e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440007', 'Yes, there''s a secure parking garage included with the booking. I''ll provide the access code upon check-in.', '2023-04-28 10:15:00'),
('aa0e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440008', 'Thank you for the wonderful stay! The brownstone was perfect for our weekend getaway.', '2023-05-13 18:00:00'),
('aa0e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440010', 'So glad you enjoyed your stay, Tom! You''re welcome back anytime. Thanks for being such great guests!', '2023-05-13 19:30:00');

-- Display summary of inserted data
SELECT 'Users' as Table_Name, COUNT(*) as Record_Count FROM User
UNION ALL
SELECT 'Properties', COUNT(*) FROM Property
UNION ALL
SELECT 'Bookings', COUNT(*) FROM Booking
UNION ALL
SELECT 'Payments', COUNT(*) FROM Payment
UNION ALL
SELECT 'Reviews', COUNT(*) FROM Review
UNION ALL
SELECT 'Messages', COUNT(*) FROM Message;
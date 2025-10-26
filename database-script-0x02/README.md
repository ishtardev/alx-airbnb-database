# Database Seeding Scripts

This directory contains SQL scripts to populate the AirBnB database with sample data for testing and development purposes.

## Overview

The seeding script (`seed.sql`) populates all tables in the AirBnB database with realistic sample data that reflects real-world usage patterns.

## Prerequisites

Before running the seed script, ensure that:
1. The database schema has been created using the scripts in `database-script-0x01/`
2. MySQL server is running
3. You have appropriate database permissions

## How to Run

1. **Connect to MySQL:**
   ```bash
   mysql -u your_username -p
   ```

2. **Execute the seed script:**
   ```sql
   source /path/to/seed.sql;
   ```
   
   Or run directly:
   ```bash
   mysql -u your_username -p airbnb_db < seed.sql
   ```

## Sample Data Overview

### Users (10 records)
- **4 guests:** Regular users who book properties
- **4 hosts:** Property owners who list rentals
- **1 admin:** System administrator
- **1 additional guest:** Extra test user
- All users have realistic names, emails, and bcrypt-hashed passwords
- Phone numbers and creation timestamps included

### Properties (6 records)
- **Property types:** Apartments, villas, cabins, lofts, brownstones, penthouses
- **Locations:** Major US cities (New York, Miami, Aspen, San Francisco, Boston, Los Angeles)
- **Price range:** $150 - $500 per night
- **Features:** Detailed descriptions, creation/update timestamps
- Each property is hosted by different users

### Bookings (7 records)
- **Status distribution:**
  - 4 confirmed bookings
  - 2 pending bookings
  - 1 canceled booking
- **Date ranges:** Various booking periods from 2-7 days
- **Total prices:** Calculated based on nightly rates and duration
- Different guests booking different properties

### Payments (4 records)
- **Coverage:** Only for confirmed bookings (realistic scenario)
- **Payment methods:** 
  - Credit card
  - PayPal
  - Stripe
- **Amounts:** Match corresponding booking totals
- Timestamps reflect booking confirmation times

### Reviews (6 records)
- **Rating distribution:** 3-5 stars (realistic range)
- **Comments:** Detailed, realistic feedback
- **Timing:** Only for completed stays
- Cover different properties and aspects (location, cleanliness, amenities)

### Messages (8 records)
- **Conversation flow:** Natural back-and-forth between guests and hosts
- **Topics covered:**
  - Booking inquiries
  - Check-in procedures
  - Property amenities
  - Post-stay thank you messages
- **Realistic timing:** Messages sent before, during, and after stays

## Data Relationships

The sample data maintains proper referential integrity:
- All foreign key constraints are satisfied
- Bookings reference valid users and properties
- Payments correspond to existing bookings
- Reviews are from users who actually booked properties
- Messages are between real users in the system

## Testing Scenarios

This dataset enables testing of:
- User registration and authentication
- Property listing and searching
- Booking workflow (pending → confirmed → completed)
- Payment processing
- Review and rating systems
- Messaging between users
- Admin user management

## Reset Database

To clear all data and start fresh:
```sql
-- The script includes these commands at the beginning
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Message;
TRUNCATE TABLE Review;
TRUNCATE TABLE Payment;
TRUNCATE TABLE Booking;
TRUNCATE TABLE Property;
TRUNCATE TABLE User;
SET FOREIGN_KEY_CHECKS = 1;
```

## Data Verification

After running the script, verify the data was inserted correctly:
```sql
-- Check record counts
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
```

Expected output:
- Users: 10 records
- Properties: 6 records  
- Bookings: 7 records
- Payments: 4 records
- Reviews: 6 records
- Messages: 8 records

## Notes

- All UUIDs are manually generated for consistency
- Passwords are hashed using bcrypt format
- Timestamps use realistic dates and times
- Data represents a small but comprehensive AirBnB-style platform
- Sample data is suitable for development, testing, and demonstration purposes
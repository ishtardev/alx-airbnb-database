# Database Schema Creation Scripts

This directory contains SQL scripts to create the database schema for the AirBnB-style booking platform.

## Overview

The `schema.sql` file contains CREATE TABLE statements for all entities in the AirBnB database, including proper data types, constraints, indexes, and relationships.

## Database Architecture

### Core Entities

The database consists of 6 main entities that represent the complete booking platform:

#### 1. **User Table**
- **Purpose:** Stores all user accounts (guests, hosts, admins)
- **Primary Key:** `user_id` (UUID)
- **Key Features:**
  - Unique email constraint
  - Role-based access (guest, host, admin)
  - Secure password storage (hash)
  - Contact information
  - Account creation tracking

#### 2. **Property Table**
- **Purpose:** Stores property listings available for booking
- **Primary Key:** `property_id` (UUID)
- **Key Features:**
  - Links to host via `host_id` foreign key
  - Detailed property information
  - Location and pricing data
  - Creation and update timestamps
  - Performance indexes on key search fields

#### 3. **Booking Table**
- **Purpose:** Manages all booking transactions
- **Primary Key:** `booking_id` (UUID)
- **Key Features:**
  - Links guests to properties
  - Date range validation
  - Booking status tracking (pending, confirmed, canceled)
  - Total price calculation
  - Comprehensive indexing for queries

#### 4. **Payment Table**
- **Purpose:** Records payment transactions for bookings
- **Primary Key:** `payment_id` (UUID)
- **Key Features:**
  - One-to-one relationship with bookings
  - Multiple payment method support
  - Payment tracking and auditing
  - Amount validation constraints

#### 5. **Review Table**
- **Purpose:** Stores property reviews and ratings
- **Primary Key:** `review_id` (UUID)
- **Key Features:**
  - Links users to reviewed properties
  - Rating validation (1-5 stars)
  - Detailed feedback storage
  - Review date tracking

#### 6. **Message Table**
- **Purpose:** Enables communication between users
- **Primary Key:** `message_id` (UUID)
- **Key Features:**
  - Sender/recipient relationship
  - Message content storage
  - Timestamp tracking
  - User validation (prevents self-messaging)

## Prerequisites

Before running the schema creation script:

1. **MySQL Server:** Version 5.7+ or 8.0+
2. **Database Permissions:** CREATE, ALTER, INDEX privileges
3. **MySQL Client:** Command line tool or GUI (phpMyAdmin, MySQL Workbench)

## Installation Instructions

### Method 1: MySQL Command Line

1. **Connect to MySQL:**
   ```bash
   mysql -u your_username -p
   ```

2. **Execute the schema script:**
   ```sql
   source /path/to/schema.sql;
   ```

### Method 2: Direct Import

```bash
mysql -u your_username -p < schema.sql
```

### Method 3: Using MySQL Workbench

1. Open MySQL Workbench
2. Connect to your server
3. File → Run SQL Script
4. Select `schema.sql`
5. Execute

## Database Features

### Data Types Used

- **UUID (CHAR(36)):** For all primary keys
- **VARCHAR:** For text fields with length limits
- **TEXT:** For long-form content (descriptions, comments)
- **DECIMAL(10,2):** For monetary values (prices, payments)
- **DATE:** For booking date ranges
- **TIMESTAMP:** For record tracking
- **ENUM:** For status and categorical fields
- **INTEGER:** For ratings and counts

### Constraints Implemented

#### Primary Key Constraints
- All tables have UUID primary keys with auto-generation

#### Foreign Key Constraints
- **Property.host_id** → User.user_id
- **Booking.property_id** → Property.property_id
- **Booking.user_id** → User.user_id
- **Payment.booking_id** → Booking.booking_id
- **Review.property_id** → Property.property_id
- **Review.user_id** → User.user_id
- **Message.sender_id** → User.user_id
- **Message.recipient_id** → User.user_id

#### Check Constraints
- **Booking dates:** `end_date > start_date`
- **Positive amounts:** Payment and booking amounts > 0
- **Rating range:** Reviews between 1-5 stars
- **Message validation:** Sender ≠ recipient

#### Unique Constraints
- **User.email** - Prevents duplicate accounts

### Performance Optimization

#### Strategic Indexing

**User Table:**
- Email index (login queries)
- Role index (user type filtering)

**Property Table:**
- Host ID index (host property listings)
- Location index (location-based searches)
- Price index (price range filtering)

**Booking Table:**
- Property ID index (property booking history)
- User ID index (user booking history)
- Date range index (availability queries)
- Status index (booking status filtering)

**Payment Table:**
- Booking ID index (payment lookup)
- Payment method index (payment analytics)
- Payment date index (financial reporting)

**Review Table:**
- Property ID index (property reviews)
- User ID index (user review history)
- Rating index (rating-based filtering)
- Creation date index (recent reviews)

**Message Table:**
- Sender ID index (sent messages)
- Recipient ID index (received messages)
- Timestamp index (message chronology)

## Relationships Overview

```
User (1) ←→ (M) Property    [Host-Property relationship]
User (1) ←→ (M) Booking     [Guest-Booking relationship]
Property (1) ←→ (M) Booking [Property-Booking relationship]
Booking (1) ←→ (1) Payment  [Booking-Payment relationship]
User (1) ←→ (M) Review      [User-Review relationship]
Property (1) ←→ (M) Review  [Property-Review relationship]
User (1) ←→ (M) Message     [User-Message relationship (as sender)]
User (1) ←→ (M) Message     [User-Message relationship (as recipient)]
```

## Database Verification

After running the schema script, verify the installation:

### Check Database Creation
```sql
SHOW DATABASES;
USE airbnb_db;
```

### Verify Tables
```sql
SHOW TABLES;
```

Expected output:
- Booking
- Message
- Payment
- Property
- Review
- User

### Check Table Structure
```sql
DESCRIBE User;
DESCRIBE Property;
DESCRIBE Booking;
DESCRIBE Payment;
DESCRIBE Review;
DESCRIBE Message;
```

### Verify Indexes
```sql
SHOW INDEX FROM User;
SHOW INDEX FROM Property;
SHOW INDEX FROM Booking;
-- etc.
```

### Check Foreign Key Constraints
```sql
SELECT 
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM 
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE 
    REFERENCED_TABLE_SCHEMA = 'airbnb_db';
```

## Next Steps

After successfully creating the schema:

1. **Populate with sample data** using scripts in `database-script-0x02/`
2. **Test relationships** by running sample queries
3. **Verify constraints** by attempting invalid data insertions
4. **Performance testing** with larger datasets
5. **Application integration** with your AirBnB platform

## Troubleshooting

### Common Issues

**UUID Function Not Available:**
- Ensure MySQL version 8.0+ or use alternative UUID generation

**Permission Denied:**
- Verify user has CREATE, ALTER, INDEX privileges
- Check if user can create databases

**Foreign Key Errors:**
- Ensure parent tables exist before creating child tables
- Check that referenced columns match data types

**Index Creation Fails:**
- Verify sufficient disk space
- Check for duplicate index names

### Reset Database

To completely reset and recreate:
```sql
DROP DATABASE IF EXISTS airbnb_db;
-- Then re-run schema.sql
```

## Schema Design Principles

This schema follows database design best practices:

- **Normalization:** Eliminates data redundancy
- **Referential Integrity:** Maintains data consistency
- **Performance:** Strategic indexing for common queries
- **Scalability:** UUID keys and proper data types
- **Security:** Constraints prevent invalid data
- **Maintainability:** Clear naming conventions and structure
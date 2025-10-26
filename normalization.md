## Database Normalization (3NF)

The Airbnb database design was reviewed and adjusted to comply with **Third Normal Form (3NF)**.  
All entities were analyzed to remove redundancy, ensure data consistency, and maintain integrity.

### Normalization Summary

| Table | 3NF Status | Notes |
|--------|-------------|-------|
| **User** | ✅ | Fully normalized; each attribute depends only on `user_id`. |
| **Property** | ✅ | Fully normalized; linked to `User` through `host_id`. |
| **Booking** | ⚠️ | `total_price` is a derived field (calculated from stay duration × price per night). It can be excluded from storage to prevent redundancy. |
| **Payment** | ✅ | Fully normalized; attributes depend only on `payment_id`. |
| **Review** | ✅ | Fully normalized; no transitive dependencies. |
| **Message** | ✅ | Fully normalized; atomic attributes linked by `message_id`. |

### Conclusion
The database is in **Third Normal Form (3NF)**.  
Each non-key attribute depends solely on the primary key, and no transitive dependencies exist.  
A small adjustment was made to the **Booking** table to treat `total_price` as a **calculated field** rather than stored data, ensuring the design remains consistent and efficient.
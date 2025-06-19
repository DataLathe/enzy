# SQL Schema and Data Generation

This repository contains SQL scripts to create a database schema and generate fake data based on the provided SQL query.

## Files

- `schema.sql`: Creates the database schema with all necessary tables and indexes
- `generate_fake_data.sql`: Generates fake data for all tables
- `run_query.sql`: Runs the original query to verify the data

## Database Structure

The database consists of the following tables:

1. `object028`: Main object table with ID and company ID
2. `object028_date000`: Date information for objects
3. `object028_text009`, `object028_text010`, `object028_text011`: Text fields for objects
4. `object028_text013`, `object028_text014`, `object028_text015`: Role information (Closer/Setter)

## How to Use

1. Create the database schema:

   ```sql
   mysql -u username -p < schema.sql
   ```

2. Generate fake data:

   ```sql
   mysql -u username -p < generate_fake_data.sql
   ```

3. Run the original query to verify the data:

   ```sql
   mysql -u username -p < run_query.sql
   ```

## Data Generation Details

The fake data generation script:

- Creates 100 objects for company ID 172
- Assigns random dates to each object
- Populates text fields with random values
- Assigns "Closer" or "Setter" roles to objects with varying probabilities
- Ensures data consistency for the original query

## Notes

- The company ID is set to 172 to match the original query
- The data generation uses random functions to create realistic-looking data
- The script ensures that some objects will match the conditions in the original query

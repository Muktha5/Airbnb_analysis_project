Airbnb Pricing and Demand Analysis Using SQL and Powerbi

Objective

Analyze Airbnb listing data to identify factors affecting pricing and demand.

---

Problem Statement

Understand how different factors such as location, room type, availability, reviews, and host behavior influence Airbnb listing performance.

---

Tools Used

- SQL
- BigQuery / MySQL
- Power BI (optional)

---

Dataset Overview

The dataset contains Airbnb listings with the following fields:

- id
- name
- host_id
- neighbourhood
- room_type
- price
- availability_365
- number_of_reviews
- review_scores_rating
- host_is_superhost

---

Business Questions

1. How does price vary across room types?
2. Which neighbourhoods are most expensive?
3. Does availability affect pricing?
4. Do higher-rated listings have higher prices?
5. Which listings have the most reviews?
6. Do some hosts manage multiple listings?
7. What are the common price ranges?
8. Do superhosts charge higher prices?

---

Key Insights

- Entire homes have higher prices compared to private and shared rooms.
- Location plays a major role in determining price.
- Listings with lower availability tend to have higher prices.
- Higher-rated listings show slightly higher pricing trends.
- A small number of hosts manage multiple listings.
- Most listings fall under mid-range pricing.
- Superhosts tend to have slightly higher prices.

---

Project Structure

airbnb-analysis-project/
│
├── sql/
│   └── queries.sql
├── dashboard/
├── README.md

---

How to Use

1. Load dataset into SQL environment.
2. Run queries from queries.sql file.
3. Analyze the output.

---

Conclusion

This project demonstrates how SQL can be used to analyze real-world data and extract insights related to pricing and demand.

---

Author

Muktha R

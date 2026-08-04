# Food Order Dataset Profiling

## Source
FoodHub food_order.csv

## Row Count
1,888 records

## Initial Grain Assumption
One row represents one customer order.

## Potential Primary Key
order_id

## Initial Facts
- cost_of_the_order
- rating
- food_preparation_time
- delivery_time

## Initial Dimensions
- customer_id
- restaurant_name
- cuisine_type
- day_of_the_week

## Questions
- Are order IDs unique?
- Are there duplicate customers?
- Should restaurant and cuisine become separate dimensions?
- Are ratings considered facts or customer attributes?

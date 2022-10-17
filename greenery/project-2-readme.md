# Jai Paton's Week 2 Submission

## Question 1:

### Prompt:

What is our user repeat rate?

### Query:
```sql
with init_sel as (
    select
        user_guid,
        case
            when count(order_guid) >= 2 then '2+ Orders'
            else '1 Order'
        end as order_bucket,
        count(order_guid) as order_count
    from stg_greenery_orders
    group by 1
)
select
    avg((select count( user_guid) from init_sel where order_bucket = '2+ Orders' ) / (select count( user_guid) from init_sel)) as pct_repeat_user
from init_sel

```


### Answer:
79.8% Repeat Rate
(99/124)

## Question 2:

### Prompt:
1. What are good indicators of a user who will likely purchase again? 
2. What about indicators of users who are likely NOT to purchase again?
3. If you had more data, what features would you want to look into to answer this question? 

### Answer:
1. Repeat rate is one, but even just those who revisit the site after making an order. Could also see if other users used a promotional code (referral code) from another purchaser. Could be an indicator of positive brand & further intent to buy.
2. Single-buyers could be identified by specific products or product types that are commonly only purchased once. 
3. I would be keen to see if there were any feedback touchpoints with the customers as well. Did they respond well to NPS or post-purchase surveys? Did they write a positive or negative review for their order? Did they have to return an item? 


## Tests:

High level I would plan on ensuring that the dbt models & tests are built automatically on a recurring basis (daily) and any failed tests will be pushed into an alerts channel.


## Snapshots:
Some orders have changed status. 
Specifically, three orders were updated

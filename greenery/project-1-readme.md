# Jai Paton's Week 1 Submission

## Question 1:

### Prompt:

How many users do we have? 

### Query:

    `Select count(USER_GUID)
    from 
    stg_greenery_users`

### Answer:

    Users - 130


## Question 2:

### Prompt:

    On average, how many orders do we receive per hour?

### Query:

    `with
    orders_per_hour as (
        select 
            date_trunc('HOUR', created_at_utc) as created_at_hour_utc,
            count(order_guid) as order_count 
        from stg_greenery_orders
        group by 1
    )
    select 
    avg(order_count)
    from orders_per_hour`

### Answer:

    Average orders per hour - 7.52

## Question 3:

### Prompt:

    On average, how long does an order take from being placed to being delievered? 

### Query:

    `select
        avg(datediff('DAY', created_at_utc , delivered_at_utc)) as completion_duration_day,
        avg(datediff('HOUR', created_at_utc , delivered_at_utc)) as completion_duration_hour
    from stg_greenery_orders`

### Answer:

    On average it takes 3.9 days or 93.4 hours for an order to be delivered after it was created


## Question 4:

### Prompt:

    How many users have only made one purchase? Two purchases? Three+ purchases? 

### Query: 

    `with init_sel as (
    select
        user_guid,
        case 
            when count(order_guid) = 1 then 'One Order'
            when count(order_guid) = 2 then 'Two Orders'
            when count(order_guid) >= 3 then 'Three+ Orders'
            else 'Error'
            end as order_count_group,
        COUNT(ORDER_GUID) AS order_count
    from stg_greenery_orders  
    group by 1
    )
    select 
        order_count_group,
        count(USER_GUID)
    from init_sel
    group by 1`

### Answer: 

    One Order - 25 Users
    Two Orders - 28
    Three + Orders - 71

## Question 5: 

### Prompt:

    On average, how many unique sessions do we have per hour? 

### Query:

    `with
    sessions_per_hour as (
        select 
            date_trunc('HOUR', created_at_utc) as created_at_hour_utc,
            count(user_guid) as user_session_count 
        from stg_greenery_events
        group by 1
    )
    select 
    avg(user_session_count) as sessions_per_hour
    from sessions_per_hour`

### Answer:

On average there are 61.25 unique sessions per hour
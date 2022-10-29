# Jai Paton's Week 3 Submission

## Question 1:

### Prompt:

Which orders changed from Week 3 to Week 4?


### Query: 
```sql
    select
    * from 
    dev_db.dbt_jaipaton.snapshot_orders
    where dbt_valid_from > '2022-10-28'
```

### Answer:
aafb9fbd-56e1-4dcc-b6b2-a3fd91381bb6

d1020671-7cdf-493c-b008-c48535415611

38c516e8-b23a-493a-8a5c-bf7b2b9ea995

All were shipping status updates. 


## Question 2:

### Prompt:

What is the number of sessions for each product funnel step? 
1. Sessions with any event of type page_view
2. Sessions with any event of type add_to_cart
3. Sessions with any event of type checkout


### Query: 

```sql
    select
    count( 
        distinct
            case when (page_views + add_to_carts + checkouts) > 0 then event_session_guid else null end)
        as top_funnel_count,
        
    count( 
        distinct
            case when (add_to_carts + checkouts) > 0 then event_session_guid else null end)
        as mid_funnel_count,
        
    count( 
        distinct
            case when (checkouts) > 0 then event_session_guid else null end)
        as bottom_funnel_count
    from DEV_DB.DBT_JAIPATON.FACT_SESSION_AGG
```

### Answer: 
page_view: 578
add_to_cart: 467
checkout: 361


## Question 3A:

### Prompt:
"if you are thinking about moving to analytics engineering, what skills have you picked that give you the most confidence in pursuing this next step?"

### Answer: 
I am in the process of applying for an internal transfer at my company, Handshake, to join the Analytics Engineering team. 
This course has given me a strong, practical foundation in dbt which gives me the confidence to hit the ground running in any future role. 
Specifically, the conceptual understanding of what dbt is and how it functions is going to be powerful in the future. Tactical execution can be learned on the spot, but high-level concepts and best practices are going to be a key foundation. 


## Question 3B:

### Prompt:
" how would you go about setting up a production/scheduled dbt run of your project in an ideal state?"

### Answer: 
I like Emily's example of using DAGster at Drizly. 
Ultimately, some tool that can automate the execution of builds and log metadata should get the job done. 
For my part, that'll depend on the existing team's structure, but the info I've learned here can help inform future decisions with a fresh perspective. 

## Final Note:

Thank you to all the instructors and peer reviewers (that means you)! 

Glad to have done this short course with you all and I hope to see you in future lessons or in the wild. 
Feel free to connect with me on LinkedIn 
https://www.linkedin.com/in/jaipaton/

Cheers! 

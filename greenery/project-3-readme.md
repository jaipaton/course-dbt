
# Jai Paton's Week 3 Submission

## Question 1:

### Prompt:

What is our overall conversion rate?

### Query:

```sql
select 
    (select count(distinct event_session_guid) from DEV_DB.DBT_JAIPATON.FACT_SESSION_PRODUCTS where event_order_id is not null)/ count(distinct event_session_guid) as conv_rate

from DBT_JAIPATON.FACT_SESSION_PRODUCTS
```

### Answer:
62.5%

## Question 2:

### Prompt:
What is our conversion rate by product? 
### Query:
```sql
    WITH 

    INIT_SEL AS (
    SELECT
        EVENT_SESSION_GUID,
        first_value(ORDER_GUID) OVER (PARTITION BY EVENT_SESSION_GUID ORDER BY ORDER_GUID ASC) AS EVENT_ORDER_ID_FILL,
        PRODUCT_GUID,
        PRODUCT_NAME
    FROM FACT_SESSION_PRODUCTS
    ),

    ORDER_SEL AS (

    SELECT
    PRODUCT_NAME,
    PRODUCT_GUID,
    EVENT_SESSION_GUID

    FROM INIT_SEL
    WHERE EVENT_ORDER_ID_FILL IS NOT NULL 
    GROUP BY 1,2,3)

    SELECT
    ISEL.PRODUCT_NAME,
    (COUNT(DISTINCT OSEL.EVENT_SESSION_GUID)/COUNT(DISTINCT ISEL.EVENT_SESSION_GUID))*100 AS PROD_CONV_RATE

    FROM INIT_SEL AS ISEL
    LEFT JOIN ORDER_SEL AS OSEL ON ISEL.EVENT_SESSION_GUID = OSEL.EVENT_SESSION_GUID AND ISEL.PRODUCT_GUID = OSEL.PRODUCT_GUID
    GROUP BY 1
```
### Answer:
Multiple values - Examples: 
    - String of Pearls: 89%
    - Arrow Head: 79%
    - Pilea Peperomioides: 74.6%

## Question 3:

### Prompt:
Which orders changed from Week 2 to Week 3?

### Answer:
Orders of ID:
e24985f3-2fb3-456e-a1aa-aaf88f490d70
5741e351-3124-4de7-9dff-01a448e7dfd4
8385cfcd-2b3f-443a-a676-9756f7eb5404

All with updated tracking information & shipping status.
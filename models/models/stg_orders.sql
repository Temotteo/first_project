with source as (

    select
        ORDER_ID            as order_id,
        CUSTOMER_ID         as customer_id,
        try_to_timestamp(ORDER_TS) as order_timestamp,
        lower(ORDER_STATUS) as order_status,
        try_to_number(ORDER_TOTAL) as order_total
    from {{ source('raw', 'TABLETEST') }}

),

cleaned as (

    select
        order_id,
        customer_id,
        order_timestamp,
        order_status,
        order_total
    from source
    where order_id is not null

)

select * from cleaned

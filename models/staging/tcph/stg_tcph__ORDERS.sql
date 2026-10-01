{{
    config(
        materialized='incremental',
        unique_key='o_orderkey'
    )
}}

with source as (

    select
        o_orderkey,         -- id, pk
        o_custkey,          -- relationship with customer??
        o_orderstatus,      -- accepted values(F, O, P)
        o_totalprice,       -- float
        o_orderdate,        -- date
        o_orderpriority,    -- accepted values(1-URGENT, 2-HIGH, 3-MEDIUM, 4-NOT SPECIFIED, 5-LOW)
        o_clerk,            -- 
        o_shippriority,     -- int
        o_comment           -- string

    from {{ source('tcph', 'ORDERS') }}

),

{% if is_incremental() %}

active_orders as (

    select
        o_orderkey

    from {{ this }}

    where o_orderstatus in ('O', 'P')

),

max_order as (

    select
        max(o_orderkey) as max_orderkey

    from {{ this }}

),

{% endif %}

renamed as (

    select
        o_orderkey,         -- id, pk
        o_custkey,          -- relationship with customer??
        o_orderstatus,      -- accepted values(F, O, P)
        o_totalprice,       -- float
        o_orderdate,        -- date
        o_orderpriority,    -- accepted values(1-URGENT, 2-HIGH, 3-MEDIUM, 4-NOT SPECIFIED, 5-LOW)
        o_clerk,            -- 
        o_shippriority,     -- int
        o_comment           -- string

    from source

    {% if is_incremental() %}

    where
        o_orderkey > (
            select max_orderkey
            from max_order
        )

        or

        o_orderkey in (
            select o_orderkey
            from active_orders
        )

    {% endif %}

)

select *
from renamed

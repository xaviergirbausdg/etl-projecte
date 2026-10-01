with 

source as (

    select * from {{ source('tcph', 'ORDERS') }}

),

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

)

select * from renamed
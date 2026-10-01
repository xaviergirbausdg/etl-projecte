with 

source as (

    select * from {{ source('tcph', 'LINEITEM') }}

),

renamed as (

    select
        l_orderkey,         -- relationship with orders
        l_partkey,          -- relationship with part
        l_suppkey,          -- 
        l_linenumber,       -- 
        l_quantity,         -- just a float that could be an int
        l_extendedprice,    -- float
        l_discount,         -- float
        l_tax,              -- float
        l_returnflag,       -- accepted values(N, R, A)
        l_linestatus,       -- accepted values(F, O)
        l_shipdate,         -- date
        l_commitdate,       -- date
        l_receiptdate,      -- date
        l_shipinstruct,     -- accepted values(NONE, COLLECT COD, DELIVER IN PERSON, TAKE BACK RETURN)
        l_shipmode,         -- accepted values(SHIP, REG AIR, MAIL, AIR, RAIL, TRUCK, FOB)
        l_comment           -- string

    from source

)

select * from renamed
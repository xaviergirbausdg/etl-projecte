with 

source as (

    select * from {{ source('tcph', 'CUSTOMER') }}

),

renamed as (

    select
        c_custkey,      -- id, pk
        c_name,         -- just a string
        c_address,      -- just a string
        c_nationkey,    -- relationship with nation
        c_phone,        -- just a string
        c_acctbal,      -- just a float
        c_mktsegment,   -- list of accepted values (HOUSEHOLD, BUILDING, AUTOMOBILE, MACHINERY, FURNITURE)
        c_comment       -- just a string

    from source

)

select * from renamed
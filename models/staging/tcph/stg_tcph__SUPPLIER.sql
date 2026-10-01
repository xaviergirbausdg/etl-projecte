with 

source as (

    select * from {{ source('tcph', 'SUPPLIER') }}

),

renamed as (

    select
        s_suppkey,      -- id, pk
        s_name,         -- string (probably not unique)
        s_address,      -- string
        s_nationkey,    -- relationship with nation
        s_phone,        -- string
        s_acctbal,      -- float
        s_comment       -- string

    from source

)

select * from renamed
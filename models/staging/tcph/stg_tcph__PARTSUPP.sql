with 

source as (

    select * from {{ source('tcph', 'PARTSUPP') }}

),

renamed as (

    select
        ps_partkey,     -- relationship with part
        ps_suppkey,     -- relationship with supplier
        ps_availqty,    -- int
        ps_supplycost,  -- float
        ps_comment      -- string

    from source

)

select * from renamed
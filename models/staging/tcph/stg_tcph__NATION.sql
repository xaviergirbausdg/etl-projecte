with 

source as (

    select * from {{ source('tcph', 'NATION') }}

),

renamed as (

    select
        n_nationkey,    -- id, pk
        n_name,         -- not null maybe unique??
        n_regionkey,    -- relationship with region
        n_comment       -- string

    from source

)

select * from renamed
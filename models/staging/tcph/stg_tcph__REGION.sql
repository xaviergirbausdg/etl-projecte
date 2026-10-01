with 

source as (

    select * from {{ source('tcph', 'REGION') }}

),

renamed as (

    select
        r_regionkey,    -- id, pk
        r_name,         -- not null maybe unique??
        r_comment       -- string

    from source

)

select * from renamed
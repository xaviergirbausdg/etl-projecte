with 

source as (

    select * from {{ source('tcph', 'NATION') }}

),

renamed as (

    select
        n_nationkey,
        n_name,
        n_regionkey,
        n_comment

    from source

)

select * from renamed
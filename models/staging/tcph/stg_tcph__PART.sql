with 

source as (

    select * from {{ source('tcph', 'PART') }}

),

renamed as (

    select
        p_partkey,      -- id, pk
        p_name,         -- string (is it unique??)
        p_mfgr,         -- relationship??, else string
        p_brand,        -- relationship??, else string
        p_type,         -- accepted values??, else string
        p_size,         -- int
        p_container,    -- accepted values??, else string
        p_retailprice,  -- float
        p_comment       -- string

    from source

)

select * from renamed
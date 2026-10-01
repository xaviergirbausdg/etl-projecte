with 

source as (

    select * from {{ source('tcph', 'PART') }}

),

renamed as (

    select
        p_partkey,      -- id, pk
        p_name,         -- string (is it unique??)
        p_mfgr,         -- string
        p_brand,        -- string
        p_type,         -- accepted values??, else string (could be divided into size, type, color)
        p_size,         -- int
        p_container,    -- accepted values??, else string (could be divided into type, size)
        p_retailprice,  -- float
        p_comment       -- string

    from source

)

select * from renamed
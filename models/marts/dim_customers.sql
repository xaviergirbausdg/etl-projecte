select C_CUSTKEY,
    C_NAME,
    C_ADDRESS,
    C_PHONE,
    C_ACCTBAL,
    C_MKTSEGMENT,
    C_COMMENT,
    N_NAME,
    N_COMMENT,
    R_NAME,
    R_COMMENT
from {{ ref('stg_tcph__CUSTOMER') }} as c
    join {{ ref('stg_tcph__NATION') }} as n on C_NATIONKEY = N_NATIONKEY
    join {{ ref('stg_tcph__REGION') }} as r on N_REGIONKEY = R_REGIONKEY

select S_SUPPKEY,
    S_NAME,
    S_ADDRESS,
    S_PHONE,
    S_ACCTBAL,
    S_COMMENT,
    N_NAME,
    N_COMMENT,
    R_NAME,
    R_COMMENT
from {{ ref('stg_tcph__SUPPLIER') }} as s
    join {{ ref('stg_tcph__NATION') }} as n on S_NATIONKEY = N_NATIONKEY
    join {{ ref('stg_tcph__REGION') }} as r on N_REGIONKEY = R_REGIONKEY
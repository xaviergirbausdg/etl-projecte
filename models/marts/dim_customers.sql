select c.C_CUSTKEY,
    c.C_NAME,
    c.C_ADDRESS,
    c.C_PHONE,
    c.C_ACCTBAL,
    c.C_MKTSEGMENT,
    c.C_COMMENT,
    n.N_NAME,
    n.N_COMMENT,
    r.R_NAME,
    r.R_COMMENT
from {{ ref('stg_tcph__CUSTOMER') }} as c
    join {{ ref('stg_tcph__NATION') }} as n on c.C_NATIONKEY = n.N_NATIONKEY
    join {{ ref('stg_tcph__REGION') }} as r on n.N_REGIONKEY = r.R_REGIONKEY

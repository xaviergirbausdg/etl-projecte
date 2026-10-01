select
    -- PK
    O_ORDERKEY as orderkey,
    L_LINENUMBER as linenumber,

    -- FK
    O_CUSTKEY as custkey,
    L_PARTKEY as partkey,
    L_SUPPKEY as suppkey,

    -- Dates (we link them to dim_date)
    to_number(to_char(O_ORDERDATE, 'YYYYMMDD')) as orderdate_key,
    to_number(to_char(L_SHIPDATE, 'YYYYMMDD')) as shipdate_key,
    to_number(to_char(L_COMMITDATE, 'YYYYMMDD')) as commitdate_key,
    to_number(to_char(L_RECEIPTDATE, 'YYYYMMDD')) as receiptdate_key,

    --O_ORDERDATE as orderdate,
    --L_SHIPDATE as shipdate,
    --L_COMMITDATE as commitdate,
    --L_RECEIPTDATE as receiptdate,

    -- Measures
    L_QUANTITY as quantity,
    L_EXTENDEDPRICE as extendedprice,
    L_DISCOUNT as discount,
    L_TAX as tax,

    L_EXTENDEDPRICE * (1 - L_DISCOUNT) as netamount,
    L_EXTENDEDPRICE * (1 - L_DISCOUNT) * (1 + L_TAX) as totalamount,

    O_TOTALPRICE,

    -- Others from orders
    O_ORDERSTATUS as orderstatus,
    O_ORDERPRIORITY as orderpriority,
    O_SHIPPRIORITY as shippriority,
    O_CLERK,

    -- Others from LineItem
    L_RETURNFLAG as returnflag,
    L_LINESTATUS as linestatus,
    L_SHIPINSTRUCT as shipinstruct,
    L_SHIPMODE as shipmode


    -- Maybe unnecessary
    --O_TOTALPRICE,
    --O_COMMENT,

    --L_COMMENT,

    --PS_AVAILQTY,
    --PS_SUPPLYCOST,
    --PS_COMMENT
from {{ ref('stg_tcph__ORDERS') }} as o
    join {{ ref('stg_tcph__LINEITEM') }} as l on o_orderkey = l_orderkey
    --join {{ ref('stg_tcph__PARTSUPP') }} as ps on ps_partkey = l_partkey and ps_suppkey = l_suppkey



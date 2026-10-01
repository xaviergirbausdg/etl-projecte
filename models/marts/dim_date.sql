/*
OLD_CODE (STATIC VERSION for 3000 rows)

with date_spine as (

    select
        dateadd(
            day,
            seq4(),
            '1992-01-01'::date
        ) as date_day
    from table(generator(rowcount => 3000))

)

select
    date_day as date_key,
    date_day,
    year(date_day) as year,
    quarter(date_day) as quarter,
    month(date_day) as month,
    monthname(date_day) as month_name,
    day(date_day) as day,
    dayofweek(date_day) as day_of_week

from date_spine
*/

{{
    config(
        materialized='incremental',
        unique_key='date_key'
    )
}}

with date_spine as (

    select
        dateadd(
            day,
            seq4(),
            '1992-01-01'::date
        ) as date_day

    from table(
        generator(rowcount => 100000)
    )

),

dates as (

    select
        date_day

    from date_spine

    where date_day <= current_date() + 365

    {% if is_incremental() %}

        and date_day > (
            select max(date)
            from {{ this }}
        )

    {% endif %}

)

select
    to_number(to_char(date_day, 'YYYYMMDD')) as date_key,
    date_day as date,
    year(date_day) as year,
    quarter(date_day) as quarter,
    month(date_day) as month,
    monthname(date_day) as month_name,
    day(date_day) as day,
    dayofweek(date_day) as day_of_week

from dates




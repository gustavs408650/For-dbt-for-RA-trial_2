{{
  config(
    materialized = "table"
  )
}}

with users as (
    select * from {{ ref('stg_bigquery_sample_questions_users') }}
),

final as (
    select user_id,
        user_display_name,
        user_creation_date,   
        location,
        reputation     
    from users
)

select * from final
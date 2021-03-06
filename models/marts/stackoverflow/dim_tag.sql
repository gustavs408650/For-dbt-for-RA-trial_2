{{
  config(
    materialized = "table"
  )
}}

with tags as (
    select * from {{ ref('stg_bigquery_sample_questions_tags') }}
),

final as (
    select 
    tag_id,
    tag_name
    from tags
)

select * from final
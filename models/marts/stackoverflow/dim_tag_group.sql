{{
  config(
    materialized = "table"
  )
}}

with questions as (
    select * from {{ ref('stg_bigquery_sample_questions_posts') }}
),

final as (
    select distinct
    tags as tag_group_key,
    length(tags) - length(replace(tags,'|','')) +1 as count_of_tags                  
    from questions
)

select * from final
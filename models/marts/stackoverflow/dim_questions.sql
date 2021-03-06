{{
  config(
    materialized = "table"
  )
}}

with questions as (
    select * from {{ ref('stg_bigquery_sample_questions_posts') }}
),

final as (
    select question_id,
        question_title,
        question_creation_date,        
        last_activity_date,
        has_accepted_answer        
    from questions
)

select * from final
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
        tags as tag_group_key,
        user_id,        
        view_count,
        answer_count,
        comment_count,
        favorite_count,
        score
    from questions
)

select * from final
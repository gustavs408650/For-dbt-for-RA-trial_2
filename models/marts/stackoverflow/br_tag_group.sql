{{
  config(
    materialized = "table"
  )
}}

with questions as (
    select * from {{ ref('stg_bigquery_sample_questions_posts') }}
),

tags as (
    select * from {{ ref('stg_bigquery_sample_questions_tags') }}
),

final as (
    select distinct
    questions.tags as tag_group_key,
    tag as tag_name,
    tags.tag_id
    from questions,
    unnest(split(tags, '|')) tag
    inner join tags on tag = tags.tag_name
)

select * from final
with source as (
    
    select * from {{ source('bigquery_sample_questions', 'stackoverflow_posts') }}
    
),

renamed as (
    
    select
        id as question_id,
        owner_user_id as user_id,
        title as question_title,
        cast(creation_date AS DATE) AS question_creation_date,        
        cast(last_activity_date AS DATE) AS last_activity_date,
        tags,
        accepted_answer_id is not null as has_accepted_answer,
        view_count,
        answer_count,
        comment_count,
        favorite_count,
        score
    from source

)

select * from renamed
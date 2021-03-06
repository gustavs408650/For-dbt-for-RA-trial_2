with source as (
    
    select * from {{ source('bigquery_sample_questions', 'users') }}
    
),

renamed as (
    
    select
        id as user_id,
        display_name as user_display_name,
        cast(creation_date AS DATE) AS user_creation_date,   
        location,
        reputation
    from source

)

select * from renamed
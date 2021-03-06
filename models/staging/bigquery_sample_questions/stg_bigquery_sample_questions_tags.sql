with source as (
    
    select * from {{ source('bigquery_sample_questions', 'tags') }}
    
),

renamed as (
    
    select
        id as tag_id,
        tag_name
    from source

)

select * from renamed
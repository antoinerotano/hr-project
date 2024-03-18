with 

source as (

    select * from {{ source('dataset', 'manager_survey_data') }}

),

renamed as (

    select
        employeeid,
        jobinvolvement,
        performancerating

    from source

)

select * from renamed

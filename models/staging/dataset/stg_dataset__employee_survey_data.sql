with 

source as (

    select * from {{ source('dataset', 'employee_survey_data') }}

),

renamed as (

    select
        employeeid,
        environmentsatisfaction,
        jobsatisfaction,
        worklifebalance

    from source

)

select * from renamed

with 

source as (

    select * from {{ source('dataset', 'df_global') }}

),

renamed as (

    select
        age,
        attrition,
        businesstravel,
        department,
        distancefromhome,
        education,
        educationfield,
        employeeid,
        joblevel,
        jobrole,
        maritalstatus,
        monthlyincome,
        numcompaniesworked,
        percentsalaryhike,
        stockoptionlevel,
        totalworkingyears,
        trainingtimeslastyear,
        yearsatcompany,
        yearssincelastpromotion,
        yearswithcurrmanager,
        totalworkinghours,
        averagehoursperday

    from source

)

select * from renamed

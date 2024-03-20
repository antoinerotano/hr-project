with 

source as (

    select * from {{ source('dataset', 'df_all') }}

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
        averagehoursperday,
        numberofdaysabsent,
        employeeid_23,
        jobinvolvement,
        performancerating,
        employeeid_26,
        environmentsatisfaction,
        jobsatisfaction,
        worklifebalance

    from source

)

select * from renamed

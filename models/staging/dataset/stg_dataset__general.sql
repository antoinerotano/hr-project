with 

source as (

    select * from {{ source('dataset', 'general') }}

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
        employeecount,
        employeeid,
        gender,
        joblevel,
        jobrole,
        maritalstatus,
        monthlyincome,
        numcompaniesworked,
        over18,
        percentsalaryhike,
        standardhours,
        stockoptionlevel,
        totalworkingyears,
        trainingtimeslastyear,
        yearsatcompany,
        yearssincelastpromotion,
        yearswithcurrmanager

    from source

)

select * from renamed

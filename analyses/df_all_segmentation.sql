SELECT
    *,
    CASE
        WHEN ROUND((environmentsatisfaction + jobsatisfaction + worklifebalance)/3.0) = 3 THEN 'Passive'
        WHEN ROUND((environmentsatisfaction + jobsatisfaction + worklifebalance)/3.0) = 4 THEN 'Promoter'
        ELSE 'Detractor'
    END AS NPS_employee,

    CASE
        WHEN ROUND((jobinvolvement + performancerating)/2.0) = 3 THEN 'Passive'
        WHEN ROUND((jobinvolvement + performancerating)/2.0) = 4 THEN 'Promoter'
        ELSE 'Detractor'
    END AS NPS_manager,

    CASE
        WHEN age >= 70 THEN 'Silent Generation'
        WHEN age BETWEEN 51 AND 69 THEN 'Baby Boomers'
        WHEN age BETWEEN 35 AND 50 THEN 'Generation X'
        WHEN age BETWEEN 19 AND 34 THEN 'Millennials'
        WHEN age BETWEEN 3 AND 18 THEN 'Generation Z'
        ELSE 'Unspecified'
    END AS generation,

    CASE
        WHEN totalworkingyears <= 5 THEN 'Beginner'
        WHEN totalworkingyears > 5 AND totalworkingyears <= 10 THEN 'Experienced'
        WHEN totalworkingyears > 10 AND totalworkingyears <= 20 THEN 'Advanced'
        WHEN totalworkingyears > 20 AND totalworkingyears <= 30 THEN 'Expert'
        WHEN totalworkingyears > 30 THEN 'Veteran'
        ELSE 'Unspecified'
    END AS ExperienceCategory,

    IF(averagehoursperday > 480, TRUE, FALSE) AS overtime,

    CASE
        WHEN DistanceFromHome BETWEEN 1 AND 2 THEN 'Very Close'
        WHEN DistanceFromHome BETWEEN 3 AND 7 THEN 'Close'
        WHEN DistanceFromHome BETWEEN 8 AND 14 THEN 'Far'
        WHEN DistanceFromHome > 14 THEN 'Very Far'
        ELSE 'Unspecified'
    END AS DistanceCategory,

    CASE
        WHEN NumberOfDaysAbsent <= 8 THEN 'Low'
        WHEN NumberOfDaysAbsent > 8 AND NumberOfDaysAbsent <= 13 THEN 'Moderate'
        WHEN NumberOfDaysAbsent > 13 AND NumberOfDaysAbsent <= 17 THEN 'High'
        WHEN NumberOfDaysAbsent > 17 THEN 'Very High'
        ELSE 'Unspecified'
    END AS AbsenteeismCategory,

    CASE
        WHEN AverageHoursPerDay < (480 - 79.64) THEN 'Significantly Below' 
        WHEN AverageHoursPerDay < 480 THEN 'Below' 
        WHEN AverageHoursPerDay = 480 THEN 'Exact' 
        WHEN AverageHoursPerDay <= (480 + 79.64) THEN 'Above' 
        WHEN AverageHoursPerDay > (480 + 79.64) THEN 'Significantly Above' 
        ELSE NULL
    END AS WorkTimeCategory
    
FROM {{ ref('stg_dataset__df_all') }}

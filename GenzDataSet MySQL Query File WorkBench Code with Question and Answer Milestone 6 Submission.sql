use genzdataset;

show tables;

select * from learning_aspirations;
select * from manager_aspirations;
select * from mission_aspirations;
select * from personalized_info;

SELECT
    COALESCE(t1.ResponseID, t2.ResponseID, t3.ResponseID, t4.ResponseID) AS ResponseID,
    t1.CareerInfluenceFactor,
    t1.HigherEducationAbroad,
    t1.PreferredWorkingEnvironment,
    t1.ZipCode AS ZipCode_t1,
    t1.ClosestAspirationalCareer,
    
    t2.WorkLikelihood3Years,
    t2.PreferredEmployer,
    t2.PreferredManager,
    t2.PreferredWorkSetup,
    t2.WorkLikelihood7Years,
    
    t3.MissionUndefinedLikelihood,
    t3.MisalignedMissionLikelihood,
    t3.NoSocialImpactLikelihood,
    t3.LaidOffEmployees,
    t3.ExpectedSalary3Years,
    t3.ExpectedSalary5Years,
    
    t4.CurrentCountry,
    t4.ZipCode AS ZipCode_t4,
    t4.Gender
    
FROM
    learning_aspirations t1
LEFT JOIN manager_aspirations t2 ON t1.ResponseID = t2.ResponseID
LEFT JOIN mission_aspirations t3 ON t1.ResponseID = t3.ResponseID
LEFT JOIN personalized_info t4 ON t1.ResponseID = t4.ResponseID

UNION

SELECT
    COALESCE(t1.ResponseID, t2.ResponseID, t3.ResponseID, t4.ResponseID) AS ResponseID,
    t1.CareerInfluenceFactor,
    t1.HigherEducationAbroad,
    t1.PreferredWorkingEnvironment,
    t1.ZipCode AS ZipCode_t1,
    t1.ClosestAspirationalCareer,
    
    t2.WorkLikelihood3Years,
    t2.PreferredEmployer,
    t2.PreferredManager,
    t2.PreferredWorkSetup,
    t2.WorkLikelihood7Years,
    
    t3.MissionUndefinedLikelihood,
    t3.MisalignedMissionLikelihood,
    t3.NoSocialImpactLikelihood,
    t3.LaidOffEmployees,
    t3.ExpectedSalary3Years,
    t3.ExpectedSalary5Years,
    
    t4.CurrentCountry,
    t4.ZipCode AS ZipCode_t4,
    t4.Gender
    
FROM
    manager_aspirations t2
LEFT JOIN learning_aspirations t1 ON t1.ResponseID = t2.ResponseID
LEFT JOIN mission_aspirations t3 ON t2.ResponseID = t3.ResponseID
LEFT JOIN personalized_info t4 ON t2.ResponseID = t4.ResponseID

UNION

SELECT
    COALESCE(t1.ResponseID, t2.ResponseID, t3.ResponseID, t4.ResponseID) AS ResponseID,
    t1.CareerInfluenceFactor,
    t1.HigherEducationAbroad,
    t1.PreferredWorkingEnvironment,
    t1.ZipCode AS ZipCode_t1,
    t1.ClosestAspirationalCareer,
    
    t2.WorkLikelihood3Years,
    t2.PreferredEmployer,
    t2.PreferredManager,
    t2.PreferredWorkSetup,
    t2.WorkLikelihood7Years,
    
    t3.MissionUndefinedLikelihood,
    t3.MisalignedMissionLikelihood,
    t3.NoSocialImpactLikelihood,
    t3.LaidOffEmployees,
    t3.ExpectedSalary3Years,
    t3.ExpectedSalary5Years,
    
    t4.CurrentCountry,
    t4.ZipCode AS ZipCode_t4,
    t4.Gender
    
FROM
    mission_aspirations t3
LEFT JOIN learning_aspirations t1 ON t1.ResponseID = t3.ResponseID
LEFT JOIN manager_aspirations t2 ON t3.ResponseID = t2.ResponseID
LEFT JOIN personalized_info t4 ON t3.ResponseID = t4.ResponseID

UNION

SELECT
    COALESCE(t1.ResponseID, t2.ResponseID, t3.ResponseID, t4.ResponseID) AS ResponseID,
    t1.CareerInfluenceFactor,
    t1.HigherEducationAbroad,
    t1.PreferredWorkingEnvironment,
    t1.ZipCode AS ZipCode_t1,
    t1.ClosestAspirationalCareer,
    
    t2.WorkLikelihood3Years,
    t2.PreferredEmployer,
    t2.PreferredManager,
    t2.PreferredWorkSetup,
    t2.WorkLikelihood7Years,
    
    t3.MissionUndefinedLikelihood,
    t3.MisalignedMissionLikelihood,
    t3.NoSocialImpactLikelihood,
    t3.LaidOffEmployees,
    t3.ExpectedSalary3Years,
    t3.ExpectedSalary5Years,
    
    t4.CurrentCountry,
    t4.ZipCode AS ZipCode_t4,
    t4.Gender
    
FROM
    personalized_info t4
LEFT JOIN learning_aspirations t1 ON t1.ResponseID = t4.ResponseID
LEFT JOIN manager_aspirations t2 ON t4.ResponseID = t2.ResponseID
LEFT JOIN mission_aspirations t3 ON t4.ResponseID = t3.ResponseID;

select * from combined_table;





-- milestone 6 Questions --

-- Question 1: How many Male have responded to the survey from India--
select Count(*) as male from combined_table 
where Gender like 'Male%' 
AND CurrentCountry = 'India' 
 
-- Question 2: How many Female have responded to the survey from India --
 select Count(*) as Female from combined_table 
 where Gender like 'Female%' 
 AND CurrentCountry = 'India' 
 
 -- Question 3: How many of the Gen-Z are influenced by their parents in regards to their career choices from India --
select distinct(CareerInfluenceFactor), count(ResponseId) from combined_table  
where CareerInfluenceFactor = 'My Parents';
 
 -- Question 4: How many of the Female Gen-Z are influenced by their parents in regards to their career choices from India --
select count(ResponseId) from combined_table 
where CareerInfluenceFactor = 'My Parents' 
And Gender = 'Female\r';
 
 -- Question 5: How many of the Male Gen-Z are influenced by their parents in regards to their career choices from India --
select count(ResponseId) from combined_table 
where CareerInfluenceFactor = 'My Parents' 
And Gender = 'Male\r';

-- Question 6:How many of the Male and Female (individually display in 2 different columns, but as part of the same query) Gen-Z are influenced by their parents in regards to their career choices from India  --
Select distinct(gender),count(gender) from combined_table 
where CareerInfluenceFactor = 'My Parents' 
group by Gender;

-- Question 7: How many Gen-Z are influenced by Social Media and Influencers together from India --
SELECT CareerInfluenceFactor, COUNT(CareerInfluenceFactor) FROM combined_table 
WHERE (CareerInfluenceFactor = 'Social Media like LinkedIn' OR CareerInfluenceFactor = 'Influencers who had successful careers') 
AND CurrentCountry = 'India' 
GROUP BY CareerInfluenceFactor

-- Question 8: How many Gen-Z are influenced by Social Media and Influencers together, display for Male and Female seperately from India -- 
select distinct(Gender),count(CareerInfluenceFactor) from combined_table 
where CareerInfluenceFactor = 'Social Media like LinkedIn' OR CareerInfluenceFactor= 'Influencers who had successful careers' 
group by Gender;

-- Question 9: How many of the Gen-Z who are influenced by the social media for their career aspiration are looking to go abroad -- 
select count(CareerInfluenceFactor) from combined_table 
where CareerInfluenceFactor = 'Social Media like LinkedIn' 
And HigherEducationAbroad = 'Yes, I wil'

-- Question 10: How many of the Gen-Z who are influenced by "people in their circle" for career aspiration are looking to go abroad -- 
select distinct(CareerInfluenceFactor), count(CareerInfluenceFactor) from combined_table  
where HigherEducationAbroad = 'Yes, I wil' 
And CareerInfluenceFactor = 'People who have changed the world for better'
-- to search which city has the most number of applicant, so that we can focus on this city.
select Applicant_City, count(*)
from  Applicant_Address
group by Applicant_City;
-- to kwow the applicant and the associated abutters.
select A.Applicant_street, Ab.*
from Applicant_Address A left outer join Applicant_Abutter AA
     on A.Applicant_ID = AA.Applicant_ID
     left outer join Abutters Ab
     on AA.Abutter_Street_Address = Ab.Abutter_Street_Address;  
-- to know one abutter and the associated number of applicants, so that we can arrange the abutter's schedule.
select AA.Abutter_Street_Address,count(A.Applicant_street)
from Applicant_Address A left outer join Applicant_Abutter AA
     on A.Applicant_ID = AA.Applicant_ID
group by AA.Abutter_Street_Address;
-- 
-- which abutter and applicant are in the smae state, so that we can make following apllicant more easie.
select A.Applicant_street, AA.Abutter_Street_Address
from Applicant_Address A left outer join Applicant_Abutter AA
     on A.Applicant_ID = AA.Applicant_ID
     left outer join Abutters Ab
     on AA.Abutter_Street_Address = Ab.Abutter_Street_Address
where A.Applicant_State = Ab.Abutter_State;
-- to find top 10 applicant in the Applicant data list in MA
select Applicant_ID
from Applicant_Address
where applicant_state = 'MA'
      and rownum<10 ;

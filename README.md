# RAMS  

##### 6th September 2016  

### OVERVIEW  
Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper.   

### GOALS  
Lorem ipsum dolor sit amet, co
nsectetuer adipiscing elit
Sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.  

### SPECIFICATIONS    

#### Company  
* Logs into Agency portal  
* Post Job Listings  
* Company Profile  
* Short-list Criteria, Skills, aggregate, number of candidates, Select college or pool   
* Schedule Tests, Interviews, Presentation  
* Browse short-listed candidates  

#### Agency  
* Get Companies  
* Get Candidates  
* Shortlist Candidates for companies  
* Agency admin portal  
* Mail Notification candidates and company  
* Pagination of candidates  
* Company Ratings   

#### Candidates  
* Register  
* Give test  
* Receive Notification [Mail* or in any other form]   
* Review Company Rating  
* Profile  
* Job Expectation  
* Apply and Search for Jobs**   

### Workflow
#### Company
* Sign-up/ Logs into RAMS portal [Company login]
* Create its Profile
* Tell RAMS to Start Recruitment Procedure
* Select Criteria of short-listing
* Schedule Test, Interviews and Presentation
* Job Posting**

#### Candidates
* Sign-up/ login into RAMS portal [Candidate login]
* Create his profile
* Available/ Unavailable to get JOB
* Give Test
* Receive Notification [Mail* or in any other form]
* Rate overall Recruitment Procedure
* Review given only by candidates gone through interview procedure
* Apply JOB**

#### RAMS
* Has Admin Portal
* Companies register to RAMS
* Candidates register to RAMS
* Start Recruitment for specific company
* Short-list candidates according to criteria provided by company
* Provide pagination
* Has Company Ratings and [Reviews**]
* Provide Notification to Candidates and Company [mail* or in any other form]

#### RAMS Admin
* Can view Companies
* Can view Candidates
* Approve Company registration
* lead stage opportunity, incoming ,prospect   staging

### DATABASE DESIGN
* Company Profile
  * name
  * location
  * type of company [ startup / incorporation / MNC / LLC ]
  * logo
  * url
  * info / desc
  * tagline
  * contact{phone number,email}
  * number of employees
* Job Openings
  * title
  * type
  * description
  * number of positions
  * status [in-progress / stopped]
  * ctc
  * location [ remote available or not ]
  * criteria
    * experience
    * skills[]
    * qualification[]
* Skills
  * name
* Qualification/ education
  * name
* Schedule
  * event type [ interview or presentation ]
  * date
  * time
  * location
* Location
  * city
  * street_name
  * street_address
  * building_name
  * building_number
  * zip_code
  * state
  * country
  * latitude
  * longitude

* Candidate profile
  * status [ seeker / non-seeker]
  * Personal details {name
  * DOB
  * gender
  * email
  * marital status
  * languages}
  * summary
  * qualification[]
  * links
  * skills[]
  * projects[]
  * interests
  * experience[]
  * references[]
  * achievements
* Links
  * type [linkedin/github/codechef/hackerrank/etc]
  * url
* Projects
  * name
  * description
  * technologies used
  * recognition
  * links 
  * duration [start_date,end_date]
  * teammates
* Experience
  * type [full time/part time/internship]
  * duration [start_date,end_date]
  * location
  * employers
  * description
* RAMS 
  * companies []
  * candidates []
  * company_id + rating + counter
  * company_ratings []
  * Admin []



### MILESTONES  
Lorem Ipsum
Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
Dolor Sit Amet
Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.

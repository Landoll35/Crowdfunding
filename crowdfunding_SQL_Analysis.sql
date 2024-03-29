-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT cam.backers_count, cam.cf_id, cam.outcome
FROM campaign as cam
WHERE (cam.outcome = 'live')
ORDER BY cam.backers_count DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT COUNT (bac.cf_id), bac.cf_id
FROM backers as bac
GROUP BY bac.cf_id
ORDER BY COUNT(bac.cf_id) DESC;



-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT con.first_name, con.last_name, con.email, (cam.goal - cam.pledged) as remaining_goal_amount 
INTO email_contacts_remaining_goal_amount
FROM campaign as cam
INNER JOIN contacts as con
ON (cam.contact_id = con.contact_id)
WHERE (cam.outcome = 'live')
ORDER BY remaining_goal_amount DESC;



-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT bac.email, bac.first_name, bac.last_name, cam.cf_id, cam.company_name, cam.description, (cam.goal - cam.pledged) as left_of_goal 
INTO email_backers_remaining_goal_amount
FROM campaign as cam
INNER JOIN backers as bac
ON (cam.cf_id = bac.cf_id)
WHERE (cam.outcome = 'live')
ORDER BY bac.last_name, bac.email;



-- Check the table
SELECT * FROM email_backers_remaining_goal_amount;


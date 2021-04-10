

-- 1. retrive all the information from the cd.facilities table?
select * from cd.facilities;

-- 2. list out facility name and member cost 
SELECT name,membercost FROM cd.facilities;

-- 3. list of facilities that charge a fee to members ?
SELECT name FROM cd.facilities
WHERE membercost != 0;

-- 4. produce a list of facilities that charge a fee to members and that fee is less than 1/50 th of the monthly maintenance cost? 
SELECT facid,name,membercost,monthlymaintenance from cd.facilities
where membercost < monthlymaintenance/50 and 
membercost != 0;

-- 5. How can you produce a list of all facilities with the word 'Tennis' in their name? 
select * from cd.facilities
where name like '%Tennis%';

-- 6. retrive the details of facilities with id 1 and 5? with out using or operator
select name from cd.facilities
where facid in (1,5);

-- 7. produce a list of members who joined after the start of september 2012? return the memid, surname, firstname and joindate of the members in question 

select memid,surname,firstname,joindate from cd.members
where to_char(joindate,'DD-MM-YYYY')::DATE >= '01-09-2012'::DATE

-- 8. How can you produce an ordered list of the first 10 surmames in the members table ? the list must not contain duplicates 
select DISTINCT(surname) from cd.members 
order by  surname asc
limit 10;


-- 9. get the signup date of your last member . How can you retruve this information 
select joindate from cd.members
order by joindate desc 
limit 1;

--10. produce a count of the nubmer of facilities that have a cost to guests of 10 or more 
select count(*) from cd.facilities
where guestcost >= 10;


 --11. produce a list of the total nuber of slots booked per facility in the month of september 2012. Produce an output table consisting of facility id and slots, sorted by the number of slots

select facid,sum(slots)from cd.bookings
where  extract(month from starttime) = 9.0
group by facid
order by sum(slots);

-- produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and total slots  sorted by facility id 
SELECT facid,sum(slots) as total_slots from cd.bookings
group by facid
having sum(slots)> 1000;
order by facid

-- 13. produce a list of the start times for bookings for tennis courts for the date 2012 - 09 - 21 ? return a list of start time and facility name pairings, ordered by the time ?

select starttime, name from cd.bookings
inner join cd.facilities
on cd.bookings.facid = cd.facilities.facid
where to_char(starttime, 'YYYY-MM-DD'):: DATE = '2012-09-21'
and cd.facilities.name ilike '%Tennis Court%'
order by starttime;


-- 14 How can you produce a list of the starttimes for bookings by members named David Farrell? 
select starttime from cd.bookings
where memid = (select memid from cd.members
where firstname = 'David' and surname = 'Farrell');
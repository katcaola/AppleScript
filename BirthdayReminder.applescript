(* 
CREATED BY katcaola - July 9 2016

How to use:
- Opening the Mac Script Editor App and then pasting the code in 
  or
  Save the file locally and open the file with the Mac Script Editor App 
- Save the file as a .applescript file
- Create a cron job to run a shell script
- have the shell script run the apple script

Important to note that cron will not run the script if your computer is asleep.
Be sure to set your cron to run at a time you know your computer will be awake or
set your computer to wake up specifically to run the script.

*)

set groupName to "Send Mail Group"

tell application "Contacts" to set group_list to name of every person in group groupName

if the (count of items in group_list) is greater than 0 then set peopleInList to true

--only if there are people in the list, go through the process of making a calendar event
if (peopleInList) then
	
	--VARIABLES
	set d to (day of (current date)) + 5
	set m to month of (current date)
	set calendarName to "Calendar"
	set newline to "
"
	
	tell application "Contacts"
		
		-- use this list to count contacts in the
		-- group. Used later for repeat block
		set group_list to name of every person in group groupName
		
		set tempNames to {}
		
		repeat with i from 1 to the count of items in group_list
			
			set tempName to name of person i in group groupName
			set addr to address of person i in group groupName
			set bday to birth date of person i in group groupName
			set contactDateValues to value of custom dates of person i in group groupName
			set contactDateLabels to label of custom dates of person i in group groupName
			set datesCount to count of items in contactDateValues
			
			-- if the person doesn't have an address listed, can't send a card
			-- let me know if I need to hunt down their address
			-- address is a property with multiple elements. if it is empty it is {} not missing value
			if addr is {} then
				set tempName to tempName & "   ❌📬"
			end if
			
			-- if birthdate is present
			if bday is not missing value then
				-- put the contact's birthday in a comparable form
				--  if you don't do this:
				--    comparing the (current date)+5 to their
				--    actual birthdate won't match because of year, 
				--    timestamp and weekday
				set x to month of bday
				set y to day of bday
				
				-- if their birthdate matches today's date + 5 days
				-- then their birthday is why they're on the list
				if m is x and d is y then
					set finalNameDescription to "🎉 - " & tempName
					set tempNames to tempNames & finalNameDescription
				end if
			end if
			
			
			-- if the dateCount >0 then custom date(s) is(are) putting them in the list
			if datesCount > 0 then
				-- There could be multiple dates. Check just in case.
				repeat with i from 1 to datesCount
					set x to month of item i of contactDateValues
					set y to day of item i of contactDateValues
					-- if their custom date matches today's date + 5 days
					-- then their custom date is why they're on the list
					if m is x and d is y then
						-- specify the contact description to be based on custom date labels
						if item i of contactDateLabels is "anniversary" then
							set finalNameDescription to "💝 - " & tempName
						end if
						if item i of contactDateLabels is "other" then
							set finalNameDescription to "📅 - " & tempName
						end if
					end if
					set tempNames to tempNames & finalNameDescription
				end repeat
			end if
		end repeat
	end tell
	-- Don't leave application open
	tell application "Contacts" to quit
	
	-- Create text for description in the calendar event
	set theText to "Mail cards to the following people:"
	repeat with i from 1 to the count of items in tempNames
		set theText to theText & newline & item i of tempNames
	end repeat
	
	tell application "Calendar"
		-- Add "Mail Cards" event to calendar
		tell calendar calendarName
			set theDate to current date
			make new event at end with properties {description:theText, summary:"📩 Mail Cards", location:"Delete this once cards are mailed", start date:theDate, allday event:true}
		end tell
	end tell
	-- Don't leave application open
	tell application "Calendar" to quit
	
end if

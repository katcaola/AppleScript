local buttonReturned
local answer
local answerText
local name
set dialogText to "Choose the statement that best represents something you would desire or appreciate more: " & "
"
set aCounter to 0
set bCounter to 0
set cCounter to 0
set dCounter to 0
set eCounter to 0

-- Set all the lists to contain what you need for each question
set question1 to {"1. I like to receive notes of emotional support and encouragement", "A", "2. I like to be hugged", "E"}
set question2 to {"1. I like to spend one-on-one time with a person who is special to me", "B", "2. I feel loved when someone gives practical help to me", "D"}
set question3 to {"1. I like it when people give me gifts.", "C", "2. I like leisurely visits with friends and loved ones.", "B"}
set question4 to {"1. I feel loved when people do things to help me.", "D", "2. I feel loved when people touch me.", "E"}
set question5 to {"1. I feel loved when someone I love or admire puts his or her arm around me.", "E", "2. I feel loved when I receive a gift from someone I love or admire.", "C"}
set question6 to {"1. I like to go places with friends and loved ones.", "B", "2. I like to high-five or hold hands with people who are special to me.", "E"}
set question7 to {"1. Visible symbols of love (gifts) are very important to me.", "C", "2. I feel loved when people affirm me.", "A"}
set question8 to {"1. I like to sit close to people whom I enjoy being around.", "E", "2. I like for people to tell me I am attractive/handsome.", "A"}
set question9 to {"1. I like to spend time with friends and loved ones.", "B", "2. I like to receive little gifts from friends and loved ones.", "C"}
set question10 to {"1. Words of acceptance are important.", "A", "2. I know someone loves me when he or she helps me.", "D"}
set question11 to {"1. I like being together and doing things with friends and loved ones.", "B", "2. I like it when kind words are spoken to me.", "A"}
set question12 to {"1. What someone does affects me more than what he or she says.", "D", "2. Hugs make me feel connected and valued.", "E"}
set question13 to {"1. I value praise and try to avoid criticism.", "A", "2. Several small gifs mean more to me than one large gift.", "C"}
set question14 to {"1. I feel close to someone when we are talking or doing something together.", "B", "2. I feel closer to friends and loved ones when they touch me often.", "E"}
set question15 to {"1. I like for people to compliment my achievements.", "A", "2. I know people love me when they do things for me that they don't enjoy doing.", "D"}
set question16 to {"1. I like to be touched as friends and loved ones walk by.", "E", "2. I like it when people listen to me and show genuine interest in what I am saying.", "B"}
set question17 to {"1. I feel loved when friends and loved ones help me with jobs or projects.", "D", "2. I really enjoy receiving gifts from friends and loved ones.", "C"}
set question18 to {"1. I like for people to compliment my appearance.", "A", "2. I feel loved when people take time to understand my feelings.", "B"}
set question19 to {"1. I feel secure when a special person is touching me.", "E", "2. Acts of service make me feel loved.", "D"}
set question20 to {"1. I appreciate the many things that special people do for me.", "D", "2. I like receiving gifts that special people make for me.", "C"}
set question21 to {"1. I really enjoy the feeling I get when someone gives me undivided attention.", "B", "2. I really enjoy the feeling I get when someone does some act of service for me.", "D"}
set question22 to {"1. Words of acceptance are important.", "A", "2. I know someone loves me when he or she helps me.", "D"}
set question23 to {"1. I know a person is thinking of me when he of she gives me a gift.", "C", "2. I feel loved when a person helps with my chores.", "D"}
set question24 to {"1. I appreciate it when someone listens patiently and doesn't interrupt me", "B", "2. I appreciate it when someone remembers special days with a gift.", "C"}
set question25 to {"1. I like knowing loved ones are concerned enough to help with my daily tasks.", "D", "2. I enjoy extended trips with someone who is special to me.", "B"}
set question26 to {"1. I enjoy kissing or being kissed by people with whom I am close.", "E", "2. Receiving a gift for no special reason excites me.", "C"}
set question27 to {"1. I like to be told that I am appreciated.", "A", "2. I like for a person to look at me when we are talking.", "B"}
set question28 to {"1. Gifts from a friend or loved one are always mean a lot to me.", "C", "2. I feel good when a friend or loved one touches me.", "E"}
set question29 to {"1. I feel loved when a person enthusiastically does some task I have requested.", "D", "2. I feel loved when I am told how much I am appreciated.", "A"}
set question30 to {"1. I need words of affirmation daily.", "E", "2. I know someone loves me when he or she helps me.", "A"}

-- put every question ever into your list
set questionList to {question1, question2, question3, question4, question5, question6, question7, question8, question9, question10, question11, question12, question13, question14, question15, question16, question17, question18, question19, question20, question21, question22, question23, question24, question25, question26, question27, question28, question29, question30}

-- set questionList to {question1, question2}

-- OPENING DIALOG TEXT - Window 1
set theDialogText to "Welcome! 
 So by taking this quiz, you will get to learn about your 'Love Language'. \"What is a love language?\" you may ask? Love Languages outline five ways that people express and experience love. The five love languages are: 
 'Words of Affirmation' 
 'Quality Time' 
 'Receiving Gifts' 
 'Acts of Service' 
 'Physical Touch' 
 
 Thus by taking this quiz, you will be able to know what your own personal love languages which will aid you in getting what you need out of your relationships with other people: if you know what you like, you know what to ask for. 
 
 Also, you might not have a 'primary' love language, some people are 'bilingual', even 'trilingual'. This means that you have more than one primary love language. 
 So what are you waiting for? Let's find out your love language!"

set questionDialog to display dialog theDialogText buttons {"Cool, let's get started!"}

-- OPENING DIALOG TEXT - Window 2 - get username
set temp to display dialog "First off, lets make this personized to you! 
 What is your name? (Your first name will do)." default answer "No shenanigans, like \"Your Name\" or anything"

set name to text returned of temp


-- OPENING DIALOG TEXT - Window 3
set questionDialog to display dialog "So your name is, " & name & "? Nice. 
 So " & name & ", let's get this thing started! 
 (For real this time)" buttons {"Alrighty"} default button 1

set numberOfQuestions to the number of items in questionList

---------------------------------------------------------------------
-- MAIN REPEAT/LOOP STATEMENT (go through List of question objects)--
---------------------------------------------------------------------
repeat with counter from 1 to numberOfQuestions
	
	-- The current question object beinng used
	set currentQuestion to item counter of questionList
	
	-- Dialog text that will appear:
	-- Statement # of #:
	-- Choose the statement that best represents something you would desire or appreciate more:
	--
	-- 1. First Statement
	--
	-- 2. Second Statement
	--
	set theDialogText to "Statement " & counter & " of " & numberOfQuestions & ¬
		": 
" & dialogText & "
" & item 1 of currentQuestion & "
 
" & item 3 of currentQuestion
	
	-- Display the dialog
	set questionDialog to ¬
		display dialog ¬
			theDialogText buttons {"1", "2", "END NAO"}
	--		¬ default button "Cool what's next?" with icon 1
	-- 162 file i/o
	
	set buttonReturned to button returned of questionDialog
	
	-- What to do if any of the buttons are clicked-ded
	if buttonReturned is "1" then
		set answer to item 2 of currentQuestion
	else if buttonReturned is "2" then
		set answer to item 4 of currentQuestion
	else
		exit repeat
	end if
	
	-- Edit le counts of each type of answer chosen using an IF statement block thing
	if answer = "A" then set aCounter to aCounter + 1
	if answer = "B" then set bCounter to bCounter + 1
	if answer = "C" then set cCounter to cCounter + 1
	if answer = "D" then set dCounter to dCounter + 1
	if answer = "E" then set eCounter to eCounter + 1
	
end repeat



-------------------------------------------------------------------------
on highest_number(values_list)
	set the high_amount to ""
	repeat with i from 1 to the count of the values_list
		set this_item to item i of the values_list
		set the item_class to the class of this_item
		if the item_class is in {integer, real} then
			if the high_amount is "" then
				set the high_amount to this_item
			else if this_item is greater than the high_amount then
				set the high_amount to item i of the values_list
			end if
		else if the item_class is list then
			set the high_value to highest_number(this_item)
			if the the high_value is greater than the high_amount then ¬
				set the high_amount to the high_value
		end if
	end repeat
	return the high_amount
end highest_number
-----------------------------------------------------------------------
set allTheCounts to {aCounter, bCounter, cCounter, dCounter, eCounter}

set higherstCount to highest_number(allTheCounts)

if higherstCount = aCounter then set answerText to "a"
if higherstCount = bCounter then set answerText to "b"
if higherstCount = cCounter then set answerText to "c"
if higherstCount = dCounter then set answerText to "d"
if higherstCount = eCounter then set answerText to "e"

-- comapre all counts to each other -> highest count gets letter
-- check if there are duplicates
-- set explanations based on the highest count(s)


--set theDialogText to "Alright " & name & ", your personal love language is… 
-- *drum roll sound effects* 

-- OLD OUTPUT FOR COUNTS
set theDialogText to "Alright, " & name & ", here are your results! 
Your Counts: 
 " & "
 " & "WORDS OF AFFIRMATION: " & aCounter & "
 " & "QUALITY TIME: " & bCounter & "
 " & "RECEIVING GIFTS: " & cCounter & "
 " & "ACTS OF SERVICE: " & dCounter & "
 " & "PHYSICAL TOUCH: " & eCounter

set questionDialog to ¬
	display dialog ¬
		theDialogText buttons {"Okay, I'm done now"}

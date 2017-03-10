(* This is a workflow so it will need to be run and processed via automator

What it does: 
This script is meant to help you pronounce and read Japanese characters. 
It can help correctly pronounce and Japanese text that the user may come across. 
Can help with learning kanji, hiragana and katakana.

How to use:
Open this script with Automator, and save. 
To test, go to apple.co.jp and highlight text on the front page. 
Right click and select "Services" --> "Speak In Japanese"

How it works:
The workflow will take highlighted text and copy it to a clipboard. 
The system then reads the text using the Japanese voice

Notes: 
- On my machine, sometimes there is initial startup time before it works.  
- I'm not sure how this script reacts if you don't have the voice "Kyoko" installed
*)

on run {input, parameters}

	tell application "System Events"
		set activeApp to name of first application process whose frontmost is true
	end tell
	
	tell application activeApp
		set the clipboard to (input as string)
	end tell
	
	say (the clipboard) using "Kyoko" speaking rate 150
	
	return input
end run

xquery version "3.1";

(: 
   Query: EventsLengthInDays
   Description: returns the amount of days a certain event goes
:)

let $eventTitle := "Van Gogh Week"
(:let $eventTitle := "Sponsor Gratitude Evening" :)

let $first := "st"
let $second := "nd"
let $third := "rd"
let $fourth := "th"


for $event in doc ("events.xml")/events/event
let $eventName := $event/eventName

where $eventTitle = $eventName
let $dates := $event/dates/date (: dates node of all teh dates:)
let $dateCount := count($dates)
let $length :=
   if ($dateCount = 1) then "day"
   else "days"

let $firstDate := substring($dates[1], 9, 2)
let $lastDate := substring($dates[$dateCount], 9, 2)
let $firstSuffix := 
   if ($firstDate = "1" or $firstDate = "21" or $firstDate = "31") then $first 
   else if ($firstDate = "2" or $firstDate = "22") then $second 
   else if ($firstDate = "3" or $firstDate = "23") then $third 
   else $fourth
let $lastSuffix := 
   if ($lastDate = "1" or $lastDate = "21" or $lastDate = "31") then $first 
   else if ($lastDate = "2" or $lastDate = "22") then $second 
   else if ($lastDate = "3" or $lastDate = "23") then $third 
   else $fourth
   
return concat($eventTitle, " lasts ", string($dateCount), " ", $length, 
    if ($length eq "day") then concat(" and is on the ", $firstDate, $firstSuffix) 
    else concat(" from the ", $firstDate, $firstSuffix, " to the ", $lastDate, $lastSuffix)
)






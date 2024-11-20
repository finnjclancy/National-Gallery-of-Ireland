xquery version "3.1";

(: 
   Query: EventsByManager
   Description: returns the events "
:)

let $managerName := "Robin"
(:let $managerName := "Robin":)

for $event in doc("events.xml")/events/event 
let $eventTitle := $event/eventName
for $manager in $event/manager
let $firstName := substring-before($manager, " ")
where $managerName = $firstName
return (
  <is_manager_for> {$eventTitle} </is_manager_for>,
  concat($managerName, " is the manager for ", $eventTitle, "&#10;")
)




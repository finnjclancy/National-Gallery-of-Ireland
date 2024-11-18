xquery version "3.1";

(: 
   Query: FeedbacksFromNonPayingUsers.xq
   Description: Retrieves feedbacks from users who have NOT made any payments.
:)

declare default element namespace "";

let $paymentSystems := collection("National-Gallery-of-Ireland")//PaymentSystem
let $feedbacks := collection("National-Gallery-of-Ireland")//Feedback

for $feedback in $feedbacks
let $visitorID := $feedback/visitorID/text()
where not(some $payment in $paymentSystems satisfies $payment/userID = $visitorID)
return
    <FeedbackFromNonPayingUser>
        { $feedback/* }
    </FeedbackFromNonPayingUser>

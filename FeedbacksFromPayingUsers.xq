xquery version "3.1";

(: 
   Query: FeedbacksFromPayingUsers.xq
   Description: Retrieves feedbacks from users who have made at least one payment.
:)

declare default element namespace "";

let $paymentSystems := collection("National-Gallery-of-Ireland")//PaymentSystem
let $feedbacks := collection("National-Gallery-of-Ireland")//Feedback

for $feedback in $feedbacks
let $visitorID := $feedback/visitorID/text()
where some $payment in $paymentSystems satisfies $payment/userID = $visitorID
return
    <FeedbackFromPayingUser>
        { $feedback/* }
    </FeedbackFromPayingUser>

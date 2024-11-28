xquery version "3.1";

declare function local:calculate-revenue($date as xs:date) as xs:decimal {
  let $donations := doc("Donations.xml")//Donation[paymentDate = $date]/amount
  let $membership := doc("Membership.xml")//Membership[purchaseDate = $date]/purchasePrice
  let $tickets := doc("Tickets.xml")//Ticket[purchaseDate = $date]/price
  return 
    sum($donations) + sum($membership) + sum($tickets)
};

let $targetDate := xs:date("2023-11-15")
let $revenue := local:calculate-revenue($targetDate)
return
  <TotalRevenue>
    {concat("The total revenue for ", $targetDate, " is $", format-number($revenue, "#,##0.00"), "!")}
  </TotalRevenue>


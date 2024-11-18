xquery version "3.1";

declare function local:calculate-revenue($date as xs:date) as xs:decimal {
  let $donations := doc("donations.xml")//Donation[paymentDate = $date]/amount
  let $membership := doc("membership.xml")//Membership[purchaseDate = $date]/purchasePrice
  let $tickets := doc("tickets.xml")//Ticket[purchaseDate = $date]/price
  return 
    sum($donations) + sum($membership) + sum($tickets)
};

let $targetDate := xs:date("2023-11-15")
return
  <TotalRevenue>
    {local:calculate-revenue($targetDate)}
  </TotalRevenue>


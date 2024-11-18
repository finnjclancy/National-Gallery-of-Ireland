let $membershipType := "Patron_Director"
let $totalMembershipRevenue := sum(
    for $membership in //Membership[type = $membershipType]
    return xs:decimal($membership/purchasePrice)
)
return <TotalMembershipRevenue type="{$membershipType}">{$totalMembershipRevenue}</TotalMembershipRevenue>

let $membershipType := "Patron_Director"
let $totalMembershipRevenue := sum(
    for $membership in //Membership[type = $membershipType]
    return xs:decimal($membership/price)
)
return <TotalMembershipRevenue type="{$membershipType}">{$totalMembershipRevenue}</TotalMembershipRevenue>

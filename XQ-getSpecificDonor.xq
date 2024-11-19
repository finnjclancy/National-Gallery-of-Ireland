for $donation in //Donation[donorID = "USER001"]
return
  <DonorDonation>
    <DonationID>{ $donation/donationID/text() }</DonationID>
    <Amount>{ $donation/amount/text() }</Amount>
    <Currency>{ $donation/amount/@currency }</Currency>
    <DonationType>{ $donation/donationType/text() }</DonationType>
  </DonorDonation>

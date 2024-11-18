xquery version "3.1";

let $artists := doc("artists.xml")//artist
let $artworks := doc("museum.xml")//artwork
for $artist in $artists
let $artistName := $artist/name
let $totalArtworks := count(
  for $art in $artworks
  where $art/artistName = $artistName
  return $art
)
return
  <artistTotal>
    <name>{$artistName}</name>
    <totalArtworks>{$totalArtworks}</totalArtworks>
  </artistTotal>

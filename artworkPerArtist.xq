xquery version "3.1";

let $artworks := doc("artwork-xml.xml")/artworks/artwork
let $artists := doc("artist-xml.xml")/artists/artist

for $artist in $artists
let $artworkCount := count($artworks[artist = $artist/name])
return
  <result>
    <artist>{$artist/name/text()}</artist>
    <artworkCount>{$artworkCount}</artworkCount>
  </result>

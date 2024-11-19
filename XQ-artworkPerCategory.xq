xquery version "3.1";

declare function local:countArtworksByCategory($category as xs:string) as xs:integer {
  count(doc("Artwork.xml")//artwork[category = $category])
};

let $artworks := doc("Artwork.xml")//artwork,
    $categories := distinct-values($artworks/category)
for $cat in $categories
let $count := local:countArtworksByCategory($cat)
return 
  <category>
    <name>{$cat}</name>
    <artworkCount>{$count}</artworkCount>
  </category>

xquery version "3.1";

declare function local:countArtworksByCategory($category as xs:string) as xs:integer {
  let $artwork := collection("National-Gallery-of-Ireland")//artwork
  return 
    count($artwork[category = $category])
};

let $artworks := collection("National-Gallery-of-Ireland")//artwork
let $categories := distinct-values($artworks/category)
for $cat in $categories
let $count := local:countArtworksByCategory($cat)
return 
  <category>
    <name>{$cat}</name>
    <artworkCount>{$count}</artworkCount>
  </category>

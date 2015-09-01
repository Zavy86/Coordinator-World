<?php
/* -------------------------------------------------------------------------- *\
|* -[ Contacts - Chained Regions JSON ]-------------------------------------- *|
\* -------------------------------------------------------------------------- */
require_once("../core/api.inc.php");
require_once("api.inc.php");
// definitions
$results=array();
// acquire variables
$undefined=$_GET['undefined'];
$idCountry=$_GET['idCountry'];
// add default results
if($undefined<>"FALSE"){$results['']=ucfirst(api_text("undefined"));}
// build query where
$query_where=" idCountry='".$idCountry."'";
// check query
//if(!$GLOBALS['db']->countOf("world_regions",$query_where)){$query_where=" 1";}
// execute the query
$regions=$GLOBALS['db']->query("SELECT * FROM world_regions WHERE".$query_where." ORDER BY name ASC");
while($region=$GLOBALS['db']->fetchNextObject($regions)){
 $results[$region->id]=api_world_region($region)->name;
}
// encode the results
echo json_encode($results);
?>
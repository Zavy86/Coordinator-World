<?php
/* -------------------------------------------------------------------------- *\
|* -[ Contacts - Chained Districts JSON ]------------------------------------ *|
\* -------------------------------------------------------------------------- */
require_once("../core/api.inc.php");
require_once("api.inc.php");
// definitions
$results=array();
// acquire variables
$undefined=$_GET['undefined'];
$idRegion=$_GET['idRegion'];
// add default results
if($undefined<>"FALSE"){$results['']=ucfirst(api_text("undefined"));}
// build query where
$query_where=" idRegion='".$idRegion."'";
// check query
//if(!$GLOBALS['db']->countOf("world_regions",$query_where)){$query_where=" 1";}
// execute the query
$districts=$GLOBALS['db']->query("SELECT * FROM world_districts WHERE".$query_where." ORDER BY name ASC");
while($district=$GLOBALS['db']->fetchNextObject($districts)){
 $results[$district->id]=api_world_district($district)->name;
}
// encode the results
echo json_encode($results);
?>
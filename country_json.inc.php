<?php
/* -------------------------------------------------------------------------- *\
|* -[ World - Country JSON ]------------------------------------------------- *|
\* -------------------------------------------------------------------------- */
require_once("../core/api.inc.php");
require_once("api.inc.php");
// definitions
$results=array();
// acquire variables
$idCountry=$_GET['idCountry'];
// build query where
$query_where=" id='".$idCountry."'";
// execute the query
$result=$GLOBALS['db']->queryUniqueObject("SELECT * FROM world_countries WHERE".$query_where." ORDER BY name ASC");
// encode the result
echo json_encode($result);
?>
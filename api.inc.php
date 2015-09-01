<?php
/* -------------------------------------------------------------------------- *\
|* -[ World - API ]---------------------------------------------------------- *|
\* -------------------------------------------------------------------------- */

/**
 * Country object
 *
 * @param mixed $country country id or object
 * @return object country object
 */
function api_world_country($country){
 // get country object
 if(is_numeric($country)){$country=$GLOBALS['db']->queryUniqueObject("SELECT * FROM world_countries WHERE id='".$country."'");}
 if(is_string($country) && strlen($country)==2){$country=$GLOBALS['db']->queryUniqueObject("SELECT * FROM world_countries WHERE iso='".strtoupper($country)."'");}
 if(!$country->id){return FALSE;}
 // check and convert
 $country->iso=stripslashes($country->iso);
 $country->name=stripslashes($country->name);
 $country->language=stripslashes($country->language);
 return $country;
}

/**
 * Countries
 *
 * @param string $search search query
 * @param boolean $pagination limit query by page
 * @param string $where additional conditions
 * @return object $results array of countries objects, $pagination pagination object, $query executed query
 */
function api_world_countries($search=NULL,$pagination=FALSE,$where=NULL){
 // definitions
 $return=new stdClass();
 $return->results=array();
 // build query
 $query_table="world_countries";
 // fields
 $query_fields="world_countries.*";
 // where
 $query_where="1";
 // search
 if(strlen($search)>0){
  $query_where.=" AND ( world_countries.iso='".$search."'";
  $query_where.=" OR world_countries.name LIKE '%".$search."%'";
  $query_where.=" OR world_countries.areaCode='".$search."' )";
 }
 // conditions
 if(strlen($where)>0){$query_where="( ".$query_where." ) AND ( ".$where." )";}
 // order
 $query_order=api_queryOrder("name ASC");
 // pagination
 if($pagination){
  $return->pagination=new str_pagination($query_table,$query_where,$GLOBALS['navigation']->filtersGet());
  // limit
  $query_limit=$return->pagination->queryLimit();
 }
 // build query
 $return->query="SELECT ".$query_fields." FROM ".$query_table." WHERE ".$query_where.$query_order.$query_limit;
 // execute query
 $results=$GLOBALS['db']->query($return->query);
 while($result=$GLOBALS['db']->fetchNextObject($results)){$return->results[$result->id]=api_world_country($result);}
 // return countries objects
 return $return;
}


/**
 * Region object
 *
 * @param mixed $region region id or object
 * @return object region object
 */
function api_world_region($region){
 // get country object
 if(is_numeric($region)){$region=$GLOBALS['db']->queryUniqueObject("SELECT * FROM world_regions WHERE id='".$region."'");}
 //if(is_string($region) && strlen($region)==2){$region=$GLOBALS['db']->queryUniqueObject("SELECT * FROM world_regions WHERE name='".strtoupper($region)."'");}
 if(!$region->id){return FALSE;}
 // check and convert
 $region->name=stripslashes($region->name);
 return $region;
}

/**
 * Regions
 *
 * @param string $search search query
 * @param boolean $pagination limit query by page
 * @param string $where additional conditions
 * @return object $results array of regions objects, $pagination pagination object, $query executed query
 */
function api_world_regions($search=NULL,$pagination=FALSE,$where=NULL){
 // definitions
 $return=new stdClass();
 $return->results=array();
 // build query
 $query_table="world_regions";
 // fields
 $query_fields="world_regions.*";
 // where
 $query_where="1";
 // search
 if(strlen($search)>0){
  $query_where.=" AND ( world_regions.name LIKE '%".$search."%' )";
 }
 // conditions
 if(strlen($where)>0){$query_where="( ".$query_where." ) AND ( ".$where." )";}
 // order
 $query_order=api_queryOrder("name ASC");
 // pagination
 if($pagination){
  $return->pagination=new str_pagination($query_table,$query_where,$GLOBALS['navigation']->filtersGet());
  // limit
  $query_limit=$return->pagination->queryLimit();
 }
 // build query
 $return->query="SELECT ".$query_fields." FROM ".$query_table." WHERE ".$query_where.$query_order.$query_limit;
 // execute query
 $results=$GLOBALS['db']->query($return->query);
 while($result=$GLOBALS['db']->fetchNextObject($results)){$return->results[$result->id]=api_world_region($result);}
 // return regions objects
 return $return;
}


/**
 * District object
 *
 * @param mixed $district district id or object
 * @return object district object
 */
function api_world_district($district){
 // get country object
 if(is_numeric($district)){$district=$GLOBALS['db']->queryUniqueObject("SELECT * FROM world_districts WHERE id='".$district."'");}
 //if(is_string($district) && strlen($district)==2){$district=$GLOBALS['db']->queryUniqueObject("SELECT * FROM world_districts WHERE name='".strtoupper($district)."'");}
 if(!$district->id){return FALSE;}
 // check and convert
 $district->name=stripslashes($district->name);
 return $district;
}

/**
 * Districts
 *
 * @param string $search search query
 * @param boolean $pagination limit query by page
 * @param string $where additional conditions
 * @return object $results array of districts objects, $pagination pagination object, $query executed query
 */
function api_world_districts($search=NULL,$pagination=FALSE,$where=NULL){
 // definitions
 $return=new stdClass();
 $return->results=array();
 // build query
 $query_table="world_districts";
 // fields
 $query_fields="world_districts.*";
 // where
 $query_where="1";
 // search
 if(strlen($search)>0){
  $query_where.=" AND ( world_districts.name LIKE '%".$search."%' )";
 }
 // conditions
 if(strlen($where)>0){$query_where="( ".$query_where." ) AND ( ".$where." )";}
 // order
 $query_order=api_queryOrder("name ASC");
 // pagination
 if($pagination){
  $return->pagination=new str_pagination($query_table,$query_where,$GLOBALS['navigation']->filtersGet());
  // limit
  $query_limit=$return->pagination->queryLimit();
 }
 // build query
 $return->query="SELECT ".$query_fields." FROM ".$query_table." WHERE ".$query_where.$query_order.$query_limit;
 // execute query
 $results=$GLOBALS['db']->query($return->query);
 while($result=$GLOBALS['db']->fetchNextObject($results)){$return->results[$result->id]=api_world_district($result);}
 // return districts objects
 return $return;
}

?>
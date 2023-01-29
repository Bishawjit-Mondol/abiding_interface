<?php

class dbconnection {
    
    public $con;
    public  $last_id;
    private $stmt;
    public  $h, $u, $p, $d;
    
    public function __construct($host, $user, $pass, $db) {
        $this->h = $host;
        $this->u = $user;
        $this->p = $pass;
        $this->d = $db;        
    
        $this->con = new mysqli($host, $user, $pass, $db);
        
        if($this->con == null){
            echo "No database connection";
            unset($this);
        }
     mysqli_set_charset($this->con,'utf8');
        $this->con->autocommit(false);
        
    }
    
    public function ping(){
        echo "ping";
    }
    
    public function store_activity($id){
        $this->con->query('start transaction');
        $this->con->query("UPDATE users SET activity = CURRENT_TIMESTAMP() WHERE iduser =".$id);
        $this->con->commit();
    }
    
    public function prepare_insert_query($table_name, $val_types ,$array_of_col, $array_of_val, $ret = null){
        
        if(count($array_of_col) != count($array_of_val)){
            return false;
        }
        
        $n = count($array_of_val);
        
        $param[0] = $val_types;
        $querey_1 = "(";
        $querey_2 = "INSERT INTO `".$table_name."` (";
        for($i = 0; $i<$n; $i++){
            if($i != $n-1){
                $querey_1 .= "? ,";
                $querey_2 = sprintf("%s `%s`, ",$querey_2, $array_of_col[$i]);
            }
            else{
                $querey_1 .= "? )";
                $querey_2 = sprintf("%s `%s` ) ",$querey_2, $array_of_col[$i]);
				
            }
            $param[$i+1] = $array_of_val[$i] ?  $array_of_val[$i]  : 'NULL';
        }
        
        
        $query =  $querey_2. " VALUES ". $querey_1;
        if(true || $_GET['debug_mode'] == '6847'){
            $ret =  $querey_2. " VALUES (";
        }
        
        
        $this->stmt = $this->con->prepare($query);
        
        return $param;
        
        
    }
    
    public function insert_query_by_array($arr){
    	return $this->insert_query($arr[0], $arr[1], $arr[2], $arr[3]);
    }
    
    public function insert_query($table_name, $val_types ,$array_of_col, $array_of_val){
        
        
        $param = $this->prepare_insert_query($table_name, $val_types, $array_of_col, $array_of_val, $consol_print);
        
        if( true || $_GET['debug_mode']=='6847'){
        
        for($i=0; $i<COUNT($array_of_val); $i++){
            if($i==0){
                if($val_types[$i]=='i')
                    $consol_print = $consol_print.$array_of_val[$i];
                elseif($val_types[$i]=='s')
                    $consol_print = $consol_print. "'".$array_of_val[$i]."'";
            		}    
            else{
                if($val_types[$i]=='i')
                    $consol_print = $consol_print. ','.$array_of_val[$i];
                elseif($val_types[$i]=='s')
                    $consol_print = $consol_print. ", '".$array_of_val[$i]."'";
                else if($val_types[$i]=='d')
                    $consol_print = $consol_print. ','.$array_of_val[$i];
                else if($val_types[$i]=='f')
                    $consol_print = $consol_print. ','.$array_of_val[$i];
                
            }
        }
			
        $consol_print = $consol_print. ")";
		
        }
        $this->console_print($consol_print);
        call_user_method_array('bind_param', $this->stmt, $param);
        
        $flag =  $this->stmt->execute();
        
        if($flag){
            $this->last_id = $this->stmt->insert_id;
            $this->stmt->close();
        }
        else{
            if(true ||  $_GET['debug_mode']=='6847'){
                //echo "<br/>".$this->stmt->error;
            }   
        }
        
        
        return $flag;
    }
    
    public function insert_query_execute($table_name, $val_types ,$array_of_col, $array_of_val){
        

        $param = $this->prepare_insert_query($table_name, $val_types, $array_of_col, $array_of_val);
        call_user_method_array('bind_param', $this->stmt, $param);
        $flag =  $this->stmt->execute();
        if($flag){
            
            $this->last_id = $this->stmt->insert_id;
            $this->con->commit();
            $this->stmt->close();
        }
        
        else{
            $this->con->rollback();
            //echo $this->stmt->error;
        }
        
        return $flag;
    }
   
    public function custom_select_query($query){
    		

        	
        $result = $this->con->query($query, MYSQLI_USE_RESULT );
        $row;
        $i=0;
        while($row[$i++] = $result->fetch_row());
        array_pop($row);
        while ($this->con->next_result()) {;}
        

        return $row;
    }
      
    public function select_table($table_name){
        
        $query = "SELECT * FROM $table_name";
        $result = $this->con->query($query);
        $row;
        $i=0;
        while($row[$i++] = $result->fetch_row());
        array_pop($row);
        return $row;
        
        
    }
    
    public function select_table_on_condition($table_name, $array_of_select, $col_check, $cond, $val){
        
        $n = count($array_of_select);
        
        $query = "SELECT ";
        for($i = 0; $i<$n; $i++){
            if($i != $n-1){
                $query = sprintf("%s %s, ",$query, $array_of_select[$i]);
            }
            else{
                $query = sprintf("%s  %s",$query, $array_of_select[$i]);
            }
            
        }
        
        $query = sprintf("%s FROM %s WHERE %s %s %s",$query, $table_name, $col_check, $cond, $val);
        
        $this->stmt = $this->con->prepare($query);
        
        $this->stmt->execute();
        
       
        
        $n = $this->stmt->field_count;
        $j=0;
        
        while($col = $this->stmt->fetch()){
            for($i=0; $i<$n; $i++){
                $res[$j][$i] = $col[$i];
            }
            $j++;
        }
        
        $this->stmt->close();
        return $res;
    }
    
    public function execute($query){
        $flag =  $this->con->query($query);
        
        if($_GET['debug_mode']=='6847'){
        		//echo "<br/>Execution : ".$query."<br/>";
        	}
        return $flag;
    }
    
    public function get_col($table_name){
        $query = "DESCRIBE $table_name";
        $result = $this->con->query($query);
        $j = 0;
        while($i = $result->fetch_row()){
            $col[$j++] = $i[0];
        }
        return $col;
    }
    
    public function add_text_col($table_name,$col_name, $char_length){
        
        //echo $query = "ALTER TABLE $table_name ADD COLUMN $col_name VARCHAR($char_length);";
        
        $flag =  $this->con->query($query);
        
        if($flag){
            $this->con->query('COMMIT');
        }
        return $flag;
    }
    
    public function add_blob_col($table_name,$col_name){
    
        $query_2 = "ALTER TABLE $table_name ADD CONSTRAINT FK_user_contact_$col_name FOREIGN KEY FK_user_contact_$col_name ($col_name) REFERENCES stored_file (idfile) ON DELETE CASCADE ON UPDATE CASCADE;";

        $query = "ALTER TABLE $table_name ADD COLUMN $col_name INTEGER(10) UNSIGNED UNIQUE";

        $this->con->query('START TRANSACTION');

        $flag = $this->con->query($query);
        
        if($flag){            
            $flag = $this->con->query($query_2);    
        }
        
        if($flag){
            $this->con->query('COMMIT');
        }
        else{
            $this->con->query('ROLLBACK');
        }
        return $flag;
    }
        
    public function get_new_id($table, $column){
		
        $res = $this->custom_select_query("SELECT $column FROM $table ORDER BY $column DESC LIMIT 0,1");
        return $res[0][0] + 1;        
    }
    
    
    
    public function add_user($name, $pass){
        $query = sprintf("INSERT INTO user (name,password) VALUES ('%s', AES_ENCRYPT('%s','%s'))",$name,$pass,$name);
        $this->con->query('START TRANSACTION');
        if($this->con->query( $query )){
            $this->con->query('COMMIT');
            return true;
        }
        $this->con->query('ROLLBACK');
        return false;
        
    }
    
    public function get_login_id_store($name, $pass){
        
        $query = sprintf("SELECT iduser FROM user WHERE name = '%s' AND AES_DECRYPT(password,name) = '%s'",$name,$pass);
        $info = $this->custom_select_query($query);
        
        if(COUNT($info)== 1){
            $this->store_log(1,$name,$pass);
        }
        else{
            $this->store_log(0,$name,$pass);
        }
        return $info[0][0];
    }
 
    public function get_login_id($name, $pass){
        $query = sprintf("SELECT iduser FROM user WHERE name = '%s' AND AES_DECRYPT(password,name) = %s",$name,$pass);
        $info = $this->custom_select_query($query);
        return $info[0][0];

        
    }
    
    public function store_log($flag,$name,$pass){
        
        $this->con->query('START TRANSACTION');
        $host = "unknown";
        $query = sprintf("INSERT INTO login_log (ip,host_name,agent,success,name,pass) VALUES ('%s','%s','%s',%d,'%s', AES_ENCRYPT('%s','%s') )",$_SERVER['REMOTE_ADDR'],$host,$_SERVER['HTTP_USER_AGENT'],$flag,$name,$pass,$name);
        if($this->con->query( $query )){
            $this->con->query('COMMIT');    
        }
        $this->con->query('ROLLBACK');    
        return false;
    }
    
    public function add_unite ($name){
        $name = strtolower($name);
        
        $this->con->query('START TRANSACTION');
        //echo $query = sprintf("INSERT INTO mesurment_unite (unite) VALUES ('%s')",$name);
        $flag = $this->con->query($query);
        
        
        //echo $this->con->error;
        if($flag){
            
            $this->con->query('COMMIT');
        }
       
        $this->con->query('ROLLBACK');
        //echo "5";
        return $flag;
    }
    
    public function add_new_page($l,$p){
        
        $id = $this->get_new_id('page', 'idpage');
        $flag = $this->insert_query('page', "is", array('idpage','name'), array($id,$p));
        $query = sprintf("CREATE TABLE %s (sl INTEGER(5) UNSIGNED NOT NULL, status BOOLEAN NOT NULL DEFAULT 0 ) ENGINE = InnoDB",$p);
        
        if($flag){
            
            $flag = $this->execute($query);
        }
        
        if($flag){
            
            $n = COUNT($l);
            for($i=0; $i<$n; $i++){
               if($flag){
                   $flag = $this->insert_query('page_level_access', "ii", array('idpage','idlevel'), array($id,$l[$i]));
               }
            }
        }
        
        if($flag){
            $this->con->query('COMMIT');
            return true;
        }
    }
      
    public function add_data($t,$d,$file,$fileSize,$fileType){
        
            $file = mysql_real_escape_string($file, $this->con);
            //echo $query = "INSERT INTO `download` (`title` ,`description` ,`file`, `size`, `type`) VALUES ( '$t', '$d', $file, $fileSize, '$fileType');";   
            $flag = $this->execute($query);
            if($flag){
                $this->con->query('COMMIT');
            }
            return $flag;
        
    }
    
    public function  get_field_detail($table){
        
        
        
        $conc = mysql_connect($this->h, $this->u, $this->p);
        $db_selected = mysql_select_db($this->d,$conc);

        $sql = "SELECT * from $table";
        
        $result = mysql_query($sql,$conc);
        $arr = array();
        $i=0;
        while ($property = mysql_fetch_field($result))
        {
            $arr[$i]['name'] = $property->name;
            $arr[$i]['not_null'] = $property->not_null;
            $arr[$i]['type'] = $property->type;
            // type can be string, blob, int
            $i++;
            
        }
        mysql_close($conc);

			        
        
        return $arr;
        
        
    }
    public function queryPrint($array){
	$table = $array[0];
	for($a=0; $a<count($array[2]); $a++){
		$col = $col.', '.$array[2][$a];
		if($array[1][$a] == 's')
			$value = $value.', '."'".$array[3][$a]."'";
		else
			$value = $value.', '.$array[3][$a];
		}
		$col = substr($col, 1);
		$value = substr($value, 1);
		$print_query = "INSERT INTO $table ($col) VALUES ($value) $q;";
		
		return $print_query;
	}
    
    public function get_accesible_pages ($user_id){
        if($user_id == -99){
            $query = sprintf("SELECT name FROM page;");
        }
        else{
            $query = sprintf("SELECT name FROM (SELECT idlevel FROM user_level WHERE iduser = %d AND status = 1) as l LEFT JOIN page_level_access USING(idlevel) LEFT JOIN page USING(idpage);",$user_id);
        }
        $page_name = $this->custom_select_query($query);
	return $page_name;
    }
    
    public function print_form_for($tab_name){
    		 
    	    $arr = $this->get_field_detail($tab_name);
            $n = count($arr);
            
            echo "<input type = 'hidden' name = 'ele_num' value = '$n' />";
            
            echo "<input type = 'hidden' name = 'id_field' value = '".$arr[0]['name']."' />";
            
            echo "<table>";
            for($i=1; $i<$n; $i++){
                echo "<tr>";
                echo '<td>'.ucfirst( $arr[$i]['name']). ': </td>';
                echo "<td><input type = 'text' name = '".$arr[$i]['name']."' value = '".(isset($_REQUEST[$arr[$i]['name']])?$_REQUEST[$arr[$i]['name']]:null)."' /></td>";
                echo "<input type = 'hidden' name = 'n_$i' value = '".$arr[$i]['name']."' />";
                echo "</tr>";
                
            }
            echo "</table>";
    }
    
    public function process_form_submission($table){
        $n = $_REQUEST['ele_num'];
        
        $field_name  = array($_REQUEST['id_field']);
        $field_value = array($this->get_new_id($table, $_REQUEST['id_field']));
        for($i=1; $i<$n; $i++){
            array_push($field_name, $_REQUEST['n_'.$i]);
            array_push($field_value,$_REQUEST[$_REQUEST['n_'.$i]]);
        }
        return array($field_name,$field_value);
        
    }
    public function current_stock($godown, $product){
	  $det = $this->custom_select_query("SELECT ammount FROM infrustructure_stock WHERE idinfrustructure = ".$godown." AND idproduct = ".$product);
	  if($det[0][0]==null)
	    return 0;
	  return $det[0][0];
    }
    public function add_product($godown, $product, $am){
	  return "UPDATE infrustructure_stock SET ammount = ammount + ". $am."  WHERE idinfrustructure = ".$godown." AND idproduct = ".$product;
    }
    public function remove_product($godown, $product, $am){
	  return "UPDATE infrustructure_stock SET ammount = ammount - ". $am  ." WHERE idinfrustructure = ".$godown." AND idproduct = ".$product;
    }
    public function update_party_balance($party, $am){
	  return "UPDATE party_creditlimit SET balance = balance + (".$am.") WHERE idparty =  ".$party;
    }

    public function console_print($string){	

    }
	

}


?>

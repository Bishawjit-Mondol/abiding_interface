-- phpMyAdmin SQL Dump
-- version 4.3.0-rc1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2015 at 09:52 পূর্বাহ্ণ
-- Server version: 5.5.40-0ubuntu0.14.04.1
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `atil_mod_l`
--


DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `___show_all_ppr_stock_book`$$
CREATE      PROCEDURE `___show_all_ppr_stock_book`(IN `C1` INT, IN `C2` INT)
BEGIN

SET C1:= (SELECT IF(ISNULL(C1),0,C1));
SET C2:= (SELECT IF(ISNULL(C2),0,C2));

IF(C1=0 AND C2=0)THEN

SELECT ___find_pe_name(idpestablishment) as godownname, 
		___find_product_name_two(idproduct) as productname , 
		concat (ammount,' ',unite_name) as qty,product_mrp,product_mpp
		FROM pestablishment_product
		left join product using(idproduct)
		left join unite using(idunite)
		LEFT JOIN product_catagory USING(idproduct_catagory) WHERE idproduct_catagory_parent = 1  ORDER BY productname ;

ELSEIF(C1>0 AND C2=0)THEN

SELECT ___find_pe_name(idpestablishment) as godownname,
		 ___find_product_name_two(idproduct) as productname ,
		concat (ammount,' ',unite_name) as qty,product_mrp,product_mpp
		FROM pestablishment_product
		left join product using(idproduct)
		LEFT JOIN product_catagory USING(idproduct_catagory) 
		left join unite using(idunite) where idproduct=C1 ORDER BY productname;

ELSEIF(C1=0 AND C2>0)THEN

SELECT ___find_pe_name(idpestablishment) as godownname, 
		 ___find_product_name_two(idproduct) as productname , 
		concat (ammount,' ',unite_name) as qty ,product_mrp,product_mpp
		FROM pestablishment_product
		left join product using(idproduct)
		LEFT JOIN product_catagory USING(idproduct_catagory) 
		left join unite using(idunite) where idpestablishment=C2 AND idproduct_catagory_parent = 1  ORDER BY productname ;

ELSEIF(C1>0 AND C2>0)THEN

SELECT ___find_pe_name(idpestablishment) as godownname, 
		 ___find_product_name_two(idproduct) as productname , 
		concat (ammount,' ',unite_name) as qty,product_mrp,product_mpp
		FROM pestablishment_product
		left join product using(idproduct)
		LEFT JOIN product_catagory USING(idproduct_catagory) 
		left join unite using(idunite) where idproduct=C1 AND idpestablishment=C2  ORDER BY productname;
		
END IF;

END$$

DROP PROCEDURE IF EXISTS `___show_all_stock_book`$$
CREATE      PROCEDURE `___show_all_stock_book`(IN `C1` INT, IN `C2` INT)
BEGIN

SET C1:= (SELECT IF(ISNULL(C1),0,C1));
SET C2:= (SELECT IF(ISNULL(C2),0,C2));

IF(C1=0 AND C2=0)THEN

SELECT ___find_pe_name(idpestablishment) as godownname, 
		 ___find_product_name(idproduct) as productname , 
		concat (ammount,' ',unite_name) as qty,product_mrp,product_mpp
		FROM pestablishment_product
		left join product using(idproduct)
		left join unite using(idunite) ;

ELSEIF(C1>0 AND C2=0)THEN

SELECT ___find_pe_name(idpestablishment) as godownname,
		 ___find_product_name(idproduct) as productname ,
		concat (ammount,' ',unite_name) as qty,product_mrp,product_mpp
		FROM pestablishment_product
		left join product using(idproduct)
		left join unite using(idunite) where idproduct=C1;

ELSEIF(C1=0 AND C2>0)THEN

SELECT ___find_pe_name(idpestablishment) as godownname, 
		 ___find_product_name(idproduct) as productname , 
		concat (ammount,' ',unite_name) as qty ,product_mrp,product_mpp
		FROM pestablishment_product
		left join product using(idproduct)
		left join unite using(idunite) where idpestablishment=C2  ;

ELSEIF(C1>0 AND C2>0)THEN

SELECT ___find_pe_name(idpestablishment) as godownname, 
		 ___find_product_name(idproduct) as productname , 
		concat (ammount,' ',unite_name) as qty,product_mrp,product_mpp
		FROM pestablishment_product
		left join product using(idproduct)
		left join unite using(idunite) where idproduct=C1 AND idpestablishment=C2;
		
END IF;

END$$

DROP PROCEDURE IF EXISTS `___show_all_upvc_stock_book`$$
CREATE      PROCEDURE `___show_all_upvc_stock_book`(IN `C1` INT, IN `C2` INT)
BEGIN

SET C1:= (SELECT IF(ISNULL(C1),0,C1));
SET C2:= (SELECT IF(ISNULL(C2),0,C2));

IF(C1=0 AND C2=0)THEN

SELECT ___find_pe_name(idpestablishment) as godownname, 
		___find_product_name_two(idproduct) as productname , 
		concat (ammount,' ',unite_name) as qty,product_mrp,product_mpp
		FROM pestablishment_product
		left join product using(idproduct)
		left join unite using(idunite)
		LEFT JOIN product_catagory USING(idproduct_catagory) WHERE idproduct_catagory_parent = 2  ORDER BY productname ;

ELSEIF(C1>0 AND C2=0)THEN

SELECT ___find_pe_name(idpestablishment) as godownname,
		 ___find_product_name_two(idproduct) as productname ,
		concat (ammount,' ',unite_name) as qty,product_mrp,product_mpp
		FROM pestablishment_product
		left join product using(idproduct)
		LEFT JOIN product_catagory USING(idproduct_catagory) 
		left join unite using(idunite) where idproduct=C1 ORDER BY productname;

ELSEIF(C1=0 AND C2>0)THEN

SELECT ___find_pe_name(idpestablishment) as godownname, 
		 ___find_product_name_two(idproduct) as productname , 
		concat (ammount,' ',unite_name) as qty ,product_mrp,product_mpp
		FROM pestablishment_product
		left join product using(idproduct)
		LEFT JOIN product_catagory USING(idproduct_catagory) 
		left join unite using(idunite) where idpestablishment=C2 AND idproduct_catagory_parent = 2  ORDER BY productname ;

ELSEIF(C1>0 AND C2>0)THEN

SELECT ___find_pe_name(idpestablishment) as godownname, 
		 ___find_product_name_two(idproduct) as productname , 
		concat (ammount,' ',unite_name) as qty,product_mrp,product_mpp
		FROM pestablishment_product
		left join product using(idproduct)
		LEFT JOIN product_catagory USING(idproduct_catagory) 
		left join unite using(idunite) where idproduct=C1 AND idpestablishment=C2  ORDER BY productname;
		
END IF;

END$$

DROP PROCEDURE IF EXISTS `___show_bank_statement`$$
CREATE      PROCEDURE `___show_bank_statement`(IN ID INT, IN D1 DATE, IN D2 DATE)
BEGIN



  IF ID > 0 THEN
    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived`, 0 as `paid` FROM `transaction` WHERE idmestablishment = ID AND transaction_status=1 AND transaction_type=2 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
         UNION
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), 0 as `recived`, -transaction_ammount as `paid` FROM `transaction` WHERE idmestablishment = ID AND transaction_status=1 AND transaction_type=2 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, recived DESC;

  ELSE

    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived`, 0 as `paid` FROM `transaction` WHERE transaction_status=1 AND transaction_type=2 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
         UNION
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), 0 as `recived`, -transaction_ammount as `paid` FROM `transaction` WHERE transaction_status=1 AND transaction_type=2 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, recived DESC;

  END IF;




END$$

DROP PROCEDURE IF EXISTS `___show_cash_bank_statement`$$
CREATE      PROCEDURE `___show_cash_bank_statement`(IN `ID` INT, IN `HID` INT, IN `D1` DATE, IN `D2` DATE)
BEGIN


  IF HID <= 0 THEN

  IF ID > 0 THEN
    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived`, 0 as `paid`, ___FIND_TRANSACTION_TYPE(idtransaction) FROM `transaction` WHERE idmestablishment = ID AND transaction_status=1 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
         UNION
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), 0 as `recived`, -transaction_ammount as `paid` , ___FIND_TRANSACTION_TYPE(idtransaction) FROM `transaction` WHERE idmestablishment = ID AND transaction_status=1 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, idtransaction;

  ELSE

    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived`, 0 as `paid` , ___FIND_TRANSACTION_TYPE(idtransaction) FROM `transaction` WHERE transaction_status=1 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
         UNION
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), 0 as `recived`, -transaction_ammount as `paid` , ___FIND_TRANSACTION_TYPE(idtransaction) FROM `transaction` WHERE transaction_status=1 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, idtransaction;

  END IF;


  ELSE



  IF ID > 0 THEN
    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived`, 0 as `paid` , ___FIND_TRANSACTION_TYPE(idtransaction) FROM `transaction` WHERE transaction_status=1 AND idmestablishment = ID AND idtransaction_head = HID AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
         UNION
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), 0 as `recived`, -transaction_ammount as `paid` , ___FIND_TRANSACTION_TYPE(idtransaction) FROM `transaction` WHERE transaction_status=1 AND idmestablishment = ID AND idtransaction_head = HID AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, idtransaction;

  ELSE

    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived`, 0 as `paid` , ___FIND_TRANSACTION_TYPE(idtransaction) FROM `transaction`  WHERE transaction_status=1 AND idtransaction_head = HID AND  transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
         UNION
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), 0 as `recived`, -transaction_ammount as `paid` , ___FIND_TRANSACTION_TYPE(idtransaction) FROM `transaction` WHERE transaction_status=1 AND idtransaction_head = HID AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, idtransaction;

  END IF;




  END IF;

END$$

DROP PROCEDURE IF EXISTS `___show_cash_statement`$$
CREATE      PROCEDURE `___show_cash_statement`(IN ID INT, IN D1 DATE, IN D2 DATE)
BEGIN



  IF ID > 0 THEN
    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived`, 0 as `paid` FROM `transaction` WHERE idmestablishment = ID AND transaction_status=1 AND transaction_type=1 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
         UNION
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), 0 as `recived`, -transaction_ammount as `paid` FROM `transaction` WHERE idmestablishment = ID AND transaction_status=1 AND transaction_type=1 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, recived DESC;

  ELSE

    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived`, 0 as `paid` FROM `transaction` WHERE transaction_status=1 AND transaction_type=1 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
         UNION
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), 0 as `recived`, -transaction_ammount as `paid` FROM `transaction` WHERE transaction_status=1 AND transaction_type=1 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, recived DESC;

  END IF;




END$$

DROP PROCEDURE IF EXISTS `___show_client_supplier_ledger`$$
CREATE      PROCEDURE `___show_client_supplier_ledger`(IN `IDC` INT, IN `D1` DATE, IN `D2` DATE)
BEGIN



Declare dr DOUBLE;

Declare cr DOUBLE;




SELECT * FROM  (

SELECT idsales,sales_date as `date`,0 as dr, sales_ammount as cr , 1 , '' as details FROM

(

SELECT idsales,sales_date,sales_ammount , 1 FROM sales

WHERE sales_status = 2 AND sales_date BETWEEN D1 AND D2 AND idcompany = IDC

) as a LEFT JOIN sales_details USING(idsales) WHERE sales_ispurchase_return = 0


UNION


SELECT idsales,sales_date as `date`, 0 as dr,  sales_ammount as cr , 4 , '' as details FROM

(

SELECT idsales,sales_date,sales_ammount , 1 FROM sales

WHERE sales_status > 0 AND sales_date BETWEEN D1 AND D2  AND idcompany = IDC

) as a LEFT JOIN sales_details USING(idsales) WHERE sales_ispurchase_return = 1


UNION


SELECT idpurchase,purchase_date as `date`, purchase_ammount as dr ,0 as cr ,  2,  '' as details  FROM

(

SELECT idpurchase,purchase_date,purchase_ammount , 1 FROM purchase

WHERE purchase_status = 1 AND purchase_date BETWEEN D1 AND D2  AND idcompany = IDC

) as a LEFT JOIN purchase_details USING(idpurchase) WHERE purchase_issales_return = 0


UNION


SELECT idpurchase,purchase_date as `date`, purchase_ammount as dr , 0 as cr ,  3 , '' as details FROM

(

SELECT idpurchase,purchase_date,purchase_ammount , 1 FROM purchase

WHERE purchase_status = 1 AND purchase_date BETWEEN D1 AND D2  AND idcompany = IDC

) as a LEFT JOIN purchase_details USING(idpurchase) WHERE purchase_issales_return = 1


UNION


SELECT idtransaction, transaction_date as `date`, transaction_ammount as dr, 0 as cr, 5, ___find_transaction_head(idtransaction) FROM

(

SELECT * FROM transaction_company WHERE idcompany = IDC

) as a LEFT JOIN transaction USING(idtransaction) WHERE transaction_status = 1 AND transaction_date BETWEEN D1 AND D2  AND transaction_ammount > 0


UNION


SELECT idtransaction, transaction_date as `date`, 0 as dr, -transaction_ammount as cr, 6, ___find_transaction_head(idtransaction) FROM

(

SELECT * FROM transaction_company WHERE idcompany = IDC

) as a LEFT JOIN transaction USING(idtransaction) WHERE transaction_status = 1 AND transaction_date BETWEEN D1 AND D2  AND transaction_ammount < 0

) as ab ORDER BY `date`;





END$$

DROP PROCEDURE IF EXISTS `___show_delivered_report`$$
CREATE      PROCEDURE `___show_delivered_report`(IN `CID` INT, IN `PID` INT, IN `D1` DATE, IN `D2` DATE)
BEGIN
 
SET CID:= (SELECT IF(ISNULL(CID),0,CID));
SET PID:= (SELECT IF(ISNULL(PID),0,PID));

IF CID = 0 AND PID = 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment),
	 ___find_company_name(idcompany), sales_ammount
 
  FROM
    (SELECT * FROM sales WHERE sales_status = 2  AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales);


ELSEIF CID > 0 AND PID = 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount
  FROM
    (SELECT * FROM sales WHERE sales_status = 2  AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idcompany = CID;

ELSEIF CID = 0 AND PID > 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount
  FROM
    (SELECT * FROM sales WHERE sales_status = 2  AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idpestablishment = PID;

ELSEIF CID > 0 AND PID > 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount
  FROM
    (SELECT * FROM sales WHERE sales_status = 2  AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idcompany = CID AND idpestablishment = PID;
END IF;


END$$

DROP PROCEDURE IF EXISTS `___show_employee_attendance`$$
CREATE      PROCEDURE `___show_employee_attendance`( IN C1 INT , IN D1  DATE , IN D2 DATE)
BEGIN

Declare DD1 DATETIME;

Declare DD2 DATETIME;


 SET DD1 =concat(D1,' ','00:00:00');

 SET DD2 =concat(D2,' ','23:59:59');

if(C1>0)Then

         SELECT  concat(post_name,' : ' ,staff_name)  as staff_name , date_time as entry , 0 as `exit` , type FROM staff_attendance
			   Left join staff USING(idstaff)
			   Left JOIN post using(idpost)where idstaff=C1 AND date_time between DD1 AND DD2 AND type =1
			   Union
			   SELECT  concat(post_name,' : ' ,staff_name) as staff_name , 0 as entry , date_time as `exit`, type FROM staff_attendance
			   Left join staff USING(idstaff)
			   Left JOIN post using(idpost)where idstaff=C1 AND date_time between DD1 AND DD2 AND type =2;

ELSE

         SELECT  concat(post_name,' : ' ,staff_name)  as staff_name , date_time as entry , 0 as `exit` , type FROM staff_attendance
			   Left join staff USING(idstaff)
			   Left JOIN post using(idpost)where date_time between DD1 AND DD2 AND type =1
			   Union
			   SELECT  concat(post_name,' : ' ,staff_name) as staff_name , 0 as entry , date_time as `exit`, type FROM staff_attendance
			   Left join staff USING(idstaff)
			   Left JOIN post using(idpost)where date_time between DD1 AND DD2 AND type =2;
 END IF;

END$$

DROP PROCEDURE IF EXISTS `___show_input_output_log`$$
CREATE      PROCEDURE `___show_input_output_log`(IN `ID` INT,IN `PEID` INT, IN `D1` DATE, IN `D2` DATE)
BEGIN

IF (PEID > 0)Then


SELECT * FROM (
  SELECT idsales ,stock_product_output_date as `date`, ___find_pe_name(sp.idpestablishment),
   0 AS INPUT , stock_product_output_qunatity AS OUTPUT , 1 as type

  FROM sales_stock_product_output s
  LEFT JOIN stock_product_output USING(idstock_product_output)
  LEFT JOIN sales USING (idsales)
  LEFT JOIN sales_details as sp Using(idsales)
  Where stock_product_output_status = 1 AND sp.idpestablishment=PEID AND idproduct =ID AND sales_ispurchase_return =0 AND stock_product_output_date between D1 AND D2

  UNION

  SELECT idsales ,stock_product_output_date as `date`, ___find_pe_name(sp.idpestablishment),
   0 AS INPUT , stock_product_output_qunatity AS OUTPUT , 2 as type

  FROM sales_stock_product_output s
  LEFT JOIN stock_product_output USING(idstock_product_output)
  LEFT JOIN sales USING (idsales)
  LEFT JOIN sales_details as sp Using(idsales)

  Where stock_product_output_status = 1 AND sp.idpestablishment=PEID AND idproduct =ID AND sales_ispurchase_return =1 AND stock_product_output_date between D1 AND D2


  UNION

  SELECT idstock_adjustment ,stock_product_output_date as `date`, ___find_pe_name(idpestablishment),
   0 AS INPUT , stock_product_output_qunatity AS OUTPUT , 3 as type
  FROM stock_adjustment_stock_product_output s
  LEFT JOIN stock_adjustment USING(idstock_adjustment)
  LEFT JOIN stock_product_output USING (idstock_product_output)

  Where stock_product_output_status = 1 AND idpestablishment=PEID AND idproduct =ID AND stock_product_output_date between D1 AND D2

  UNION

  SELECT  idstock_transfer ,stock_product_output_date as `date`, ___find_pe_name(idpestablishment),
  0 AS INPUT , stock_product_output_qunatity AS OUTPUT , 4 as type
  FROM stock_transfer
  left join stock_transfer_stock_product_input_stock_product_output USING (idstock_transfer)
  LEFT JOIN stock_product_output USING ( idstock_product_output)
  Where stock_product_output_status = 1 AND idpestablishment=PEID AND idproduct =ID AND stock_product_output_date between D1 AND D2

  UNION

  SELECT idpurchase ,stock_product_input_date as `date`, ___find_pe_name(pp.idpestablishment),
  stock_product_input_qunatity AS INPUT , 0 AS OUTPUT , 5 as type

  FROM purchase_stock_product_input s
  LEFT JOIN stock_product_input USING(idstock_product_input)
  LEFT JOIN purchase USING (idpurchase)
  LEFT JOIN purchase_details pp USING(idpurchase)
  Where stock_product_input_status = 1 AND pp.idpestablishment=PEID AND idproduct =ID AND purchase_issales_return =0 AND stock_product_input_date between D1 AND D2

  UNION

  SELECT idpurchase ,stock_product_input_date as `date`, ___find_pe_name(pp.idpestablishment),
   stock_product_input_qunatity AS INPUT , 0 AS OUTPUT , 6 as type

  FROM purchase_stock_product_input s
  LEFT JOIN stock_product_input USING(idstock_product_input)
  LEFT JOIN purchase USING (idpurchase)
  LEFT JOIN purchase_details pp USING(idpurchase)
  Where stock_product_input_status = 1 AND pp.idpestablishment=PEID AND idproduct =ID AND purchase_issales_return =1 AND  stock_product_input_date between D1 AND D2

  UNION

  SELECT idstock_adjustment ,stock_product_input_date as `date`, ___find_pe_name(idpestablishment),
  stock_product_input_qunatity AS INPUT , 0 AS OUTPUT , 3 as type
  FROM stock_adjustment_stock_product_input s
  LEFT JOIN stock_adjustment USING(idstock_adjustment)
  LEFT JOIN stock_product_input USING (idstock_product_input)
  Where stock_product_input_status = 1 AND idpestablishment=PEID  AND idproduct =ID AND stock_product_input_date between D1 AND D2

  UNION

  SELECT idstock_transfer ,stock_product_input_date as `date`, ___find_pe_name(idpestablishment),
  stock_product_input_qunatity AS INPUT , 0 AS OUTPUT , 4 as type
  FROM stock_transfer
  LEFT JOIN stock_transfer_stock_product_input_stock_product_output USING (idstock_transfer)
  LEFT JOIN stock_product_input USING ( idstock_product_input)
  Where stock_product_input_status = 1 AND idpestablishment=PEID AND idproduct =ID AND stock_product_input_date between D1 AND D2

 ) AS ff ORDER BY `date`, INPUT DESC, OUTPUT;

  ELSE


SELECT * FROM (

  SELECT idsales ,stock_product_output_date as `date`, ___find_pe_name(sp.idpestablishment),
   0 AS INPUT , stock_product_output_qunatity AS OUTPUT , 1 as type

  FROM sales_stock_product_output s
  LEFT JOIN stock_product_output USING(idstock_product_output)
  LEFT JOIN sales USING (idsales)
  LEFT JOIN sales_details as sp Using(idsales)
  Where stock_product_output_status = 1 AND idproduct =ID AND sales_ispurchase_return =0 AND stock_product_output_date between D1 AND D2

  UNION

  SELECT idsales ,stock_product_output_date as `date`, ___find_pe_name(sp.idpestablishment),
   0 AS INPUT , stock_product_output_qunatity AS OUTPUT , 2 as type

  FROM sales_stock_product_output s
  LEFT JOIN stock_product_output USING(idstock_product_output)
  LEFT JOIN sales USING (idsales)
  LEFT JOIN sales_details as sp Using(idsales)

  Where stock_product_output_status = 1  AND idproduct =ID AND sales_ispurchase_return =1 AND stock_product_output_date between D1 AND D2


  UNION

  SELECT idstock_adjustment ,stock_product_output_date as `date`, ___find_pe_name(idpestablishment),
   0 AS INPUT , stock_product_output_qunatity AS OUTPUT , 3 as type
  FROM stock_adjustment_stock_product_output s
  LEFT JOIN stock_adjustment USING(idstock_adjustment)
  LEFT JOIN stock_product_output USING (idstock_product_output)

  Where stock_product_output_status = 1  AND idproduct =ID AND stock_product_output_date between D1 AND D2

  UNION

  SELECT  idstock_transfer ,stock_product_output_date as `date`, ___find_pe_name(idpestablishment),
  0 AS INPUT , stock_product_output_qunatity AS OUTPUT , 4 as type
  FROM stock_transfer
  left join stock_transfer_stock_product_input_stock_product_output USING (idstock_transfer)
  LEFT JOIN stock_product_output USING ( idstock_product_output)
  Where stock_product_output_status = 1  AND idproduct =ID AND stock_product_output_date between D1 AND D2
  UNION

  SELECT idpurchase ,stock_product_input_date as `date`, ___find_pe_name(pp.idpestablishment),
  stock_product_input_qunatity AS INPUT , 0 AS OUTPUT , 5 as type

  FROM purchase_stock_product_input s
  LEFT JOIN stock_product_input USING(idstock_product_input)
  LEFT JOIN purchase USING (idpurchase)
  LEFT JOIN purchase_details pp USING(idpurchase)
  Where stock_product_input_status = 1  AND idproduct =ID AND purchase_issales_return =0 AND stock_product_input_date between D1 AND D2

  UNION

  SELECT idpurchase ,stock_product_input_date as `date`, ___find_pe_name(pp.idpestablishment),
   stock_product_input_qunatity AS INPUT , 0 AS OUTPUT , 6 as type

  FROM purchase_stock_product_input s
  LEFT JOIN stock_product_input USING(idstock_product_input)
  LEFT JOIN purchase USING (idpurchase)
  LEFT JOIN purchase_details pp USING(idpurchase)
  Where stock_product_input_status = 1  AND idproduct =ID AND purchase_issales_return =1 AND  stock_product_input_date between D1 AND D2

  UNION

  SELECT idstock_adjustment ,stock_product_input_date as `date`, ___find_pe_name(idpestablishment),
  stock_product_input_qunatity AS INPUT , 0 AS OUTPUT , 3 as type
  FROM stock_adjustment_stock_product_input s
  LEFT JOIN stock_adjustment USING(idstock_adjustment)
  LEFT JOIN stock_product_input USING (idstock_product_input)
  Where stock_product_input_status = 1  AND idproduct=ID AND stock_product_input_date between D1 AND D2

  UNION

  SELECT idstock_transfer ,stock_product_input_date as `date`, ___find_pe_name(idpestablishment),
  stock_product_input_qunatity AS INPUT , 0 AS OUTPUT , 4 as type
  FROM stock_transfer
  LEFT JOIN stock_transfer_stock_product_input_stock_product_output USING (idstock_transfer)
  LEFT JOIN stock_product_input USING ( idstock_product_input)
  Where stock_product_input_status = 1  AND idproduct=ID AND stock_product_input_date between D1 AND D2

  ) AS ll ORDER BY `date`, INPUT DESC, OUTPUT;

  END IF;

END$$

DROP PROCEDURE IF EXISTS `___show_paid_statement`$$
CREATE      PROCEDURE `___show_paid_statement`(IN ID INT, IN HID INT, IN D1 DATE, IN D2 DATE)
BEGIN


  IF HID <= 0 THEN

  IF ID > 0 THEN
    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), -transaction_ammount as `paid` FROM `transaction` WHERE idmestablishment = ID AND transaction_status=1 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, paid DESC;

  ELSE

    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), -transaction_ammount as `paid` FROM `transaction` WHERE transaction_status=1 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, paid DESC;

  END IF;


  ELSE



  IF ID > 0 THEN
    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), -transaction_ammount as `paid` FROM `transaction` WHERE idmestablishment = ID AND transaction_status=1 AND idtransaction_head = HID AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, paid DESC;

  ELSE

    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), -transaction_ammount as `paid` FROM `transaction` WHERE transaction_status=1 AND idtransaction_head = HID AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, paid DESC;

  END IF;




  END IF;

END$$

DROP PROCEDURE IF EXISTS `___show_ppr_sales_chalan`$$
CREATE      PROCEDURE `___show_ppr_sales_chalan`(CID INT, PID INT, D1 DATE, D2 DATE)
BEGIN

SET CID:= (SELECT IF(ISNULL(CID),0,CID));
SET PID:= (SELECT IF(ISNULL(PID),0,PID));

IF CID = 0 AND PID = 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_details_chalan_date
  FROM
    (SELECT * FROM sales WHERE sales_status = 1 AND    sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE sales_ispurchase_return = 0 AND idproduct_catagory = 1;


ELSEIF CID > 0 AND PID = 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_details_chalan_date
  FROM
    (SELECT * FROM sales WHERE sales_status = 1 AND    sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idcompany = CID AND sales_ispurchase_return = 0 AND idproduct_catagory = 1;

ELSEIF CID = 0 AND PID > 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_details_chalan_date
  FROM
    (SELECT * FROM sales WHERE sales_status = 1 AND   sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idpestablishment = PID  AND sales_ispurchase_return = 0 AND idproduct_catagory = 1;

ELSEIF CID > 0 AND PID > 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_details_chalan_date
  FROM
    (SELECT * FROM sales WHERE sales_status = 1 AND sales_ispurchase_return = 0 AND idproduct_catagory = 1  AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idcompany = CID AND idpestablishment = PID  AND sales_ispurchase_return = 0 AND idproduct_catagory = 1;
END IF;

END$$

DROP PROCEDURE IF EXISTS `___show_ppr_sales_order`$$
CREATE      PROCEDURE `___show_ppr_sales_order`(CID INT, PID INT, D1 DATE, D2 DATE)
BEGIN

SET CID:= (SELECT IF(ISNULL(CID),0,CID));
SET PID:= (SELECT IF(ISNULL(PID),0,PID));

IF CID = 0 AND PID = 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_gps_a, sales_gps_b
  FROM
    (SELECT * FROM sales WHERE sales_status = 0    AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE sales_ispurchase_return = 0 AND idproduct_catagory = 1 ;


ELSEIF CID > 0 AND PID = 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_gps_a, sales_gps_b
  FROM
    (SELECT * FROM sales WHERE sales_status = 0    AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idcompany = CID AND sales_ispurchase_return = 0 AND idproduct_catagory = 1 ;

ELSEIF CID = 0 AND PID > 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_gps_a, sales_gps_b
  FROM
    (SELECT * FROM sales WHERE sales_status = 0   AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idpestablishment = PID AND sales_ispurchase_return = 0 AND idproduct_catagory = 1 ;

ELSEIF CID > 0 AND PID > 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_gps_a, sales_gps_b
  FROM
    (SELECT * FROM sales WHERE sales_status = 0    AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idcompany = CID AND idpestablishment = PID AND sales_ispurchase_return = 0 AND idproduct_catagory = 1 ;
END IF;


END$$

DROP PROCEDURE IF EXISTS `___show_pro_bank_statement`$$
CREATE      PROCEDURE `___show_pro_bank_statement`(IN ID INT, IN D1 DATE, IN D2 DATE)
BEGIN



  IF ID > 0 THEN
    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived`, 0 as `paid` FROM `transaction` WHERE idmestablishment = ID AND transaction_status=0 AND transaction_type=2 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
         UNION
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), 0 as `recived`, -transaction_ammount as `paid` FROM `transaction` WHERE idmestablishment = ID AND transaction_status=0 AND transaction_type=2 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, recived DESC;

  ELSE

    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived`, 0 as `paid` FROM `transaction` WHERE transaction_status=0 AND transaction_type=2 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
         UNION
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), 0 as `recived`, -transaction_ammount as `paid` FROM `transaction` WHERE transaction_status=0 AND transaction_type=2 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, recived DESC;

  END IF;




END$$

DROP PROCEDURE IF EXISTS `___show_pro_cash_bank_statement`$$
CREATE      PROCEDURE `___show_pro_cash_bank_statement`(IN ID INT, IN HID INT, IN D1 DATE, IN D2 DATE)
BEGIN


  IF HID <= 0 THEN

  IF ID > 0 THEN
    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived`, 0 as `paid` FROM `transaction` WHERE idmestablishment = ID AND transaction_status=0 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
         UNION
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), 0 as `recived`, -transaction_ammount as `paid` FROM `transaction` WHERE idmestablishment = ID AND transaction_status=0 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, recived DESC;

  ELSE

    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived`, 0 as `paid` FROM `transaction` WHERE transaction_status=0 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
         UNION
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), 0 as `recived`, -transaction_ammount as `paid` FROM `transaction` WHERE transaction_status=0 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, recived DESC;

  END IF;


  ELSE



  IF ID > 0 THEN
    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived`, 0 as `paid` FROM `transaction` WHERE transaction_status=0 AND idmestablishment = ID AND idtransaction_head = HID AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
         UNION
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), 0 as `recived`, -transaction_ammount as `paid` FROM `transaction` WHERE transaction_status=0 AND idmestablishment = ID AND idtransaction_head = HID AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, recived DESC;

  ELSE

    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived`, 0 as `paid` FROM `transaction`  WHERE transaction_status=0 AND idtransaction_head = HID AND  transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
         UNION
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), 0 as `recived`, -transaction_ammount as `paid` FROM `transaction` WHERE transaction_status=0 AND idtransaction_head = HID AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, recived DESC;

  END IF;




  END IF;

END$$

DROP PROCEDURE IF EXISTS `___show_pro_cash_statement`$$
CREATE      PROCEDURE `___show_pro_cash_statement`(IN ID INT, IN D1 DATE, IN D2 DATE)
BEGIN



  IF ID > 0 THEN
    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived`, 0 as `paid` FROM `transaction` WHERE idmestablishment = ID AND transaction_status=0 AND transaction_type=1 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
         UNION
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), 0 as `recived`, -transaction_ammount as `paid` FROM `transaction` WHERE idmestablishment = ID AND transaction_status=0 AND transaction_type=1 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, recived DESC;

  ELSE

    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived`, 0 as `paid` FROM `transaction` WHERE transaction_status=0 AND transaction_type=1 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
         UNION
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), 0 as `recived`, -transaction_ammount as `paid` FROM `transaction` WHERE transaction_status=0 AND transaction_type=1 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, recived DESC;

  END IF;




END$$

DROP PROCEDURE IF EXISTS `___show_pro_paid_statement`$$
CREATE      PROCEDURE `___show_pro_paid_statement`(IN ID INT, IN HID INT, IN D1 DATE, IN D2 DATE)
BEGIN


  IF HID <= 0 THEN

  IF ID > 0 THEN
    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), -transaction_ammount as `paid` FROM `transaction` WHERE idmestablishment = ID AND transaction_status=0 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, paid DESC;

  ELSE

    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), -transaction_ammount as `paid` FROM `transaction` WHERE transaction_status=0 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, paid DESC;

  END IF;


  ELSE



  IF ID > 0 THEN
    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), -transaction_ammount as `paid` FROM `transaction` WHERE idmestablishment = ID AND transaction_status=0 AND idtransaction_head = HID AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, paid DESC;

  ELSE

    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction), -transaction_ammount as `paid` FROM `transaction` WHERE transaction_status=0 AND idtransaction_head = HID AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0
    ) as a ORDER BY transaction_date, paid DESC;

  END IF;




  END IF;

END$$

DROP PROCEDURE IF EXISTS `___show_pro_recived_statement`$$
CREATE      PROCEDURE `___show_pro_recived_statement`(IN ID INT, IN HID INT, IN D1 DATE, IN D2 DATE)
BEGIN


  IF HID <= 0 THEN

  IF ID > 0 THEN
    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived` FROM `transaction` WHERE idmestablishment = ID AND transaction_status=0 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
      ) as a ORDER BY transaction_date, recived DESC;

  ELSE

    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived` FROM `transaction` WHERE transaction_status=0 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
      ) as a ORDER BY transaction_date, recived DESC;

  END IF;


  ELSE



  IF ID > 0 THEN
    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived` FROM `transaction` WHERE idmestablishment = ID AND transaction_status=0 AND idtransaction_head = HID AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
      ) as a ORDER BY transaction_date, recived DESC;

  ELSE

    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived` FROM `transaction`  WHERE transaction_status=0 AND idtransaction_head = HID AND  transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
      ) as a ORDER BY transaction_date, recived DESC;

  END IF;




  END IF;

END$$

DROP PROCEDURE IF EXISTS `___show_purchase_history`$$
CREATE      PROCEDURE `___show_purchase_history`( IN IDC INT , IN IDP INT , IN D1 DATE  , IN D2 DATE )
BEGIN


SET IDP:= (SELECT IF(ISNULL(IDP),0,IDP));
SET IDC:= (SELECT IF(ISNULL(IDC),0,IDC));

 IF(IDP=0 AND IDC=0)THEN

    SELECT idpurchase,purchase_date, ___find_company_name(idcompany), ___find_pe_name(idpestablishment),  purchase_ammount FROM (
    SELECT * FROM purchase_details p
    ) as a LEFT JOIN purchase USING(idpurchase) WHERE purchase_status = 1 AND purchase_date between D1 AND D2;


    ELSEIF (IDP>0 AND IDC=0)THEN

    SELECT idpurchase,purchase_date, ___find_company_name(idcompany), ___find_pe_name(idpestablishment),  purchase_ammount FROM (
    SELECT * FROM purchase_details p
    ) as a LEFT JOIN purchase USING(idpurchase) WHERE purchase_status = 1 AND idpestablishment = IDP AND purchase_date between D1 AND D2;


    ELSEIF(IDP=0 AND IDC>0)THEN

    SELECT idpurchase,purchase_date, ___find_company_name(idcompany), ___find_pe_name(idpestablishment),  purchase_ammount FROM (
    SELECT * FROM purchase_details p
    ) as a LEFT JOIN purchase USING(idpurchase) WHERE purchase_status = 1 AND idcompany = IDC AND purchase_date between D1 AND D2;


    ELSEIF(IDP>0 AND IDC>0)THEN

    SELECT idpurchase,purchase_date, ___find_company_name(idcompany), ___find_pe_name(idpestablishment),  purchase_ammount FROM (
    SELECT * FROM purchase_details p
    ) as a LEFT JOIN purchase USING(idpurchase) WHERE purchase_status = 1 AND idpestablishment = IDP AND idcompany = IDC AND purchase_date between D1 AND D2;


    END IF;

END$$

DROP PROCEDURE IF EXISTS `___show_purchase_return_history`$$
CREATE      PROCEDURE `___show_purchase_return_history`(IN `CID` INT, IN `PID` INT, IN `D1` DATE, IN `D2` DATE)
BEGIN
 
SET CID:= (SELECT IF(ISNULL(CID),0,CID));
SET PID:= (SELECT IF(ISNULL(PID),0,PID));

IF CID = 0 AND PID = 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount
  FROM
    (SELECT * FROM sales WHERE sales_status = 2  AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE sales_ispurchase_return=1;

ELSEIF CID > 0 AND PID = 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount
  FROM
    (SELECT * FROM sales WHERE sales_status = 2  AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idcompany = CID AND sales_ispurchase_return=1;

ELSEIF CID = 0 AND PID > 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount
  FROM
    (SELECT * FROM sales WHERE sales_status = 2  AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idpestablishment = PID AND sales_ispurchase_return=1;

ELSEIF CID > 0 AND PID > 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount
  FROM
    (SELECT * FROM sales WHERE sales_status = 2  AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idcompany = CID AND idpestablishment = PID AND sales_ispurchase_return=1;
END IF;


END$$

DROP PROCEDURE IF EXISTS `___show_recived_statement`$$
CREATE      PROCEDURE `___show_recived_statement`(IN ID INT, IN HID INT, IN D1 DATE, IN D2 DATE)
BEGIN


  IF HID <= 0 THEN

  IF ID > 0 THEN
    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived` FROM `transaction` WHERE idmestablishment = ID AND transaction_status=1 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
      ) as a ORDER BY transaction_date, recived DESC;

  ELSE

    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived` FROM `transaction` WHERE transaction_status=1 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
      ) as a ORDER BY transaction_date, recived DESC;

  END IF;


  ELSE



  IF ID > 0 THEN
    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived` FROM `transaction` WHERE idmestablishment = ID AND transaction_status=1 AND idtransaction_head = HID AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
      ) as a ORDER BY transaction_date, recived DESC;

  ELSE

    SELECT * FROM (
      SELECT idtransaction,transaction_date,___find_me_name_for_transaction(idtransaction),___find_transaction_head(idtransaction),___find_transaction_with_details(idtransaction),transaction_ammount as `recived` FROM `transaction`  WHERE transaction_status=1 AND idtransaction_head = HID AND  transaction_date BETWEEN D1 AND D2 AND transaction_ammount > 0
      ) as a ORDER BY transaction_date, recived DESC;

  END IF;




  END IF;

END$$

DROP PROCEDURE IF EXISTS `___show_sales_chalan`$$
CREATE      PROCEDURE `___show_sales_chalan`(CID INT, PID INT, D1 DATE, D2 DATE)
BEGIN

SET CID:= (SELECT IF(ISNULL(CID),0,CID));
SET PID:= (SELECT IF(ISNULL(PID),0,PID));

IF CID = 0 AND PID = 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_details_chalan_date
  FROM
    (SELECT * FROM sales WHERE sales_status = 1  AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales);


ELSEIF CID > 0 AND PID = 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_details_chalan_date
  FROM
    (SELECT * FROM sales WHERE sales_status = 1  AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idcompany = CID;

ELSEIF CID = 0 AND PID > 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_details_chalan_date
  FROM
    (SELECT * FROM sales WHERE sales_status = 1  AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idpestablishment = PID;

ELSEIF CID > 0 AND PID > 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_details_chalan_date
  FROM
    (SELECT * FROM sales WHERE sales_status = 1  AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idcompany = CID AND idpestablishment = PID;
END IF;

END$$

DROP PROCEDURE IF EXISTS `___show_sales_order`$$
CREATE      PROCEDURE `___show_sales_order`(CID INT, PID INT, D1 DATE, D2 DATE)
BEGIN

SET CID:= (SELECT IF(ISNULL(CID),0,CID));
SET PID:= (SELECT IF(ISNULL(PID),0,PID));

IF CID = 0 AND PID = 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_gps_a, sales_gps_b
  FROM
    (SELECT * FROM sales WHERE sales_status = 0  AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales);


ELSEIF CID > 0 AND PID = 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_gps_a, sales_gps_b
  FROM
    (SELECT * FROM sales WHERE sales_status = 0  AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idcompany = CID;

ELSEIF CID = 0 AND PID > 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_gps_a, sales_gps_b
  FROM
    (SELECT * FROM sales WHERE sales_status = 0  AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idpestablishment = PID;

ELSEIF CID > 0 AND PID > 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_gps_a, sales_gps_b
  FROM
    (SELECT * FROM sales WHERE sales_status = 0  AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idcompany = CID AND idpestablishment = PID;
END IF;


END$$

DROP PROCEDURE IF EXISTS `___show_sales_return`$$
CREATE      PROCEDURE `___show_sales_return`( IN IDP INT , IN IDC INT , IN D1 DATE  , IN D2 DATE )
BEGIN


SET IDP:= (SELECT IF(ISNULL(IDP),0,IDP));
SET IDC:= (SELECT IF(ISNULL(IDC),0,IDC));

 IF(IDP=0 AND IDC=0)THEN

  SELECT idpurchase, purchase_date, purchase_ammount, purchase_discount_rate,
  purchase_discount_ammount , ___find_company_name(idcompany),___find_pe_name(idpestablishment)

  FROM (SELECT * FROM purchase WHERE purchase_status = 0 AND purchase_date between D1 AND D2) as a
  LEFT JOIN purchase_details USING(idpurchase) WHERE purchase_issales_return = 1;

 ELSEIF (IDP>0 AND IDC=0)THEN

  SELECT idpurchase, purchase_date, purchase_ammount, purchase_discount_rate,
  purchase_discount_ammount , ___find_company_name(idcompany),___find_pe_name(idpestablishment)

  FROM (SELECT * FROM purchase WHERE purchase_status = 0 AND purchase_date between D1 AND D2) as a
  LEFT JOIN purchase_details USING(idpurchase) WHERE purchase_issales_return = 1 AND idpestablishment = IDP;

 ELSEIF (IDP=0 AND IDC>0)THEN

  SELECT idpurchase, purchase_date, purchase_ammount, purchase_discount_rate,
  purchase_discount_ammount , ___find_company_name(idcompany),___find_pe_name(idpestablishment)

  FROM (SELECT * FROM purchase WHERE purchase_status = 0 AND purchase_date between D1 AND D2) as a
  LEFT JOIN purchase_details USING(idpurchase) WHERE purchase_issales_return = 1 AND idcompany = IDC;


 ELSEIF (IDP>0 AND IDC>0)THEN

  SELECT idpurchase, purchase_date, purchase_ammount, purchase_discount_rate,
  purchase_discount_ammount , ___find_company_name(idcompany),___find_pe_name(idpestablishment)

  FROM (SELECT * FROM purchase WHERE purchase_status = 0 AND purchase_date between D1 AND D2) as a
  LEFT JOIN purchase_details USING(idpurchase) WHERE purchase_issales_return = 1  AND idpestablishment = IDP AND idcompany = IDC;

 END IF;

END$$

DROP PROCEDURE IF EXISTS `___show_sales_return_history`$$
CREATE      PROCEDURE `___show_sales_return_history`( IN IDC INT , IN IDP INT , IN D1 DATE  , IN D2 DATE )
BEGIN


SET IDP:= (SELECT IF(ISNULL(IDP),0,IDP));
SET IDC:= (SELECT IF(ISNULL(IDC),0,IDC));

 IF(IDP=0 AND IDC=0)THEN

    SELECT idpurchase,purchase_date, ___find_company_name(idcompany), ___find_pe_name(idpestablishment),  purchase_ammount FROM (
    SELECT * FROM purchase_details p WHERE purchase_issales_return = 1
    ) as a LEFT JOIN purchase USING(idpurchase) WHERE purchase_date between D1 AND D2;


    ELSEIF (IDP>0 AND IDC=0)THEN

    SELECT idpurchase,purchase_date, ___find_company_name(idcompany), ___find_pe_name(idpestablishment),  purchase_ammount FROM (
    SELECT * FROM purchase_details p WHERE purchase_issales_return = 1
    ) as a LEFT JOIN purchase USING(idpurchase) WHERE idpestablishment = IDP AND purchase_date between D1 AND D2;


    ELSEIF(IDP=0 AND IDC>0)THEN

    SELECT idpurchase,purchase_date, ___find_company_name(idcompany), ___find_pe_name(idpestablishment),  purchase_ammount FROM (
    SELECT * FROM purchase_details p WHERE purchase_issales_return = 1
    ) as a LEFT JOIN purchase USING(idpurchase) WHERE idcompany = IDC AND purchase_date between D1 AND D2;


    ELSEIF(IDP>0 AND IDC>0)THEN

    SELECT idpurchase,purchase_date, ___find_company_name(idcompany), ___find_pe_name(idpestablishment),  purchase_ammount FROM (
    SELECT * FROM purchase_details p WHERE purchase_issales_return = 1
    ) as a LEFT JOIN purchase USING(idpurchase) WHERE idpestablishment = IDP AND idcompany = IDC AND purchase_date between D1 AND D2;


    END IF;

END$$

DROP PROCEDURE IF EXISTS `___show_staff_ledger`$$
CREATE      PROCEDURE `___show_staff_ledger`(IN `ID` INT, IN `D1` DATE, IN `D2` DATE)
BEGIN


SELECT * FROM  (

SELECT idtransaction, transaction_date as `date`, 0 as dr, transaction_ammount as cr, ___find_transaction_head(idtransaction) FROM

(SELECT * FROM transaction_staff WHERE idstaff = ID

) as a LEFT JOIN transaction USING(idtransaction) WHERE transaction_status = 1 AND transaction_date BETWEEN D1 AND D2  AND transaction_ammount > 0


UNION


SELECT idtransaction, transaction_date as `date`, -transaction_ammount as dr, 0 as cr, ___find_transaction_head(idtransaction) FROM

(SELECT * FROM transaction_staff WHERE idstaff = ID

) as a LEFT JOIN transaction USING(idtransaction) WHERE transaction_status = 1 AND transaction_date BETWEEN D1 AND D2 AND transaction_ammount < 0


UNION


SELECT idstaff_grant, staff_grant_date as `date`, 0 as dr, staff_grant_ammount as cr, (SELECT transaction_head_name FROM transaction_head WHERE idtransaction_head=s.idtransaction_head)
  FROM staff_grant s WHERE idstaff = ID AND staff_grant_status=1 AND staff_grant_date BETWEEN D1 AND D2

) as ab ORDER BY `date`;


END$$

DROP PROCEDURE IF EXISTS `___show_transaction_head_statement`$$
CREATE      PROCEDURE `___show_transaction_head_statement`(IN `HID` INT, IN `D1` DATE, IN `D2` DATE)
BEGIN

 
 IF HID>0 THEN


  SELECT SUM(transaction_ammount) AS Receiving ,0 as Paying, transaction_head_name,transaction_type   FROM `transaction` t
	LEFT JOIN transaction_head USING(idtransaction_head) WHERE transaction_ammount > 0 AND idmestablishment=HID AND transaction_date BETWEEN D1 AND D2 GROUP BY idtransaction_head
    	UNION
	SELECT 0 AS Receiving, SUM(transaction_ammount) AS Paying , transaction_head_name,transaction_type  FROM `transaction` t
	LEFT JOIN transaction_head USING(idtransaction_head) WHERE transaction_ammount < 0 AND idmestablishment=HID AND transaction_date BETWEEN D1 AND D2 GROUP BY idtransaction_head;

  ELSE
	SELECT SUM(transaction_ammount) AS Receiving ,0 as Paying, transaction_head_name,transaction_head_type  FROM `transaction` t
	LEFT JOIN transaction_head USING(idtransaction_head) WHERE transaction_ammount > 0 AND transaction_date BETWEEN D1 AND D2 GROUP BY idtransaction_head
    	UNION
	SELECT 0 AS Receiving, SUM(transaction_ammount) AS Paying , transaction_head_name,transaction_head_type  FROM `transaction` t
	LEFT JOIN transaction_head USING(idtransaction_head) WHERE transaction_ammount < 0 AND transaction_date BETWEEN D1 AND D2 GROUP BY idtransaction_head;
 END IF;


END$$

DROP PROCEDURE IF EXISTS `___show_upvc_sales_chalan`$$
CREATE      PROCEDURE `___show_upvc_sales_chalan`(CID INT, PID INT, D1 DATE, D2 DATE)
BEGIN

SET CID:= (SELECT IF(ISNULL(CID),0,CID));
SET PID:= (SELECT IF(ISNULL(PID),0,PID));

IF CID = 0 AND PID = 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_details_chalan_date
  FROM
    (SELECT * FROM sales WHERE sales_status = 1 AND    sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE sales_ispurchase_return = 0 AND  idproduct_catagory = 2;


ELSEIF CID > 0 AND PID = 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_details_chalan_date
  FROM
    (SELECT * FROM sales WHERE sales_status = 1 AND    sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idcompany = CID AND sales_ispurchase_return = 0 AND  idproduct_catagory = 2;

ELSEIF CID = 0 AND PID > 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_details_chalan_date
  FROM
    (SELECT * FROM sales WHERE sales_status = 1 AND   sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idpestablishment = PID  AND sales_ispurchase_return = 0 AND  idproduct_catagory = 2;

ELSEIF CID > 0 AND PID > 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_details_chalan_date
  FROM
    (SELECT * FROM sales WHERE sales_status = 1 AND sales_ispurchase_return = 0 AND  idproduct_catagory = 2  AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idcompany = CID AND idpestablishment = PID  AND sales_ispurchase_return = 0 AND  idproduct_catagory = 2;
END IF;

END$$

DROP PROCEDURE IF EXISTS `___show_upvc_sales_order`$$
CREATE      PROCEDURE `___show_upvc_sales_order`(CID INT, PID INT, D1 DATE, D2 DATE)
BEGIN

SET CID:= (SELECT IF(ISNULL(CID),0,CID));
SET PID:= (SELECT IF(ISNULL(PID),0,PID));

IF CID = 0 AND PID = 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_gps_a, sales_gps_b
  FROM
    (SELECT * FROM sales WHERE sales_status = 0    AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE sales_ispurchase_return = 0 AND  idproduct_catagory = 2 ;


ELSEIF CID > 0 AND PID = 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_gps_a, sales_gps_b
  FROM
    (SELECT * FROM sales WHERE sales_status = 0    AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idcompany = CID AND sales_ispurchase_return = 0 AND  idproduct_catagory = 2 ;

ELSEIF CID = 0 AND PID > 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_gps_a, sales_gps_b
  FROM
    (SELECT * FROM sales WHERE sales_status = 0   AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idpestablishment = PID AND sales_ispurchase_return = 0 AND  idproduct_catagory = 2 ;

ELSEIF CID > 0 AND PID > 0 THEN
  SELECT
    idsales, sales_date, ___find_pe_name(idpestablishment), ___find_company_name(idcompany), sales_ammount, sales_gps_a, sales_gps_b
  FROM
    (SELECT * FROM sales WHERE sales_status = 0    AND sales_date BETWEEN D1 AND D2 ) as sales
  LEFT JOIN
  sales_details USING(idsales) WHERE idcompany = CID AND idpestablishment = PID AND sales_ispurchase_return = 0 AND  idproduct_catagory = 2 ;
END IF;


END$$

DROP PROCEDURE IF EXISTS `___view_client_ledger`$$
CREATE      PROCEDURE `___view_client_ledger`(IN `ID` INT, IN `D1` DATE, IN `D2` DATE)
BEGIN

  SET @Bl:= (SELECT company_ob from company_details where idcompany= ID);


    IF( @Bl< 0)THEN

       SET @cr:=@Bl;
       SET @dr:=0;

    ELSEIF( @Bl>=0 )THEN
 
       SET @dr:=@Bl;
       SET @cr:=0;

    END IF;

    SELECT NULL , NULL , @dr , @cr , NULL , NULL

    UNION

    SELECT idpurchase, purchase_date , purchase_ammount as 'due' , 0 as 'advance', 0 , 'purchase' FROM (
		SELECT * FROM purchase WHERE idcompany = ID  AND purchase_date BETWEEN D1 AND D2
		) as a

		UNION

		SELECT idsales, sales_date , 0 as 'due', sales_ammount as 'advance' , 1 , 'sales' FROM (
		SELECT * FROM sales WHERE idcompany = ID  AND sales_date BETWEEN D1 AND D2
		) as b

		UNION

		SELECT idtransaction, transaction_date,transaction_ammount as 'due', 0 as 'advance' ,2,transaction_head_name FROM(
		SELECT * FROM transaction_company WHERE idcompany = ID
		) AS c LEFT JOIN transaction USING(idtransaction)
		LEFT JOIN transaction_head USING(idtransaction_head)
		WHERE (transaction_date BETWEEN D1 AND D2) AND transaction_ammount > 0

		UNION


		SELECT idtransaction, transaction_date, 0 as 'due', -1*transaction_ammount as 'advance',3,transaction_head_name FROM(
		SELECT * FROM transaction_company WHERE idcompany = ID
		) AS c LEFT JOIN transaction USING(idtransaction)
		LEFT JOIN transaction_head USING(idtransaction_head)
		WHERE (transaction_date BETWEEN D1 AND D2) AND transaction_ammount < 0;



END$$

DROP PROCEDURE IF EXISTS `___view_transaction`$$
CREATE      PROCEDURE `___view_transaction`(IN `ID` INT)
BEGIN







  DECLARE transaction_type INT;

  DECLARE transaction_with VARCHAR(256) charset utf8;

  SET transaction_type:= (SELECT ___FIND_TRANSACTION_TYPE(ID));

  SET transaction_with:= (SELECT ___find_transaction_with(ID));



  select idtransaction, idtransaction_head, idmestablishment, transaction_date,

  transaction_ammount, transaction_type,transaction_with, transaction_status, idstaff, iduser,

  transaction_bounced, mestablishment_name, mestablishment_balance, mestablishment_type,

  mestablishment_address, transaction_head_name, idtransaction_head_type, transaction_cheque,

  transaction_bank, transaction_branch, transaction_comments, transaction_entrytime,

  transaction_cheque_date

  from

  (SELECT *  FROM `transaction` t WHERE idtransaction = ID LIMIT 1) as a

  LEFT JOIN mestablishment USING(idmestablishment)

  LEFT JOIN transaction_head USING(idtransaction_head)

  LEFT JOIN transaction_details USING(idtransaction);

END$$

--
-- Functions
--
DROP FUNCTION IF EXISTS `__find_lender_ob`$$
CREATE      FUNCTION `__find_lender_ob`(ID INT, D1 DATE) RETURNS double
BEGIN
RETURN (SELECT IFNULL(SUM(transaction_ammount),0) FROM (
SELECT idtransaction FROM transaction_loan t LEFT JOIN loan USING(idloan) WHERE idlender = ID
) as a LEFT JOIN `transaction` USING(idtransaction) WHERE transaction_date < D1);

END$$

DROP FUNCTION IF EXISTS `___find_company_name`$$
CREATE      FUNCTION `___find_company_name`(`ID` INT) RETURNS varchar(64) CHARSET utf8
    COMMENT 'give company name'
BEGIN
	RETURN (SELECT company_name FROM company c WHERE idcompany = ID);
END$$

DROP FUNCTION IF EXISTS `___find_company_ob`$$
CREATE      FUNCTION `___find_company_ob`(`ID` INT, `D1` DATE) RETURNS double
    COMMENT 'find opening balance of company on a particular date'
BEGIN

	RETURN 0.00;
END$$

DROP FUNCTION IF EXISTS `___find_company_opening_balance`$$
CREATE      FUNCTION `___find_company_opening_balance`(IDC INT, D1 DATE) RETURNS double
BEGIN

  DECLARE sales DOUBLE DEFAULT 0.00;
  DECLARE purchase DOUBLE DEFAULT 0.00;
  DECLARE tran DOUBLE DEFAULT 0.00;
  DECLARE ob DOUBLE DEFAULT 0.00;

  SET sales := (SELECT IF(ISNULL( SUM(sales_ammount)),0, SUM(sales_ammount))  FROM sales s WHERE sales_status = 2 AND   idcompany = IDC AND sales_date < D1);
  SET purchase := (SELECT IF(ISNULL(SUM(purchase_ammount)),0,SUM(purchase_ammount))  FROM purchase s WHERE purchase_status = 1 AND   idcompany = IDC AND purchase_date < D1);

  SET tran := (SELECT IF(ISNULL(SUM(transaction_ammount)),0,SUM(transaction_ammount))     FROM (
    SELECT idtransaction,transaction_ammount FROM `transaction` WHERE transaction_status = 1 AND transaction_date < D1
  ) AS a LEFT JOIN transaction_company USING(idtransaction) WHERE idcompany = IDC);

  SET ob := (SELECT IF( ISNULL(company_ob ),0,company_ob) FROM company_details c WHERE idcompany = IDC LIMIT 1);

  RETURN ( sales + ob - tran - purchase);

END$$

DROP FUNCTION IF EXISTS `___find_company_with_label`$$
CREATE      FUNCTION `___find_company_with_label`(`ID` INT) RETURNS varchar(128) CHARSET utf8
BEGIN
  DECLARE RES VARCHAR(128) CHARSET utf8;
  DECLARE COMPANY_TYPE INT;
  DECLARE COMPANY_NAME VARCHAR(64) CHARSET utf8;

  
  DECLARE CUR_1 CURSOR FOR SELECT company_name, company_type FROM company c WHERE idcompany = ID LIMIT 1;
  DECLARE CONTINUE HANDLER FOR NOT FOUND  SET @END_CUR_1 := 1;

    OPEN CUR_1;
    REPEAT
      FETCH CUR_1 INTO COMPANY_NAME,COMPANY_TYPE;
        UNTIL 1 = 1
    END REPEAT;
    CLOSE CUR_1;

    IF COMPANY_TYPE = 1 THEN
    	IF @software_ln = 1 THEN
	    	SET RES = "ক্রেতা : ";
        ELSE
            SET RES = "CLIENT : ";
	   END IF;
	    	
    ELSEIF  COMPANY_TYPE = 2 THEN
    	IF @software_ln = 1 THEN
	    	SET RES = "সরবরাহকারী : ";
        ELSE
            SET RES = "SUPPLIER : ";
	   END IF;
    END IF;
    SET RES := CONCAT(RES , COMPANY_NAME );
    
    RETURN RES;

END$$

DROP FUNCTION IF EXISTS `___find_mestablishment_ob`$$
CREATE      FUNCTION `___find_mestablishment_ob`(`ID` INT, `D1` DATE) RETURNS double
    COMMENT 'find opening balance of cash / bank on a particular date'
BEGIN
  DECLARE AMMOUNT DOUBLE DEFAULT 0.00;
  DECLARE COMPANY_OB DOUBLE DEFAULT 0.00;
  DECLARE COMPANY_REG DATE  DEFAULT '1980-01-01';

  
  DECLARE CUR_1 CURSOR FOR SELECT mestablishment_reg_date, IF(mestablishment_ob IS NULL, 0 , mestablishment_ob) FROM mestablishment_details WHERE idmestablishment = ID LIMIT 1;

  DECLARE CONTINUE HANDLER FOR NOT FOUND  SET @END_CUR_1 := 1;


    OPEN CUR_1;
    REPEAT
      FETCH CUR_1 INTO COMPANY_REG , COMPANY_OB;
        UNTIL 1 = 1
    END REPEAT;
    CLOSE CUR_1;


	SET AMMOUNT := (SELECT IF(`sum` IS NULL, 0 , `sum`) FROM (SELECT SUM(transaction_ammount) AS 'sum' FROM `transaction` t WHERE transaction_status = 1 AND idmestablishment = ID AND transaction_date < D1 ) as a);

	IF D1 >= COMPANY_REG THEN
		SET AMMOUNT := AMMOUNT + COMPANY_OB;
	END IF;

	RETURN AMMOUNT;
END$$

DROP FUNCTION IF EXISTS `___find_mestablishment_opening_balance`$$
CREATE      FUNCTION `___find_mestablishment_opening_balance`(IDM INT, D1 DATE) RETURNS double
BEGIN

  DECLARE tran DOUBLE DEFAULT 0.00;
  DECLARE ob DOUBLE DEFAULT 0.00;

  SET tran := (SELECT IF(ISNULL(SUM(transaction_ammount)),0,SUM(transaction_ammount))     FROM (
    SELECT idtransaction,transaction_ammount,idmestablishment FROM `transaction` WHERE transaction_status = 1 AND transaction_date < D1
  ) AS a WHERE idmestablishment = IDM);

  SET ob := (SELECT IF( ISNULL(mestablishment_ob ),0,mestablishment_ob) FROM mestablishment_details c WHERE idmestablishment = IDM LIMIT 1);

  RETURN ( ob + tran );

END$$

DROP FUNCTION IF EXISTS `___find_me_name`$$
CREATE      FUNCTION `___find_me_name`(`ID` INT) RETURNS varchar(64) CHARSET utf8
    COMMENT 'give mestablishment name'
BEGIN
	RETURN (SELECT mestablishment_name FROM mestablishment WHERE idmestablishment = ID);
END$$

DROP FUNCTION IF EXISTS `___find_me_name_for_transaction`$$
CREATE      FUNCTION `___find_me_name_for_transaction`(`ID` INT) RETURNS varchar(64) CHARSET utf8
BEGIN

  RETURN (SELECT mestablishment_name FROM `transaction` LEFT JOIN mestablishment USING(idmestablishment) WHERE idtransaction=ID);

END$$

DROP FUNCTION IF EXISTS `___find_pb_sales_return`$$
CREATE      FUNCTION `___find_pb_sales_return`(D1 DATE,  ID INT, IC INT) RETURNS double
BEGIN
  RETURN (SELECT IFNULL(SUM(purchase_ammount),0) FROM purchase p LEFT JOIN purchase_details USING(idpurchase) WHERE purchase_issales_return = 1 AND idstaff = ID AND purchase_date < D1 AND purchase_status = 1 AND idcompany = IC);
END$$

DROP FUNCTION IF EXISTS `___find_pb_sl`$$
CREATE      FUNCTION `___find_pb_sl`(`IDS` INT,`IDC` INT, `D1` DATE) RETURNS double
    COMMENT 'find previous balance of company on a particular date for SALE'
BEGIN
  DECLARE AMMOUNT DOUBLE DEFAULT 0.00;


	SET AMMOUNT := (SELECT SUM(sales_ammount) FROM ( SELECT * FROM sales WHERE sales_status = 2 AND idcompany=IDC AND sales_date < D1) as a
LEFT JOIN  sales_details USING(idsales) WHERE idstaff = IDS);

	RETURN if( ISNULL(AMMOUNT), 0,  AMMOUNT );
END$$

DROP FUNCTION IF EXISTS `___find_pb_tr`$$
CREATE      FUNCTION `___find_pb_tr`(`IDS` INT,`IDC` INT, `D1` DATE) RETURNS double
    COMMENT 'find previous balance of company on a date for transaction'
BEGIN
  DECLARE AMMOUNT DOUBLE DEFAULT 0.00;


	SET AMMOUNT := (SELECT SUM(transaction_ammount) FROM ( SELECT * FROM `transaction_company` WHERE idcompany=IDC) as a
LEFT JOIN `transaction` USING(idtransaction) WHERE transaction_status = 1 AND transaction_date < D1 AND idstaff = IDS);

	RETURN if( ISNULL(AMMOUNT), 0,  AMMOUNT );
END$$

DROP FUNCTION IF EXISTS `___find_pestablishment_opening_balance`$$
CREATE      FUNCTION `___find_pestablishment_opening_balance`(PID INT,PESID INT, D1 DATE) RETURNS double
BEGIN

DECLARE RET_VAL DOUBLE;
DECLARE a DOUBLE;
DECLARE b DOUBLE;

IF(PESID>0)THEN
  set a:= (SELECT  sum(s.stock_product_input_qunatity)
         FROM stock_product_input s
         left join pestablishment p using (idpestablishment)
         left join stock_product_input using(idproduct)
         where idproduct=PID AND s.stock_product_input_status=1 AND s.stock_product_input_date< D1
         AND s.idpestablishment = PESID );

  IF ( (SELECT ISNULL(a) = 1)) THEN
    set a:= 0;
  END IF;


  set b:= (SELECT  sum(s.stock_product_output_qunatity )
         FROM stock_product_output s
         left join pestablishment p using (idpestablishment)
         left join stock_product_input using(idproduct)
         where idproduct=PID AND s.stock_product_output_status=1 AND s.stock_product_output_date< D1
         AND s.idpestablishment = PESID );


  IF ( (SELECT ISNULL(b) = 1)) THEN
      set b:= 0;
  END IF;

ELSE

  set a:= (SELECT  sum(s.stock_product_input_qunatity)
         FROM stock_product_input s
         left join pestablishment p using (idpestablishment)
         left join stock_product_input using(idproduct)
         where idproduct=PID AND s.stock_product_input_status=1 AND s.stock_product_input_date< D1);

  IF ( (SELECT ISNULL(a) = 1)) THEN
    set a:= 0;
  END IF;

  set b:= (SELECT  sum(s.stock_product_output_qunatity )
         FROM stock_product_output s
         left join pestablishment p using (idpestablishment)
         left join stock_product_input using(idproduct)
         where idproduct=PID AND s.stock_product_output_status=1 AND s.stock_product_output_date< D1 );


  IF ( (SELECT ISNULL(b) = 1)) THEN
      set b:= 0;
  END IF;

END IF;

SET RET_VAL := a-b;
RETURN RET_VAL;

END$$

DROP FUNCTION IF EXISTS `___find_pe_name`$$
CREATE      FUNCTION `___find_pe_name`(`ID` INT) RETURNS varchar(64) CHARSET utf8
    COMMENT 'give pestablishment name'
BEGIN
	RETURN (SELECT pestablishment_name FROM pestablishment WHERE idpestablishment = ID);
END$$

DROP FUNCTION IF EXISTS `___find_previous_purchase_balance`$$
CREATE      FUNCTION `___find_previous_purchase_balance`(IDC INT, D1 DATE) RETURNS double
BEGIN

  SET @purchase := (SELECT IF(ISNULL( SUM(purchase_ammount)),0, SUM(purchase_ammount))
                   FROM purchase LEFT JOIN purchase_details USING(idpurchase)
                   WHERE purchase_status=1 AND purchase_issales_return=0 AND idcompany = IDC AND purchase_date < D1);

  SET @purchase_return := (SELECT IF(ISNULL( SUM(sales_ammount)),0, SUM(sales_ammount))
                           FROM sales LEFT JOIN sales_details USING(idsales)
                           WHERE sales_status = 2 AND sales_ispurchase_return=1 AND idcompany = IDC AND sales_date < D1);

  SET @tran := (SELECT IF(ISNULL(SUM(transaction_ammount)),0,SUM(transaction_ammount))
                FROM transaction_company LEFT JOIN `transaction` USING(idtransaction)
                WHERE (idtransaction_head=13 OR idtransaction_head=16)
                    AND transaction_status=1 AND idcompany = IDC AND transaction_date < D1);

  SET @ob := (SELECT IF( ISNULL(company_ob ),0,company_ob) FROM company_details c WHERE idcompany = IDC LIMIT 1);

  RETURN ( -(@purchase-@purchase_return) + @ob - @tran );

END$$

DROP FUNCTION IF EXISTS `___find_previous_sales_balance`$$
CREATE      FUNCTION `___find_previous_sales_balance`(IDC INT, D1 DATE) RETURNS double
BEGIN

  SET @sales := (SELECT IF(ISNULL( SUM(sales_ammount)),0, SUM(sales_ammount))
               FROM sales LEFT JOIN sales_details USING(idsales)
               WHERE sales_status = 2 AND sales_ispurchase_return=0 AND idcompany = IDC AND sales_date < D1);

  SET @sales_return := (SELECT IF(ISNULL( SUM(purchase_ammount)),0, SUM(purchase_ammount))
                      FROM purchase LEFT JOIN purchase_details USING(idpurchase)
                      WHERE purchase_status=1 AND purchase_issales_return=1 AND idcompany = IDC AND purchase_date < D1);

  SET @tran := (SELECT IF(ISNULL(SUM(transaction_ammount)),0,SUM(transaction_ammount))
                FROM transaction_company LEFT JOIN `transaction` USING(idtransaction)
                WHERE (idtransaction_head=14 OR idtransaction_head=15)
                    AND transaction_status=1 AND idcompany = IDC AND transaction_date < D1);

  SET @ob := (SELECT IF( ISNULL(company_ob ),0,company_ob) FROM company_details c WHERE idcompany = IDC LIMIT 1);

  RETURN ( (@sales-@sales_return) + @ob - @tran );

END$$

DROP FUNCTION IF EXISTS `___find_product_name`$$
CREATE      FUNCTION `___find_product_name`(`ID` INT) RETURNS varchar(128) CHARSET utf8
BEGIN
  DECLARE PR_NAME VARCHAR(128);
  DECLARE PR_ID INT;
  SET PR_NAME := (  SELECT product_name FROM product p WHERE idproduct = ID LIMIT 1);
  SET PR_ID := (  SELECT idproduct_catagory FROM product p WHERE idproduct = ID LIMIT 1);

  WHILE(SELECT IFNULL(PR_ID,FALSE)) DO
    SET PR_NAME := CONCAT((    SELECT product_catagory_name FROM product_catagory  WHERE idproduct_catagory = PR_ID LIMIT 1), ' - ',PR_NAME);
    SET PR_ID :=(SELECT idproduct_catagory_parent FROM product_catagory  WHERE idproduct_catagory = PR_ID LIMIT 1);
  END WHILE;
  RETURN PR_NAME;
END$$

DROP FUNCTION IF EXISTS `___find_product_name_except_last`$$
CREATE      FUNCTION `___find_product_name_except_last`(ID INT) RETURNS varchar(128) CHARSET utf8
BEGIN
  DECLARE PR_NAME VARCHAR(128);
  DECLARE PR_ID INT;
  SET PR_NAME := (  SELECT product_name FROM product p WHERE idproduct = ID LIMIT 1);
  SET PR_ID := (  SELECT idproduct_catagory FROM product p WHERE idproduct = ID LIMIT 1);

  WHILE(SELECT IFNULL(PR_ID,FALSE)) DO

    SET @pr :=(SELECT idproduct_catagory_parent FROM product_catagory  WHERE idproduct_catagory = PR_ID LIMIT 1);
    IF (SELECT IFNULL(@pr,FALSE)) THEN
      SET PR_NAME := CONCAT((    SELECT product_catagory_name FROM product_catagory  WHERE idproduct_catagory = PR_ID LIMIT 1), ' - ',PR_NAME);
      SET PR_ID = @pr;
    ELSE
      SET PR_ID = NULL;
    END IF;
  END WHILE;
  RETURN PR_NAME;
END$$

DROP FUNCTION IF EXISTS `___find_product_name_two`$$
CREATE      FUNCTION `___find_product_name_two`(`ID` INT) RETURNS varchar(128) CHARSET utf8
BEGIN

  DECLARE PR_NAME VARCHAR(128);

  DECLARE PR_ID INT;

  SET PR_NAME := (  SELECT product_name FROM product p WHERE idproduct = ID LIMIT 1);

  SET PR_ID := (  SELECT idproduct_catagory FROM product p WHERE idproduct = ID LIMIT 1);





    SET PR_NAME := CONCAT((    SELECT product_catagory_name FROM product_catagory  WHERE idproduct_catagory = PR_ID LIMIT 1), ' - ',PR_NAME);

    SET PR_ID :=(SELECT idproduct_catagory_parent FROM product_catagory  WHERE idproduct_catagory = PR_ID LIMIT 1);



  RETURN PR_NAME;

END$$

DROP FUNCTION IF EXISTS `___find_product_opening_balance`$$
CREATE      FUNCTION `___find_product_opening_balance`(ID INT , D1 DATE) RETURNS double
BEGIN

DECLARE RET_VAL DOUBLE;
DECLARE a DOUBLE;
DECLARE b DOUBLE;


set a:=(SELECT sum(stock_product_input_qunatity) FROM product
         left join stock_product_input using(idproduct)
         where idproduct=ID AND stock_product_input_status=1  AND stock_product_input_date<D1);


IF ( (SELECT ISNULL(a) = 1)) THEN
    set a:= 0;
END IF;


set b:=(SELECT sum(stock_product_input_qunatity) FROM product
         left join stock_product_input using(idproduct)
         where idproduct=ID AND stock_product_input_status=1 AND stock_product_input_date<D1);

IF ( (SELECT ISNULL(b) = 1)) THEN
    set b:= 0;
END IF;


SET RET_VAL:= a-b;

RETURN RET_VAL;

END$$

DROP FUNCTION IF EXISTS `___find_product_stock`$$
CREATE      FUNCTION `___find_product_stock`(`ID` INT) RETURNS double
BEGIN

RETURN (SELECT num FROM (
SELECT idproduct, a-b as num FROM (
SELECT idproduct , SUM(inum) a , SUM(onum) b  FROM (

SELECT idproduct, 0 as inum, SUM(stock_product_output_qunatity) as onum , 1  FROM stock_product_output  WHERE stock_product_output_status = 1 GROUP BY  idproduct
UNION
SELECT idproduct, SUM(stock_product_input_qunatity) as inum, 0 as onum, 2  FROM stock_product_input  WHERE stock_product_input_status = 1 GROUP BY  idproduct
) as a GROUP BY idproduct
) as b
) as b WHERE idproduct = ID);

	
END$$

DROP FUNCTION IF EXISTS `___find_product_type`$$
CREATE      FUNCTION `___find_product_type`(`ID` INT) RETURNS int(11)
BEGIN
  RETURN (SELECT product_type FROM product WHERE idproduct = ID LIMIT 1 );
END$$

DROP FUNCTION IF EXISTS `___find_product_unit`$$
CREATE      FUNCTION `___find_product_unit`(`ID` INT) RETURNS varchar(64) CHARSET utf8
BEGIN
  RETURN (SELECT unite_name FROM (
SELECT idunite FROM product p WHERE idproduct = ID
) as a LEFT JOIN unite USING(idunite));
END$$

DROP FUNCTION IF EXISTS `___find_sales_return`$$
CREATE      FUNCTION `___find_sales_return`(D1 DATE, D2 DATE,  ID INT, IC INT) RETURNS double
BEGIN
  RETURN (SELECT IFNULL(SUM(purchase_ammount),0) FROM purchase p LEFT JOIN purchase_details USING(idpurchase) WHERE purchase_issales_return = 1 AND idstaff = ID AND purchase_date BETWEEN D1 AND D2 AND purchase_status = 1 AND idcompany = IC);
END$$

DROP FUNCTION IF EXISTS `___find_staff_opening_balance`$$
CREATE      FUNCTION `___find_staff_opening_balance`(IDE INT, D1 DATE) RETURNS double
BEGIN

  DECLARE gran DOUBLE DEFAULT 0.00;
  DECLARE tran DOUBLE DEFAULT 0.00;
  DECLARE ob DOUBLE DEFAULT 0.00;

  SET gran := (SELECT IF( ISNULL(SUM(staff_grant_ammount)), 0, SUM(staff_grant_ammount) ) FROM staff_grant s WHERE idstaff=IDE AND staff_grant_date < D1);

  SET tran := (SELECT IF(ISNULL(SUM(transaction_ammount)),0,SUM(transaction_ammount))     FROM (
    SELECT idtransaction,transaction_ammount FROM `transaction` WHERE transaction_status = 1 AND transaction_date < D1
  ) AS a LEFT JOIN transaction_staff USING(idtransaction) WHERE idstaff = IDE);

  SET ob := (SELECT IF( ISNULL(staff_ob ),0,staff_ob) FROM staff_details c WHERE idstaff = IDE LIMIT 1);

  RETURN ( -gran - ob - tran );

END$$

DROP FUNCTION IF EXISTS `___find_stock_opening_balance`$$
CREATE      FUNCTION `___find_stock_opening_balance`(`PID` INT, `PEID` INT, `D1` DATE) RETURNS double
BEGIN

	

	DECLARE inp DOUBLE;

	DECLARE outp DOUBLE;



IF PID > 0 AND PEID > 0 THEN



SET outp:=(SELECT IF(ISNULL(sum(stock_product_output_qunatity)),0,sum(stock_product_output_qunatity))
  FROM stock_product_output s
  Where stock_product_output_status = 1 AND idpestablishment=PEID AND idproduct=PID AND stock_product_output_date < D1);

SET inp:=(SELECT IF(ISNULL(sum(stock_product_input_qunatity)),0,sum(stock_product_input_qunatity))
  FROM stock_product_input s
  Where stock_product_input_status = 1 AND idpestablishment=PEID AND idproduct=PID AND stock_product_input_date < D1);


ELSEIF PID > 0 AND PEID = 0 THEN


SET outp:=(SELECT IF(ISNULL(sum(stock_product_output_qunatity)),0,sum(stock_product_output_qunatity))
  FROM stock_product_output s
  Where stock_product_output_status = 1 AND idproduct=PID AND stock_product_output_date < D1);

SET inp:=(SELECT IF(ISNULL(sum(stock_product_input_qunatity)),0,sum(stock_product_input_qunatity))
  FROM stock_product_input s
  Where stock_product_input_status = 1 AND idproduct=PID AND stock_product_input_date < D1);



END IF;




	RETURN inp-outp;



END$$

DROP FUNCTION IF EXISTS `___find_transaction_head`$$
CREATE      FUNCTION `___find_transaction_head`(`ID` INT) RETURNS varchar(128) CHARSET utf8
BEGIN
  RETURN (SELECT transaction_head_name FROM `transaction` LEFT JOIN transaction_head USING(idtransaction_head)
LEFT JOIN transaction_head_type USING(idtransaction_head_type) WHERE idtransaction=ID);
END$$

DROP FUNCTION IF EXISTS `___FIND_TRANSACTION_TYPE`$$
CREATE      FUNCTION `___FIND_TRANSACTION_TYPE`(`ID` INT) RETURNS int(11)
BEGIN

   /* 1 mean with company, 2 mean with staff , 3 mean with propiter, 4 mean with other */
   /* 5 loan, 6 incentive reciver , 7 fund transfer */

   DECLARE RET_VAL INT;

   SET RET_VAL = (

       SELECT * FROM (

          SELECT 1 FROM transaction_company LEFT JOIN company USING(idcompany) WHERE idtransaction = ID LIMIT 1

          UNION

          SELECT 2 FROM transaction_staff LEFT JOIN staff USING(idstaff) WHERE idtransaction = ID LIMIT 1

          UNION

          SELECT 3 FROM transaction_propiter LEFT JOIN propiter USING(idpropiter) WHERE idtransaction = ID LIMIT 1

          UNION

          SELECT 4 FROM transaction_other WHERE idtransaction = ID LIMIT 1

          UNION

          SELECT 5 FROM transaction_loan  LEFT JOIN loan USING(idloan)  WHERE idtransaction = ID LIMIT 1

          UNION

          SELECT 6 FROM transaction_incentive_reciver  LEFT JOIN incenvice_reciver USING(idincentive_reciver)  WHERE idtransaction = ID LIMIT 1
          
          UNION
 
          SELECT 7 FROM `transaction` t WHERE  idtransaction = ID AND (idtransaction_head = 23 OR  idtransaction_head =53) LIMIT 1
          
          ) as a LIMIT 1 );

   RETURN RET_VAL;

END$$

DROP FUNCTION IF EXISTS `___find_transaction_with`$$
CREATE      FUNCTION `___find_transaction_with`(`ID` INT) RETURNS varchar(128) CHARSET utf8
BEGIN




RETURN (SELECT company_name FROM transaction_company LEFT JOIN company USING(idcompany) WHERE idtransaction = ID LIMIT 1
UNION
SELECT lender_name FROM transaction_loan LEFT JOIN loan USING(idloan) LEFT JOIN lender USING(idlender)  WHERE idtransaction = ID LIMIT 1
UNION
SELECT propiter_name FROM transaction_propiter LEFT JOIN propiter USING(idpropiter)  WHERE idtransaction = ID LIMIT 1
UNION
SELECT staff_name FROM transaction_staff t LEFT JOIN staff USING(idstaff) WHERE idtransaction = ID LIMIT 1
UNION
SELECT incentive_reciver_name FROM transaction_incentive_reciver LEFT JOIN incenvice_reciver USING(idincentive_reciver) WHERE idtransaction = ID LIMIT 1
UNION
SELECT `for` FROM transaction_other t  WHERE idtransaction = ID LIMIT 1);

END$$

DROP FUNCTION IF EXISTS `___find_transaction_with_details`$$
CREATE      FUNCTION `___find_transaction_with_details`(`ID` INT) RETURNS varchar(128) CHARSET utf8
BEGIN




RETURN (SELECT company_name FROM transaction_company LEFT JOIN company USING(idcompany) WHERE idtransaction = ID LIMIT 1
UNION
SELECT CONCAT('[', idloan,'] ', lender_name) FROM transaction_loan LEFT JOIN loan USING(idloan) LEFT JOIN lender USING(idlender) WHERE idtransaction = ID LIMIT 1
UNION
SELECT propiter_name FROM transaction_propiter LEFT JOIN propiter USING(idpropiter)  WHERE idtransaction = ID LIMIT 1
UNION
SELECT CONCAT('[',division_name,'  ', post_name,']  ', staff_name) FROM transaction_staff LEFT JOIN staff USING(idstaff) LEFT JOIN post USING(idpost) LEFT JOIN division USING(iddivision) WHERE idtransaction = ID LIMIT 1
UNION
SELECT `for` FROM transaction_other t  WHERE idtransaction = ID LIMIT 1);

END$$

DROP FUNCTION IF EXISTS `___product_with_parents`$$
CREATE      FUNCTION `___product_with_parents`(`ID` INT) RETURNS varchar(256) CHARSET latin1
BEGIN
	RETURN "ABC";
END$$

DROP FUNCTION IF EXISTS `___show_mestablishment_past_balance`$$
CREATE      FUNCTION `___show_mestablishment_past_balance`(ID INT, D1 DATE) RETURNS double
BEGIN
  DECLARE BAL DOUBLE;
  IF ID > 0 THEN
    SET BAL =  (SELECT SUM(transaction_ammount) FROM `transaction` t WHERE transaction_date < D1 AND idmestablishment = ID );
  ELSE
    SET BAL =  (SELECT SUM(transaction_ammount) FROM `transaction` t WHERE transaction_date < D1);
  END IF;
  RETURN BAL;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
CREATE TABLE IF NOT EXISTS `bank` (
`idbank` int(10) unsigned NOT NULL,
  `bank_name_en` varchar(64) NOT NULL,
  `bank_name_bn` varchar(64) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`idbank`, `bank_name_en`, `bank_name_bn`) VALUES
(1, 'AB Bank Limited', ''),
(2, 'Bangladesh Commerce Bank Limited', ''),
(3, 'Bank Asia Limited', ''),
(4, 'BRAC Bank Limited', ''),
(5, 'Dhaka Bank Limited', NULL),
(6, 'Dutch Bangla Bank Limited', NULL),
(7, 'Eastern Bank Limited', NULL),
(8, 'Farmers Bank Limited', NULL),
(9, 'IFIC Bank Limited', NULL),
(10, 'Jamuna Bank Limited', NULL),
(11, 'Meghna Bank Limited', NULL),
(12, 'Mercantile Bank Limited', NULL),
(13, 'Midland Bank Limited', NULL),
(14, 'Midland Bank Limited', NULL),
(15, 'Mutual Trust Bank Limited', NULL),
(16, 'National Bank Limited', NULL),
(17, 'NCC Bank Limited', NULL),
(18, 'NRB Bank Limited', NULL),
(19, 'NRB Commercial Bank Limited', NULL),
(20, 'NRB Global Bank Ltd', NULL),
(21, 'One Bank Limited', NULL),
(22, 'Prime Bank Limited', NULL),
(23, 'Pubali Bank Limited', NULL),
(24, 'South Bangla Agriculture and Commerce Bank Ltd', NULL),
(25, 'Southeast Bank Limited', NULL),
(26, 'Standard Bank Limited', NULL),
(27, 'The City Bank Limited', NULL),
(28, 'The Premier Bank Limited', NULL),
(29, 'Trust Bank Limited', NULL),
(30, 'United Commercial Bank Ltd', NULL),
(31, 'Uttara Bank Limited', NULL),
(32, 'Al-Arafah Islami Bank Limited', NULL),
(33, 'Export Import Bank of Bangladesh Limited', NULL),
(34, 'First Security Islami Bank Limited', NULL),
(35, 'ICB Islamic Bank', NULL),
(36, 'Islami Bank Bangladesh Limited', NULL),
(37, 'Shahjalal islami bank Limited', NULL),
(38, 'Social Islami Bank Limited', NULL),
(39, 'Union Bank Limited', NULL),
(40, 'Bank Alfalah', NULL),
(41, 'Citibank NA', NULL),
(42, 'Commercial Bank of Ceylon', NULL),
(43, 'Habib Bank Limited', NULL),
(44, 'HSBC ( The Hong Kong and Shanghai Banking Corporation Ltd. )', NULL),
(45, 'National Bank of Pakistan', NULL),
(46, 'Standard Chartered Bank', NULL),
(47, 'State Bank of India', NULL),
(48, 'Woori Bank', NULL),
(49, 'Bangladesh Krishi Bank', NULL),
(50, 'Rajshahi Krishi Unnayan Bank', NULL),
(51, 'Bangladesh Development Bank Ltd', NULL),
(52, 'BASIC Bank Limited', NULL),
(53, 'Probashi Kallyan Bank', NULL),
(54, 'Z-Bank', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bitstring`
--

DROP TABLE IF EXISTS `bitstring`;
CREATE TABLE IF NOT EXISTS `bitstring` (
  `letter` varchar(2) NOT NULL,
  `bit` char(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `bitstring`
--

INSERT INTO `bitstring` (`letter`, `bit`) VALUES
('  ', '100110101101'),
('$', '100100100101'),
('%', '101001001001'),
('*', '100101101101'),
('+', '100101001001'),
('-', '100101011011'),
('.', '110010101101'),
('/', '100100101001'),
('0', '101001101101'),
('1', '110100101011'),
('2', '101100101011	'),
('3', '110110010101'),
('4', '101001101011'),
('5', '110100110101	'),
('6', '101100110101'),
('7', '101001011011'),
('8', '110100101101'),
('9', '101100101101'),
('A', '110101001011'),
('B', '101101001011'),
('C', '110110100101'),
('D', '101011001011'),
('E', '110101100101'),
('F', '101101100101'),
('G', '101010011011'),
('H', '110101001101'),
('I', '101101001101'),
('J', '101011001101'),
('K', '110101010011'),
('L', '101101010011'),
('M', '110110101001'),
('N', '101011010011'),
('O', '110101101001'),
('P', '101101101001'),
('Q', '101010110011'),
('R', '110101011001'),
('S', '101101011001'),
('T', '101011011001'),
('U', '110010101011'),
('V', '100110101011'),
('W', '110011010101'),
('X', '100101101011'),
('Y', '110010110101'),
('Z', '100110110101');

-- --------------------------------------------------------

--
-- Table structure for table `cheque_leaf`
--

DROP TABLE IF EXISTS `cheque_leaf`;
CREATE TABLE IF NOT EXISTS `cheque_leaf` (
`idcheque_leaf` int(10) unsigned NOT NULL,
  `idbank` int(10) unsigned NOT NULL,
  `cheque_leaf_pre` varchar(10) NOT NULL,
  `cheque_leaf_sl` varchar(10) NOT NULL,
  `cheque_leaf_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cheque_leaf`
--

INSERT INTO `cheque_leaf` (`idcheque_leaf`, `idbank`, `cheque_leaf_pre`, `cheque_leaf_sl`, `cheque_leaf_status`) VALUES
(1, 36, 'IBU', '0001259', 1),
(2, 36, 'IBU', '0001261', 1),
(3, 36, 'IBU', '0001262', 1),
(4, 36, 'IBU', '0001263', 1),
(5, 36, 'IBU', '0001264', 1),
(6, 36, 'IBU', '0001265', 1),
(7, 36, 'IBU', '0001266', 1),
(8, 36, 'IBU', '0001267', 1),
(9, 36, 'IBU', '0001268', 1),
(10, 36, 'IBU', '0001269', 1),
(11, 36, 'IBU', '0001270', 1),
(12, 36, 'IBU', '0001271', 1),
(13, 36, 'IBU', '0001272', 1),
(14, 36, 'IBU', '0001273', 1),
(15, 36, 'IBU', '0001274', 1),
(16, 36, 'IBU', '0001275', 1),
(17, 36, 'IBU', '0001276', 0),
(18, 36, 'IBU', '0001277', 1),
(19, 36, 'IBU', '0001278', 0),
(20, 36, 'IBU', '0001279', 0),
(21, 36, 'IBU', '0001280', 1),
(22, 36, 'IBU', '0001281', 1),
(23, 36, 'IBU', '0001282', 1),
(24, 36, 'IBU', '0001283', 1),
(25, 36, 'IBU', '0001284', 1),
(26, 36, 'IBU', '0001285', 1),
(27, 36, 'IBU', '0001286', 1),
(28, 36, 'IBU', '0001287', 1),
(29, 36, 'IBU', '0001288', 1),
(30, 36, 'IBU', '0001289', 1),
(31, 36, 'IBU', '0001290', 1),
(32, 36, 'IBU', '0001291', 1),
(33, 36, 'IBU', '0001292', 1),
(34, 36, 'IBU', '0001293', 1),
(35, 36, 'IBU', '0001294', 1),
(36, 36, 'IBU', '0001295', 1),
(37, 36, 'IBU', '0001296', 1),
(38, 36, 'IBU', '0001297', 1),
(39, 36, 'IBU', '0001298', 1),
(40, 36, 'IBU', '0001299', 0),
(41, 36, 'IBU', '0001300', 0),
(42, 17, 'C', '0986301', 0),
(43, 17, 'C', '0986302', 0),
(44, 17, 'C', '0986303', 0),
(45, 17, 'C', '0986304', 0),
(46, 17, 'C', '0986305', 0),
(47, 17, 'C', '0986306', 0),
(48, 17, 'C', '0986307', 0),
(49, 17, 'C', '0986308', 0),
(50, 17, 'C', '0986309', 0),
(51, 17, 'C', '0986310', 0),
(52, 17, 'C', '0986311', 0),
(53, 17, 'C', '0986312', 0),
(54, 17, 'C', '0986313', 0),
(55, 17, 'C', '0986314', 0),
(56, 17, 'C', '0986315', 0),
(57, 17, 'C', '0986316', 0),
(58, 17, 'C', '0986317', 0),
(59, 17, 'C', '0986318', 0),
(60, 17, 'C', '0986319', 0),
(61, 17, 'C', '0986320', 0),
(62, 17, 'C', '0986321', 0),
(63, 17, 'C', '0986322', 0),
(64, 17, 'C', '0986323', 0),
(65, 17, 'C', '0986324', 0),
(66, 17, 'C', '0986325', 0),
(67, 17, 'C', '0986326', 0),
(68, 17, 'C', '0986327', 0),
(69, 17, 'C', '0986328', 0),
(70, 17, 'C', '0986329', 0),
(71, 17, 'C', '0986330', 0),
(72, 17, 'C', '0986331', 0),
(73, 17, 'C', '0986332', 0),
(74, 17, 'C', '0986333', 0),
(75, 17, 'C', '0986334', 0),
(76, 17, 'C', '0986335', 0),
(77, 17, 'C', '0986336', 0),
(78, 17, 'C', '0986337', 0),
(79, 17, 'C', '0986338', 0),
(80, 17, 'C', '0986339', 0),
(81, 17, 'C', '0986340', 0),
(82, 17, 'C', '0986341', 0),
(83, 17, 'C', '0986342', 0),
(84, 17, 'C', '0986343', 0),
(85, 17, 'C', '0986344', 0),
(86, 17, 'C', '0986345', 0),
(87, 17, 'C', '0986346', 0),
(88, 17, 'C', '0986347', 0),
(89, 17, 'C', '0986348', 0),
(90, 17, 'C', '0986349', 0),
(91, 17, 'C', '0986350', 0),
(92, 17, 'NCC', '0986258', 1),
(93, 17, 'NCC', '0986259', 1),
(94, 17, 'NCC', '0986260', 0),
(95, 17, 'NCC', '0986261', 0),
(96, 17, 'NCC', '0986262', 0),
(97, 17, 'NCC', '0986263', 0),
(98, 17, 'NCC', '0986264', 0),
(99, 17, 'NCC', '0986265', 0),
(100, 17, 'NCC', '0986266', 0),
(101, 17, 'NCC', '0986267', 0),
(102, 17, 'NCC', '0986268', 0),
(103, 17, 'NCC', '0986269', 0),
(104, 17, 'NCC', '0986270', 0),
(105, 17, 'NCC', '0986271', 0),
(106, 17, 'NCC', '0986272', 0),
(107, 17, 'NCC', '0986273', 0),
(108, 17, 'NCC', '0986274', 0),
(109, 17, 'NCC', '0986275', 0),
(110, 17, 'NCC', '0986276', 0),
(111, 17, 'NCC', '0986277', 0),
(112, 17, 'C', '0986295', 1),
(113, 17, 'C', '0986296', 1),
(114, 17, 'C', '0986297', 1),
(115, 17, 'C', '0986298', 0),
(116, 17, 'C', '0986299', 0),
(117, 17, 'C', '0986300', 0);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
`idcompany` int(10) unsigned NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_balance` double NOT NULL COMMENT '+means company have to pay ATIL',
  `company_creditlimit` double unsigned zerofill DEFAULT NULL,
  `company_phone` varchar(64) NOT NULL,
  `company_address` varchar(255) NOT NULL,
  `company_type` smallint(5) unsigned NOT NULL COMMENT '1 if clitent sales to it, 2 if client buy from it, 3 if do both, 4 if do anyother buisness'
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8 COMMENT='details of other company with whome our client do buisness';

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`idcompany`, `company_name`, `company_balance`, `company_creditlimit`, `company_phone`, `company_address`, `company_type`) VALUES
(5, 'Abiding Development &amp; Holdings Ltd (ADHL)', 282799.69999999984, 0000000000000100000000, '+8801924585234', 'Akram Tower, Level-8, Suite-9, 199, Shahid Syed Nazrul Islam Sharani (15/5,BijoyNagar) Dhaka', 1),
(6, 'New Jharna Sanitary', 0, 0000000000000100000000, '+8801972522945', '3, Darus-Salam Road, Mirpur-1, Dhaka', 1),
(7, 'Feni Dealer    ', 0.00000000005820766091346741, 0000000000000100000000, '+8801721612270', 'Ritu Fashion House, Hazi Ibrahim Hossain Super Market, Trank Road, Feni', 1),
(8, 'Major Zakir', -9809.700000000004, 0000000000000100000000, '+8801770252278', 'House # 212, Road # 10, DOHS, Mirpur-12, Dhaka', 1),
(9, 'Mr. Roni', 0, 0000000000000100000000, '+8801819552000', 'Bhanga Press, Matbor Bari, Jatrabari', 1),
(10, 'Sami Real Estate &amp; Housing Ltd', -0.000000000014551915228366852, 0000000000000100000000, '+8801714242739', '241, DIT Road (3rd Floor), Malibagh, Dhaka', 1),
(11, 'Maati Properties Ltd', 136291.75, 0000000000000100000000, '+8801611594291', '84, Sheikh Rasel Square, Panthapath, Dhaka', 1),
(12, 'Sabbir &amp; Brothers ', 0, 0000000000000100000000, '+8801199801563', 'Dhaka Tower,145/147, Hazi Osman Goni Road, Dhaka', 1),
(13, 'Utah Group', 118097.09999999999, 0000000000000100000000, '+8801713041180', 'House-13A,Road-117,Gulshan-1,Dhaka-1212', 1),
(14, 'Shandhani Life Housing &amp; Development Ltd.', -0.000000000007275957614183426, 0000000000000100000000, '+8801833325967', '16, Motijheel C/A (4th Floor), Dhaka-1000', 1),
(15, 'Excel Real Estate &amp; Development Ltd.', 29249.70000000001, 0000000000000100000000, '+8801779593951', '28, Topkhana Road, Dhaka-1000', 1),
(16, 'Victoria Properties Ltd.', 0, 0000000000000100000000, '+8801931165591', 'House # 13, Road # 3, Block # E, Rampura Banashree, Dhaka.', 1),
(17, 'Hi-Q Developers Ltd.', -2144.75, 0000000000000100000000, '+8802-9561749', '1/B, DIT Avenue (5th Floor), Motijheel C/A, Dhaka-1000', 1),
(18, 'Dhaka Polymer Ltd.', 0, 0000000000000100000000, '+8801739622651', 'Green Road', 1),
(19, 'Md. Zahirul Islam', 0, 0000000000000100000000, '+8801711662375', 'Rayer Bagh, Near Punom Cinama Hall, Dhaka.', 1),
(20, 'Shobuj Bhai (Gazipur)', 0.000000000014551915228366852, 0000000000000100000000, '+8801753445615', 'Kashempur, Gazipur.', 1),
(21, 'Ideal Real Estate Ltd.', 33622.5, 0000000000000100000000, '+8802-8113398,', 'Sultana Tower (8th Floor), 2 Mirpur Road, Kalabagan, Dhanmondi, Dhaka.', 1),
(22, 'Sarker Builders &amp; Developers Ltd.', 0, 0000000000000100000000, '+8802-8932136', 'Plot # 10/A, Road # 7/D, Sec # 9, Uttara, Dhaka', 1),
(23, 'Mr. Barek', -0.6000000000003638, 0000000000000100000000, '+8801726264825', '121/3/D, Ibrahimpur, Mirpur, Dhaka.', 1),
(24, 'Mohol Properties Ltd.', 0, 0000000000000100000000, '+8801728262726', '20, Atish Dipanker, Bashaboo (2nd Floor), Dhaka.', 1),
(25, 'Babui Builders Ltd.', 0, 0000000000000100000000, '+8802-8840541', 'Ka- 216, Hakim Plaza (2nd Floor), Badda, Dhaka.', 1),
(26, 'B. N Builders Ltd.', -0.7999999998373823, 0000000000000100000000, '+8801711527067, ', '650/1, Bara Moghbazar, Dhaka-1217.', 1),
(27, 'Intex Builders Limited', 229433.65000000002, 0000000000000100000000, '+8801841410698', 'D. K Tower (5th Floor), Bir Uttam C. R Datta Road, Hatirpool,Dhanmondi, Dhaka.', 1),
(28, 'A To Z Polymer Ltd.', 36045.90000000002, 0000000000000100000000, '+8801712297814', 'Karwan Bazar, Dhaka.', 1),
(29, 'Genusys Ltd.', 0, 0000000000000100000000, '+8801755639389', 'Sruti Tower (4th Floor), Plot # 08, Block # Ka, Sec # 06, Mirpur, Dhaka.', 1),
(30, 'Mim Sanitary', 0, 0000000000000100000000, '+8801711682222', 'Gha- 24/1, Shajadpur, Gulshan, Dhaka.', 1),
(31, 'Lt. Col. Md. Mahabub', 0, 0000000000000100000000, '+8801768962640', 'House # 229, Road # 4, Mirpur DOHS, Dhaka.', 1),
(32, 'Moon Group', 0, 0000000000000100000000, '+8801775351538', '1/5, Mizan Tower, kallayanpur, Dhaka.', 1),
(33, 'Primex Building &amp; Materials Com. Ltd.', 10.299999999999272, 0000000000000100000000, '+8802-85811069, ', '6A-6B, Attaturk Tower, 22 kamal Attaturk Avenue, banani, Dhaka.', 1),
(34, 'Can-Bangla Developers Ltd.', 0, 0000000000000100000000, '+8801911457371', '105, Park Road, (Ground Floor), New DOHS, Mohakhali, Dhaka.', 1),
(35, 'Gtech Limited', 0.000000000014551915228366852, 0000000000000100000000, '+8801721446886', 'House # 65, Road # 4, Block # D, Bashundhara, Dhaka.', 1),
(36, 'Md. Monir', 0, 0000000000000100000000, '+880676563913', '59, Lal Chan Mokim Lane, Roth Khola', 1),
(37, 'H. S. Real Estate', 0, 0000000000000100000000, '+8802-8714518,', 'House # 148, (Ground Floor), Road # 4, New DOHS, Mohakhali, Dhaka.', 1),
(38, 'Suncity Builders Ltd.', 0, 0000000000000100000000, '+8802-8881136,', 'Estern Nibash, (2nd Floor), Suite # 204, 138 gulshan Avenue, Gulshan-2, Dhak-1212.', 1),
(39, 'Tristar Builders Ltd.', 0, 0000000000000100000000, '+8801678079240', '20, Dilkusha C/A, (4th Floor), Dhaka-1000.', 1),
(40, 'Shara Housing Ltd.', 0, 0000000000000100000000, '+8801728284718', 'House # 22/H, Road # 1, Block # D, Bashundhara R/A, Dhaka', 1),
(41, 'Architects Limited', 0, 0000000000000100000000, '+8802-8154358, ', 'Apr # 4B, House # 42, Road # 9/A, Dhanmondi, Dhaka-1209.', 1),
(42, 'Md. Nazmul Hossain ', 0, 0000000000000100000000, '+8801717247385', 'House # 77, Bir Uttam C. R Datta Road, Hatirpool, Dhanmondi, Dhaka.', 1),
(43, 'Dewan Holdings Ltd.', 0, 0000000000000100000000, '+8802-9513567', 'Baitul View Tower, 56/1, Purana Paltan, Dhaka.', 1),
(44, 'Stone Town Developers Ltd.', -7125.599999999977, 0000000000000100000000, '+8802-7211711, ', '583/C (2nd Floor), Shahid Baki Sharani, Malibagh Chowdhury Para, Dhaka,', 1),
(45, 'Heritage design &amp; Development Ltd.', 57.60000000000582, 0000000000000100000000, '+8802-8833895, ', 'House # 500 (1st Floor), Road # 34, New D.O.H.S. Mohakhali, Dhaka.', 1),
(46, 'Kazi Zahid Imtiaz', 0, 0000000000000100000000, '+880171124032', 'Confidance CNG Pump, Nandon, Chondra, Kaliyakar, Gazipur.', 1),
(51, 'Richmond Developers Ltd.', 0, 0000000000000100000000, '+8802-8824239, +8802', 'Monarch (4th Floor), House # 74, Road # 21, Block # B, banani, Dhaka-1213', 1),
(52, 'Manama Developments Ltd.', 0, 0000000000000100000000, '01719-795983', '14/11, Iqbal Road, Mohammadpur, Dhaka', 1),
(53, 'Heritage Real Estate Ltd.', 46.29999999999927, 0000000000000100000000, '+8802-9103554', '160, Lake Circus (2nd Floor), Kolabagan, Mirpur Road, Dhanmondi, Dhaka-1205', 1),
(54, 'Md. Raju Chowdhury', 1463.0499999999884, 0000000000000100000000, '+8801716865603', 'House # 27, Mirpur Post Office Road, Mirpur-2, Dhaka', 1),
(56, 'ATIL Sample for Marketing', 141178.7000000002, 0000000000000100000000, '01913030931', '15/5,Bijoy Nagar', 1),
(57, 'A. R Real Estate Ltd.', 0, 0000000000000100000000, '01741-782680', 'House # 131, Road # 4, Block # A, Banani, Dhaka.', 1),
(58, 'Articulation Developments Ltd.', 138953.82659999977, 0000000000000100000000, '0167-8678122', '17/B, Monipuripara (1st Floor), Shangshad Avenue, Dhaka-1215.', 1),
(59, 'Isphahan Real Estate Ltd.', 0, 0000000000000100000000, '01712835113', 'House # 288/5-6, Block # C, Khilgaon Chowdhury Para, Dhaka-1219.', 1),
(60, 'The Orbital (Bangladesh) Limited', -399.28000000009774, 0000000000000100000000, '01730-734116', 'House # 434, Road # 30, New DOHS, Mohakhali, Dhaka', 1),
(61, 'Homes 71 Limited', 81674.60770000002, 0000000000000100000000, '01912-624623', 'House # 434, Main Road (Old), DOHS Mirpur, Dhaka-1216', 1),
(62, 'Col. Md. Saleh Ahamed', 0, 0000000000000100000000, '01833325967', 'House # 1040, Road # 44, DOHS, Mirpur, Dhaka.', 1),
(63, 'Ancient Builders Limited', 0, 0000000000000100000000, '+8801711-389795', '14, Bijoy Nagar, 3rd floor, Dhaka-1000.', 1),
(64, 'Unique Living Ltd.', 73942.3999999999, 0000000000000100000000, '+880167-2013046', 'Padma House, Ground Floor, 117/1, Shantinagar, Dhaka.', 1),
(65, 'Annex Holding Ltd.', -17583.399999999965, 0000000000000100000000, '+8801552-117549', 'Kha- 100/1, Khilkhet Namapara, Dhaka.', 1),
(66, 'Arena Holdings Ltd.', 0, 0000000000000100000000, '01750444000', '8/2, New Eskaton, (Gausnagar), Ground Floor, Ramna, Dhaka', 1),
(69, 'City Polymer Ltd.', 0, 0000000000000100000000, '+880167-5804444', 'House # 442/C, Shaheenbag, Mohakhali, Tejgaon, Dhaka-1225.', 1),
(70, 'Abdul High Sarker', 0, 0000000000000100000000, '01712297814', 'Plot # 1203, Kawla, Uttara, Dhaka.', 1),
(71, 'Adept International ', 8050, 0000000000000100000000, '+8801917247385', 'Dilora Tower, (3rd Floor), House # 77, Bir Uttam C. R Datta Road, Hatirpool, Dhanmondi, Dhaka.', 1),
(72, 'Jamuna Sanitary', 21844.600000000006, 0000000000000100000000, '+880167-6153313', '2/D, Bashtola, Nurerchala, J Block, Baridhara, Dhaka.', 1),
(73, 'Dr. Major Rehana Begum', 0, 0000000000000100000000, '01931-80 95 18', 'House # 1046, Road # 44, DOHS Mirpur, Dhaka.', 1),
(74, 'Gemcon City Limited', 28630.719999999827, 0000000000000100000000, '01713333307', 'House # 44, Road # 16 (27 Old), Dhanmondi, Dhaka', 1),
(75, 'Nirban Real Estate Limited', 0.0000000000009094947017729282, 0000000000000100000000, '0183-33 116 08', 'House # 69/3, Road # 7/A, Dhanmondi, Dhaka', 1),
(76, 'Desun Garments Ltd.', 0, 0000000000000100000000, '+8801712297814', '89/1, Birulia Road, Savar Bus Stand, Savar.', 1),
(77, 'Md. Saiful Islam ', 0, 0000000000000100000000, '01819-20 24 92', '27, Ahamed Nagar, Paik Para, Mirpur-1, Dhaka.', 1),
(78, 'Md. Rakibul Hasan', 10686.75, 0000000000000100000000, '01611-516 9 06', 'House # 105, Road # 1, DOHS Mohakhali, Dhaka', 1),
(79, 'Kingdom Builders Ltd.', 130321.70000000007, 0000000000000100000000, '01678-041203', 'House # 470, Road # 31, DOHS Mohakhali, Dhaka', 1),
(80, 'Somerset Properties Ltd. ', -0.000000000003637978807091713, 0000000000000100000000, '01912-07 59 45', 'House # 23/B, Road # 104, Gulshan-2', 1),
(81, 'Md. Nasir ', 0, 0000000000000100000000, '01822- 87 12 04', '68, Shankar, West Dhanmondi, Dhaka', 1),
(82, 'Md. Mizanur Rahman', 0, 0000000000000100000000, '01911-257133', 'House # 6/D, Topkhana Road, Shegunbagicha, Dhaka.', 1),
(83, 'Home Source Ltd.', 918.8000000000175, 0000000000000100000000, '01819-211406', 'House # 3/1, Block # D, Lalmatia, Dhanmondi, Dhaka', 1),
(84, 'Doreen Interior', 0, 0000000000000100000000, '01816-26 65 56', '60/B, Purana Paltan, Ground floor, Dhaka-1000', 1),
(85, 'Dipa Construction Ltd.', 0.000000000003637978807091713, 0000000000000100000000, '01785-641768', '12/1, Mirpur-10, Dhaka', 1),
(86, 'Navana Engineering Ltd.', 1.0999999999949068, 0000000000000100000000, '01833- 32 66 67', '125/A,Motijheel,C/A,Dhaka', 1),
(87, 'Olive Crown Resources Ltd.', 1501.4000000000233, 0000000000000100000000, '01728-08 66 68', '40/1, Naya Paltan, (84, Shantinagar) (4th Floor), V.I.P Road, A.R Khan Trade Center, Dhaka-1000', 1),
(89, 'Hotel Switch garden', 0, 0000000000000100000000, '01687-36 10 15', 'House # 89, Road # 13, Banani, Dhaka', 1),
(91, 'Rams Developments Ltd', 0, 0000000000000100000000, '01922-10 61 17', 'House # 44 F/6 ( 2nd Floor), West Panthapath, Dhaka-1215', 1),
(92, 'New Borak Sanitary Ware', 0, 0000000000000100000000, '0119-5-09 73 11', '16/2, Azom Road, Mohammadpur, Dhaka-1207', 1),
(93, 'Wealth Builders Ltd.', 498.3999999999942, 0000000000000100000000, '01779-593951', '15/5, Bijoynagar, Dhaka', 1),
(94, 'Helal Senitary', 424.39999999999964, 0000000000000100000000, '01718-348439', '48/3, Mirpur-1, Dhaka', 1),
(96, 'Md. Hanif', 0, 0000000000000100000000, '01712-70 30 17', 'House # 8, Road # 1, Sec # 3, Uattara, Dhaka', 1),
(97, 'Md. Ali Haider (Mis Match)', 116289.4, 0000000000000100000000, '01913-030931', '15/5, Bijoynagar, Dhaka.', 1),
(98, 'Rafique Construction Ltd', 0, 0000000000000100000000, '01946-94 62 82', '33/1, (2nd Floor), Green Road, Dhanmondi, Dhaka.', 1),
(99, 'Dr. Majeda Khatun', 0, 0000000000000100000000, '01741-638532', 'House # 425, Road # 7, Block # D, Bashundhara, Dhaka.', 1),
(100, 'Hazi Abul Hashem Chowdhury', 0.000000000014551915228366852, 0000000000000100000000, '01819-53 47 38', 'Shanti Chaya, Shanti Company Road, Feni.', 1),
(101, 'Epic Properties Ltd', -96.10000000002947, 0000000000000100000000, '01777786719', 'House # 81/3, Autis Dipankar Sharak, Sabujbagh, Bashaboo, Dhaka.', 1),
(102, 'Techven Properties Ltd', 90460.09999999998, 0000000000000100000000, '01763-717585', 'House # 92 A, Mosjid Road, DOHS, Banani, Dhaka', 1),
(103, 'Sharmin Sanitary', 0, 0000000000000100000000, '01621-54 75 90', 'Ga- 23/1, Shahjadpur, Dhaka.', 1),
(104, 'Green Agency', 0, 0000000000000100000000, '01732-82 84 44', '27/1, Haazi Osman Goni Road, Allou Bazar Dhaka.', 1),
(106, 'Belal Hossain', 0, 0000000000000100000000, '01718-483471', '1 No Siddique Bazar, Dhaka', 1),
(107, 'Apon Sanitary', 0, 0000000000000100000000, '01923-47 39 59', '1 No Siddique Bazar, Dhaka.', 1),
(108, 'Home Stade Builders Ltd.', 0, 0000000000000100000000, '01717-46 13 63 ', 'House# 7/2, (4th floor), Block # Ka, Main Road, Bashundhara, Dhaka.', 1),
(109, 'Bashir Ahamed', 0, 0000000000000100000000, '01911-34 21 67', 'Ta 16/2, Middle Badda, Dhaka', 1),
(110, 'Islami Bank bangladesh Limited (Mr. Nasir Ahmed Howlader)', 0, 0000000000000100000000, '01710966601', 'Islami Bank Shyamoli, Mirpur Road, Dhaka.', 1),
(111, 'Md. Karim', 0, 0000000000000100000000, '01712- 28 23 09', 'House # 531/7, Road # 11, Baridhara DOHS, Dhaka', 1),
(112, 'Shohidul Islam', -0.000000000007275957614183426, 0000000000000100000000, '01685-89 55  72', '51/1/ A1, South Mugda, Opside of Jheelpar Mosjid, Dhaka.', 1),
(113, 'Abdul Latif (Feni)', 0.000000000003637978807091713, 0000000000000100000000, '01819-53 47 38', 'Mojlishpur, Mollabari, Cadet Collage Road, Feni', 1),
(114, 'Al Ihasan Realtor Ltd.', 1263.5, 0000000000000100000000, '01678- 70 21 01', 'City Heart Building (10th Floor), Nayapaltan, Dhaka.', 1),
(115, 'Jamal Uddin', 0, 0000000000000100000000, '01621-461370 (Ajomol', 'Khilkhtet East Namapara, Beside Water Tank, Dhaka', 1),
(116, 'Mojammel Haq', 0, 0000000000000100000000, '01785-641764', 'House # 77, Akbor Shah Mosjid Road, Mirpur-1, Dhaka', 1),
(117, 'S.M Khalid Shams', 0.0000000000018189894035458565, 0000000000000100000000, '01924-99 58 85', '264/2, Sultangonj, Rayer Bazar, Dhaka', 1),
(118, 'Thikana Properties Ltd', 465.3000000000029, 0000000000000100000000, '01943-682246', 'House # 202/E, Road # 6, Mohammadia Housing Ltd, Mohammadpur, Dhaka', 1),
(119, 'M/s Talha Enterprise', 171232.40000000002, 0000000000000100000000, '01913-056944', '21, Shahid Soyed Najrul Islam Sharani (North South Road), 26/1, Hazi Osman Goni Road, Dhaka-1000', 1),
(120, 'Cosmic Tower', -399.78999999998223, 0000000000000100000000, '01732-932533', '106/Ka, Nayapalton, Box Culvert Road, Motijheel, Dhaka.', 1),
(121, 'Md.Rafique Shaikh', 0.0000000000018189894035458565, 0000000000000100000000, '01712-97 68 96', '184/1, Ahamed Nagar, Paik Para. Habuler Pukur Par, Near Of  Mosjid.', 1),
(122, 'Momin Real Estate Ltd', 216782.60699999993, 0000000000000100000000, '01819-71 05 15', 'House # 387, Road # 29, Mohakhali D.O.H.S, Dhaka', 1),
(123, 'Md. Liton', 0, 0000000000000100000000, '01830-940704', '42/2, Rayer Bazar, Dhaka', 1),
(124, 'Humayun Kabir Manik (Feni)', 0, 0000000000000100000000, '01715-17 41 23', 'New Police Line, Feni Sadar, Feni', 1),
(125, 'Eastern Housing Limited', 8724.902000000002, 0000000000000100000000, '01724-866897', 'Islam Chamber, 125/A, Motijheel C/A, Dhaka-1000', 1),
(126, 'Rajdhani Sanitary', 0, 0000000000000100000000, '01716-900612', 'Uttar badda, Shahjadpur', 1),
(127, 'Hazi Md. Shahjahan, ', 0, 0000000000000100000000, '01819-534738', 'S.B Leather House, Saudagar Patti, Feni', 1),
(128, 'Nextus Builders &amp; Developers Ltd', 981, 0000000000000100000000, '02-8835184', 'House # 30, Road # 10, block # D, Banani, Dhaka.', 1),
(129, 'Abul Hashem Khan', -0.000000000029103830456733704, 0000000000000100000000, '01711-980350', 'House # 266-2, Isha-kha Road, Ahmed Nagar, Paikpara, Dhaka', 1),
(131, 'Progati Design &amp; Development Ltd', -520.9599999999919, 0000000000000100000000, '01672-463373', 'Al-Raji Complex (3rd floor), Paltan, Dhaka', 1),
(132, 'Nurun Nobi', 0, 0000000000000100000000, '01713-040446', 'House # 8, Road # 4, Sec # 12, Uttara, Dhaka', 1),
(133, 'L.B Trading Link International', -1266.2300000000105, 0000000000000100000000, '02-8960668', 'Flat # 3D (3rd Fl.), House # 06, Road # 14/A,, Sec # 04, Uttara, Dhaka-1230', 1),
(134, 'Md. Miraz Hossain', 0, 0000000000000100000000, '01712-976896', '151/1/A, Habuler Pukur Par Mosjid, Paikpara, Mirpur-1, Dhaka.', 1),
(136, 'Tushar Ahmed', 0, 0000000000000100000000, '01671- 41 75 18 ', '137, Begum Rokeya Sharani, Mirpur # 10, Dhaka', 1),
(137, 'Cosmopolitan Homes Ltd.', 0, 0000000000000100000000, '01678-029821', '22/2, Babor Road, Block # B, Mohammadpur, Dhaka.', 1),
(139, 'Advance Development Consultants Ltd', 0, 0000000000000100000000, '01714-015732', '759, Satmasjid Road, Dhanmondi, Dhaka-1209', 1),
(140, 'Rans Real Estate Ltd', 0, 0000000000000100000000, '01716-185740', 'House # 2015, Road # 14, D.O.H.S Mohakhali, Dhaka', 1),
(141, 'Tropical Homes Ltd', -43.29349999999977, 0000000000000100000000, '01811-455873', 'Planers Tower, Bangla Motor, Dhaka', 1),
(142, 'C.P Bangladesh Co. Ltd.', 0, 0000000000000100000000, '01744-310618', 'Valuka Farm-13, Valuka, Mymensingh. ', 1),
(143, 'Nahar Sanitary', 0, 0000000000000100000000, '01715- 15 04 03', '61/2, Progati Sharani, Baridhara, Dhaka', 1),
(144, 'Janata Saniraty ', 0, 0000000000000100000000, '01772-835496', '10/C, Savar Bus Stand, Savar, Dhaka.', 1),
(145, 'Core Development Ltd', 0.2999999999999545, 0000000000000100000000, '01771-13 75 13', 'House # 41, Road # 30, D.O.H.S Mohakhali, Dhaka', 1),
(146, 'Md. Maruf Hossain', 221.80000000000143, 0000000000000100000000, '01713 08 21 45', 'shampur', 1),
(147, 'Desh Polymer', 906.4499999999971, 0000000000000100000000, '01837-31 48 84', 'House # 7, Road # 2, Block # A, Sec # 2, Mirpur, Dhaka', 1),
(148, 'Prakriti Development Ltd', 0.3000000000538421, 0000000000000100000000, '01911-14 21 26', 'House # 18, Shahid Taj Uddin Sharani, Moghbazar, Dhaka', 1),
(149, 'Southern Real Estate Ltd', 82587.99999999997, 0000000000000100000000, '01718-53 28 44', 'House # 18 New (2nd Floor), Road # 7, Dhanmondi, Dhaka', 1),
(150, 'Sammi Sanitary', 0, 0000000000000100000000, '01914-19 63 62', 'Chowrangi Market, Mirpur-10, Dhaka', 1),
(151, 'Hazi Sayed Zahir Ahsan Zahid', 0, 0000000000000100000000, '01711-64 81 01', '69/1, Purana Paltan, Vip Roa, Oriental Trade Centre (4th Floor), Dhaka.', 1),
(152, 'Care Homes Ltd', 184.69999999999345, 0000000000000100000000, '01912-923192', '380/B, Mirpur Road (3rd Floor), Dhanmondi-27, Dhaka', 1),
(153, 'Anayet Contractor ', 0, 0000000000000100000000, '01792-22 42 23', '280, Mirpur-10, Dhaka', 1),
(154, 'Zahid Sanitary', 0, 0000000000000100000000, '01726-35 26 47', 'Abdur Rashid Manson, Kawtoli, Brahmanbaria, Bangladesh', 1),
(155, 'Akaba Development Ltd', 0, 0000000000000100000000, '01678-043383', '55/B, Purana Paltan', 1),
(156, 'Labib Group', -13044.5, 0000000000000100000000, '01862-725872', 'House # 17, Road # 4, Block # K, Baridhara, Dhaka', 1),
(157, 'Md. Masum', -0.000000000014551915228366852, 0000000000000100000000, '01915-703624', '512, Manda Battola, Dhaka.', 1),
(158, 'Reliance Holdings Ltd ', 0, 0000000000000100000000, '01716-55 12 58', 'House # 119, Road # 1, Block # F, Banani, Dhaka', 1),
(159, 'Parents Fair Trade Int.', -0.1500000000014552, 0000000000000100000000, '01818-17 73 32', '25, Shahid Sayeed nazrul Islam Sharani, Alu Bazar, Dhaka', 1),
(160, 'Configure Group', 0, 0000000000000100000000, '01817-210928', 'House # 132, Road # 13/C, Block # E, Banani, Dhaka', 1),
(161, 'Estate Holdings Ltd', -650.7999999999884, 0000000000000100000000, '01739-18 33 06', 'House # 5, Road # 2/D, Block # J, Baridhara', 1),
(162, 'Md. Shahjahan', -4730.300000000003, 0000000000000100000000, '01856-41 53 53 ', 'Fagun, Rajendrapur, Gazipur. ', 1),
(163, 'Hero Sanitary', 2257.359999999995, 0000000000000100000000, '01921-45 40 15', '11 No Bhavan Market, Gulshan-2, Dhaka.', 1),
(164, 'Parrot Development Ltd', 0, 0000000000000100000000, '01911-35 69 27', '12-13, Rahman Chamber, Motijheel, Dhaka', 1),
(165, 'Anam Sanitary', 0.7999999999701686, 0000000000000100000000, '01712-09 34 76', 'Platinum Market, Gulshan-2, Dhaka', 1),
(166, 'Md. Salim', 0, 0000000000000100000000, '01672-073043', 'House # 309, Alambagh, Jurain, Dhaka.', 1),
(167, 'Md. Bahar', 0, 0000000000000100000000, '01818-49 10 00', 'House # Ta 135/1, Badda Gudara Ghat, Dhaka', 1),
(168, 'Ejab Development Ltd.', 425061.39, 0000000000000100000000, '01847- 06 62 97', '42, Mohakhali C/A, Dhaka', 1),
(169, 'Padma Diagnostic Center ', 0, 0000000000000100000000, '01712-68 71 36', 'House # 245/2, Mouchak,Malibagh, Dhaka', 1),
(170, 'S.F Builders Ltd', 75, 0000000000000100000000, '01796-24 11 42', 'House # 890, Road # 17/A, Mirpur D.O.H.S, Dhaka ', 1),
(171, 'Col. Mr. Mannan', 489.2, 0000000000000100000000, '01680-04 20 54', 'House # 275/277, Road # 3, Mirpur D.O.H.S, Dhaka', 1),
(172, 'Royal Stone Ltd', 6306.699999999997, 0000000000000100000000, '01723-33 87 85', 'House # 54, Road # 10, Block # E, Banani, Dhaka', 1),
(173, 'Golden Agency', 0, 0000000000000100000000, '01944- 72 80 85', '188/A, Nobijan Plaza, Siddiq Bazar, Dhaka', 1),
(174, 'Shuruchi Properties Ltd', 78.04999999998108, 0000000000000100000000, '028858954', 'House # 331 (1st Floor0, Road # 22, New D.O.H.S Mohakhali, Dhaka', 1),
(175, 'Putul Properties Ltd', -0.000000000029103830456733704, 0000000000000100000000, '02-8411538, 02-84115', 'House # 490, Road # 8, DOHS Baridhara, Dhaka', 1),
(176, 'Hazi Mohammad Alam', 8499.75, 0000000000000100000000, '01711-23 07 54', '148Water Works Road, Chandi Ghat, Rohmatgonj.', 1),
(177, 'Nid Mohol Housing Ltd', 0, 0000000000000100000000, '01719-48 50 96', '219/A, South Pirerbagh, Mirpur, Dhaka', 1),
(178, 'ACE Development Ltd', 1347.949999999997, 0000000000000100000000, '01711-56 74 03', 'House # 339, Road # 29, Mohakhali D.O.H.S, Dhaka', 1),
(179, 'Md. Al-Amin', 0.000000000007275957614183426, 0000000000000100000000, '01718-35 48 76', '140/1, Lake Circus, Kalabagan, Dhaka', 1),
(181, 'Exotica Homes Ltd', 1745.699999999997, 0000000000000100000000, '01688-63 63 79', '464/C, Khilgaon, Dhaka', 1),
(182, 'Wind &amp; Light Development Ltd', 115708.641, 0000000000000100000000, '01733-21 55 73', '17/C, SS Steel building, Panthapath, Dhaka', 1),
(183, 'Online Group', 130.549999999972, 0000000000000100000000, '01730- 45 55 95', '22/2, Babor Road, Block # B, Mohammadpur', 1),
(184, 'Index Companies ', 9239.920000000002, 0000000000000100000000, '01712- 01 57 33', 'House # 34, Road # Block # K, Baridhara, Dhaka', 1),
(185, 'Araf Holdings Ltd', 409.2000000000007, 0000000000000100000000, '01819-552290', 'VIP Tower, (3rd floor), 51/1 Vip Road, Naya Paltan, Dhaka', 1),
(186, 'Md. Sohel', 10852.12, 0000000000000100000000, '01819-71 05 15', 'House # 730, Purbo Faydabad, Dakhin Khan, Uttara, Dhaka', 1),
(187, 'Joty Enterprise', 383.8000000000029, 0000000000000100000000, '01817-51 42 96', '173 Inner Circuler Road, Arambagh, Motijheel, Dhaka', 1),
(188, 'Shuchona 5p', 0, 0000000000000100000000, '029641100', 'Hydrolink Limited, Chandrashila Suvastu Tower, Suite-13A, 69/1, Panthapath, Dhaka', 1),
(189, 'Cdr. Baniz Ali', 8028.299999999995, 0000000000000100000000, '01680-04 20 54', 'Plot # 1325, Road # 26/A, Mirpur D.O.H.S, Dhaka', 1),
(190, 'Ohee Builders Ltd', -2489.100000000006, 0000000000000100000000, '01778-31 98 63', '323/1, D.I.T Road, Rampura, Dhaka', 1),
(191, 'Nur Hossain Khan', 34.999999999972374, 0000000000000100000000, '01952-71 33 50', '95, Naya Paltan, Dhaka', 1),
(192, 'Bangladesh Sanitary', 0, 0000000000000100000000, '01937-94 28 23', '88/A, Sher-Sha-Suri Road, Mohammadpur, Dhaka', 1),
(193, 'Estate Management Partners Ltd', 152.7500000000109, 0000000000000100000000, '02-9673379', 'House # 9, Road # 8, Dhanmondi, Dhaka', 1),
(194, 'Social Marketing Company', 1090.5500000000102, 0000000000000100000000, '01711-80 34 43', '33, Banani C/A, Dhaka', 1),
(195, 'Mezba Uddin Plaza', 0, 0000000000000100000000, '017126-87136', '91 Mouchak, Dhaka', 1),
(196, 'Mr. Ariful', 0, 0000000000000100000000, '0171-8560505', '62/5, Shiddeshwari (4th floor), Dhaka', 1),
(197, 'Vision Living Ltd.', -242.14999999984866, 0000000000000100000000, '01711-38 24 16', 'House # 12, Road # 10, Sec # 4, Uttara, Dhaka', 1),
(198, 'Sany Sanitary', 0, 0000000000000100000000, '01914-26 40 30', '98/2, Senpara Parbata, Mirpur-10, Dhaka', 1),
(199, 'Tani Construction Ltd', 6042.699999999997, 0000000000000100000000, '01716-907806', 'House # 12, Road # 10, Sec # 4, Uttara, Dhaka', 1),
(200, 'AZ Sanitary', 0, 0000000000000100000000, '01789-03 55 06', 'Dolphin Goli, Kalabagan, Dhaka', 1),
(201, 'Mr. Ruhul Amin', 0, 0000000000000100000000, '01767- 84 78 74', 'Arai Hajar, Narayngonj.', 1),
(202, 'Col. Meher', 0.5, 0000000000000100000000, '01720 99 77 00', 'House# 276, Road# 03, D.O.H.S, Mirpur, Dhaka.', 1),
(203, 'Trust Asset Limited', 147354.40649999992, 0000000000000100000000, '02 8963629', 'House # 18, Road # 01, Sec # 05, Uttara Dhaka.', 1),
(204, 'Italian Real Estate &amp; Devlopments Ltd', 2325.1600000000044, 0000000000000100000000, '8919261', 'A B Super Market, Azampur Uttara Dhaka', 1),
(205, 'A R S Properties Ltd', 5754.799999999999, 0000000000000100000000, '01937 70 59 31', '93/3 Badda Main Road ', 1),
(206, 'BOCL ', 13351.200000000004, 0000000000000100000000, '01917-43 24 33', 'Sultana Tower, (6th floor), 1st Lane, Kalabagan, Dhaka', 1),
(207, 'Seven Circle Development', 4688.600000000006, 0000000000000100000000, '02-8817690', '28, Gulshan-2, (7th Floor), Dhaka', 1),
(208, 'Orbit Bhaban', 31064.640000000018, 0000000000000100000000, '02-7392407', '1/2, Orbit Manson, 21 Islampur, Dhaka', 1),
(209, 'Md. Momin Ullah Saymon', 0.6500000000014552, 0000000000000100000000, '01680-24 28 27', '85/3, Arambagh, Motijheel, Dhaka', 1),
(210, 'ICL Real Estate Ltd', -251.79999999998836, 0000000000000100000000, '01711-82 34 34', '48, Bijoynagar, Dhaka', 1),
(211, 'Space Properties Ltd.', 0.5, 0000000000000100000000, '02-7175840 ', '47/4, Toyenbee Cirular Road, Dhaka', 1),
(212, 'Sena Kalyan Construction &amp; Developments', 203501.507, 0000000000000100000000, '01730-79 24 02', 'House # 615, Road # Main Road, D.O.H.S, Mirpur, Dhaka', 1),
(213, 'Mr. Nazrul Islam', 8.25, 0000000000000100000000, '01912-70 54 16', 'Sekher Nagar, Siraji Khan, Munshigonj', 1),
(214, 'Navana Engineering', -1389321.16438, 0000000000010000000000, '01833326604', '125/A, Motijheel, C/A, Dhaka', 2),
(216, 'M/S Shahazalal Enterprise (Meher Polymar)', -207672, 0000000000010000000000, '01675007025', '17/A, D.I.T Road, Rampura, Dhaka-1219.', 2),
(217, 'Sabbir &amp; Brothers', 10.400000000000091, 0000000000010000000000, '01917-402839', '145/147, Haji Osman Goni Road, Dhaka Tower, Dhaka.', 2),
(218, 'Primax Building Materials', 0, 0000000000010000000000, '01740093000', '6A-6B Ataturk Tower, 22, Kemal Ataturk Avenue,Banani, Dhaka', 2),
(219, 'Shuchana 5P', -5360.279999999999, 0000000000010000000000, '01686685000', '69/A, Panthapath, Dhaka', 2),
(220, 'Hridoy Corporation', 163000, 0000000000010000000000, '0192-558697', 'Allien Aristocracy, Flat # 2A, House # 48, Sec # 13, Gausul Azam Avenue, Uttara, Dhaka.', 2),
(221, 'Adept International', -8050, 0000000000010000000000, '02-8626842', 'Dilara Tower (3rd Floor), 77, Bir Uttam C.R. Datta Road, (340, Sonargaon Road), Hatirpool, Dhaka-1205', 2),
(222, 'New Dhaka Sanitary Agency', -0.3, 0000000000010000000000, '01715-012155', '75/2, Green Road, Farmgate, Dhaka-1205', 2),
(223, 'Dany Wing', 9899, 0000000000010000000000, 'NULL', 'China', 2),
(224, 'Zakir Sanitary', 0, 0000000000001000000000, '01715-29 70 33', 'Nordda, Kalachandpur, Gulshan.', 1),
(225, 'Major Azad', 0, 0000000000001000000000, '01713-09 57 97', 'Plot # 692, Link Road, Mirpur, D.O.H.S, Dhaka', 1),
(226, 'Major Azad', 0, 0000000000001000000000, '01713-09 57 97', ' Plot # 692, Link Road, Mirpur, D.O.H.S, Dhaka', 1),
(227, 'Protik Developers Ltd.', 612121.21, 0000000000001000000000, '02-8343671', 'Sultana Tower, (4th Floor), 2, Mirpur Road. Dhaka.', 1),
(228, 'MR. Razib', 1.2999999999992724, 0000000000001000000000, '01813 37 26 46', 'Shekkor Nagar, Sirajdikhan, Munshigang.', 1),
(229, 'Living Stone Ltd.', 0.9000000000014552, 0000000000001000000000, '9832956, 9860617', 'House # 50, Street # 02, Banani (Old), DOHS, Dhaka.', 1),
(230, 'Adjust Developments Ltd.', 19272, 0000000000001000000000, '02-8122132', '66/M, West Raza Bazar, Indira Road, Dhaka-1215.', 1),
(231, 'H.M Akhterul Alam', 0, 0000000000001000000000, '01711 54 43 37', 'House # 05, Road # 01, Block # B, Aftabnagar  R/A, Merul Badda, Dhaka.', 1),
(232, 'Progoti Enterprise', 0.3999999999996362, 0000000000001000000000, '02-9895721', 'House # 82/10, 11 Bir Uttam Ziaur Rahman Road, Banani, Dhaka.', 1),
(233, 'A.K.H  Echo Apparel Ltd.  ', 276727.80065000005, 0000000000001000000000, '01819 22 39 51', 'Plot # 09, 2 No Khilji Road, Shamoli, Dhaka.', 1),
(234, 'Assure Builders Ltd.', 445047.0936, 0000000000001000000000, '017300 88 008', 'Jabbar Tower   Level-5 ,   42, Gulshan Avenue, Gulshan-1, Dhaka.', 1),
(235, 'Abul Hasem', 0.3999999999996362, 0000000000001000000000, '01711 89 88 50', '53/2, West Agargaon, Dhaka.', 1),
(236, 'Avenue Builders Ltd.', 0.5, 0000000000001000000000, '953 0835', '6/1/A, Tobkhana Road, Dhaka.', 1),
(237, 'Khan Brothers Group', -275.6929999999993, 0000000000001000000000, '833 2069', '24/1 Chamelibagh, Shantinagar, Dhaka', 1),
(238, 'Square Homes Development LTD', 0.5, 0000000000001000000000, '9352261, 8352208, 8351103', '76, Shantinagar, Dhaka', 1),
(239, 'Md. Hassan (Md. Ali Haider)', 9358.05, 0000000000001000000000, '01913 48 03 40', '119 S K Das Road, Gandaria Dhaka 1204', 1);

--
-- Triggers `company`
--
DROP TRIGGER IF EXISTS `trigger___update_company`;
DELIMITER $$
CREATE TRIGGER `trigger___update_company` BEFORE UPDATE ON `company`
 FOR EACH ROW BEGIN
	IF -NEW.company_balance > NEW.company_creditlimit THEN
    	IF @software_ln = 1 THEN
        	SET @software_error := (SELECT CONCAT(company_name , ' এর ক্রেডিট লিমিট অতিক্রম করবে।') FROM company WHERE idcompany = NEW.idcompany);
		ELSE
		   SET @software_error := (SELECT CONCAT(company_name , ' is crossing credit limit') FROM company WHERE idcompany = NEW.idcompany);		   
      END IF;
		CALL ___fault_crossing_creditlimit();
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `company_details`
--

DROP TABLE IF EXISTS `company_details`;
CREATE TABLE IF NOT EXISTS `company_details` (
  `idcompany` int(10) unsigned NOT NULL,
  `company_ob` double NOT NULL DEFAULT '0',
  `company_contactperson` varchar(64) DEFAULT NULL,
  `company_contactperson_phone` varchar(15) DEFAULT NULL,
  `company_comission` double NOT NULL,
  `company_reg_date` date DEFAULT NULL,
  `company_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company_details`
--

INSERT INTO `company_details` (`idcompany`, `company_ob`, `company_contactperson`, `company_contactperson_phone`, `company_comission`, `company_reg_date`, `company_timestamp`) VALUES
(5, 234197.29999999987, 'Syed Murad Ahamed', '+8801924585234', 0, '0000-00-00', '2014-12-09 02:10:55'),
(6, 0, 'Mr. Shuvo', '+8801972522945', 0, '0000-00-00', '2014-12-09 02:10:55'),
(7, 0.00000000005820766091346741, 'Md. Ekramul Haque', '+8801721612270', 0, '0000-00-00', '2014-12-09 02:10:55'),
(8, -9809.700000000004, 'Major Zakir', '+8801770252278', 0, '0000-00-00', '2014-12-09 02:10:55'),
(9, 0, 'Mr. Roni', '+8801819552000', 0, '0000-00-00', '2014-12-09 02:10:55'),
(10, -0.000000000014551915228366852, 'Mr. Hedaytul Islam', '+8801714242739', 0, '0000-00-00', '2014-12-09 02:10:55'),
(11, 136291.75, 'Mr. Utpol Kumar', '+8801611594291', 0, '0000-00-00', '2014-12-09 02:10:55'),
(12, 0, 'Mr. Anwar', '+8801199801563', 0, '0000-00-00', '2014-12-09 02:10:55'),
(13, 0, 'Mr. Based', '+8801713041180', 0, '0000-00-00', '2014-12-09 02:10:55'),
(14, -0.000000000007275957614183426, 'Mr. Shahidur Rahman', '+8801833325967', 0, '0000-00-00', '2014-12-09 02:10:55'),
(15, 0, 'Mr. Jamal', '+8801779593951', 0, '0000-00-00', '2014-12-09 02:10:55'),
(16, 0, 'Director', '+8801931165591', 0, '0000-00-00', '2014-12-09 02:10:55'),
(17, -2144.75, 'SM Abdur Rahman', '+8802-9561749', 0, '0000-00-00', '2014-12-09 02:10:55'),
(18, 0, 'Mr. Kanchan', '+8801739622651', 0, '0000-00-00', '2014-12-09 02:10:55'),
(19, 0, 'Mr. Zahirul Islam', '+8801711662375', 0, '0000-00-00', '2014-12-09 02:10:55'),
(20, 0.000000000014551915228366852, 'Shobuj Bhai', '+8801753445615', 0, '0000-00-00', '2014-12-09 02:10:55'),
(21, 68718.25, 'Anis Faruki', '+8802-8113398,', 0, '0000-00-00', '2014-12-09 02:10:55'),
(22, 0, 'Mr. Tutue', '+8802-8932136', 0, '0000-00-00', '2014-12-09 02:10:55'),
(23, 5274.4, 'Mr. Mizan', '+8801726264825', 0, '0000-00-00', '2014-12-09 02:10:55'),
(24, 0, 'Mr. Litan', '+8801728262726', 0, '0000-00-00', '2014-12-09 02:10:55'),
(25, 0, 'S.M Abdur Rahman', '+8802-8840541', 0, '0000-00-00', '2014-12-09 02:10:55'),
(26, 1.3000000001629815, 'Mr. fazlu', '+8801711527067,', 0, '0000-00-00', '2014-12-09 02:10:55'),
(27, 227314.90000000002, 'Mr. Khorshed', '+8801841410698', 0, '0000-00-00', '2014-12-09 02:10:55'),
(28, 35045.90000000002, 'Mr. Monir', '+8801712297814', 0, '0000-00-00', '2014-12-09 02:10:55'),
(29, 0, 'Mr. Ratan', '+8801755639389', 0, '0000-00-00', '2014-12-09 02:10:55'),
(30, 0, 'Mr. Jamal', '+8801711682222', 0, '0000-00-00', '2014-12-09 02:10:55'),
(31, 0, 'Mr. Mahabub', '+8801768962640', 0, '0000-00-00', '2014-12-09 02:10:55'),
(32, 0, 'Mr. Rasel', '+8801775351538', 0, '0000-00-00', '2014-12-09 02:10:55'),
(33, 0, 'Mr. faruk', '+8802-85811069,', 0, '0000-00-00', '2014-12-09 02:10:55'),
(34, 0, 'Mr. Anisuzzaman', '+8801911457371', 0, '0000-00-00', '2014-12-09 02:10:55'),
(35, 0.000000000014551915228366852, 'Mr. Ismail', '+8801721446886', 0, '0000-00-00', '2014-12-09 02:10:55'),
(36, 0, 'Mr. Monir', '+880676563913', 0, '0000-00-00', '2014-12-09 02:10:55'),
(37, 0, 'Mr. Mastakar Rahman', '+8802-8714518,', 0, '0000-00-00', '2014-12-09 02:10:55'),
(38, 0, 'Mr. jahangir Hossain', '+8802-8881136,', 0, '0000-00-00', '2014-12-09 02:10:55'),
(39, 0, 'Mr. Nasir Uddin', '+8801678079240', 0, '0000-00-00', '2014-12-09 02:10:55'),
(40, 0, 'Mr. Bojlu', '+8801728284718', 0, '0000-00-00', '2014-12-09 02:10:55'),
(41, 0, 'Mr. Ahrafuzzaman', '+8802-8154358, ', 0, '0000-00-00', '2014-12-09 02:10:55'),
(42, 0, 'Mr. Sohel', '+8801717247385', 0, '0000-00-00', '2014-12-09 02:10:55'),
(43, 0, 'Mr. Saymon', '+8802-9513567', 0, '0000-00-00', '2014-12-09 02:10:55'),
(44, -7125.599999999977, 'Mr. Solayman', '+8802-7211711, ', 0, '0000-00-00', '2014-12-09 02:10:55'),
(45, 6057.600000000006, 'Mr. Engr. Akram', '+8802-8833895, ', 0, '0000-00-00', '2014-12-09 02:10:55'),
(46, 0, 'Mr. Alauddin', '+880171124032', 0, '0000-00-00', '2014-12-09 02:10:55'),
(51, 0, 'Mr. Al Amin (Deputi Manager)', '+8802-8824239, ', 0, '0000-00-00', '2014-12-09 02:10:55'),
(52, 0, 'Mr. Jon', '01719-795983', 0, '0000-00-00', '2014-12-09 02:10:55'),
(53, -543, 'A. K. M Abdullah Al Baki', '+8802-9103554', 0, '0000-00-00', '2014-12-09 02:10:55'),
(54, 1463.0499999999884, 'Md. Raju Chowdhury', '+8801716865603', 0, '0000-00-00', '2014-12-09 02:10:55'),
(56, 141178.7000000002, 'Ali Haider', '01913030931', 0, '0000-00-00', '2014-12-09 02:10:55'),
(57, 0, 'Engr. Sobhan', '01741-782680', 0, '0000-00-00', '2014-12-09 02:10:55'),
(58, 76.63999999978114, 'Engr. Hasan', '0167-8678122', 0, '0000-00-00', '2014-12-09 02:10:55'),
(59, 0, 'Md. Mahbubul Alam Khan', '01712835113', 0, '0000-00-00', '2014-12-09 02:10:55'),
(60, 4838.019999999902, 'Gazi Md. Aftabuzzaman', '01730-734116', 0, '0000-00-00', '2014-12-09 02:10:55'),
(61, 0.40000000002328306, 'Md. Jahangir Alam', '01912-624623', 0, '0000-00-00', '2014-12-09 02:10:55'),
(62, 0, 'Col. Md. Saleh Ahamed', '01833325967', 0, '0000-00-00', '2014-12-09 02:10:55'),
(63, 0, 'Engr: Rafiq', '+8801711-389795', 0, '0000-00-00', '2014-12-09 02:10:55'),
(64, 186642.3999999999, 'Mr. Rubel', '+880167-2013046', 0, '0000-00-00', '2014-12-09 02:10:55'),
(65, -17583.399999999965, 'Eng. Anowar Hossain', '+8801552-117549', 0, '0000-00-00', '2014-12-09 02:10:55'),
(66, 0, 'Didder-e-Mostofa Pavel', '01750444000', 0, '0000-00-00', '2014-12-09 02:10:55'),
(69, 0, 'Mr. Masum Parvez', '+880167-5804444', 0, '0000-00-00', '2014-12-09 02:10:55'),
(70, 0, 'Md. Abdul High Sarker', '01712297814', 0, '0000-00-00', '2014-12-09 02:10:55'),
(71, 0, 'Nazmul Hossain', '+8801917247385', 0, '0000-00-00', '2014-12-09 02:10:55'),
(72, 0, 'Mr. Kamal', '+880167-6153313', 0, '0000-00-00', '2014-12-09 02:10:55'),
(73, 0, 'Dr. Major Rehana Begum', '01931-80 95 18', 0, '0000-00-00', '2014-12-09 02:10:55'),
(74, 4585.189999999828, 'Md. Anisur Rahman', '01713333307', 0, '0000-00-00', '2014-12-09 02:10:55'),
(75, 0.0000000000009094947017729282, 'Mr. Rabbani', '0183-33 116 08', 0, '0000-00-00', '2014-12-09 02:10:55'),
(76, 0, 'Mr. Monir', '+8801712297814', 0, '0000-00-00', '2014-12-09 02:10:55'),
(77, 0, 'Md. Saiful Islam ', '01819-20 24 92', 0, '0000-00-00', '2014-12-09 02:10:55'),
(78, 10686.75, 'Md. Rakibul Hasan', '01611-516 9 06', 0, '0000-00-00', '2014-12-09 02:10:55'),
(79, 185444.30000000005, 'Mr. Osman (Engr.)', '01678-041203', 0, '0000-00-00', '2014-12-09 02:10:55'),
(80, -0.000000000003637978807091713, 'Mr. Borhan Uddin', '01912-07 59 45', 0, '0000-00-00', '2014-12-09 02:10:55'),
(81, 0, 'Md. Nasir (Contractor)', '01822- 87 12 04', 0, '0000-00-00', '2014-12-09 02:10:55'),
(82, 0, 'Md. Mizanur Rahman', '01911-257133', 0, '0000-00-00', '2014-12-09 02:10:55'),
(83, 918.3000000000175, 'Engr. Saidur Rahman', '01819-211406', 0, '0000-00-00', '2014-12-09 02:10:55'),
(84, 0, 'A.S.M Asaduzzaman', '01816-26 65 56', 0, '0000-00-00', '2014-12-09 02:10:55'),
(85, 0.000000000003637978807091713, 'Dipa Construction Ltd.', '01785-641768', 0, '0000-00-00', '2014-12-09 02:10:55'),
(86, 0.6999999999970896, 'Mr. Mamun', '01833- 32 66 67', 0, '0000-00-00', '2014-12-09 02:10:55'),
(87, 1501.4000000000233, 'Mr. Mamun', '01728-08 66 68', 0, '0000-00-00', '2014-12-09 02:10:55'),
(89, 0, 'Mr. Jakir', '01687-36 10 15', 0, '0000-00-00', '2014-12-09 02:10:55'),
(91, 0, 'Mr. Riopn', '01922-10 61 17', 0, '0000-00-00', '2014-12-09 02:10:55'),
(92, 0, 'Md. Shahadat Hossain', '0119-5-09 73 11', 0, '0000-00-00', '2014-12-09 02:10:55'),
(93, 498.3999999999942, 'Mr. jamal', '01779-593951', 0, '0000-00-00', '2014-12-09 02:10:55'),
(94, 424.39999999999964, 'Mr. Helal', '01718-348439', 0, '0000-00-00', '2014-12-09 02:10:55'),
(96, 0, 'Md. Hanif', '01712-70 30 17', 0, '0000-00-00', '2014-12-09 02:10:55'),
(97, 116289.4, 'Md. Ali Haider', '01913-030931', 0, '0000-00-00', '2014-12-09 02:10:55'),
(98, 0, 'Md. Shajahan', '01946-94 62 82', 0, '0000-00-00', '2014-12-09 02:10:55'),
(99, 0, 'Dr. Majeda Khatun', '01741-638532', 0, '0000-00-00', '2014-12-09 02:10:55'),
(100, 0.000000000014551915228366852, 'Hazi Abul Hashem Chowdhury', '01819-53 47 38', 0, '0000-00-00', '2014-12-09 02:10:55'),
(101, -0.000000000029103830456733704, 'Md. Saymon', '01777786719', 0, '0000-00-00', '2014-12-09 02:10:55'),
(102, 110789.79999999999, 'Md. Saymon', '01763-717585', 0, '0000-00-00', '2014-12-09 02:10:55'),
(103, 0, 'Hanif Sharder', '01621-54 75 90', 0, '0000-00-00', '2014-12-09 02:10:55'),
(104, 0, 'S M Abdur Rahman', '01732-82 84 44', 0, '0000-00-00', '2014-12-09 02:10:55'),
(106, 0, 'Belal Hossain', '01718-483471', 0, '0000-00-00', '2014-12-09 02:10:55'),
(107, 0, 'Md. Mizan', '01923-47 39 59', 0, '0000-00-00', '2014-12-09 02:10:55'),
(108, 0, 'Md. Latif ', '01717-46 13 63 ', 0, '0000-00-00', '2014-12-09 02:10:55'),
(109, 0, 'Bashir Ahamed', '01911-34 21 67', 0, '0000-00-00', '2014-12-09 02:10:55'),
(110, 0, 'Nasir Ahmed Howlader', '01710966601', 0, '0000-00-00', '2014-12-09 02:10:55'),
(111, 0, 'Md. Karim', '01712- 28 23 09', 0, '0000-00-00', '2014-12-09 02:10:55'),
(112, -0.000000000007275957614183426, 'Shohidul Islam', '01685-89 55  72', 0, '0000-00-00', '2014-12-09 02:10:55'),
(113, 0.000000000003637978807091713, 'Abdul Latif ', '01819-53 47 38', 0, '0000-00-00', '2014-12-09 02:10:55'),
(114, 1263.5, 'Engr. Mosharaf Hossain', '01678- 70 21 01', 0, '0000-00-00', '2014-12-09 02:10:55'),
(115, 0, 'Jamal Uddin', '01621-461370 (A', 0, '0000-00-00', '2014-12-09 02:10:55'),
(116, 0, 'Mojammel Haq', '01785-641764', 0, '0000-00-00', '2014-12-09 02:10:55'),
(117, 0.0000000000018189894035458565, 'S.M Khalid Shams', '01924-99 58 85', 0, '0000-00-00', '2014-12-09 02:10:55'),
(118, 465.3000000000029, 'Mr. Jamal Uddin', '01943-682246', 0, '0000-00-00', '2014-12-09 02:10:55'),
(119, 170052.60000000003, 'Md. Abu Talha', '01913-056944', 0, '0000-00-00', '2014-12-09 02:10:55'),
(120, -0.1999999999825377, 'Jakir', '01732-932533', 0, '0000-00-00', '2014-12-09 02:10:55'),
(121, 0.0000000000018189894035458565, 'Md.Rafique Shaikh', '01712-97 68 96', 0, '0000-00-00', '2014-12-09 02:10:55'),
(122, 156047.09999999998, 'Md. Sujon (Purchase manager)', '01819-71 05 15', 0, '0000-00-00', '2014-12-09 02:10:55'),
(123, 0, 'Md. Liton', '01830-940704', 0, '0000-00-00', '2014-12-09 02:10:55'),
(124, 0, 'Humayun Kabir', '01715-17 41 23', 0, '0000-00-00', '2014-12-09 02:10:55'),
(125, 285314.902, 'Zakir Hossain', '01724-866897', 0, '0000-00-00', '2014-12-09 02:10:55'),
(126, 0, 'Mr. Azmir ', '01716-900612', 0, '0000-00-00', '2014-12-09 02:10:55'),
(127, 0, 'Hazi Md. Shahjahan, ', '01819-534738', 0, '0000-00-00', '2014-12-09 02:10:55'),
(128, 981, 'Md. Jamal Nasir', '02-8835184', 0, '0000-00-00', '2014-12-09 02:10:55'),
(129, -0.000000000029103830456733704, 'Abul Hashem Khan', '01711-980350', 0, '0000-00-00', '2014-12-09 02:10:55'),
(131, -426.8399999999965, 'Md. jamal Uddin', '01672-463373', 0, '0000-00-00', '2014-12-09 02:10:55'),
(132, 0, 'Nurun Nobi', '01713-040446', 0, '0000-00-00', '2014-12-09 02:10:55'),
(133, -1266.2300000000105, 'Md. Mijanur Rahman (Lavlu)', '02-8960668', 0, '0000-00-00', '2014-12-09 02:10:55'),
(134, 0, 'Md. Miraz Hossain', '01712-976896', 0, '0000-00-00', '2014-12-09 02:10:55'),
(136, 0, 'Tushar Ahmed', '01671- 41 75 18', 0, '0000-00-00', '2014-12-09 02:10:55'),
(137, 0, 'Mr. Barek Sikder', '01678-029821', 0, '0000-00-00', '2014-12-09 02:10:55'),
(139, 0, 'Kabir Mahmud Hassan', '01714-015732', 0, '0000-00-00', '2014-12-09 02:10:55'),
(140, 0, 'Md. habib Hasan (Purchase)', '01716-185740', 0, '0000-00-00', '2014-12-09 02:10:55'),
(141, 0, 'Mr. Sazzad', '01811-455873', 0, '0000-00-00', '2014-12-09 02:10:55'),
(142, 0, 'Mehedi Hasan Babul', '01744-310618', 0, '0000-00-00', '2014-12-09 02:10:55'),
(143, 0, 'Mr. Riaz', '01715- 15 04 03', 0, '0000-00-00', '2014-12-09 02:10:55'),
(144, 0, 'Mr. Reaz', '01772-835496', 0, '0000-00-00', '2014-12-09 02:10:55'),
(145, 130.29999999999995, 'Mr. Israfil', '01771-13 75 13', 0, '0000-00-00', '2014-12-09 02:10:55'),
(146, 1171.4000000000015, 'Md. Maruf Hossain', '01713 08 21 45', 0, '0000-00-00', '2014-12-09 02:10:55'),
(147, 906.4499999999971, 'Md. Tushar', '01837-31 48 84', 0, '0000-00-00', '2014-12-09 02:10:55'),
(148, 0.00000000005820766091346741, 'Mr. Ekram', '01911-14 21 26', 0, '0000-00-00', '2014-12-09 02:10:55'),
(149, 82587.99999999997, 'Md. Sanowar Hossain', '01718-53 28 44', 0, '0000-00-00', '2014-12-09 02:10:55'),
(150, 0, 'Sammi Sanitary', '01914-19 63 62', 0, '0000-00-00', '2014-12-09 02:10:55'),
(151, 0, 'Hazi Sayed Zahir Ahsan Zahid', '01711-64 81 01', 0, '0000-00-00', '2014-12-09 02:10:55'),
(152, 41.89999999999418, 'Dr. Md. Sohel Al Beruni', '01912-923192', 0, '0000-00-00', '2014-12-09 02:10:55'),
(153, 0, 'Mr. Anayet', '01792-22 42 23', 0, '0000-00-00', '2014-12-09 02:10:55'),
(154, 0, 'Mr. Zahid', '01726-35 26 47', 0, '0000-00-00', '2014-12-09 02:10:55'),
(155, 0, 'Mr. Jamal Uddin', '01678-043383', 0, '0000-00-00', '2014-12-09 02:10:55'),
(156, 14316.25, 'Engr. Maksud Alam', '01862-725872', 0, '0000-00-00', '2014-12-09 02:10:55'),
(157, -0.000000000014551915228366852, 'Md. Masum', '01915-703624', 0, '0000-00-00', '2014-12-09 02:10:55'),
(158, 0, 'Md. Rokonuj zaman', '01716-55 12 58', 0, '0000-00-00', '2014-12-09 02:10:55'),
(159, -0.1500000000014552, 'Md. Mesbah Uddin (Mizan)', '01818-17 73 32', 0, '0000-00-00', '2014-12-09 02:10:55'),
(160, 0, 'Md. Rajib', '01817-210928', 0, '0000-00-00', '2014-12-09 02:10:55'),
(161, -650.7999999999884, 'Engr. Abu Sayeed ', '01739-18 33 06', 0, '0000-00-00', '2014-12-09 02:10:55'),
(162, -4730.300000000003, 'Md. Shahjahan', '01856-41 53 53 ', 0, '0000-00-00', '2014-12-09 02:10:55'),
(163, 642.3199999999961, 'Md. Riaz', '01921-45 40 15', 0, '0000-00-00', '2014-12-09 02:10:55'),
(164, 0, 'Md. Ripon', '01911-35 69 27', 0, '0000-00-00', '2014-12-09 02:10:55'),
(165, -0.000000000029103830456733704, 'Mr. Anam', '01712-09 34 76', 0, '0000-00-00', '2014-12-09 02:10:55'),
(166, 0, 'Md. Salim', '01672-073043', 0, '0000-00-00', '2014-12-09 02:10:55'),
(167, 0, 'Md. Bahar', '01818-49 10 00', 0, '0000-00-00', '2014-12-09 02:10:55'),
(168, 375035.26999999996, 'Md. Belayet', '01847- 06 62 97', 0, '0000-00-00', '2014-12-09 02:10:55'),
(169, 0, 'Md. Nazrul Islam', '01712-68 71 36', 0, '0000-00-00', '2014-12-09 02:10:55'),
(170, 2575, 'Md. Rafique (Manager)', '01796-24 11 42', 0, '0000-00-00', '2014-12-09 02:10:55'),
(171, 671.5, 'Col. Mr. Mannan', '01680-04 20 54', 0, '0000-00-00', '2014-12-09 02:10:55'),
(172, 6306.699999999997, 'Md. Saymon', '01723-33 87 85', 0, '0000-00-00', '2014-12-09 02:10:55'),
(173, 0, 'Golden Agency', '01944- 72 80 85', 0, '0000-00-00', '2014-12-09 02:10:55'),
(174, -22253.550000000017, 'Ayub Ali', '028858954', 0, '0000-00-00', '2014-12-09 02:10:55'),
(175, -0.000000000029103830456733704, 'Sumaya Mostafa (Managing Director)', '02-8411538, 02-', 0, '0000-00-00', '2014-12-09 02:10:55'),
(176, 8499.75, 'Hazi Mohammad Alam', '01711-23 07 54', 0, '0000-00-00', '2014-12-09 02:10:55'),
(177, 0, 'Md. Moshiur Rahman', '01719-48 50 96', 0, '0000-00-00', '2014-12-09 02:10:55'),
(178, 1347.949999999997, 'Md. Nuruzzman', '01711-56 74 03', 0, '0000-00-00', '2014-12-09 02:10:55'),
(179, 0.000000000007275957614183426, 'Md. Al-Amin', '01718-35 48 76', 0, '0000-00-00', '2014-12-09 02:10:55'),
(181, 1745.699999999997, 'Md. Sohidul Haq', '01688-63 63 79', 0, '0000-00-00', '2014-12-09 02:10:55'),
(182, 157064.12, 'Md. Riaz uddin', '01733-21 55 73', 0, '0000-00-00', '2014-12-09 02:10:55'),
(183, 116.34999999997672, 'Md. Jamal Uddin', '01730- 45 55 95', 0, '0000-00-00', '2014-12-09 02:10:55'),
(184, 9705.800000000003, 'Md. Zakir Hossain Khan (Asst. Manager)', '01712- 01 57 33', 0, '0000-00-00', '2014-12-09 02:10:55'),
(185, -1813.2799999999988, 'Shakawat Hossain Chowdhury Rashel', '01819-552290', 0, '0000-00-00', '2014-12-09 02:10:55'),
(186, 10852.12, 'Md. Sohel ', '01819-71 05 15', 0, '0000-00-00', '2014-12-09 02:10:55'),
(187, 4412.1500000000015, 'Md. Shafayet Hossain Titu', '01817-51 42 96', 0, '0000-00-00', '2014-12-09 02:10:55'),
(188, 0, 'S.K Sajjad', '029641100', 0, '0000-00-00', '2014-12-09 02:10:55'),
(189, 1317.699999999997, 'Cdr. Baniz Ali', '01680-04 20 54', 0, '0000-00-00', '2014-12-09 02:10:55'),
(190, -2489.100000000006, 'Md. Saymon', '01778-31 98 63', 0, '0000-00-00', '2014-12-09 02:10:55'),
(191, 0.7199999999720603, 'Nur Hossain Khan', '01952-71 33 50', 0, '0000-00-00', '2014-12-09 02:10:55'),
(192, 0, 'Jashim Uddin', '01937-94 28 23', 0, '0000-00-00', '2014-12-09 02:10:55'),
(193, 17151.95000000001, 'Mr. Shakil (Purchase Office)', '02-9673379', 0, '0000-00-00', '2014-12-09 02:10:55'),
(194, 405.45000000001164, 'Md. Kashem', '01711-80 34 43', 0, '0000-00-00', '2014-12-09 02:10:55'),
(195, 0, 'Md. Nazrul', '017126-87136', 0, '0000-00-00', '2014-12-09 02:10:55'),
(196, 0, 'Mr. Afirul', '0171-8560505', 0, '0000-00-00', '2014-12-09 02:10:55'),
(197, 218543.55000000016, 'Mr. Jamal', '01711-38 24 16', 0, '0000-00-00', '2014-12-09 02:10:55'),
(198, 0, 'Md. Hemayet Hossain', '01914-26 40 30', 0, '0000-00-00', '2014-12-09 02:10:55'),
(199, 5950.199999999997, 'Shirajul Islam', '01716-907806', 0, '0000-00-00', '2014-12-09 02:10:55'),
(200, 0, 'Md. Riaz', '01789-03 55 06', 0, '0000-00-00', '2014-12-09 02:10:55'),
(201, 0, 'Mr. Ruhul Amin', '01767- 84 78 74', 0, '0000-00-00', '2014-12-09 02:10:55'),
(202, 0.5, 'Col. Meher', '01720 99 77 00', 0, '0000-00-00', '2014-12-09 02:10:55'),
(203, 224670.15000000002, 'Engr Ruhul Amin', '02 8963629', 0, '0000-00-00', '2014-12-09 02:10:55'),
(204, 8.160000000003492, 'Eng. Monir', '8919261', 0, '0000-00-00', '2014-12-09 02:10:55'),
(205, 5954.799999999999, 'Md. Riaz', '01937 70 59 31', 0, '0000-00-00', '2014-12-09 02:10:55'),
(206, 16142, 'Aminur Rahman', '01917-43 24 33', 0, '0000-00-00', '2014-12-09 02:10:55'),
(207, 91208.6, 'Pranashker (Purchase)', '02-8817690', 0, '0000-00-00', '2014-12-09 02:10:55'),
(208, 20.639999999999418, 'Md. Mosharaf Hossain', '02-7392407', 0, '0000-00-00', '2014-12-09 02:10:55'),
(209, 0.6500000000014552, 'Md. Momin Ullah Saymon', '01680-24 28 27', 0, '0000-00-00', '2014-12-09 02:10:55'),
(210, 215410.65, 'Mr. Anowar', '01711-82 34 34', 0, '0000-00-00', '2014-12-09 02:10:55'),
(211, 212978.5, 'Mr. Shahidur Rahman', '02-7175840 ', 0, '0000-00-00', '2014-12-09 02:10:55'),
(212, 8567.3, 'Mr. Mojibor', '01730-79 24 02', 0, '0000-00-00', '2014-12-09 02:10:55'),
(213, 8.25, 'Mr. Nazrul Islam', '01912-70 54 16', 0, '0000-00-00', '2014-12-09 02:10:55'),
(214, -416950, 'Mr. Reza', '01833326604', 0, '2014-12-08', '2014-12-10 11:10:47'),
(216, -207672, 'Mr. Sikandar', '01675007025', 0, '2014-12-08', '2014-12-10 05:48:31'),
(217, 0, 'Mr. Jamal', '01917-402839', 0, '2014-12-08', '2014-12-10 05:49:57'),
(218, 0, 'Mr. Faruq', '01740093000', 0, '2014-12-08', '2014-12-10 05:53:21'),
(219, -1477, 'Mr. Sazzad', '01686685000', 0, '2014-12-08', '2014-12-10 05:54:15'),
(220, 0, 'Mr. Shumon', '0192-558697', 0, '2014-12-08', '2014-12-10 05:58:06'),
(221, 0, 'Md. Nazmul Hossain', '02-8626842', 0, '2014-12-08', '2014-12-10 06:00:14'),
(222, 5800, 'Mr. Jamal', '01715-012155', 0, '2014-12-08', '2014-12-10 11:17:15'),
(223, 0, 'Dany Wing', 'Dany Wing', 0, '2014-12-08', '2014-12-10 10:09:41'),
(224, 0, 'Mr. Zakir', '01715-29 70 33', 0, '2014-12-10', '2014-12-11 05:01:43'),
(225, 0, 'Major Azad', '01713-09 57 97', 0, '2014-12-17', '2014-12-17 06:26:10'),
(226, 0, 'Major Azad', '01713-09 57 97', 0, '2014-12-17', '2014-12-17 08:44:06'),
(227, 0, 'Eng. Jasim Uddin', '01721 18 85 28', 0, '2015-01-14', '2015-01-14 05:14:34'),
(228, 0, 'Mr. Razib', '01813 37 26 46', 0, '2015-01-22', '2015-01-22 08:08:18'),
(229, 0, 'Eng.Md. Raofun Islam', '01950 092 166', 0, '2015-01-24', '2015-01-24 12:46:55'),
(230, 0, 'Engg. Safi', '01717 56 55 65', 0, '2015-01-28', '2015-01-29 03:48:32'),
(231, 0, 'H.M Akhterul Alam', '01711 54 43 37', 0, '2015-01-29', '2015-01-29 03:51:52'),
(232, 0, 'Md. Monjur Hossain', '01819 13 43 42', 0, '2015-01-29', '2015-01-29 04:58:30'),
(233, 0, 'Md. Alamgir Hossain', '01819 22 39 51', 0, '2015-02-04', '2015-02-04 10:48:22'),
(234, 0, 'Mr Jakir Hosaain (Procurement Manager)', '017300 88 008', 0, '2015-02-08', '2015-02-08 04:35:08'),
(235, 0, ' Mr. Abul Hasem', '01711 89 88 50', 0, '2015-02-09', '2015-02-09 04:31:56'),
(236, 0, 'Mr. Shajal', '953 0835', 0, '2015-02-15', '2015-02-15 04:09:56'),
(237, 0, 'Mr. Nayeem', '01712 24 63 18', 0, '2015-02-15', '2015-02-15 07:57:38'),
(238, 0, 'Chief Engr. Nazrul Islam', '01917 73 32 07', 0, '2015-03-05', '2015-03-05 06:24:17'),
(239, 0, 'Md. Hassan', '017777 86 718 ', 0, '2015-03-07', '2015-03-07 07:22:57');

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
CREATE TABLE IF NOT EXISTS `division` (
`iddivision` int(10) unsigned NOT NULL,
  `division_name` varchar(64) NOT NULL,
  `division_priority` smallint(5) unsigned NOT NULL DEFAULT '50'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `division`
--

INSERT INTO `division` (`iddivision`, `division_name`, `division_priority`) VALUES
(1, 'Director', 100),
(2, 'Marketing', 70),
(3, 'Accounts', 60),
(4, 'Head Office', 0),
(5, 'IT', 40),
(6, 'Procurements', 50),
(7, 'Administration', 90),
(8, 'Finance', 80),
(9, 'Maintenance', 30);

-- --------------------------------------------------------

--
-- Table structure for table `fund_transfer`
--

DROP TABLE IF EXISTS `fund_transfer`;
CREATE TABLE IF NOT EXISTS `fund_transfer` (
`idfund_transfer` int(10) unsigned NOT NULL,
  `idtransaction_deposite` int(10) unsigned NOT NULL,
  `idtransaction_withdraw` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fund_transfer`
--

INSERT INTO `fund_transfer` (`idfund_transfer`, `idtransaction_deposite`, `idtransaction_withdraw`) VALUES
(1, 21, 20),
(2, 23, 22),
(3, 65, 64),
(4, 78, 77),
(5, 95, 94),
(6, 116, 115),
(7, 139, 138),
(8, 162, 161),
(9, 170, 169),
(10, 186, 185),
(11, 198, 197),
(12, 208, 207),
(13, 214, 213),
(14, 216, 215),
(15, 221, 220),
(16, 223, 222),
(17, 238, 237),
(18, 253, 252),
(19, 255, 254),
(20, 260, 259),
(21, 263, 262),
(22, 269, 268),
(23, 286, 285),
(24, 308, 307),
(25, 329, 328),
(26, 337, 336),
(27, 348, 347),
(28, 381, 380),
(29, 418, 417),
(30, 443, 442),
(31, 479, 478),
(32, 496, 495),
(33, 499, 498),
(34, 516, 515),
(35, 520, 519),
(36, 532, 531),
(37, 538, 537),
(38, 549, 548),
(39, 551, 550),
(40, 557, 556);

-- --------------------------------------------------------

--
-- Table structure for table `incenvice_reciver`
--

DROP TABLE IF EXISTS `incenvice_reciver`;
CREATE TABLE IF NOT EXISTS `incenvice_reciver` (
`idincentive_reciver` int(10) unsigned NOT NULL,
  `idcompany` int(10) unsigned NOT NULL,
  `incentive_reciver_name` varchar(64) NOT NULL,
  `incenvice_reciver_remarks` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lender`
--

DROP TABLE IF EXISTS `lender`;
CREATE TABLE IF NOT EXISTS `lender` (
`idlender` int(10) unsigned NOT NULL,
  `lender_name` varchar(64) NOT NULL,
  `lender_details` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lender`
--

INSERT INTO `lender` (`idlender`, `lender_name`, `lender_details`) VALUES
(1, 'ADHL', 'Sister Concern of Abiding Group'),
(2, 'Phoenix Finance &amp; Investment Ltd.', 'Phoenix Finance &amp; Investment Ltd.'),
(3, 'IBBL Investment Account', 'IBBL Investment Account');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
CREATE TABLE IF NOT EXISTS `loan` (
`idloan` int(10) unsigned NOT NULL,
  `loan_date` date NOT NULL,
  `loan_type` tinyint(1) NOT NULL COMMENT '1 mean giving loan, 2 mean reciving loan',
  `loan_pay` double NOT NULL,
  `loan_recive` double NOT NULL,
  `loan_base` double NOT NULL,
  `idlender` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`idloan`, `loan_date`, `loan_type`, `loan_pay`, `loan_recive`, `loan_base`, `idlender`) VALUES
(1, '2014-12-15', 1, 1416879.3, 1416879.3, 1416879.3, 1),
(2, '2014-12-08', 2, 3364652, 3364652, 3364652, 2),
(3, '2014-12-08', 2, 1880000, 1880000, 1880000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `mestablishment`
--

DROP TABLE IF EXISTS `mestablishment`;
CREATE TABLE IF NOT EXISTS `mestablishment` (
`idmestablishment` int(10) unsigned NOT NULL,
  `mestablishment_name` varchar(65) NOT NULL COMMENT '1. Advance Cheque A/C  [manual]',
  `mestablishment_balance` double NOT NULL,
  `mestablishment_type` smallint(5) unsigned NOT NULL COMMENT '1 if cash, 2 if bank',
  `mestablishment_address` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mestablishment`
--

INSERT INTO `mestablishment` (`idmestablishment`, `mestablishment_name`, `mestablishment_balance`, `mestablishment_type`, `mestablishment_address`) VALUES
(1, 'Advance Cheque A/C', 50975, 1, 'Null'),
(2, 'Cash', 93686, 1, 'Abiding Reza Tower, 57/2 Kakrail, Dhaka'),
(3, 'Islami Bank Bangladesh Limited', 406778.30000000005, 2, 'Bijoy Nogor, Dhaka'),
(4, 'NCC Bank Limited', 342757, 2, 'Bijoy Nagar, Dhaka'),
(5, 'Loan A/C', 6791531.3, 1, '-'),
(6, 'IOU Md Sir', 2209, 3, ''),
(7, 'IOU Haider', 8500, 3, '');

--
-- Triggers `mestablishment`
--
DROP TRIGGER IF EXISTS `trigger___edit_mestablishment_balance`;
DELIMITER $$
CREATE TRIGGER `trigger___edit_mestablishment_balance` BEFORE UPDATE ON `mestablishment`
 FOR EACH ROW BEGIN
			IF NEW.mestablishment_balance < 0 THEN
   	 		IF @software_ln = 1 THEN
      	  		SET @software_error := (SELECT CONCAT(mestablishment_name, ' এ ' , FORMAT(mestablishment_balance,2), ' টাকা অাছে') FROM mestablishment m WHERE idmestablishment = NEW.idmestablishment);
				ELSE
      	  		SET @software_error := (SELECT CONCAT( 'There Is ' , FORMAT(mestablishment_balance,2), ' On ' , mestablishment_name) FROM mestablishment m WHERE idmestablishment = NEW.idmestablishment);
	      	END IF;
				CALL NOT_ENOUGH_BALANCE();
			END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mestablishment_bank`
--

DROP TABLE IF EXISTS `mestablishment_bank`;
CREATE TABLE IF NOT EXISTS `mestablishment_bank` (
`idmestablishment` int(10) unsigned NOT NULL,
  `mestablishment_ac` varchar(25) NOT NULL,
  `mestablishment_branch` varchar(64) NOT NULL,
  `idbank` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mestablishment_bank`
--

INSERT INTO `mestablishment_bank` (`idmestablishment`, `mestablishment_ac`, `mestablishment_branch`, `idbank`) VALUES
(3, '20502230100200703', 'V.I.P. Road', 36),
(4, '0570210007869', 'Bijoy Nagar', 17);

-- --------------------------------------------------------

--
-- Table structure for table `mestablishment_details`
--

DROP TABLE IF EXISTS `mestablishment_details`;
CREATE TABLE IF NOT EXISTS `mestablishment_details` (
`idmestablishment` int(10) unsigned NOT NULL,
  `mestablishment_ob` double NOT NULL,
  `mestablishment_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mestablishment_reg_date` date NOT NULL DEFAULT '1980-01-01',
  `mestablishment_comments` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mestablishment_details`
--

INSERT INTO `mestablishment_details` (`idmestablishment`, `mestablishment_ob`, `mestablishment_timestamp`, `mestablishment_reg_date`, `mestablishment_comments`) VALUES
(2, 241297, '2014-12-10 08:08:16', '2014-12-08', 'Head Office Cash'),
(3, 207743.1, '2014-12-10 12:06:31', '2014-12-08', 'Bank Account'),
(4, 7150, '2014-12-10 08:46:00', '2014-12-08', 'Bank Account'),
(5, 0, '2014-12-15 04:26:42', '2014-12-08', '-');

-- --------------------------------------------------------

--
-- Table structure for table `pestablishment`
--

DROP TABLE IF EXISTS `pestablishment`;
CREATE TABLE IF NOT EXISTS `pestablishment` (
`idpestablishment` int(10) unsigned NOT NULL,
  `pestablishment_name` varchar(65) NOT NULL,
  `pestablishment_address` varchar(255) NOT NULL COMMENT 'if it is machine then it will serve as machine description\r\n'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pestablishment`
--

INSERT INTO `pestablishment` (`idpestablishment`, `pestablishment_name`, `pestablishment_address`) VALUES
(1, 'Godown (Reza Tower)', '_');

--
-- Triggers `pestablishment`
--
DROP TRIGGER IF EXISTS `trigger___add_pestablishment`;
DELIMITER $$
CREATE TRIGGER `trigger___add_pestablishment` AFTER INSERT ON `pestablishment`
 FOR EACH ROW BEGIN
	INSERT INTO `pestablishment_product`
	(SELECT NEW.idpestablishment, idproduct,0.00 FROM product);
	INSERT INTO `pestablishment_product_demand`
	(SELECT NEW.idpestablishment, idproduct,0.00,0.00 FROM product);	
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pestablishment_product`
--

DROP TABLE IF EXISTS `pestablishment_product`;
CREATE TABLE IF NOT EXISTS `pestablishment_product` (
  `idpestablishment` int(10) unsigned NOT NULL,
  `idproduct` int(10) unsigned NOT NULL,
  `ammount` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stock';

--
-- Dumping data for table `pestablishment_product`
--

INSERT INTO `pestablishment_product` (`idpestablishment`, `idproduct`, `ammount`) VALUES
(1, 1, 11622),
(1, 2, 14157),
(1, 3, 0),
(1, 4, 0),
(1, 5, 10880),
(1, 6, 4459),
(1, 7, 6867),
(1, 8, 5235),
(1, 9, 2699),
(1, 10, 92),
(1, 11, 374),
(1, 12, 137),
(1, 13, 3024),
(1, 14, 2453),
(1, 15, 550),
(1, 16, 420),
(1, 17, 372),
(1, 18, 58),
(1, 19, 300),
(1, 20, 465),
(1, 21, 711),
(1, 22, 235),
(1, 23, 180),
(1, 24, 163),
(1, 25, 106),
(1, 26, 342),
(1, 27, 2860),
(1, 28, 598),
(1, 29, 13),
(1, 30, 4),
(1, 31, 20),
(1, 32, 101),
(1, 33, 3556),
(1, 34, 2633),
(1, 35, 2460),
(1, 36, 313),
(1, 37, 76),
(1, 38, 3097),
(1, 39, 1815),
(1, 40, 283),
(1, 41, 132),
(1, 42, 205),
(1, 43, 105),
(1, 44, 9368),
(1, 45, 4473),
(1, 46, 426),
(1, 47, 168),
(1, 48, 307),
(1, 49, 158),
(1, 53, 10010),
(1, 54, 881),
(1, 55, 197),
(1, 56, 301),
(1, 57, 38),
(1, 58, 255),
(1, 59, 206),
(1, 60, 1038),
(1, 61, 110),
(1, 62, 132),
(1, 63, 180),
(1, 64, 168),
(1, 65, 45),
(1, 66, 66),
(1, 67, 41),
(1, 68, 380),
(1, 69, 140),
(1, 70, 92),
(1, 71, 158),
(1, 72, 259),
(1, 73, 25886),
(1, 74, 9447),
(1, 75, 1464),
(1, 76, 958),
(1, 77, 1293),
(1, 78, 152),
(1, 79, 12546),
(1, 80, 762),
(1, 81, 223),
(1, 82, 270),
(1, 83, 93),
(1, 84, 199),
(1, 85, 385),
(1, 86, 303),
(1, 87, 177),
(1, 88, 115),
(1, 89, 94),
(1, 90, 75),
(1, 91, 78),
(1, 92, 57),
(1, 93, 120),
(1, 94, 8540),
(1, 95, 4279),
(1, 96, 497),
(1, 97, 183),
(1, 98, 130),
(1, 99, 192),
(1, 100, 68),
(1, 101, 57),
(1, 102, 1840),
(1, 103, 1446),
(1, 104, 648),
(1, 105, 40),
(1, 106, 131),
(1, 107, 95),
(1, 108, 346),
(1, 109, 200),
(1, 110, 194),
(1, 111, 76),
(1, 112, 72),
(1, 113, 69),
(1, 114, 433),
(1, 115, 275),
(1, 116, 86),
(1, 117, 90),
(1, 118, 95),
(1, 119, 30),
(1, 120, 1730),
(1, 121, 1551),
(1, 122, 510),
(1, 123, 49),
(1, 124, 241),
(1, 125, 67),
(1, 126, 767),
(1, 127, 118),
(1, 128, 366),
(1, 129, 359),
(1, 130, 659),
(1, 131, 143),
(1, 132, 52),
(1, 133, 176),
(1, 134, 31),
(1, 135, 1770),
(1, 136, 365),
(1, 137, 528),
(1, 138, 240),
(1, 139, 243),
(1, 140, 266),
(1, 141, 4843),
(1, 142, 2987),
(1, 143, 1967),
(1, 144, 1252),
(1, 145, 0),
(1, 146, 0),
(1, 147, 15169),
(1, 148, 1437),
(1, 149, 1727),
(1, 150, 0),
(1, 151, 12),
(1, 152, 0),
(1, 153, 120),
(1, 154, 107),
(1, 155, 0),
(1, 156, 0),
(1, 157, 0),
(1, 158, 0),
(1, 159, 0),
(1, 160, 0),
(1, 161, 0),
(1, 162, 0),
(1, 163, 0),
(1, 164, 0),
(1, 165, 0),
(1, 166, 0),
(1, 167, 0),
(1, 168, 0),
(1, 169, 0),
(1, 170, 0),
(1, 171, 0),
(1, 172, 0),
(1, 173, 0),
(1, 174, 0),
(1, 175, 0),
(1, 176, 0),
(1, 177, 0),
(1, 178, 0),
(1, 179, 0),
(1, 180, 0),
(1, 181, 0),
(1, 182, 0),
(1, 183, 0),
(1, 184, 0),
(1, 185, 0),
(1, 186, 0),
(1, 187, 0),
(1, 188, 0),
(1, 189, 0),
(1, 190, 0),
(1, 191, 0),
(1, 192, 0),
(1, 193, 0),
(1, 194, 0),
(1, 195, 0),
(1, 196, 0),
(1, 197, 0),
(1, 198, 0),
(1, 199, 0),
(1, 200, 0),
(1, 201, 0),
(1, 202, 0),
(1, 203, 0),
(1, 204, 0),
(1, 205, 0),
(1, 206, 0),
(1, 207, 0),
(1, 208, 0),
(1, 209, 0),
(1, 210, 0),
(1, 211, 0),
(1, 212, 0),
(1, 213, 0),
(1, 214, 0),
(1, 215, 0),
(1, 216, 0),
(1, 217, 0),
(1, 218, 0),
(1, 219, 0),
(1, 220, 0),
(1, 221, 0),
(1, 222, 0),
(1, 223, 0),
(1, 231, 150),
(1, 232, 63),
(1, 233, 369),
(1, 234, 19),
(1, 235, 54),
(1, 236, 0),
(1, 237, 537),
(1, 238, 240),
(1, 239, 0),
(1, 240, 4),
(1, 241, 191),
(1, 242, 0),
(1, 243, 0),
(1, 244, 24248),
(1, 245, 357),
(1, 246, 607),
(1, 247, 5),
(1, 248, 167),
(1, 249, 654),
(1, 250, 240),
(1, 251, 0),
(1, 252, 174),
(1, 253, 262),
(1, 254, 0),
(1, 255, 174),
(1, 256, 50),
(1, 257, 54),
(1, 258, 56),
(1, 259, 0),
(1, 260, 0),
(1, 261, 0),
(1, 262, 120),
(1, 263, 130),
(1, 264, 363),
(1, 265, 150),
(1, 266, 1),
(1, 267, 0),
(1, 268, 458),
(1, 269, 104),
(1, 270, 409),
(1, 271, 0),
(1, 272, 200),
(1, 273, 294),
(1, 274, 1),
(1, 275, 155),
(1, 276, 45),
(1, 277, 69),
(1, 278, 64),
(1, 279, 60),
(1, 280, 40),
(1, 281, 48),
(1, 282, 60),
(1, 283, 105),
(1, 284, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pestablishment_product_demand`
--

DROP TABLE IF EXISTS `pestablishment_product_demand`;
CREATE TABLE IF NOT EXISTS `pestablishment_product_demand` (
  `idpestablishment` int(10) unsigned NOT NULL,
  `idproduct` int(10) unsigned NOT NULL,
  `in_ammount` double NOT NULL DEFAULT '0',
  `out_ammount` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pestablishment_product_demand`
--

INSERT INTO `pestablishment_product_demand` (`idpestablishment`, `idproduct`, `in_ammount`, `out_ammount`) VALUES
(1, 1, 0, 430),
(1, 2, 0, 444),
(1, 3, 0, 403),
(1, 4, 0, 1),
(1, 5, 0, 156),
(1, 6, 0, 351),
(1, 7, 0, 60),
(1, 8, 0, 6),
(1, 9, 0, 18),
(1, 10, 0, 0),
(1, 11, 0, 10),
(1, 12, 0, 12),
(1, 13, 0, 10),
(1, 14, 0, 0),
(1, 15, 0, 16),
(1, 16, 0, 0),
(1, 17, 0, 0),
(1, 18, 0, 0),
(1, 19, 0, 0),
(1, 20, 0, 0),
(1, 21, 0, 2),
(1, 22, 0, 0),
(1, 23, 0, 0),
(1, 24, 0, 0),
(1, 25, 0, 0),
(1, 26, 0, 8),
(1, 27, 0, 52),
(1, 28, 0, 0),
(1, 29, 0, 32),
(1, 30, 0, 0),
(1, 31, 0, 27),
(1, 32, 0, 7),
(1, 33, 0, 154),
(1, 34, 0, 0),
(1, 35, 0, 0),
(1, 36, 0, 0),
(1, 37, 0, 0),
(1, 38, 0, 0),
(1, 39, 0, 0),
(1, 40, 0, 0),
(1, 41, 0, 0),
(1, 42, 0, 0),
(1, 43, 0, 0),
(1, 44, 0, 150),
(1, 45, 0, 24),
(1, 46, 0, 0),
(1, 47, 0, 0),
(1, 48, 0, 5),
(1, 49, 0, 0),
(1, 53, 0, 208),
(1, 54, 0, 0),
(1, 55, 0, 6),
(1, 56, 0, 0),
(1, 57, 0, 0),
(1, 58, 0, 0),
(1, 59, 0, 0),
(1, 60, 0, 17),
(1, 61, 0, 13),
(1, 62, 0, 0),
(1, 63, 0, 0),
(1, 64, 0, 0),
(1, 65, 0, 5),
(1, 66, 0, 0),
(1, 67, 0, 6),
(1, 68, 0, 0),
(1, 69, 0, 0),
(1, 70, 0, 0),
(1, 71, 0, 0),
(1, 72, 0, 0),
(1, 73, 1000, 380),
(1, 74, 0, 428),
(1, 75, 0, 26),
(1, 76, 0, 0),
(1, 77, 0, 10),
(1, 78, 0, 20),
(1, 79, 0, 66),
(1, 80, 0, 0),
(1, 81, 0, 4),
(1, 82, 0, 0),
(1, 83, 0, 0),
(1, 84, 0, 0),
(1, 85, 0, 0),
(1, 86, 0, 0),
(1, 87, 0, 12),
(1, 88, 0, 0),
(1, 89, 0, 0),
(1, 90, 0, 0),
(1, 91, 0, 0),
(1, 92, 0, 0),
(1, 93, 0, 0),
(1, 94, 0, 220),
(1, 95, 0, 0),
(1, 96, 0, 0),
(1, 97, 0, 0),
(1, 98, 0, 0),
(1, 99, 0, 0),
(1, 100, 0, 0),
(1, 101, 0, 0),
(1, 102, 0, 0),
(1, 103, 0, 0),
(1, 104, 0, 7),
(1, 105, 0, 0),
(1, 106, 0, 7),
(1, 107, 0, 5),
(1, 108, 0, 0),
(1, 109, 0, 0),
(1, 110, 0, 0),
(1, 111, 0, 0),
(1, 112, 0, 0),
(1, 113, 0, 0),
(1, 114, 0, 0),
(1, 115, 0, 0),
(1, 116, 0, 0),
(1, 117, 0, 0),
(1, 118, 0, 0),
(1, 119, 0, 0),
(1, 120, 0, 0),
(1, 121, 0, 0),
(1, 122, 0, 0),
(1, 123, 0, 0),
(1, 124, 0, 0),
(1, 125, 0, 3),
(1, 126, 0, 60),
(1, 127, 0, 0),
(1, 128, 0, 0),
(1, 129, 0, 0),
(1, 130, 0, 0),
(1, 131, 0, 0),
(1, 132, 0, 0),
(1, 133, 0, 0),
(1, 134, 0, 0),
(1, 135, 0, 0),
(1, 136, 0, 0),
(1, 137, 0, 10),
(1, 138, 0, 0),
(1, 139, 0, 0),
(1, 140, 0, 0),
(1, 141, 0, 0),
(1, 142, 0, 0),
(1, 143, 0, 0),
(1, 144, 0, 0),
(1, 145, 253, 0),
(1, 146, 0, 0),
(1, 147, 0, 120),
(1, 148, 0, 0),
(1, 149, 0, 0),
(1, 150, 0, 0),
(1, 151, 0, 0),
(1, 152, 0, 0),
(1, 153, 0, 0),
(1, 154, 0, 0),
(1, 155, 0, 0),
(1, 156, 0, 0),
(1, 157, 0, 0),
(1, 158, 0, 0),
(1, 159, 0, 0),
(1, 160, 0, 0),
(1, 161, 0, 0),
(1, 162, 0, 0),
(1, 163, 0, 0),
(1, 164, 0, 0),
(1, 165, 0, 0),
(1, 166, 0, 0),
(1, 167, 0, 0),
(1, 168, 0, 0),
(1, 169, 0, 0),
(1, 170, 0, 0),
(1, 171, 0, 0),
(1, 172, 0, 0),
(1, 173, 0, 0),
(1, 174, 0, 0),
(1, 175, 0, 0),
(1, 176, 0, 0),
(1, 177, 0, 0),
(1, 178, 0, 0),
(1, 179, 0, 0),
(1, 180, 0, 0),
(1, 181, 0, 0),
(1, 182, 0, 0),
(1, 183, 0, 0),
(1, 184, 0, 0),
(1, 185, 0, 0),
(1, 186, 0, 0),
(1, 187, 0, 0),
(1, 188, 0, 0),
(1, 189, 0, 0),
(1, 190, 0, 0),
(1, 191, 0, 0),
(1, 192, 0, 0),
(1, 193, 0, 0),
(1, 194, 0, 0),
(1, 195, 0, 0),
(1, 196, 0, 0),
(1, 197, 0, 0),
(1, 198, 0, 0),
(1, 199, 0, 0),
(1, 200, 0, 0),
(1, 201, 0, 0),
(1, 202, 0, 0),
(1, 203, 0, 0),
(1, 204, 0, 0),
(1, 205, 0, 0),
(1, 206, 0, 0),
(1, 207, 0, 0),
(1, 208, 0, 0),
(1, 209, 0, 0),
(1, 210, 0, 0),
(1, 211, 0, 0),
(1, 212, 0, 0),
(1, 213, 0, 0),
(1, 214, 0, 0),
(1, 215, 0, 0),
(1, 216, 0, 0),
(1, 217, 0, 0),
(1, 218, 0, 0),
(1, 219, 0, 0),
(1, 220, 0, 0),
(1, 221, 0, 0),
(1, 222, 0, 0),
(1, 223, 0, 0),
(1, 231, 0, 0),
(1, 232, 0, 0),
(1, 233, 0, 0),
(1, 234, 0, 0),
(1, 235, 0, 0),
(1, 236, 0, 0),
(1, 237, 0, 0),
(1, 238, 0, 0),
(1, 239, 0, 0),
(1, 240, 0, 0),
(1, 241, 0, 0),
(1, 242, 0, 0),
(1, 243, 0, 0),
(1, 244, 0, 1703),
(1, 245, 0, 2197),
(1, 246, 0, 208),
(1, 247, 0, 0),
(1, 248, 0, 0),
(1, 249, 0, 0),
(1, 250, 0, 0),
(1, 251, 0, 0),
(1, 252, 0, 0),
(1, 253, 0, 0),
(1, 254, 0, 0),
(1, 255, 0, 0),
(1, 256, 0, 0),
(1, 257, 0, 0),
(1, 258, 0, 0),
(1, 259, 0, 0),
(1, 260, 0, 0),
(1, 261, 0, 0),
(1, 262, 0, 0),
(1, 263, 0, 0),
(1, 264, 0, 12),
(1, 265, 0, 20),
(1, 266, 0, 7),
(1, 267, 0, 0),
(1, 268, 0, 7),
(1, 269, 0, 2),
(1, 270, 0, 0),
(1, 271, 0, 0),
(1, 272, 0, 0),
(1, 273, 0, 0),
(1, 274, 0, 0),
(1, 275, 0, 0),
(1, 276, 0, 0),
(1, 277, 0, 0),
(1, 278, 0, 0),
(1, 279, 0, 0),
(1, 280, 0, 0),
(1, 281, 0, 0),
(1, 282, 0, 0),
(1, 283, 0, 0),
(1, 284, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pestablishment_type`
--

DROP TABLE IF EXISTS `pestablishment_type`;
CREATE TABLE IF NOT EXISTS `pestablishment_type` (
  `idpestablishment` int(10) unsigned NOT NULL,
  `pestablishment_type` tinyint(1) unsigned NOT NULL COMMENT '1 sale, 2 store, 3 production'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pestablishment_type`
--

INSERT INTO `pestablishment_type` (`idpestablishment`, `pestablishment_type`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
`idpost` int(10) unsigned NOT NULL,
  `post_name` varchar(64) NOT NULL,
  `iddivision` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`idpost`, `post_name`, `iddivision`) VALUES
(12, 'General Manager', 7),
(13, 'Manager', 7),
(14, 'General Manager', 2),
(15, 'Assistants General Manager', 2),
(16, 'Deputy Manager', 2),
(17, 'Assistant Manager', 2),
(18, 'Senior Executive', 2),
(19, 'Executive', 2),
(20, 'Manager', 2),
(21, 'Delivery Man', 4),
(22, 'Office Peon', 4),
(23, 'Front Desk Executive', 4),
(24, 'Store Keeper', 4),
(25, 'Cleaner', 4),
(26, 'Office Assistant', 4),
(27, 'Manager', 3),
(28, 'Managing Director', 1),
(29, 'Director Operation', 1),
(30, 'Director Marketing', 1),
(31, 'Chief Executive Manager ', 5),
(32, 'Senior Officer', 3),
(33, 'Director', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
`idproduct` int(10) unsigned NOT NULL,
  `product_name` varchar(64) NOT NULL,
  `product_mrp` double NOT NULL,
  `product_mpp` double NOT NULL,
  `idproduct_catagory` int(10) unsigned DEFAULT NULL,
  `idunite` int(10) unsigned DEFAULT NULL,
  `product_status` int(10) unsigned NOT NULL DEFAULT '1',
  `product_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 mean pipe 2 mean fittings'
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`idproduct`, `product_name`, `product_mrp`, `product_mpp`, `idproduct_catagory`, `idunite`, `product_status`, `product_type`) VALUES
(1, '&frac12;&quot;', 23, 23, 43, 32, 1, 1),
(2, '&frac34;&quot;', 35, 35, 43, 32, 1, 1),
(3, '1&quot;', 51, 51, 43, 32, 1, 1),
(4, '1&frac14;&quot;', 79, 79, 43, 32, 1, 1),
(5, '1&frac12;&quot;', 98, 98, 43, 32, 1, 1),
(6, '2&quot;', 152, 152, 43, 32, 1, 1),
(7, '&frac12;&quot;', 11, 11, 44, 30, 1, 2),
(8, '&frac34;&quot;', 15, 15, 44, 30, 1, 2),
(9, '1&quot;', 25, 25, 44, 30, 1, 2),
(10, '1&frac14;&quot;', 37, 37, 44, 30, 1, 2),
(11, '1&frac12;&quot;', 55, 55, 44, 30, 1, 2),
(12, '2&quot;', 89, 89, 44, 30, 1, 2),
(13, '&frac34;&quot; &times; &frac12;&quot;', 18, 18, 45, 30, 1, 2),
(14, '1&quot; &times; &frac12;&quot;', 20, 20, 45, 30, 1, 2),
(15, '1&quot; &times; &frac34;&quot;', 25, 25, 45, 30, 1, 2),
(16, '1&frac14;&quot; &times; &frac12;&quot;', 32, 32, 45, 30, 1, 2),
(17, '1&frac14;&quot; &times; &frac34;&quot;', 35, 35, 45, 30, 1, 2),
(18, '1&frac14;&quot; &times; 1&quot;', 42, 42, 45, 30, 1, 2),
(19, '1&frac12;&quot; &times; &frac12;&quot;', 50, 50, 45, 30, 1, 2),
(20, '1&frac12;&quot; &times; &frac34;&quot;', 55, 55, 45, 30, 1, 2),
(21, '1&frac12;&quot; &times; 1&quot;', 59, 59, 45, 30, 1, 2),
(22, '1&frac12;&quot; x 1&frac14;&quot;', 65, 65, 45, 30, 1, 2),
(23, '2&quot; &times; &frac34;&quot;', 80, 80, 45, 30, 1, 2),
(24, '2&quot; &times; 1&quot;', 90, 90, 45, 30, 1, 2),
(25, '2&quot; &times; 1&frac14;&quot;', 95, 95, 45, 30, 1, 2),
(26, '2&quot; &times; 1&frac12;&quot;', 115, 115, 45, 30, 1, 2),
(27, '&frac12;&quot; &times; &frac12;&quot;', 110, 110, 46, 30, 1, 2),
(28, '&frac34;&quot; &times; &frac34;&quot;', 155, 155, 46, 30, 1, 2),
(29, '1&quot; &times; 1&quot;', 305, 305, 46, 30, 1, 2),
(30, '1&frac14;&quot; &times; 1&frac14;&quot;', 550, 550, 46, 30, 1, 2),
(31, '1&frac12;&quot; &times; 1&frac12;&quot;', 750, 750, 46, 30, 1, 2),
(32, '2&quot; &times; 2&quot;', 1080, 1080, 46, 30, 1, 2),
(33, '&frac12;&quot; &times; &frac12;&quot;', 115, 115, 47, 30, 1, 2),
(34, '&frac12;&quot; &times; &frac34;&quot;', 120, 120, 47, 30, 1, 2),
(35, '&frac34;&quot; &times; &frac12;&quot;', 130, 130, 47, 30, 1, 2),
(36, '&frac34;&quot; &times; &frac34;&quot;', 150, 150, 47, 30, 1, 2),
(37, '1&quot; &times; 1&quot;', 285, 285, 47, 30, 1, 2),
(38, '&frac12;&quot; &times; &frac12;&quot;', 110, 110, 51, 30, 1, 2),
(39, '&frac34;&quot; &times; &frac34;&quot;', 145, 145, 51, 30, 1, 2),
(40, '1&quot; &times; 1&quot;', 295, 295, 51, 30, 1, 2),
(41, '1&frac14;&quot; &times; 1&frac14;&quot;', 540, 540, 51, 30, 1, 2),
(42, '1&frac12;&quot; &times; 1&frac12;&quot;', 659, 659, 51, 30, 1, 2),
(43, '2&quot; &times; 2&quot;', 1000, 1000, 51, 30, 1, 2),
(44, '&frac12;&quot;', 18, 18, 50, 30, 1, 2),
(45, '&frac34;&quot;', 30, 30, 50, 30, 1, 2),
(46, '1&quot;', 40, 40, 50, 30, 1, 2),
(47, '1&frac14;&quot;', 80, 80, 50, 30, 1, 2),
(48, '1&frac12;&quot;', 125, 125, 50, 30, 1, 2),
(49, '2&quot;', 220, 220, 50, 30, 1, 2),
(53, '&frac34;&quot; &times; &frac12;&quot;', 35, 35, 49, 30, 1, 2),
(54, '1&quot; &times; &frac12;&quot;', 40, 40, 49, 30, 1, 2),
(55, '1&quot; &times; &frac34;&quot;', 45, 45, 49, 30, 1, 2),
(56, '1&frac14;&quot; &times; &frac12;&quot;', 95, 95, 49, 30, 1, 2),
(57, '1&frac14;&quot; &times; &frac34;&quot;', 96, 96, 49, 30, 1, 2),
(58, '1&frac14;&quot; &times; 1&quot;', 98, 98, 49, 30, 1, 2),
(59, '1&frac12;&quot; &times; &frac12;&quot;', 98, 98, 49, 30, 1, 2),
(60, '1&frac12;&quot; &times; &frac34;&quot;', 100, 100, 49, 30, 1, 2),
(61, '1&frac12;&quot; &times; 1&quot;', 105, 105, 49, 30, 1, 2),
(62, '1&frac12;&quot; &times; 1&frac14;&quot;', 135, 135, 49, 30, 1, 2),
(63, '2&quot; &times; &frac12;&quot;', 205, 205, 49, 30, 1, 2),
(64, '2&quot; &times; &frac34;&quot;', 210, 210, 49, 30, 1, 2),
(65, '2&quot; &times; 1&quot;', 215, 215, 49, 30, 1, 2),
(66, '2&quot; &times; 1&frac14;&quot;', 220, 220, 49, 30, 1, 2),
(67, '2&quot; &times; 1&frac12;&quot;', 250, 250, 49, 30, 1, 2),
(68, '&frac12;&quot; &times; &frac12;&quot;', 125, 125, 48, 30, 1, 2),
(69, '&frac34;&quot; &times; &frac12;&quot;', 150, 150, 48, 30, 1, 2),
(70, '&frac34;&quot; &times; &frac34;&quot;', 170, 170, 48, 30, 1, 2),
(71, '&frac12;&quot; &times; &frac12;&quot;', 50, 50, 52, 30, 1, 2),
(72, '&frac34;&quot; &times; &frac34;&quot;', 75, 75, 52, 30, 1, 2),
(73, '&frac12;&quot;', 13, 13, 54, 30, 1, 2),
(74, '&frac34;&quot;', 20, 20, 54, 30, 1, 2),
(75, '1&quot;', 35, 35, 54, 30, 1, 2),
(76, '1&frac14;&quot;', 70, 70, 54, 30, 1, 2),
(77, '1&frac12;&quot;', 110, 110, 54, 30, 1, 2),
(78, '2&quot;', 185, 185, 54, 30, 1, 2),
(79, '&frac34;&quot; &times; &frac12;&quot;', 30, 30, 55, 30, 1, 2),
(80, '1&quot; &times; &frac12;&quot;', 35, 35, 55, 30, 1, 2),
(81, '1&quot; &times; &frac34;&quot;', 40, 40, 55, 30, 1, 2),
(82, '1&frac14;&quot; &times; &frac12;&quot;', 70, 70, 55, 30, 1, 2),
(83, '1&frac14;&quot; &times; &frac34;&quot;', 90, 90, 55, 30, 1, 2),
(84, '1&frac14;&quot; &times; 1&quot;', 100, 100, 55, 30, 1, 2),
(85, '1&frac12;&quot; &times; &frac12;&quot;', 110, 110, 55, 30, 1, 2),
(86, '1&frac12;&quot; &times; &frac34;&quot;', 120, 120, 55, 30, 1, 2),
(87, '1&frac12;&quot; &times; 1&quot;', 130, 130, 55, 30, 1, 2),
(88, '1&frac12;&quot; &times; 1&frac14;&quot;', 185, 185, 55, 30, 1, 2),
(89, '2&quot; &times; &frac12;&quot;', 210, 210, 55, 30, 1, 2),
(90, '2&quot; &times; &frac34;&quot;', 215, 215, 55, 30, 1, 2),
(91, '2&quot; &times; 1&quot;', 220, 220, 55, 30, 1, 2),
(92, '2&quot; &times; 1&frac14;&quot;', 250, 250, 55, 30, 1, 2),
(93, '2&quot; &times; 1&frac12;&quot;', 260, 260, 55, 30, 1, 2),
(94, '&frac12;&quot; &times; &frac12;&quot;', 99, 99, 56, 30, 1, 2),
(95, '&frac12;&quot; &times; &frac34;&quot;', 125, 125, 56, 30, 1, 2),
(96, '&frac34;&quot; &times; &frac12;&quot;', 125, 125, 56, 30, 1, 2),
(97, '&frac34;&quot; &times; &frac34;&quot;', 165, 165, 56, 30, 1, 2),
(98, '&frac12;&quot; &times; &frac12;&quot;', 115, 115, 57, 30, 1, 2),
(99, '&frac34;&quot; &times; &frac12;&quot;', 150, 150, 57, 30, 1, 2),
(100, '&frac34;&quot; &times; &frac34;&quot;', 170, 170, 57, 30, 1, 2),
(101, '&frac12;&quot; &times; &frac12;&quot;', 320, 320, 58, 30, 1, 2),
(102, '&frac12;&quot;', 180, 180, 59, 30, 1, 2),
(103, '&frac34;&quot;', 245, 245, 59, 30, 1, 2),
(104, '1&quot;', 290, 290, 59, 30, 1, 2),
(105, '1&frac14;&quot;', 435, 435, 59, 30, 1, 2),
(106, '1&frac12;&quot;', 695, 695, 59, 30, 1, 2),
(107, '2&quot;', 885, 885, 59, 30, 1, 2),
(108, '&frac12;&quot; &times; &frac12;&quot;', 280, 280, 60, 30, 1, 2),
(109, '&frac34;&quot; &times; &frac34;&quot;', 420, 420, 60, 30, 1, 2),
(110, '1&quot; &times; 1&quot;', 560, 560, 60, 30, 1, 2),
(111, '1&frac14;&quot; &times; 1&frac14;&quot;', 800, 800, 60, 30, 1, 2),
(112, '1&frac12;&quot; &times; 1&frac12;&quot;', 980, 980, 60, 30, 1, 2),
(113, '2&quot; &times; 2&quot;', 1480, 1480, 60, 30, 1, 2),
(114, '&frac12;&quot; &times; &frac12;&quot;', 280, 280, 61, 30, 1, 2),
(115, '&frac34;&quot; &times; &frac34;&quot;', 420, 420, 61, 30, 1, 2),
(116, '1&quot; &times; 1&quot;', 560, 560, 61, 30, 1, 2),
(117, '1&frac14;&quot; &times; 1&frac14;&quot;', 800, 800, 61, 30, 1, 2),
(118, '1&frac12;&quot; &times; 1&frac12;&quot;', 980, 980, 61, 30, 1, 2),
(119, '2&quot; &times; 2&quot;', 1480, 1480, 61, 30, 1, 2),
(120, '&frac12;&quot;', 375, 375, 62, 30, 1, 2),
(121, '&frac34;&quot;', 465, 465, 62, 30, 1, 2),
(122, '1&quot;', 500, 500, 62, 30, 1, 2),
(123, '1&frac14;&quot;', 750, 750, 62, 30, 1, 2),
(124, '1&frac12;&quot;', 1400, 1400, 62, 30, 1, 2),
(125, '2&quot;', 1700, 1700, 62, 30, 1, 2),
(126, '&frac12;&quot; &times; &frac12;&quot;', 950, 950, 63, 30, 1, 2),
(127, '&frac34;&quot; &times; &frac34;&quot;', 1190, 1190, 63, 30, 1, 2),
(128, '&frac12;&quot; &times; &frac12;&quot;', 790, 790, 64, 30, 1, 2),
(129, '&frac12;&quot;', 210, 210, 65, 30, 1, 2),
(130, '&frac34;&quot;', 280, 280, 65, 30, 1, 2),
(131, '1&quot;', 365, 365, 65, 30, 1, 2),
(132, '1&frac14;&quot;', 460, 460, 65, 30, 1, 2),
(133, '1&frac12;&quot;', 698, 698, 65, 30, 1, 2),
(134, '2&quot;', 935, 935, 65, 30, 1, 2),
(135, '&frac12;&quot;', 12, 12, 66, 30, 1, 2),
(136, '&frac34;&quot;', 20, 20, 66, 30, 1, 2),
(137, '1&quot;', 35, 35, 66, 30, 1, 2),
(138, '1&frac14;&quot;', 50, 50, 66, 30, 1, 2),
(139, '1&frac12;&quot;', 75, 75, 66, 30, 1, 2),
(140, '2&quot;', 105, 105, 66, 30, 1, 2),
(141, '&frac12;&quot;', 12, 12, 67, 30, 1, 2),
(142, '&frac34;&quot;', 14, 14, 67, 30, 1, 2),
(143, '1&quot;', 20, 20, 67, 30, 1, 2),
(144, '1&frac14;&quot;', 30, 30, 67, 30, 1, 2),
(145, '1&frac12;&quot;', 42, 42, 67, 30, 1, 2),
(146, '2&quot;', 52, 52, 67, 30, 1, 2),
(147, '&frac12;&quot;', 10, 10, 68, 30, 1, 2),
(148, '&frac34;&quot;', 14, 14, 68, 30, 1, 2),
(149, '1&quot;', 18, 18, 68, 30, 1, 2),
(150, '1&frac14;&quot;', 38, 38, 68, 30, 1, 2),
(151, '1&frac12;&quot;', 85, 85, 68, 30, 1, 2),
(152, '2&quot;', 105, 105, 68, 30, 1, 2),
(153, '1000 W, &frac12; - 2', 8500, 8500, 69, 30, 1, 2),
(154, '20 - 63, &frac12; - 2', 2000, 2000, 70, 30, 1, 2),
(155, '32 mm / &frac14', 21, 21, 73, 32, 1, 1),
(156, '40 mm/1 &frac12', 27, 27, 73, 32, 1, 1),
(157, '50 mm/2&quot;', 35, 35, 73, 32, 1, 1),
(158, '110 mm/4&quot;', 62, 62, 73, 32, 1, 1),
(159, '110 mm/4&quot;,3.0-3.2mm', 69, 69, 73, 32, 1, 1),
(160, '110 mm/4&quot;,3.2-3.4mm', 78, 78, 73, 32, 1, 1),
(161, '160 mm/6&quot; 4mm', 130, 130, 73, 32, 1, 1),
(162, '160 mm/6&quot; 4.0-4.5mm', 156, 156, 73, 32, 1, 1),
(163, '200 mm/8&quot; 5mm', 215, 215, 73, 32, 1, 1),
(164, '&frac12&quot; 3.1mm', 14.5, 14.5, 74, 32, 1, 1),
(165, '&frac34&quot; 3.2mm', 21, 21, 74, 32, 1, 1),
(166, '1&quot; 3.5mm', 29, 29, 74, 32, 1, 1),
(167, '1 &;frac14&quot; 4.2mm', 43, 43, 74, 32, 1, 1),
(168, '1 &frac12&quot; 4.2mm', 49, 49, 74, 32, 1, 1),
(169, '2&quot; 4.2mm', 65, 65, 74, 32, 1, 1),
(170, '32mm/ &frac14', 35, 35, 75, 32, 1, 2),
(171, '40mm/ &frac12', 38, 38, 75, 32, 1, 2),
(172, '50mm/ 2&quot;', 42, 42, 75, 32, 1, 2),
(173, '110mm/ 4&quot;', 129, 129, 75, 32, 1, 2),
(174, '160mm/ 6&quot;', 490, 490, 75, 32, 1, 2),
(175, '200mm/ 8&quot;', 2600, 2600, 75, 32, 1, 2),
(176, '110mm/ 4&quot;', 115, 115, 76, 32, 1, 2),
(177, '160mm/ 6&quot;', 595, 595, 76, 32, 1, 2),
(178, '110mm/ 4&quot;', 158, 158, 77, 32, 1, 2),
(179, '110mm/ 4&quot;', 188, 188, 78, 32, 1, 2),
(180, '160mm/ 6&quot;', 640, 640, 77, 32, 1, 2),
(181, '32mm/ 1 &frac14', 41, 41, 79, 32, 1, 2),
(182, '40mm/ 1 &frac12', 45, 45, 79, 32, 1, 2),
(183, '50mm/ 2&quot;', 58, 58, 79, 32, 1, 2),
(184, '110mm/ 4&quot;', 179, 179, 79, 32, 1, 2),
(185, '160mm/ 6&quot;', 778, 778, 79, 32, 1, 2),
(186, '200mm/ 8&quot;', 2800, 2800, 79, 32, 1, 2),
(187, '110mm/ 4&quot;', 198, 198, 80, 32, 1, 2),
(188, '160mm/ 6&quot;', 1230, 1230, 80, 32, 1, 2),
(189, '110mm/ 4&quot;', 198, 198, 81, 32, 1, 2),
(190, '110mm/ 4&quot;', 380, 380, 82, 32, 1, 2),
(191, '110mm/ 4&quot;', 285, 285, 83, 32, 1, 2),
(192, '50mm/ 2&quot;', 138, 138, 84, 32, 1, 2),
(193, '110mm/ 4&quot;', 295, 295, 84, 32, 1, 2),
(194, '160mm/ 6&quot;', 1350, 1350, 84, 32, 1, 2),
(195, '4&quot; &times; 2&quot;', 215, 215, 85, 32, 1, 2),
(196, '6&quot; &times; 4&quot;', 950, 950, 85, 32, 1, 2),
(197, '8&quot; &times; 6&quot;', 2700, 2700, 85, 32, 1, 2),
(198, '4&quot; &times; 2&quot;', 385, 385, 86, 32, 1, 2),
(199, '6&quot; &times; 4&quot;', 1150, 1150, 86, 32, 1, 2),
(200, '110mm/ 4&quot;', 268, 268, 87, 32, 1, 2),
(201, '110mm/ 4&quot;', 390, 390, 88, 32, 1, 2),
(202, '110mm/ 4&quot;', 190, 190, 90, 32, 1, 2),
(203, '20mm/ 2&quot;', 195, 195, 91, 32, 1, 2),
(204, '110mm/ 4&quot;', 199, 199, 91, 32, 1, 2),
(205, '160mm/ 6&quot;', 960, 960, 91, 32, 1, 2),
(206, '110mm/ 4&quot;', 480, 480, 92, 32, 1, 2),
(207, '160mm/ 6&quot;', 875, 875, 92, 32, 1, 2),
(208, '4&quot; &times; 2&quot;', 195, 195, 94, 32, 1, 2),
(209, '6&quot; &times; 4&quot;', 350, 350, 94, 32, 1, 2),
(210, '110mm/ 4&quot;', 480, 480, 95, 32, 1, 2),
(211, '160mm/ 6&quot;', 1050, 1050, 95, 32, 1, 2),
(212, '4&quot; &times; 2&quot;', 100, 100, 96, 32, 1, 2),
(213, '6&quot; &times; 4&quot;', 275, 275, 96, 32, 1, 2),
(214, '8&quot; &times; 6&quot;', 750, 750, 96, 32, 1, 2),
(215, '50mm/ 2&quot;', 40, 40, 97, 32, 1, 2),
(216, '110 mm/4&quot;', 135, 135, 97, 32, 1, 2),
(217, '160mm/ 6&quot;', 295, 295, 97, 32, 1, 2),
(218, '50mm/ 2&quot;', 30, 30, 98, 32, 1, 2),
(219, '110mm/ 4&quot;', 42, 42, 98, 32, 1, 2),
(220, '160mm/ 6&quot;', 75, 75, 98, 32, 1, 2),
(221, '500ml', 475, 475, 99, 32, 1, 2),
(222, '500ml', 430, 430, 100, 32, 1, 2),
(223, '110mm/ 4&quot;', 350, 350, 101, 32, 1, 2),
(231, '1&quot; &times; &frac12;&quot;', 185, 185, 57, 30, 1, 2),
(232, ' 2&quot; &times; 2&quot;', 1090, 1090, 56, 30, 1, 2),
(233, '&frac34;&quot; &times; &frac12;&quot;', 120, 120, 51, 30, 1, 2),
(234, '1&frac12;&quot; &times; 1&frac12;&quot;', 850, 850, 56, 30, 1, 2),
(235, '1&quot; &times; &frac12;&quot;', 265, 265, 47, 30, 1, 2),
(236, '1&quot; &times; &frac12;&quot;', 230, 230, 56, 30, 1, 2),
(237, '&frac34;&quot; &times; &frac12;&quot; ', 135, 135, 46, 30, 1, 2),
(238, '1&quot; &times; &frac34;&quot; ', 268, 268, 47, 30, 1, 2),
(239, '&frac34;&quot;  ', 780, 780, 105, 30, 1, 2),
(240, '1&quot;', 1200, 1200, 105, 30, 1, 2),
(241, '1&frac12;&quot;', 3675, 3675, 105, 30, 1, 2),
(242, '4&quot;', 150, 150, 107, 30, 1, 2),
(243, '10&quot;', 344, 344, 73, 32, 1, 2),
(244, '&frac12;&quot;', 26, 26, 110, 32, 1, 1),
(245, '&frac34;&quot;', 39, 39, 110, 32, 1, 1),
(246, '1&quot;', 55, 55, 110, 32, 1, 1),
(247, '1&frac14;&quot;', 87, 87, 110, 32, 1, 1),
(248, '1&frac12;&quot;', 105, 105, 110, 32, 1, 1),
(249, '2&quot;', 158, 158, 110, 32, 1, 1),
(250, '&frac12;&quot; &times; &frac34;&quot;', 125, 125, 46, 30, 1, 2),
(251, '1&quot; &times; &frac12;&quot;', 255, 255, 46, 30, 1, 2),
(252, '1&quot; &times; &frac34;&quot;', 260, 260, 46, 30, 1, 2),
(253, '&frac12;&quot; &times; &frac34;&quot;', 125, 125, 51, 30, 1, 2),
(254, '1&quot; &times; &frac12;&quot;', 240, 240, 51, 30, 1, 2),
(255, '1&quot; &times; &frac34;&quot;', 254, 254, 51, 30, 1, 2),
(256, '1&frac14;&quot; &times; 1&frac14;&quot;', 395, 395, 47, 30, 1, 2),
(257, '1&frac12;&quot; &times; 1&frac12;&quot;', 880, 880, 47, 30, 1, 2),
(258, '2&quot; &times; 2&quot;', 1090, 1090, 47, 30, 1, 2),
(259, '1&quot; &times; &frac34;&quot;', 248, 248, 56, 30, 1, 2),
(260, '1&quot; &times; 1&quot;', 225, 225, 56, 30, 1, 2),
(261, '1&frac14;&quot; &times; 1&frac14;&quot;', 320, 320, 56, 30, 1, 2),
(262, '1&quot; x &frac34;&quot;', 199, 199, 57, 30, 1, 2),
(263, '&frac12;&quot; &times; &frac34;&quot;', 195, 195, 48, 30, 1, 2),
(264, '&frac12;&quot;', 315, 315, 109, 30, 1, 2),
(265, '&frac34;&quot;', 425, 425, 109, 30, 1, 2),
(266, '1&quot;', 500, 500, 109, 30, 1, 2),
(267, '1&frac14;&quot;', 800, 800, 109, 30, 1, 2),
(268, '1&frac12;&quot;', 1175, 1175, 109, 30, 1, 2),
(269, '2&quot;', 1350, 1350, 109, 30, 1, 2),
(270, '&frac12;&quot; &times; &frac12;&quot;', 120, 120, 111, 30, 1, 2),
(271, '&frac34;&quot; &times; &frac12;&quot;', 130, 130, 111, 30, 1, 2),
(272, '1&quot; &times; 1&quot;', 150, 150, 111, 30, 1, 2),
(273, '&frac34;&quot; x &frac34;&quot;', 135, 135, 111, 30, 1, 2),
(274, '1 &frac14; x 1 &frac14; ', 2950, 2950, 105, 30, 1, 2),
(275, '2 x 2', 4900, 4900, 105, 30, 1, 2),
(276, '1 &frac14; x 1 &frac14; ', 540, 540, 57, 30, 1, 2),
(277, '1 &frac12; x 1 &frac12; ', 1080, 1080, 57, 30, 1, 2),
(278, '2 x 2 ', 1175, 1175, 57, 30, 1, 2),
(279, '2 x 2 ', 1700, 1700, 48, 30, 1, 2),
(280, '1 &frac14; x 1 &frac14; ', 950, 950, 48, 30, 1, 2),
(281, '1 &frac12; x 1 &frac12; ', 1295, 1295, 48, 30, 1, 2),
(282, '1  x 1  ', 595, 595, 48, 30, 1, 2),
(283, '1  x &frac34;  ', 295, 295, 48, 30, 1, 2),
(284, '20m &times; 12mm &times; 0.075mm', 20, 12.6, 112, 30, 1, 2);

--
-- Triggers `product`
--
DROP TRIGGER IF EXISTS `trigger___add_product`;
DELIMITER $$
CREATE TRIGGER `trigger___add_product` AFTER INSERT ON `product`
 FOR EACH ROW BEGIN
	INSERT INTO `pestablishment_product`
	(SELECT idpestablishment, NEW.idproduct,0.00 FROM pestablishment);
	
	INSERT INTO `pestablishment_product_demand`
	(SELECT idpestablishment, NEW.idproduct,0.00,0.00 FROM pestablishment);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product_catagory`
--

DROP TABLE IF EXISTS `product_catagory`;
CREATE TABLE IF NOT EXISTS `product_catagory` (
`idproduct_catagory` int(10) unsigned NOT NULL,
  `product_catagory_name` varchar(64) NOT NULL,
  `idproduct_catagory_parent` int(10) unsigned DEFAULT NULL,
  `product_catagory_salesable` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COMMENT='if idcatagory is a parent to some other productcatagory  tha';

--
-- Dumping data for table `product_catagory`
--

INSERT INTO `product_catagory` (`idproduct_catagory`, `product_catagory_name`, `idproduct_catagory_parent`, `product_catagory_salesable`) VALUES
(1, 'PPR', NULL, 1),
(2, 'uPVC', NULL, 1),
(43, 'Huijia Pipes', 1, 0),
(44, 'Plain Socket', 1, 0),
(45, 'Reducing Socket', 1, 0),
(46, 'Male Thread Socket', 1, 0),
(47, 'Female Thread Tee', 1, 0),
(48, 'Male Thread Tee', 1, 0),
(49, 'Reducing Tee', 1, 0),
(50, 'Plain Tee', 1, 0),
(51, 'Female Thread Socket', 1, 0),
(52, 'Cross Tee', 1, 0),
(54, '90&deg; Elbow', 1, 0),
(55, 'Reducing Elbow', 1, 0),
(56, 'Female Thread Elbow', 1, 0),
(57, 'Male Thread Elbow', 1, 0),
(58, 'Thread Female Double Elbow', 1, 0),
(59, 'Plain Union', 1, 0),
(60, 'Male Thread Union', 1, 0),
(61, 'Female Thread Union', 1, 0),
(62, 'Stop Valve / Get Valve', 1, 0),
(63, 'Conceal Stop Cock-A', 1, 0),
(64, 'Conceal Stop Cock-B', 1, 0),
(65, 'Plastic Ball Valve', 1, 0),
(66, 'End Cap', 1, 0),
(67, 'Pipe Clamp / Clip', 1, 0),
(68, 'Plug', 1, 0),
(69, 'Heat Melting Machine', 1, 0),
(70, 'Pipe Cutter', 1, 0),
(73, 'uPVC Pipe', 2, 0),
(74, 'Thread Pipe', 2, 0),
(75, '90&deg Plain Blend FF', 2, 0),
(76, '45&deg Plain Blend FF', 2, 0),
(77, 'Back Door Bend', 2, 0),
(78, 'Side Door Bend', 2, 0),
(79, 'Plain Tee', 2, 0),
(80, 'Back Door Tee', 2, 0),
(81, 'Side Door Tee', 2, 0),
(82, 'Cross Door Tee', 2, 0),
(83, 'Cross Tee', 2, 0),
(84, 'Y Tee', 2, 0),
(85, 'Reducing Plain Tee', 2, 0),
(86, 'Reducing Y Tee', 2, 0),
(87, 'Long Trap/P-Trap', 2, 0),
(88, 'Long Trap With Door', 2, 0),
(90, 'U-Body', 2, 0),
(91, 'Off-Set', 2, 0),
(92, 'Access Pipe', 2, 0),
(94, 'Reducing Socket', 2, 0),
(95, 'Door Socket', 2, 0),
(96, 'Reducing Bush', 2, 0),
(97, 'Vent Cowel', 2, 0),
(98, 'Pipe Clip', 2, 0),
(99, 'P&amp;S(Singapore)', 2, 0),
(100, 'Made In China', 2, 0),
(101, 'S Trap', 2, 0),
(105, 'Double Union Ball Valve', 1, 0),
(107, 'Plug', 2, 0),
(109, 'Steel Ball Valve', 1, 0),
(110, 'Special Huijia Pipe', 1, 0),
(111, 'Off-Set', 1, 0),
(112, 'Thread Tap', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `propiter`
--

DROP TABLE IF EXISTS `propiter`;
CREATE TABLE IF NOT EXISTS `propiter` (
`idpropiter` int(10) unsigned NOT NULL,
  `propiter_name` varchar(64) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `propiter`
--

INSERT INTO `propiter` (`idpropiter`, `propiter_name`) VALUES
(10, 'Shamima Akter Moni'),
(11, 'Shahanaz Ahamed'),
(12, 'Motia Parvin');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
CREATE TABLE IF NOT EXISTS `purchase` (
`idpurchase` int(10) unsigned NOT NULL,
  `idcompany` int(10) unsigned NOT NULL,
  `purchase_date` date NOT NULL,
  `purchase_ammount` double NOT NULL,
  `purchase_status` tinyint(1) NOT NULL COMMENT '1 mean confirmed 0 mean not confirmed'
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`idpurchase`, `idcompany`, `purchase_date`, `purchase_ammount`, `purchase_status`) VALUES
(2, 222, '2014-12-09', 5800, 1),
(3, 214, '2014-12-09', 142799.97732, 1),
(4, 214, '2014-12-10', 72799.999272, 1),
(5, 214, '2014-12-13', 179200.021, 1),
(6, 220, '2014-12-14', 142500, 1),
(7, 182, '2014-12-17', 6137, 1),
(8, 204, '2014-12-17', 29442.3, 1),
(9, 182, '2014-12-18', 603.84, 1),
(10, 225, '2014-12-18', 56, 1),
(11, 156, '2014-12-18', 35902, 1),
(12, 203, '2014-12-18', 19337.5, 1),
(13, 119, '2014-12-20', 3737.5, 1),
(14, 74, '2014-12-22', 4550, 1),
(15, 182, '2014-12-28', 8285.8, 1),
(16, 119, '2014-12-30', 6961.5, 1),
(17, 219, '2015-01-01', 3822.28, 1),
(18, 152, '2015-01-03', 18175.5, 1),
(19, 192, '2015-01-06', 2535, 1),
(20, 131, '2015-01-11', 8058, 1),
(21, 119, '2015-01-13', 130, 1),
(22, 208, '2015-01-13', 8892, 1),
(23, 220, '2015-01-13', 1750, 1),
(24, 221, '2015-01-14', 8050, 1),
(25, 203, '2015-01-15', 11375, 1),
(26, 210, '2015-01-12', 39101.4, 1),
(27, 131, '2015-01-19', 12994.8, 1),
(28, 217, '2015-01-21', 3375, 1),
(29, 220, '2015-01-21', 870, 1),
(30, 222, '2015-01-22', 0.04, 1),
(31, 214, '2015-01-22', 515199.99843, 1),
(32, 163, '2015-01-24', 1332.8, 1),
(33, 220, '2015-01-24', 780, 1),
(34, 227, '2015-01-24', 481, 1),
(35, 163, '2015-01-25', 6111.84, 1),
(36, 214, '2015-01-27', 603680.002926, 1),
(37, 148, '2015-01-27', 2292.55, 1),
(38, 15, '2015-01-28', 24010, 1),
(39, 223, '2015-01-29', 1702680, 1),
(40, 168, '2015-01-07', 13266, 1),
(41, 217, '2015-01-28', 1260, 1),
(43, 120, '2015-01-31', 4624, 1),
(44, 217, '2015-01-31', 1518, 1),
(45, 231, '2015-01-31', 4916.8, 1),
(46, 146, '2015-02-01', 949.6, 1),
(47, 217, '2015-02-07', 1386, 1),
(48, 227, '2015-02-01', 90887.16, 1),
(49, 208, '2015-02-10', 36407, 1),
(50, 235, '2015-02-10', 1106, 1),
(51, 203, '2015-02-09', 13410.15, 1),
(52, 203, '2015-02-09', 57138.9, 1),
(53, 208, '2015-02-12', 1050, 1),
(54, 79, '2015-02-12', 16240, 1),
(55, 220, '2015-02-15', 131250, 1),
(56, 222, '2015-02-15', 0.02, 1),
(57, 222, '2015-02-15', 0.24, 1),
(58, 214, '2015-02-18', 82320.0378, 1),
(59, 214, '2015-02-18', 369600.231, 1),
(60, 233, '2015-02-17', 7117.5, 1),
(61, 214, '2015-02-07', 109480, 1),
(62, 214, '2015-02-08', 366520, 1),
(63, 214, '2015-02-19', 179200.021, 1),
(64, 217, '2015-02-24', 3000, 1),
(65, 217, '2015-02-24', 16030, 1),
(66, 189, '2015-02-25', 430.5, 1),
(67, 217, '2015-02-28', 1650.6, 1),
(68, 214, '2015-02-28', 284905.621, 1),
(69, 237, '2015-03-02', 3376.1, 1),
(70, 214, '2015-03-02', 145745.6, 1),
(71, 219, '2015-03-03', 68061, 1);

--
-- Triggers `purchase`
--
DROP TRIGGER IF EXISTS `trigger___add_purchase`;
DELIMITER $$
CREATE TRIGGER `trigger___add_purchase` BEFORE INSERT ON `purchase`
 FOR EACH ROW BEGIN
  DECLARE COMPANY_BALANCE DOUBLE DEFAULT 0.00;
  DECLARE COMPANY_CREDITLIMIT DOUBLE  DEFAULT 0.00;

    
	IF NEW.purchase_status = 1  THEN
		UPDATE company 
		SET company_balance = company_balance - NEW.purchase_ammount 
		WHERE idcompany = NEW.idcompany;

  END IF;

END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `trigger___edit_purchase`;
DELIMITER $$
CREATE TRIGGER `trigger___edit_purchase` BEFORE UPDATE ON `purchase`
 FOR EACH ROW BEGIN

  IF OLD.purchase_status = 1 THEN
  
    	IF @software_ln = 1 THEN
        	SET @software_error := ("সংশোধনযোগ্য নয়");
		ELSE
		   SET @software_error := ("Not Editable Now");		   
      END IF;
		CALL ___can_not_do_now();

  END IF;

  IF NEW.purchase_status = 1 AND OLD.purchase_status = 0 THEN
  

		UPDATE company 
		SET company_balance = company_balance  - NEW.purchase_ammount 
		WHERE idcompany = OLD.idcompany;
  END IF;


END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `trigger_delete_purchase`;
DELIMITER $$
CREATE TRIGGER `trigger_delete_purchase` BEFORE DELETE ON `purchase`
 FOR EACH ROW BEGIN
  IF OLD.purchase_status = 1  THEN
  
		UPDATE company 
		SET company_balance = company_balance + OLD.purchase_ammount
		WHERE idcompany = OLD.idcompany;
		
		DELETE FROM stock_product_input WHERE idstock_product_input IN (SELECT idstock_product_input FROM purchase_stock_product_input s WHERE idpurchase = OLD.idpurchase);

  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_code`
--

DROP TABLE IF EXISTS `purchase_code`;
CREATE TABLE IF NOT EXISTS `purchase_code` (
`idpurchase` int(10) unsigned NOT NULL,
  `purchase_code` char(10) NOT NULL,
  `purchase_open` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `purchase_code`
--

INSERT INTO `purchase_code` (`idpurchase`, `purchase_code`, `purchase_open`) VALUES
(2, 'PCODE-2', 1),
(3, 'PCODE-3', 1),
(4, 'PCODE-4', 1),
(5, 'PCODE-5', 1),
(6, 'PCODE-6', 1),
(7, 'PCODE-7', 1),
(8, 'PCODE-8', 1),
(9, 'PCODE-9', 1),
(10, 'PCODE-10', 1),
(11, 'PCODE-11', 1),
(12, 'PCODE-12', 1),
(13, 'PCODE-13', 1),
(14, 'PCODE-14', 1),
(15, 'PCODE-15', 1),
(16, 'PCODE-16', 1),
(17, 'PCODE-17', 1),
(18, 'PCODE-18', 1),
(19, 'PCODE-19', 1),
(20, 'PCODE-20', 1),
(21, 'PCODE-21', 1),
(22, 'PCODE-22', 1),
(23, 'PCODE-23', 1),
(24, 'PCODE-24', 1),
(25, 'PCODE-25', 1),
(26, 'PCODE-26', 1),
(27, 'PCODE-27', 1),
(28, 'PCODE-28', 1),
(29, 'PCODE-29', 1),
(30, 'PCODE-30', 1),
(31, 'PCODE-31', 1),
(32, 'PCODE-32', 1),
(33, 'PCODE-33', 1),
(34, 'PCODE-34', 1),
(35, 'PCODE-35', 1),
(36, 'PCODE-36', 1),
(37, 'PCODE-37', 1),
(38, 'PCODE-38', 1),
(39, '572', 1),
(40, 'PCODE-40', 1),
(41, 'PCODE-41', 1),
(43, 'PCODE-43', 1),
(44, 'PCODE-44', 1),
(45, 'PCODE-45', 1),
(46, 'PCODE-46', 1),
(47, 'PCODE-47', 1),
(48, 'PCODE-48', 1),
(49, 'PCODE-49', 1),
(50, 'PCODE-50', 1),
(51, 'PCODE-51', 1),
(52, 'PCODE-52', 1),
(53, 'PCODE-53', 1),
(54, 'PCODE-54', 1),
(55, 'PCODE-55', 1),
(56, 'PCODE-56', 1),
(57, 'PCODE-57', 1),
(58, 'PCODE-58', 1),
(59, 'PCODE-59', 1),
(60, 'PCODE-60', 1),
(61, 'PCODE-61', 1),
(62, 'PCODE-62', 1),
(63, 'PCODE-63', 1),
(64, 'PCODE-64', 1),
(65, 'PCODE-65', 1),
(66, 'PCODE-66', 1),
(67, 'PCODE-67', 1),
(68, 'PCODE-68', 1),
(69, 'PCODE-69', 1),
(70, 'PCODE-70', 1),
(71, 'PCODE-71', 1);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

DROP TABLE IF EXISTS `purchase_details`;
CREATE TABLE IF NOT EXISTS `purchase_details` (
`idpurchase` int(10) unsigned NOT NULL,
  `purchase_discount_f_rate` double NOT NULL,
  `purchase_discount_f_ammount` double NOT NULL DEFAULT '0',
  `purchase_comments` varchar(255) NOT NULL,
  `purchase_issales_return` tinyint(1) NOT NULL DEFAULT '0',
  `idstaff` int(10) unsigned DEFAULT NULL,
  `iduser` int(10) unsigned DEFAULT NULL,
  `purchase_entrytime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idproduct_catagory` int(10) unsigned DEFAULT NULL,
  `purchase_transport` double NOT NULL,
  `idpestablishment` int(10) unsigned NOT NULL,
  `purchase_details_billing_date` date DEFAULT NULL,
  `purchase_details_chalan_date` date DEFAULT NULL,
  `purchase_discount_p_rate` double NOT NULL DEFAULT '0',
  `purchase_discount_p_ammount` double NOT NULL DEFAULT '0',
  `purchase_dollar_rate` double NOT NULL DEFAULT '1',
  `purchase_ischina` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_details`
--

INSERT INTO `purchase_details` (`idpurchase`, `purchase_discount_f_rate`, `purchase_discount_f_ammount`, `purchase_comments`, `purchase_issales_return`, `idstaff`, `iduser`, `purchase_entrytime`, `idproduct_catagory`, `purchase_transport`, `idpestablishment`, `purchase_details_billing_date`, `purchase_details_chalan_date`, `purchase_discount_p_rate`, `purchase_discount_p_ammount`, `purchase_dollar_rate`, `purchase_ischina`) VALUES
(2, 20, 1450, 'None', 0, 1, 0, '2014-12-10 10:43:56', NULL, 0, 1, '2014-12-09', '2014-12-09', 0, 0, 1, 0),
(3, 0, 0, '', 0, 1, 0, '2014-12-13 03:56:16', NULL, 0, 1, '2014-12-09', '2014-12-09', 0, 0, 1, 0),
(4, 0, 0, '', 0, 1, 0, '2014-12-13 04:08:21', NULL, 0, 1, '2014-12-10', '2014-12-10', 0, 0, 1, 0),
(5, 0, 0, 'Navana Challan # 8040', 0, 1, 0, '2014-12-14 05:01:44', NULL, 0, 1, '2014-12-13', '2014-12-13', 0, 0, 1, 0),
(6, 50, 142500, '', 0, 1, 0, '2014-12-14 08:03:47', NULL, 0, 1, '2014-12-14', '2014-12-14', 0, 0, 1, 0),
(7, 32, 2888, '', 1, 5, 0, '2014-12-17 04:38:36', 1, 0, 1, '2014-12-17', '2014-12-17', 32, 0, 1, 0),
(8, 31, 13227.7, '', 1, 5, 0, '2014-12-17 09:20:25', 1, 0, 1, '2014-12-17', '2014-12-17', 0, 0, 1, 0),
(9, 32, 284.16, '', 1, 5, 0, '2014-12-18 04:06:18', 1, 0, 1, '2014-12-18', '2014-12-18', 0, 0, 1, 0),
(10, 30, 24, '', 1, 1, 0, '2014-12-18 04:37:16', 1, 0, 1, '2014-12-18', '2014-12-18', 0, 0, 1, 0),
(11, 25, 5777, '', 1, 1, 0, '2014-12-18 10:41:07', 1, -500, 1, '2014-12-18', '2014-12-18', 25, 6357, 1, 0),
(12, 35, 10412.5, '', 1, 1, 0, '2014-12-18 11:09:09', 1, 0, 1, '2014-12-18', '2014-12-18', 35, 0, 1, 0),
(13, 35, 2012.4999999999998, '', 1, 7, 0, '2014-12-20 11:22:20', 1, 0, 1, '2014-12-20', '2014-12-20', 0, 0, 1, 0),
(14, 30, 1950, '', 1, 1, 9, '2014-12-22 10:51:20', 1, 0, 1, '2014-12-22', '2014-12-22', 0, 0, 1, 0),
(15, 32, 3899.2000000000003, '', 1, 5, 9, '2014-12-28 04:31:52', 1, 0, 1, '2014-12-28', '2014-12-28', 0, 0, 1, 0),
(16, 35, 3748.4999999999995, '', 1, 7, 9, '2014-12-30 10:42:47', 1, 0, 1, '2014-12-30', '2014-12-30', 0, 0, 1, 0),
(17, 27, 1413.72, '', 0, 1, 8, '2015-01-01 10:24:08', NULL, 0, 1, '2015-01-01', '2015-01-01', 27, 0, 1, 0),
(18, 30, 7789.5, '', 1, 1, 9, '2015-01-03 04:21:54', 1, 0, 1, '2015-01-03', '2015-01-03', 30, 0, 1, 0),
(19, 35, 1365, '', 1, 1, 9, '2015-01-06 09:51:03', 1, 0, 1, '2015-01-06', '2015-01-06', 35, 0, 1, 0),
(20, 32, 3792, '', 1, 1, 9, '2015-01-12 12:53:27', 1, 0, 1, '2015-01-11', '2015-01-11', 32, 0, 1, 0),
(21, 35, 70, '', 1, 4, 9, '2015-01-13 04:55:01', 1, 0, 1, '2015-01-13', '2015-01-13', 35, 0, 1, 0),
(22, 22, 2508, '', 1, 1, 9, '2015-01-13 09:23:21', 1, 0, 1, '2015-01-13', '2015-01-13', 22, 0, 1, 0),
(23, 50, 1750, '', 0, 4, 8, '2015-01-13 09:56:18', NULL, 0, 1, '2015-01-13', '2015-01-13', 0, 0, 1, 0),
(24, 30, 3450, '', 0, 4, 0, '2015-01-14 05:36:55', NULL, 0, 1, '2015-01-14', '2015-01-14', 0, 0, 1, 0),
(25, 35, 6125, '', 1, 1, 9, '2015-01-15 03:47:01', 1, 0, 1, '2015-01-15', '2015-01-15', 0, 0, 1, 0),
(26, 35, 18752.3, '', 1, 1, 9, '2015-01-15 12:14:07', 1, 0, 1, '2015-01-12', '2015-01-12', 35, 2302.2999999999997, 1, 0),
(27, 0, 0, '', 1, 1, 9, '2015-01-19 05:09:22', 1, 0, 1, '2015-01-19', '2015-01-19', 32, 6115.2, 1, 0),
(28, 0, 0, '', 0, 4, 8, '2015-01-21 10:16:51', NULL, 0, 1, '2015-01-21', '2015-01-21', 0, 0, 1, 0),
(29, 0, 0, '', 0, 4, 8, '2015-01-22 03:53:33', NULL, 0, 1, '2015-01-21', '2015-01-21', 0, 0, 1, 0),
(30, 0, 0, '', 0, 4, 8, '2015-01-22 04:28:35', NULL, 0, 1, '2015-01-22', '2015-01-22', 0, 0, 1, 0),
(31, 0, 0, '', 0, 1, 8, '2015-01-22 04:54:42', NULL, 0, 1, '2015-01-22', '2015-01-22', 0, 0, 1, 0),
(32, 32, 627.2, '', 1, 5, 9, '2015-01-24 05:05:49', 1, 0, 1, '2015-01-24', '2015-01-24', 0, 0, 1, 0),
(33, 40, 520, '', 0, 4, 8, '2015-01-24 07:03:01', NULL, 0, 1, '2015-01-24', '2015-01-24', 0, 0, 1, 0),
(34, 0, 0, '', 1, 1, 9, '2015-01-24 12:33:19', 1, 0, 1, '2015-01-24', '2015-01-24', 0, 0, 1, 0),
(35, 32, 2876.16, '', 1, 5, 9, '2015-01-25 05:25:30', 1, 0, 1, '2015-01-25', '2015-01-25', 0, 0, 1, 0),
(36, 0, 0, '', 0, 1, 8, '2015-01-27 08:25:06', NULL, 0, 1, '2015-01-27', '2015-01-27', 0, 0, 1, 0),
(37, 35, 1234.4499999999998, '', 1, 1, 9, '2015-01-27 12:36:53', 1, 0, 1, '2015-01-27', '2015-01-27', 0, 0, 1, 0),
(38, 30, 10290, '', 1, 1, 9, '2015-01-28 13:08:02', 1, 0, 1, '2015-01-28', '2015-01-28', 0, 0, 1, 0),
(39, 0, 0, '6th Shipment', 0, 4, 8, '2015-01-29 05:51:40', NULL, 0, 1, '2015-01-29', '2015-01-29', 0, 0, 1, 0),
(40, 33, 6534, '', 1, 1, 9, '2015-01-29 10:51:48', 1, 0, 1, '2015-01-07', '2015-01-07', 0, 0, 1, 0),
(41, 0, 0, '', 0, 4, 8, '2015-01-31 04:25:08', NULL, 0, 1, '2015-01-28', '2015-01-28', 0, 0, 1, 0),
(43, 32, 2176, '', 1, 1, 9, '2015-01-31 09:39:48', 1, 0, 1, '2015-01-31', '2015-01-31', 0, 0, 1, 0),
(44, 0, 0, '', 0, 4, 8, '2015-01-31 11:16:26', NULL, 0, 1, '2015-01-31', '2015-01-31', 0, 0, 1, 0),
(45, 30, 1475.3999999999999, '', 1, 6, 9, '2015-02-01 13:26:18', 1, 0, 1, '2015-01-31', '2015-01-31', 30, 631.8, 1, 0),
(46, 20, 237.4, '', 1, 7, 9, '2015-02-01 13:35:05', 1, 0, 1, '2015-02-01', '2015-02-01', 20, 0, 1, 0),
(47, 0, 0, '', 0, 4, 8, '2015-02-07 07:43:35', NULL, 0, 1, '2015-02-07', '2015-02-07', 0, 0, 1, 0),
(48, 0, 0, '', 1, 1, 9, '2015-02-07 08:02:35', 1, 0, 1, '2015-02-01', '2015-02-01', 0, 0, 1, 0),
(49, 30, 693, '', 1, 1, 9, '2015-02-10 09:31:14', 1, -700, 1, '2015-02-10', '2015-02-10', 30, 15210, 1, 0),
(50, 30, 474, '', 1, 1, 9, '2015-02-11 04:49:10', 1, 0, 1, '2015-02-10', '2015-02-10', 30, 0, 1, 0),
(51, 35, 0, '', 1, 1, 9, '2015-02-11 04:52:59', 1, 0, 1, '2015-02-09', '2015-02-09', 35, 7220.849999999999, 1, 0),
(52, 35, 0, '', 1, 1, 9, '2015-02-11 04:56:58', 1, 0, 1, '2015-02-09', '2015-02-09', 35, 30767.1, 1, 0),
(53, 30, 450, '', 1, 1, 9, '2015-02-12 13:15:51', 1, 0, 1, '2015-02-12', '2015-02-12', 0, 0, 1, 0),
(54, 30, 6960, '', 1, 1, 9, '2015-02-12 13:38:34', 1, 0, 1, '2015-02-12', '2015-02-12', 0, 0, 1, 0),
(55, 50, 131250, '', 0, 1, 8, '2015-02-15 03:55:44', NULL, 0, 1, '2015-02-15', '2015-02-15', 0, 0, 1, 0),
(56, 0, 0, 'Fake purchase for adjust stock.', 0, 4, 8, '2015-02-17 04:15:25', NULL, 0, 1, '2015-02-15', '2015-02-15', 0, 0, 1, 0),
(57, 0, 0, 'Fake purchase  for adjust antry', 0, 4, 8, '2015-02-17 04:21:36', NULL, 0, 1, '2015-02-15', '2015-02-15', 0, 0, 1, 0),
(58, 0, 0, 'Delivery Challan # 9062', 0, 4, 8, '2015-02-18 12:35:47', NULL, 0, 1, '2015-02-18', '2015-02-18', 0, 0, 1, 0),
(59, 0, 0, 'Delivery Challan # 9063', 0, 4, 8, '2015-02-18 12:37:26', NULL, 0, 1, '2015-02-18', '2015-02-18', 0, 0, 1, 0),
(60, 35, 3832.4999999999995, '', 1, 1, 9, '2015-02-18 12:59:36', 1, 0, 1, '2015-02-17', '2015-02-17', 0, 0, 1, 0),
(61, 0, 0, 'Challan # 8844', 0, 1, 8, '2015-02-19 08:07:59', NULL, 0, 1, '2015-02-07', '2015-02-07', 44, 86020, 1, 0),
(62, 0, 0, 'Challan # 8887', 0, 1, 8, '2015-02-19 11:52:07', NULL, 0, 1, '2015-02-08', '2015-02-08', 44, 287980, 1, 0),
(63, 0, 0, 'Challan # 9095', 0, 1, 8, '2015-02-22 05:13:20', NULL, 0, 1, '2015-02-19', '2015-02-19', 0, 0, 1, 0),
(64, 0, 0, '', 0, 7, 8, '2015-02-24 10:45:54', NULL, 0, 1, '2015-02-24', '2015-02-24', 0, 0, 1, 0),
(65, 30, 6870, 'Purchase From Mizanur Rahman ( X Employee)', 0, 1, 8, '2015-02-24 11:23:50', NULL, 0, 1, '2015-02-24', '2015-02-24', 0, 0, 1, 0),
(66, 30, 184.5, '', 1, 1, 9, '2015-02-25 10:40:08', 1, 0, 1, '2015-02-25', '2015-02-25', 0, 0, 1, 0),
(67, 0, 0, '', 0, 1, 8, '2015-03-01 04:35:55', NULL, 0, 1, '2015-02-28', '2015-02-28', 0, 0, 1, 0),
(68, 0, 0, '', 0, 1, 8, '2015-03-01 04:52:31', NULL, 0, 1, '2015-02-28', '2015-02-28', 0, 0, 1, 0),
(69, 30, 1446.8999999999999, '', 1, 5, 9, '2015-03-02 06:15:24', 1, 0, 1, '2015-03-02', '2015-03-02', 30, 0, 1, 0),
(70, 0, 0, '', 0, 1, 8, '2015-03-02 11:37:08', NULL, 0, 1, '2015-03-02', '2015-03-02', 44, 114514.4, 1, 0),
(71, 30, 29169, '', 0, 1, 8, '2015-03-03 08:39:53', NULL, 0, 1, '2015-03-03', '2015-03-03', 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_stock_product_input`
--

DROP TABLE IF EXISTS `purchase_stock_product_input`;
CREATE TABLE IF NOT EXISTS `purchase_stock_product_input` (
  `idpurchase` int(10) unsigned NOT NULL,
  `idstock_product_input` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `purchase_stock_product_input`
--

INSERT INTO `purchase_stock_product_input` (`idpurchase`, `idstock_product_input`) VALUES
(2, 571),
(3, 572),
(4, 573),
(5, 574),
(6, 575),
(7, 576),
(7, 577),
(8, 578),
(8, 579),
(9, 580),
(10, 581),
(11, 582),
(11, 583),
(11, 584),
(11, 585),
(11, 586),
(11, 587),
(11, 588),
(11, 589),
(11, 590),
(11, 591),
(11, 592),
(11, 593),
(11, 594),
(11, 595),
(11, 596),
(11, 597),
(11, 598),
(11, 599),
(11, 600),
(11, 601),
(11, 602),
(11, 603),
(11, 604),
(11, 605),
(11, 606),
(11, 607),
(11, 608),
(12, 609),
(12, 610),
(13, 611),
(14, 612),
(15, 613),
(15, 614),
(15, 615),
(15, 616),
(15, 617),
(16, 618),
(17, 619),
(18, 620),
(18, 621),
(18, 622),
(18, 623),
(19, 624),
(19, 625),
(20, 626),
(21, 627),
(22, 628),
(23, 629),
(24, 630),
(24, 631),
(25, 632),
(26, 633),
(26, 634),
(26, 635),
(26, 636),
(26, 637),
(26, 638),
(26, 639),
(26, 640),
(26, 641),
(26, 642),
(26, 643),
(26, 644),
(26, 645),
(26, 646),
(26, 647),
(26, 648),
(26, 649),
(26, 650),
(26, 651),
(26, 652),
(27, 653),
(28, 654),
(29, 655),
(29, 656),
(30, 657),
(31, 658),
(31, 659),
(32, 660),
(32, 661),
(33, 662),
(34, 663),
(35, 664),
(35, 665),
(35, 666),
(35, 667),
(35, 668),
(35, 669),
(35, 670),
(35, 671),
(35, 672),
(35, 673),
(35, 674),
(36, 675),
(36, 676),
(36, 677),
(37, 678),
(37, 679),
(37, 680),
(38, 681),
(38, 682),
(38, 683),
(39, 684),
(39, 685),
(39, 686),
(39, 687),
(39, 688),
(39, 689),
(39, 690),
(39, 691),
(39, 692),
(39, 693),
(39, 694),
(39, 695),
(39, 696),
(39, 697),
(39, 698),
(39, 699),
(39, 700),
(39, 701),
(39, 702),
(39, 703),
(39, 704),
(39, 705),
(39, 706),
(39, 707),
(39, 708),
(39, 709),
(39, 710),
(39, 711),
(39, 712),
(39, 713),
(39, 714),
(39, 715),
(39, 716),
(39, 717),
(39, 718),
(39, 719),
(39, 720),
(39, 721),
(39, 722),
(40, 723),
(41, 724),
(43, 726),
(44, 727),
(45, 728),
(45, 729),
(45, 730),
(45, 731),
(45, 732),
(45, 733),
(45, 734),
(45, 735),
(45, 736),
(45, 737),
(45, 738),
(45, 739),
(45, 740),
(45, 741),
(45, 742),
(45, 743),
(46, 744),
(46, 745),
(46, 746),
(46, 747),
(46, 748),
(46, 749),
(47, 750),
(48, 751),
(49, 753),
(49, 754),
(50, 755),
(50, 756),
(51, 757),
(52, 758),
(53, 759),
(54, 760),
(54, 761),
(54, 762),
(54, 763),
(54, 764),
(55, 765),
(55, 766),
(56, 767),
(57, 768),
(58, 769),
(59, 770),
(60, 771),
(61, 772),
(62, 773),
(63, 774),
(64, 775),
(65, 776),
(65, 777),
(66, 778),
(67, 779),
(68, 780),
(68, 781),
(69, 782),
(69, 783),
(69, 784),
(69, 785),
(69, 786),
(69, 787),
(69, 788),
(70, 789),
(71, 790),
(71, 791),
(71, 792);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
`idsales` int(10) unsigned NOT NULL,
  `idcompany` int(10) unsigned NOT NULL,
  `sales_date` date NOT NULL,
  `sales_ammount` double NOT NULL DEFAULT '0',
  `idsales_type` smallint(5) unsigned NOT NULL,
  `sales_status` tinyint(1) NOT NULL COMMENT '0 mean proposed      1 mean chalan     2 mean billed'
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`idsales`, `idcompany`, `sales_date`, `sales_ammount`, `idsales_type`, `sales_status`) VALUES
(1, 26, '2014-12-09', 2346.4, 1, 2),
(2, 199, '2014-12-09', 1592.5, 2, 2),
(3, 182, '2014-12-09', 6137, 2, 2),
(4, 122, '2014-12-09', 1295, 2, 2),
(5, 224, '2014-12-11', 1360, 1, 2),
(6, 122, '2014-12-13', 37519.3, 2, 2),
(7, 165, '2014-12-13', 12435.8, 1, 2),
(8, 203, '2014-12-13', 126228.05, 2, 2),
(9, 197, '2014-12-13', 2509.65, 2, 2),
(10, 210, '2014-12-13', 396.5, 2, 2),
(11, 210, '2014-12-13', 39609.05, 2, 2),
(12, 5, '2014-12-14', 10061.8, 2, 2),
(13, 148, '2014-12-14', 11038.3, 1, 2),
(14, 26, '2014-12-14', 3581.2, 1, 2),
(15, 119, '2014-12-14', 9943.7, 1, 2),
(16, 163, '2014-12-14', 43919.16, 1, 2),
(17, 197, '2014-12-14', 8247.85, 2, 2),
(18, 183, '2014-12-15', 14391, 2, 2),
(19, 122, '2014-12-15', 38781.4, 2, 2),
(20, 122, '2014-12-15', 1631.7, 2, 2),
(21, 122, '2014-12-15', 11393.9, 2, 2),
(22, 204, '2014-12-15', 31119, 2, 2),
(23, 163, '2014-12-17', 7554.8, 1, 2),
(24, 174, '2014-12-17', 3656.25, 2, 2),
(25, 182, '2014-12-17', 22295.84, 2, 2),
(26, 203, '2014-12-17', 17127.5, 2, 2),
(27, 225, '2014-12-17', 69286, 2, 2),
(28, 122, '2014-12-17', 970.2, 2, 2),
(29, 225, '2014-12-18', 165.2, 2, 2),
(30, 206, '2014-12-18', 3564.4, 2, 2),
(31, 174, '2014-12-18', 9813.6, 2, 2),
(32, 197, '2014-12-20', 20456.8, 2, 2),
(33, 119, '2014-12-20', 3737.5, 2, 2),
(34, 119, '2014-12-20', 552.5, 2, 2),
(35, 156, '2014-12-21', 330, 1, 2),
(36, 148, '2014-12-21', 49930.4, 1, 2),
(37, 119, '2014-12-21', 9490, 1, 2),
(38, 86, '2014-12-21', 8940.75, 1, 2),
(39, 119, '2014-12-21', 71.5, 2, 2),
(40, 74, '2014-12-22', 27587.53, 2, 2),
(41, 15, '2014-12-22', 102268.6, 2, 2),
(42, 61, '2014-12-22', 26437.4, 2, 2),
(43, 101, '2014-12-22', 13332.9, 2, 2),
(44, 74, '2014-12-22', 1008, 2, 2),
(45, 183, '2014-12-23', 9609.6, 2, 2),
(46, 13, '2014-12-23', 51568.44, 2, 2),
(47, 5, '2014-12-23', 36006.6, 2, 2),
(48, 182, '2014-12-24', 10098, 2, 2),
(49, 191, '2014-12-24', 9488.04, 2, 2),
(50, 119, '2014-12-27', 13526.5, 2, 2),
(51, 102, '2014-12-28', 6958.7, 2, 2),
(52, 102, '2014-12-28', 4879.7, 2, 2),
(53, 102, '2014-12-28', 19718.3, 2, 2),
(54, 119, '2014-12-28', 3874, 2, 2),
(55, 119, '2014-12-28', 2484.95, 2, 2),
(56, 119, '2014-12-28', 195, 2, 2),
(57, 163, '2014-12-30', 693.6, 2, 2),
(58, 119, '2014-12-30', 6961.5, 2, 2),
(59, 119, '2014-12-30', 4826.25, 2, 2),
(60, 122, '2015-01-01', 28592.2, 2, 2),
(61, 152, '2015-01-01', 18318.3, 2, 2),
(62, 21, '2015-01-01', 30494.25, 2, 2),
(63, 53, '2015-01-01', 52994.2, 2, 2),
(64, 194, '2015-01-03', 45983.6, 2, 2),
(65, 119, '2015-01-03', 3097.9, 1, 2),
(66, 26, '2015-01-03', 627.9, 1, 2),
(67, 192, '2015-01-06', 2535, 1, 2),
(68, 182, '2015-01-06', 36638.4, 2, 2),
(69, 192, '2015-01-06', 2145, 1, 2),
(70, 168, '2015-01-07', 134685.41, 2, 2),
(71, 187, '2015-01-07', 30410.9, 2, 2),
(72, 119, '2015-01-07', 1925.3, 1, 2),
(73, 15, '2015-01-08', 100991.1, 2, 2),
(74, 146, '2015-01-08', 528, 1, 2),
(76, 208, '2015-01-08', 153890.1, 2, 2),
(77, 206, '2015-01-10', 48344.8, 2, 2),
(78, 5, '2015-01-10', 2534, 2, 2),
(79, 119, '2015-01-10', 3594.5, 2, 2),
(80, 183, '2015-01-10', 52931.45, 2, 2),
(81, 122, '2015-01-11', 5056.8, 2, 2),
(82, 119, '2015-01-11', 5450.25, 1, 2),
(83, 210, '2015-01-12', 20108.4, 2, 2),
(84, 27, '2015-01-12', 52118.75, 2, 2),
(85, 193, '2015-01-12', 15508.8, 2, 2),
(86, 131, '2015-01-13', 60882.44, 2, 2),
(87, 203, '2015-01-14', 14731.6, 2, 2),
(88, 61, '2015-01-14', 10185, 2, 2),
(89, 227, '2015-01-14', 590664.31, 2, 2),
(90, 131, '2015-01-15', 726.24, 2, 2),
(91, 168, '2015-01-15', 4234.4, 2, 2),
(92, 210, '2015-01-15', 481, 2, 2),
(93, 187, '2015-01-15', 360.75, 2, 2),
(94, 182, '2015-01-15', 471.24, 2, 2),
(95, 13, '2015-01-17', 7227, 2, 2),
(96, 191, '2015-01-17', 22234.64, 2, 2),
(97, 182, '2015-01-17', 22403.28, 2, 2),
(98, 86, '2015-01-17', 28417.35, 2, 2),
(99, 61, '2015-01-18', 131037, 2, 2),
(100, 61, '2015-01-18', 10766, 2, 2),
(101, 122, '2015-01-18', 2658.6, 2, 2),
(102, 168, '2015-01-18', 15277.34, 2, 2),
(103, 183, '2015-01-18', 11304.15, 2, 2),
(104, 61, '2015-01-19', 8784.6, 2, 2),
(105, 163, '2015-01-20', 12873.76, 1, 2),
(106, 119, '2015-01-20', 3819.4, 1, 2),
(107, 119, '2015-01-20', 11440, 2, 2),
(108, 163, '2015-01-22', 1332.8, 1, 2),
(109, 61, '2015-01-22', 910, 2, 2),
(110, 212, '2015-01-22', 201604.2, 2, 2),
(111, 227, '2015-01-21', 19560, 2, 2),
(112, 182, '2015-01-22', 4284, 2, 2),
(113, 228, '2015-01-22', 13508.3, 1, 2),
(114, 86, '2015-01-22', 520, 1, 2),
(115, 163, '2015-01-24', 4700.16, 2, 2),
(116, 163, '2015-01-24', 1091.4, 1, 2),
(117, 228, '2015-01-24', 793, 1, 2),
(118, 227, '2015-01-24', 481, 2, 2),
(119, 229, '2015-01-24', 20710.9, 2, 2),
(120, 122, '2015-01-25', 19168.1, 2, 2),
(121, 60, '2015-01-25', 1049.7, 2, 2),
(122, 156, '2015-01-26', 6806.25, 2, 2),
(123, 194, '2015-01-26', 11966.5, 1, 2),
(124, 148, '2015-01-27', 8817.25, 1, 2),
(125, 122, '2015-01-27', 3964, 2, 2),
(126, 156, '2015-01-27', 1405, 1, 2),
(127, 58, '2015-01-27', 46068.36, 2, 2),
(128, 102, '2015-01-28', 33350.1, 2, 2),
(129, 227, '2015-01-28', 181873.85, 2, 2),
(130, 231, '2015-01-29', 4916.8, 1, 2),
(131, 232, '2015-01-29', 4950.4, 1, 2),
(132, 141, '2015-01-29', 123056.7065, 1, 2),
(133, 230, '2015-01-29', 133472, 1, 2),
(134, 148, '2015-01-29', 1608.75, 1, 2),
(135, 168, '2015-01-29', 13266, 2, 2),
(136, 227, '2015-01-28', 28338.87, 2, 2),
(137, 122, '2015-01-31', 196, 2, 2),
(138, 194, '2015-01-31', 702, 1, 2),
(139, 212, '2015-01-31', 1554.007, 2, 2),
(140, 203, '2015-01-31', 8216.65, 2, 2),
(141, 203, '2015-01-31', 11251.5, 2, 2),
(143, 120, '2015-01-31', 4229.6, 1, 2),
(144, 227, '2015-02-01', 242800.96, 2, 2),
(145, 137, '2015-02-01', 1750, 2, 2),
(146, 227, '2015-02-02', 0, 2, 2),
(147, 227, '2015-02-02', 5720, 2, 2),
(148, 203, '2015-02-03', 74111.05, 2, 2),
(149, 203, '2015-02-03', 128859.9065, 2, 2),
(150, 203, '2015-02-03', 105963, 2, 2),
(151, 120, '2015-02-04', 654.81, 1, 2),
(152, 233, '2015-02-04', 219523.85, 2, 2),
(153, 208, '2015-02-04', 16877, 2, 2),
(154, 185, '2015-02-05', 18554.48, 2, 2),
(155, 61, '2015-02-07', 43945.2, 2, 2),
(156, 102, '2015-02-07', 30772, 2, 2),
(157, 227, '2015-02-07', 143663.68, 2, 2),
(158, 227, '2015-02-07', 281633.7, 2, 2),
(159, 229, '2015-02-08', 4662, 2, 2),
(160, 234, '2015-02-08', 121798.88, 2, 2),
(161, 61, '2015-02-08', 13300.007, 2, 2),
(162, 234, '2015-02-08', 0.0068, 2, 2),
(163, 58, '2015-02-08', 0.0066, 2, 2),
(164, 234, '2015-02-08', 320256.2, 2, 2),
(165, 234, '2015-02-08', 0.0068, 2, 2),
(166, 235, '2015-02-09', 9399.6, 2, 2),
(167, 119, '2015-02-09', 2226.9, 2, 2),
(168, 208, '2015-02-09', 47995.5, 2, 2),
(169, 203, '2015-02-09', 57330, 2, 2),
(170, 13, '2015-02-09', 58430.46, 2, 2),
(171, 229, '2015-02-10', 1204, 1, 2),
(172, 235, '2015-02-10', 1150.8, 2, 2),
(173, 230, '2015-02-11', 800, 2, 2),
(174, 203, '2015-02-11', 0, 2, 2),
(175, 203, '2015-02-09', 13410.15, 2, 2),
(176, 122, '2015-02-11', 10975.307, 2, 2),
(177, 33, '2015-02-11', 16914.8, 1, 2),
(178, 119, '2015-02-11', 7016.1, 2, 2),
(179, 79, '2015-02-12', 358177.4, 2, 2),
(180, 174, '2015-02-12', 34875.75, 2, 2),
(181, 79, '2015-02-12', 0, 2, 2),
(182, 208, '2015-02-12', 922.6, 2, 2),
(183, 58, '2015-02-14', 1409.1, 2, 2),
(184, 33, '2015-02-14', 1095.5, 2, 2),
(185, 233, '2015-02-14', 21417.5, 2, 2),
(186, 174, '2015-02-15', 286, 2, 2),
(187, 236, '2015-02-15', 675.5, 2, 2),
(188, 13, '2015-02-15', 871.2, 2, 2),
(189, 203, '2015-02-15', 129028.9, 2, 2),
(190, 102, '2015-02-15', 4592, 2, 2),
(192, 182, '2015-02-15', 23504.2, 2, 2),
(193, 184, '2015-02-15', 6534.12, 2, 2),
(194, 102, '2015-02-15', 3888.5, 2, 2),
(195, 234, '2015-02-15', 2992, 2, 2),
(196, 237, '2015-02-15', 44942.807, 1, 2),
(197, 148, '2015-02-16', 25164.1, 2, 2),
(198, 72, '2015-02-16', 100918.35, 2, 2),
(199, 237, '2015-02-15', 2766.4, 1, 2),
(200, 86, '2015-02-17', 3224, 1, 2),
(201, 237, '2015-02-18', 2569, 1, 2),
(202, 182, '2015-02-18', 500.001, 2, 2),
(203, 168, '2015-02-18', 187191.97, 2, 2),
(204, 53, '2015-02-18', 26576.2, 2, 2),
(205, 189, '2015-02-19', 26507.6, 2, 2),
(206, 168, '2015-02-19', 10500, 2, 2),
(207, 148, '2015-02-22', 12673.05, 2, 2),
(208, 119, '2015-02-22', 22844.25, 2, 2),
(209, 72, '2015-02-22', 7787, 1, 2),
(210, 26, '2015-02-23', 6217.4, 1, 2),
(211, 233, '2015-02-23', 133973.45, 2, 2),
(212, 119, '2015-02-23', 6643, 2, 2),
(213, 203, '2015-02-24', 14631.5, 2, 2),
(214, 227, '2015-02-24', 18500, 2, 2),
(215, 189, '2015-02-24', 525, 2, 2),
(216, 233, '2015-02-24', 2047.5, 2, 2),
(217, 182, '2015-02-25', 2339.2, 2, 2),
(218, 208, '2015-02-25', 19726, 2, 2),
(219, 168, '2015-02-25', 2680, 2, 2),
(220, 79, '2015-02-26', 2940, 2, 2),
(221, 58, '2015-02-26', 59646.6, 2, 2),
(222, 237, '2015-02-28', 3805.2, 2, 2),
(223, 191, '2015-02-28', 319.6, 2, 2),
(224, 227, '2015-03-01', 220735.7, 2, 2),
(225, 53, '2015-02-28', 186.9, 2, 2),
(226, 227, '2015-03-01', 69117.3, 2, 2),
(227, 58, '2015-03-01', 33153.12, 2, 2),
(228, 102, '2015-02-15', 511, 2, 2),
(229, 72, '2015-03-02', 15902.25, 2, 2),
(230, 214, '2015-02-28', 79080.32, 1, 2),
(231, 83, '2015-03-02', 1012.5, 2, 2),
(232, 86, '2015-03-03', 19839.3, 1, 2),
(233, 119, '2015-03-03', 3712.8, 2, 2),
(234, 208, '2015-03-03', 24575.8, 2, 2),
(235, 233, '2015-03-03', 503828, 2, 2),
(236, 233, '2015-03-03', 72875, 2, 2),
(237, 204, '2015-03-03', 2325.3, 2, 2),
(238, 233, '2015-03-04', 0.00065, 2, 2),
(239, 234, '2015-03-05', 28658.6, 2, 1),
(240, 234, '2015-03-05', 61179.60068, 2, 1),
(241, 61, '2015-03-05', 23415.0007, 2, 2),
(242, 238, '2015-03-05', 682.5, 1, 2),
(243, 189, '2015-03-05', 8026.2, 2, 2),
(244, 239, '2015-03-07', 9358.05, 2, 2);

--
-- Triggers `sales`
--
DROP TRIGGER IF EXISTS `trigger___add_sales`;
DELIMITER $$
CREATE TRIGGER `trigger___add_sales` AFTER INSERT ON `sales`
 FOR EACH ROW BEGIN
	IF NEW.sales_status = 2  THEN
			UPDATE company 
			SET company_balance = company_balance + NEW.sales_ammount
			WHERE idcompany = NEW.idcompany;
	END IF;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `trigger___edit_sales`;
DELIMITER $$
CREATE TRIGGER `trigger___edit_sales` BEFORE UPDATE ON `sales`
 FOR EACH ROW BEGIN
  IF OLD.sales_status = 2 THEN
    	IF @software_ln = 1 THEN
        	SET @software_error := ("সংশোধনযোগ্য নয়");
		ELSE
		   SET @software_error := ("Not Editable Now");		   
      END IF;
		CALL ___can_not_do_now();

  END IF;

  IF NEW.sales_status = 2 AND OLD.sales_status = 1 THEN
		UPDATE company 
		SET company_balance = company_balance + NEW.sales_ammount
		WHERE idcompany = NEW.idcompany;
  END IF;

END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `trigger_delete_sales`;
DELIMITER $$
CREATE TRIGGER `trigger_delete_sales` BEFORE DELETE ON `sales`
 FOR EACH ROW BEGIN
  IF OLD.sales_status = 2  THEN
  
		UPDATE company 
		SET company_balance = company_balance - OLD.sales_ammount
		WHERE idcompany = OLD.idcompany;
		
		DELETE FROM stock_product_output WHERE idstock_product_output IN (SELECT idstock_product_output FROM sales_stock_product_output s WHERE idsales = OLD.idsales);

  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_details`
--

DROP TABLE IF EXISTS `sales_details`;
CREATE TABLE IF NOT EXISTS `sales_details` (
`idsales` int(10) unsigned NOT NULL,
  `sales_discount_f_rate` double NOT NULL DEFAULT '0' COMMENT 'rate of fittings',
  `sales_discount_f_ammount` double NOT NULL DEFAULT '0' COMMENT 'ammount of discount in fittings',
  `sales_comments` varchar(255) NOT NULL DEFAULT '',
  `sales_ispurchase_return` tinyint(1) NOT NULL DEFAULT '0',
  `iduser` int(10) unsigned DEFAULT NULL,
  `idstaff` int(10) unsigned DEFAULT NULL,
  `sales_entrytime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sales_delivery_address` varchar(255) DEFAULT '',
  `idproduct_catagory` int(10) unsigned DEFAULT NULL,
  `sales_transport` double DEFAULT '0',
  `idpestablishment` int(10) unsigned NOT NULL DEFAULT '1',
  `sales_details_billing_date` date DEFAULT NULL,
  `sales_details_chalan_date` date DEFAULT NULL,
  `sales_discount_p_rate` double NOT NULL DEFAULT '0' COMMENT 'rate of pipe',
  `sales_discount_p_ammount` double NOT NULL DEFAULT '0' COMMENT 'discount ammount  of pipe',
  `sales_gps_a` varchar(45) NOT NULL DEFAULT '0.00',
  `sales_gps_b` varchar(45) NOT NULL DEFAULT '0.00',
  `contact_number` varchar(64) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `sales_details`
--

INSERT INTO `sales_details` (`idsales`, `sales_discount_f_rate`, `sales_discount_f_ammount`, `sales_comments`, `sales_ispurchase_return`, `iduser`, `idstaff`, `sales_entrytime`, `sales_delivery_address`, `idproduct_catagory`, `sales_transport`, `idpestablishment`, `sales_details_billing_date`, `sales_details_chalan_date`, `sales_discount_p_rate`, `sales_discount_p_ammount`, `sales_gps_a`, `sales_gps_b`, `contact_number`) VALUES
(1, 30, 210, 'Delivery Challan : 1026', 0, 0, 1, '2014-12-09 10:05:32', '650/1, Bara Moghbazar, Dhaka', 1, 0, 1, '2014-12-09', '2014-12-09', 30, 795.6, '23.7361636000', '90.4101474000', '01928-86 35 26'),
(2, 0, 0, 'Delivery Challan : 1027', 0, 0, 5, '2014-12-09 10:14:45', 'Ziro Point Masjid, Muslim Nagar, Matuil, Jatrabari, Dhaka.', 1, 0, 1, '2014-12-09', '2014-12-09', 30, 682.5, '23.7361636000', '90.4101474000', '01716-90 78 06'),
(3, 32, 2888, 'Delivery Challan : 1028', 0, 0, 5, '2014-12-09 10:18:45', '5/ 1 / H Mohonpur, Shamoly', 1, 0, 1, '2014-12-11', '2014-12-09', 0, 0, '23.7362283000', '90.4101121000', '01733 21 55 73'),
(4, 30, 555, 'NULL', 0, 0, 1, '2014-12-09 10:20:26', '&quot;Momin Kunjo Korobi&quot;, House # 305, Road #21, New DOHS Mohakhali, Dhaka', 1, 0, 1, '2014-12-11', '2014-12-11', 0, 0, 'NULL', 'NULL', '01817-03 22 09'),
(5, 32, 640, 'Delivery Challan : 1030', 0, 0, 5, '2014-12-11 05:03:37', 'Nordda, Kalachandpur, Gulshan', 1, 0, 1, '2014-12-10', '2014-12-11', 0, 0, '23.7360497000', '90.4101501000', ' 01715-29 70 33'),
(6, 30, 1014, ' Delivery Challan : 1031', 0, 0, 1, '2014-12-13 07:26:10', '&quot;Momin&#039;s Jui&quot; P # 442, R # 07, DOHS Baridhara, Dhaka.', 1, 0, 1, '2014-12-14', '2014-12-13', 30, 15065.699999999999, '23.7361140000', '90.4100886000', '01817-03 22 09'),
(7, 35, 5449.5, 'Delivery Challan : 1032', 0, 0, 1, '2014-12-13 07:30:58', 'Shop # 18, DCC Market, Gulshan-2, Dhaka', 1, 0, 1, '2014-12-13', '2014-12-13', 35, 1246.6999999999998, 'NULL', 'NULL', ' 01712-09 34 76'),
(8, 35, 28898.1, 'Delivery Challan : 1033', 0, 0, 1, '2014-12-13 07:36:59', '&quot;Trust Asset Meem Mohol&quot;, Plot # 557, Road # , Adabor, Mohammadpur, Dhaka', 1, 0, 1, '2014-12-14', '2014-12-13', 35, 39070.85, 'NULL', 'NULL', '01759-18 77 16'),
(9, 35, 1351.35, 'NULL', 0, 0, 1, '2014-12-13 07:38:32', '&quot;Vision Mehrab Garden&quot;, P # 20, R # 04, Cantonment Dhaka.', 1, 0, 1, '2014-12-14', '2014-12-14', 0, 0, 'NULL', 'NULL', '01926- 68 29 06'),
(10, 35, 213.5, 'Delivery Challan : 1035', 0, 0, 1, '2014-12-13 07:40:46', '&quot;Vision Mehrab Garden&quot;, Plot # 20, Road # 04, Cantonment Dhaka.', 1, 0, 1, '2014-12-14', '2014-12-13', 0, 0, 'NULL', 'NULL', '01926- 68 29 06'),
(11, 35, 1653.75, 'NULL', 0, 0, 1, '2014-12-13 07:43:16', 'ICE Apartment, 48 Bijoynagar, Dhaka', 1, 0, 1, '2014-12-14', '2014-12-13', 35, 19674.199999999997, 'NULL', 'NULL', '01919- 69 24 40'),
(12, 30, 256.2, 'Delivery Challan : 1037', 0, 0, 7, '2014-12-14 04:03:57', ' Abiding Reza Tower (Motor Line)', 1, 0, 1, '2014-12-14', '2014-12-14', 30, 4056, '23.7364945000', '90.4100174000', '01777786729 (Engr. Helal)'),
(13, 35, 1690.5, 'NULL', 0, 0, 1, '2014-12-14 07:59:19', 'House # 58/11, Kodomtala, Wasa Road, Bashaboo, Dhaka.', 1, 0, 1, '2014-12-14', '2014-12-14', 30, 3385.2, '23.7364943000', '90.4099947000', '01922-14 21 26 (Ekram)'),
(14, 30, 1176, 'NULL', 0, 0, 1, '2014-12-14 08:52:59', '650/1, Bara Moghbazar, Dhaka', 1, 0, 1, '2014-12-14', '2014-12-14', 30, 358.8, '23.7364952000', '90.4099856000', '01760-58 23 39'),
(15, 35, 2874.8999999999996, 'NULL', 0, 0, 7, '2014-12-14 10:08:14', '26/1, Hazi Osman Goni Road, Dhaka-1000', 1, 0, 1, '2014-12-14', '2014-12-14', 30, 1973.3999999999999, '23.7360904000', '90.4101194000', '01913-056944'),
(16, 32, 10413.44, 'NULL', 0, 0, 5, '2014-12-14 11:47:10', '11 No Bhavan Market, Gulshan-2, Dhaka', 1, 0, 1, '2014-12-14', '2014-12-14', 32, 10254.4, '23.7360893000', '90.4101164000', '01921-45 40 15'),
(17, 35, 4441.15, 'NULL', 0, 0, 1, '2014-12-14 12:14:50', '&quot;Vision Mehrab Garden&quot;, P # 20, R # 04, Cantonment Dhaka.', 1, 0, 1, '2014-12-17', '2014-12-14', 0, 0, '23.7360897000', '90.4101195000', ' 01926- 68 29 06'),
(18, 35, 3290, 'Delivery Challan : 1043', 0, 0, 1, '2014-12-15 06:08:50', '13 Khilgi Road, MohammadPur, Dhaka.', 1, 0, 1, '2014-12-17', '2014-12-15', 35, 4459, '23.7361127000', '90.4100877000', '01730 45 55 96'),
(19, 30, 10166.1, 'Delivery Challan : 1044', 0, 0, 1, '2014-12-15 06:14:12', ' &quot;Momins Primrose Hill Apartment&quot;, Plot # 5, Road # 14, Block # J, Baridhara, Dhaka', 1, 0, 1, '2014-12-15', '2014-12-15', 30, 6454.5, 'NULL', 'NULL', ''),
(20, 30, 699.3, 'Delivery Challan : 1045', 0, 0, 1, '2014-12-15 06:16:54', '&quot;Momins Sheikh Lodge&quot;, Plot # 37/A, Road # 5, Nazir Road, Cantonment Bazar, Dhaka', 1, 0, 1, '2014-12-17', '2014-12-15', 30, 0, 'NULL', 'NULL', ''),
(21, 30, 4883.099999999999, 'Delivery Challan : 1046', 0, 0, 1, '2014-12-15 06:20:27', '&quot;Momins Sheikh Lodge&quot;, Plot # 37/A, Road # 5, Nazir Road, Cantonment Bazar, Dhaka', 1, 0, 1, '2014-12-17', '2014-12-15', 30, 0, '23.7364882000', '90.4100140000', ''),
(22, 31, 13981, 'Delivery Challan : 1047', 0, 0, 5, '2014-12-15 06:23:17', 'House # 02, Road # 5 / A, Sec # 5, Uttara Dhaka.', 1, 0, 1, '2014-12-15', '2014-12-15', 0, 0, 'NULL', 'NULL', '01733- 77 72 48'),
(23, 32, 3555.2000000000003, 'NULL', 0, 0, 5, '2014-12-17 03:40:06', 'Khalilur Rahman, Hotel Tajmohol, Road # 125, Shreemongol, Sylhet. ', 1, 0, 1, '2014-12-18', '2014-12-17', 32, 0, '23.8103320000', '90.4125181000', '01673-13 70 33'),
(24, 35, 1968.7499999999998, 'NULL', 0, 0, 5, '2014-12-17 03:47:30', 'House # 2, Road # 4, Block # C, Rampura Banashree, Dhaka', 1, 0, 1, '2014-12-17', '2014-12-17', 35, 0, 'NULL', 'NULL', '01723-88 63 69'),
(25, 32, 10492.16, 'NULL', 0, 0, 5, '2014-12-17 04:33:20', '5/ 1 / H Mohonpur, Shamoly', 1, 0, 1, '2014-12-17', '2014-12-17', 32, 0, '23.7365216000', '90.4099843000', '01733 21 55 73'),
(26, 35, 9222.5, 'NULL', 0, 0, 1, '2014-12-17 08:27:50', '&quot;Trust Asset Meem Mohol&quot;, Plot # 557, Road # , Adabor, Mohammadpur, Dhaka', 1, 0, 1, '2014-12-18', '2014-12-17', 35, 0, '23.7365079000', '90.4099710000', '01759-18 77 16'),
(27, 30, 16008.9, 'NULL', 0, 0, 1, '2014-12-17 09:14:43', 'Plot # 692, Link Road, Mirpur, D.O.H.S, Dhaka', 1, 0, 1, '2014-12-17', '2014-12-17', 30, 13685.1, '23.7361135000', '90.4100811000', '01680-04 20 54'),
(28, 30, 415.8, 'NULL', 0, 0, 1, '2014-12-17 09:31:34', '&quot; Momins Sonajhuri&quot;, House 6/1, Block # F, Lalmatia, (Lalmatia thana)', 1, 0, 1, '2014-12-17', '2014-12-17', 30, 0, '23.7365112000', '90.4099795000', '01847-00 19 43'),
(29, 30, 70.8, 'NULL', 0, 0, 1, '2014-12-18 04:39:31', 'Plot # 692, Link Road, Mirpur, D.O.H.S, Dhaka', 1, 0, 1, '2014-12-18', '2014-12-18', 30, 0, '23.7365068000', '90.4099730000', '01680-04 20 54'),
(30, 30, 295.2, 'NULL', 0, 0, 6, '2014-12-18 05:30:03', 'Plot # 671, Road # 26, Mirpur, D.O.H.S, Dhaka', 1, 0, 1, '2014-12-18', '2014-12-18', 30, 1232.3999999999999, '23.7360908000', '90.4100945000', '01917-43 24 33 (Engr. Zahid)'),
(31, 35, 439.25, 'NULL', 0, 0, 5, '2014-12-18 06:37:31', 'House # 2, Road # 4, Block # C, Rampura Banashree, Dhaka', 1, 100, 1, '2014-12-18', '2014-12-18', 35, 4791.15, '23.8103320000', '90.4125181000', '01723-88 63 69'),
(32, 35, 122.49999999999999, 'NULL', 0, 0, 1, '2014-12-20 04:47:23', '&quot;Vision Mehrab Garden&quot;, P # 20, R # 04, Cantonment Dhaka.', 1, 0, 1, '2014-12-20', '2014-12-20', 35, 10892.699999999999, '23.7360903000', '90.4100944000', '01926- 68 29 06'),
(33, 35, 2012.4999999999998, 'NULL', 0, 0, 7, '2014-12-20 11:04:13', '26/1, Hazi Osman Goni Road, Dhaka-1000', 1, 0, 1, '2014-12-20', '2014-12-20', 30, 0, '23.7365068000', '90.4099730000', '01913-056944'),
(34, 35, 297.5, 'NULL', 0, 0, 7, '2014-12-20 11:26:12', 'Alo Bazar(self)', 1, 0, 1, '2014-12-20', '2014-12-20', 30, 0, '23.7365237000', '90.4099764000', '01913056944'),
(35, 25, 110, 'NULL', 0, 0, 1, '2014-12-21 05:07:50', 'House# 17, Road# 4, Block# K, Baridhara, Dhaka.', 1, 0, 1, '2014-12-21', '2014-12-21', 0, 0, '23.7365953000', '90.4099409000', '01730 09 57 95'),
(36, 35, 4399.5, 'NULL', 0, 0, 1, '2014-12-21 05:42:47', 'House # 58/11, Kodomtala, Wasa Road, Bashaboo, Dhaka.', 1, 0, 1, '2014-12-21', '2014-12-21', 30, 17897.1, '23.7360938000', '90.4100530000', '01922-14 21 26 (Ekram)'),
(37, 35, 3184.2999999999997, 'NULL', 0, 0, 7, '2014-12-21 10:18:13', '26/1, Hazi Osman Goni Road, Dhaka-1000', 1, 0, 1, '2014-12-21', '2014-12-21', 30, 1532.7, '23.7365262000', '90.4099841000', '01913-056944'),
(38, 35, 4814.25, 'NULL', 0, 0, 7, '2014-12-21 10:29:06', 'Self Delivered by  Mr. Mamun', 1, 0, 1, '2014-12-21', '2014-12-21', 0, 0, '23.7365112000', '90.4099795000', '01833- 32 66 67'),
(39, 35, 38.5, 'NULL', 0, 0, 7, '2014-12-21 10:49:58', 'Alu Bazar', 1, 0, 1, '2014-12-21', '2014-12-21', 30, 0, '23.7365152000', '90.4099783000', '01777786715'),
(40, 30, 8175, 'NULL', 0, 0, 1, '2014-12-22 03:58:25', 'Mannan&#039;s B, Plot # 83, Road # 06, D.O.H.S Banani, Dhaka.', 1, 0, 1, '2014-12-23', '2014-12-22', 27, 3148.4700000000003, '23.7360901000', '90.4100952000', '01771 -10 92 35'),
(41, 30, 35577, 'NULL', 0, 0, 1, '2014-12-22 04:18:25', '46, Molla Bari, Kawla, Dhaka', 1, 0, 1, '2014-12-22', '2014-12-22', 30, 8252.4, '23.7360906000', '90.4100942000', '01911-75 96 91'),
(42, 30, 1899, 'NULL', 0, 0, 1, '2014-12-22 04:21:54', 'Plot # 1197, Road # 49/A, D.O.H.S, Mirpur, Dhaka', 1, 0, 1, '2014-12-23', '2014-12-22', 20, 5501.6, '23.7365068000', '90.4099721000', '01715-56 89 20'),
(43, 30, 2305.5, 'NULL', 0, 9, 1, '2014-12-22 09:57:24', '&quot; Epic Florentis &quot;, House # 81/3 Autis Dipankar Road, Bashaboo, Dhaka', 1, 0, 1, '2014-12-23', '2014-12-22', 30, 3408.6, '23.7365086000', '90.4099577000', '01711-18 75 11'),
(44, 30, 432, 'NULL', 0, 9, 1, '2014-12-22 10:53:26', 'Mannan&#039;s B, Plot # 83, Road # 06, D.O.H.S Banani, Dhaka.', 1, 0, 1, '2014-12-23', '2014-12-22', 27, 0, '23.7365237000', '90.4099764000', '01771 10 92 35'),
(45, 35, 697.1999999999999, 'NULL', 0, 9, 1, '2014-12-23 05:08:59', '&quot;Online Lake Castle&quot;, 134/1, Maatikata, Mirpur DOHS Road, Cantonment, Dhaka', 1, 0, 1, '2014-12-23', '2014-12-23', 35, 4477.2, '23.7364997000', '90.4099755000', '01730-45 55 96'),
(46, 34, 17646, 'NULL', 0, 9, 6, '2014-12-23 06:47:42', 'Utah Fashion Ltd, Salna, Gazipur.', 1, 0, 1, '2015-01-17', '2014-12-23', 34, 8919.560000000001, '23.7360946000', '90.4101102000', '01849-77 73 33 (Mr. Amin)'),
(47, 30, 8415.3, 'NULL', 0, 9, 7, '2014-12-23 11:59:36', 'Abiding Reza Tower', 1, 0, 1, '2014-12-31', '2014-12-23', 30, 7016.099999999999, '23.7365047000', '90.4099902000', '01777786729 (Engr. Helal)'),
(48, 32, 4752, 'NULL', 0, 9, 5, '2014-12-24 04:48:13', '5/ 1 / H Mohonpur, Shamoly', 1, 0, 1, '2014-12-24', '2014-12-24', 32, 0, '23.7360832000', '90.4100886000', '01733 21 55 73'),
(49, 32, 2264.32, 'NULL', 0, 9, 1, '2014-12-24 05:33:08', 'Box Culvert Road, Purana Paltan, Dhaka.', 1, 0, 1, '2014-12-24', '2014-12-24', 32, 2200.64, '23.7360955000', '90.4101102000', '01952 71 33 50'),
(50, 35, 5593, 'NULL', 0, 9, 7, '2014-12-27 10:22:08', '26/1, Hazi Osman Goni Road, Dhaka-1000', 1, 0, 1, '2014-12-27', '2014-12-27', 30, 1345.5, '23.7360955000', '90.4101102000', '01913-056944'),
(51, 30, 1590, 'NULL', 0, 9, 9, '2014-12-28 06:46:23', '&quot;Techven Moon Light&quot;, House # 333, Road # 3, Block # F, Bashundhara, Dhaka.', 1, 0, 1, '2014-12-28', '2014-12-28', 30, 1392.3, '23.7365103000', '90.4099919000', ''),
(52, 30, 387, 'NULL', 0, 9, 5, '2014-12-28 06:53:05', 'House # 304, Road # 1/3, Block # F, Bashundhara, Dhaka', 1, 0, 1, '2014-12-28', '2014-12-28', 30, 1704.3, '23.7365005000', '90.4099746000', '01710-41 99 63'),
(53, 30, 1185, 'NULL', 0, 9, 9, '2014-12-28 07:12:19', '&quot;Techven Ridoy Castle&quot;, House # 269, Road # 4/A, Block # F, Bashundhara, Dhaka', 1, 0, 1, '2014-12-28', '2014-12-28', 30, 7265.7, '23.7365103000', '90.4099919000', ''),
(54, 35, 2086, 'NULL', 0, 9, 7, '2014-12-28 09:18:59', '26/1, Hazi Osman Goni Road, Dhaka-1000', 1, 0, 1, '2014-12-28', '2014-12-28', 30, 0, '23.7365099000', '90.4099902000', '01913-056944'),
(55, 35, 1338.05, 'NULL', 0, 9, 7, '2014-12-28 09:24:20', '26/1, Hazi Osman Goni Road, Dhaka-1000', 1, 0, 1, '2014-12-28', '2014-12-28', 30, 0, 'NULL', 'NULL', '01913-056944'),
(56, 35, 105, 'NULL', 0, 9, 7, '2014-12-28 11:31:20', '26/1, Hazi Osman Goni Road, Dhaka-1000 ', 1, 0, 1, '2014-12-28', '2014-12-28', 30, 0, '23.7360958000', '90.4101105000', '01913-056944'),
(57, 32, 326.40000000000003, 'NULL', 0, 9, 5, '2014-12-30 04:47:10', 'Self Delivered By Riaz', 1, 0, 1, '2014-12-30', '2014-12-30', 32, 0, '23.7360832000', '90.4100887000', '01777 78 67 21'),
(58, 35, 3748.4999999999995, 'NULL', 0, 9, 7, '2014-12-30 10:35:50', 'Alubazar.', 1, 0, 1, '2014-12-30', '2014-12-30', 30, 0, '23.7360960000', '90.4101105000', '01913-05 69 44'),
(59, 35, 2598.75, 'NULL', 0, 9, 7, '2014-12-30 10:44:57', 'Alubazar', 1, 0, 1, '2014-12-30', '2014-12-30', 30, 0, '23.7360952000', '90.4101104000', '01913-05 69 44'),
(60, 30, 1376.7, 'NULL', 0, 9, 1, '2015-01-01 03:46:54', 'Momen&#039;s Sonajhuri, House # 6/1, Block # F, Lalmatia, Dhaka.', 1, 0, 1, '2015-01-01', '2015-01-01', 30, 10877.1, '23.7363323000', '90.4102190000', '01847 00 19 43'),
(61, 30, 195, 'NULL', 0, 9, 1, '2015-01-01 03:59:40', 'CAre Saykat, 116/5, Jafrabad, West  Dhanmondi.', 1, 0, 1, '2015-01-01', '2015-01-01', 30, 7655.7, '23.7361367000', '90.4102286000', '01912 92 31 92 '),
(62, 25, 7847.5, 'NULL', 0, 9, 1, '2015-01-01 04:09:07', 'Ideal Garden, 180/1, Road # 05, Mohammadia Housing Ltd Ltd. Mohammadpur, Dhaka.', 1, 0, 1, '2015-01-03', '2015-01-01', 25, 2317.25, '23.7363886000', '90.4102214000', '01974 16 93 27 '),
(63, 30, 6113.4, 'NULL', 0, 9, 1, '2015-01-01 10:35:28', '5/3, Mohonpur, Ring Road, Shamoli, Dhaka.', 1, 0, 1, '2015-01-06', '2015-01-01', 30, 16598.399999999998, '23.7362259000', '90.4102275000', '01833 31 41 71 '),
(64, 35, 16761.5, 'NULL', 0, 9, 1, '2015-01-03 04:18:13', 'SMC Tower, 33 Banani C/A, Dhaka', 1, 0, 1, '2015-01-05', '2015-01-03', 35, 7998.9, '23.7363781000', '90.4102215000', '01716 61 05 46, 01711-80 34 43'),
(65, 35, 1354.1499999999999, 'NULL', 0, 9, 7, '2015-01-03 06:37:30', '26/1, Alloo Bazar', 1, 0, 1, '2015-01-03', '2015-01-03', 35, 313.95, '23.7364253000', '90.4102240000', '01983 57 32 91'),
(66, 30, 0, 'NULL', 0, 9, 1, '2015-01-03 06:53:45', 'Self Delivery, 650/1 Bara MaghBazar', 1, 0, 1, '2015-01-03', '2015-01-03', 30, 269.09999999999997, '23.7361450000', '90.4102451000', '01760 58 23 39'),
(67, 35, 1365, 'NULL', 0, 9, 1, '2015-01-06 08:19:38', 'Self Delivery', 1, 0, 1, '2015-01-06', '2015-01-06', 35, 0, '23.7360827000', '90.4100889000', '01937 94 28 23'),
(68, 32, 268.8, 'NULL', 0, 9, 5, '2015-01-06 08:38:37', '5/4/H Mohonpur, Shamoli.', 1, 0, 1, '2015-01-07', '2015-01-06', 32, 16972.8, '23.7365728000', '90.4098776000', '01733 21 55 73'),
(69, 35, 1155, 'NULL', 0, 9, 1, '2015-01-06 08:40:47', 'Self Delivery', 1, 0, 1, '2015-01-06', '2015-01-06', 35, 0, '23.8103320000', '90.4125181000', '01937 94 28 23'),
(70, 33, 31241.100000000002, 'NULL', 0, 9, 1, '2015-01-07 05:05:40', '45/1 R.K Mission Road, Dhaka.', 1, 0, 1, '2015-01-11', '2015-01-07', 33, 35096.490000000005, '23.7363177000', '90.4101948000', '01847 06 62 95'),
(71, 35, 3422.2999999999997, 'NULL', 0, 9, 7, '2015-01-07 07:10:20', 'CIC Bhaban, 31 Bangla Motor, Karwan Bazar, Dhaka. (Beside Planner&#039;s Tower)', 1, 0, 1, '2015-01-07', '2015-01-07', 20, 6013.8, '23.7366085000', '90.4098477000', 'Eng. Ashraf : 01671 96 15 69'),
(72, 35, 404.25, 'NULL', 0, 0, 7, '2015-01-07 08:57:57', 'self delivery', 1, 0, 1, '2015-01-07', '2015-01-07', 35, 632.4499999999999, '23.7362599000', '90.4099039000', '01913 05 69 44'),
(73, 30, 36375, 'NULL', 0, 9, 1, '2015-01-08 03:47:49', 'Kawla Mollabari, 46 Kawla, Dhaka.', 1, 0, 1, '2015-01-10', '2015-01-08', 30, 6906.9, '23.7365776000', '90.4101301000', '01911 75 96 91 '),
(74, 20, 132, 'NULL', 0, 9, 7, '2015-01-08 03:54:32', 'Shempur, Mohammad Bagh', 1, 0, 1, '2015-01-08', '2015-01-08', 20, 0, '23.7365018000', '90.4097886000', '01713 08 21 45'),
(76, 22, 12296.68, 'NULL', 0, 9, 1, '2015-01-08 08:42:35', 'Plot # 50, Road # 13, Sector # 03, Uttara, Dhaka.', 1, 0, 1, '2015-01-08', '2015-01-08', 22, 31108.22, '23.7363190000', '90.4102003000', ''),
(77, 30, 13161, 'NULL', 0, 9, 6, '2015-01-10 04:09:15', 'BOCL, Baset Monjil, Plot # 1055, Road # 39, BOHS, Mirpur, Dhaka.', 1, 0, 1, '2015-01-10', '2015-01-10', 30, 7558.2, '23.7363209000', '90.4101989000', 'Eng. Zahid : 01917 43 24 33, 01811 41 21 09'),
(78, 30, 859.8, 'NULL', 0, 0, 7, '2015-01-10 07:29:30', '&quot;Afsar garden &quot; For- Roof Top Community Room Toilet Works ', 1, 0, 1, '2015-01-10', '2015-01-10', 30, 226.2, '23.7365054000', '90.4097861000', '017777 86 709'),
(79, 35, 1935.4999999999998, 'NULL', 0, 9, 7, '2015-01-10 08:28:57', 'Alloo Bazar, Self Delivery', 1, 0, 1, '2015-01-10', '2015-01-10', 35, 0, '23.7366137000', '90.4101088000', '01913 05 69 44'),
(80, 35, 20643.699999999997, 'NULL', 0, 9, 1, '2015-01-10 13:06:25', 'Online Center, 572/K, Matikata, Mirpur, cant.', 1, 0, 1, '2015-01-11', '2015-01-11', 35, 7857.849999999999, '23.7363177000', '90.4101948000', ''),
(81, 30, 2167.2, 'NULL', 0, 9, 1, '2015-01-11 06:22:53', 'Momin Jui, Plot # 442, Road # 07, DOHS, Baridhara, Dhaka', 1, 0, 1, '2015-01-12', '2015-01-11', 30, 0, '23.7365054000', '90.4097861000', '01817 03 22 09'),
(82, 35, 1365, 'NULL', 0, 0, 7, '2015-01-11 08:38:59', '26/1, Hazi Osman Goni Road Dhaka.', 1, 0, 1, '2015-01-11', '2015-01-11', 35, 1569.75, '23.7365229000', '90.4098056000', '01913 05 69 44'),
(83, 35, 1218, 'NULL', 0, 9, 1, '2015-01-12 04:20:48', '48, Bijoynagar, Dhaka.', 1, 0, 1, '2015-01-12', '2015-01-12', 35, 9609.599999999999, '23.7363726000', '90.4103491000', ''),
(84, 30, 12822, 'NULL', 0, 9, 1, '2015-01-12 04:16:43', 'Regnun Place, House # 205/4, Road # 08,  Niketan,  Gulshan, Dhaka.', 1, 0, 1, '2015-01-12', '2015-01-12', 25, 7400.25, '23.7363177000', '90.4101948000', '01841 41 07 01'),
(85, 20, 1415, 'NULL', 0, 9, 5, '2015-01-12 04:40:56', 'House # 64, Road # 26, DHanmondi, Dhaka.', 1, 0, 1, '2015-01-12', '2015-01-12', 20, 2462.2000000000003, '23.7366274000', '90.4101250000', '01819 90 15 07'),
(86, 32, 8828.16, 'NULL', 0, 9, 1, '2015-01-13 10:18:26', 'Progati Momtaz Dream, 168, 179 Tetul Road, Uttar Badda, Dhaka.', 1, 0, 1, '2015-01-13', '2015-01-13', 32, 19822.4, '23.7363245000', '90.4102280000', '01678 59 23 09, 01672 46 33 73'),
(87, 35, 7932.4, 'NULL', 0, 9, 1, '2015-01-14 04:17:06', 'Plot # 1231/1233, Road # 47/A, DOHS, Mirpur, Dhaka.', 1, 0, 1, '2015-01-14', '2015-01-14', 35, 0, '23.7363187000', '90.4102274000', '01942 22 38 58'),
(88, 30, 4365, 'NULL', 0, 9, 1, '2015-01-14 04:33:06', 'Plot # 1248, Road # 17/A, DOHS, Mirpur, Dhaka.', 1, 0, 1, '2015-01-15', '2015-01-14', 20, 0, '23.7364943000', '90.4097419000', '01715 56 89 20'),
(89, 0, 0, 'NULL', 0, 9, 1, '2015-01-14 05:26:32', 'Protik Ruposree, Plot # 78, Road # 12/4,  South Banosree, Dhaka.', 1, 0, 1, '2015-01-15', '2015-01-14', 0, 0, '23.7362884000', '90.4099444000', 'Mr. Jewel : 01683 60 85 93, Mr. Monir : 01824 83 26 73'),
(90, 32, 341.76, 'NULL', 0, 9, 1, '2015-01-15 03:52:00', 'Progati Momtaz Dream, 168,179 Tetul Road, Uttar Badda, Dhaka,', 1, 0, 1, '2015-01-15', '2015-01-15', 32, 0, '23.7363004000', '90.4100205000', '01672 46 33 73, 01678 59 23 09'),
(91, 33, 2085.6, 'NULL', 0, 9, 1, '2015-01-15 04:03:45', 'Ejab Alifa SIddique, 45/1, RK Mission  Road, Gopibagh, Dhaka', 1, 0, 1, '2015-01-15', '2015-01-15', 33, 0, '23.7362994000', '90.4100223000', '01847 06 62 99'),
(92, 35, 259, 'NULL', 0, 9, 1, '2015-01-15 07:52:08', '48, Bijoynagar, Dhaka.', 1, 0, 1, '2015-01-15', '2015-01-15', 35, 0, '23.7363075000', '90.4100138000', '01919-69 24 40'),
(93, 35, 194.25, 'NULL', 0, 9, 7, '2015-01-15 07:55:53', 'CIC Bhaban, 31 Bangla Motor, Karwan Bazar, Dhaka. (Beside Planners Tower)', 1, 0, 1, '2015-01-15', '2015-01-15', 20, 0, '23.7362987000', '90.4100204000', 'Eng. Ashraf : 01671 96 15 69'),
(94, 32, 221.76, 'NULL', 0, 9, 1, '2015-01-15 12:37:41', '5/4/H Mohonpur, Shamoli.', 1, 0, 1, '2015-01-15', '2015-01-15', 32, 0, '23.7363370000', '90.4097609000', '01733-21 55 73'),
(95, 34, 3723.0000000000005, 'NULL', 0, 9, 6, '2015-01-17 04:26:52', 'Utah Knitting &amp; Dyeing Ltd.Road # 03, House # 06, Dhanmondi, Dhaka-1205 (For Gazipur Site)', 1, 0, 1, '2015-01-17', '2015-01-17', 34, 0, '23.7362998000', '90.4100173000', 'Md. Alamin : 01922 66 01 21'),
(96, 32, 6810.88, 'NULL', 0, 9, 1, '2015-01-17 04:41:32', 'Box Culvert Road, Purono Paltan, Dhaka.', 1, 0, 1, '2015-01-17', '2015-01-17', 32, 3652.48, '23.7363649000', '90.4096977000', '01777 78 67 16 '),
(97, 32, 5376, 'NULL', 0, 9, 5, '2015-01-17 04:48:44', '5/4/H Mohon Pur Shamoli, Dhaka.', 1, 0, 1, '2015-01-17', '2015-01-17', 32, 5166.72, '23.7362972000', '90.4100200000', '01733 21 55 73'),
(98, 35, 15301.65, 'NULL', 0, 9, 7, '2015-01-17 10:18:36', 'Self Delivery', 1, 0, 1, '2015-01-17', '2015-01-17', 0, 0, 'NULL', 'NULL', 'MD. Mokbul : 01684 06 97 70'),
(99, 30, 21393, 'NULL', 0, 9, 1, '2015-01-18 04:26:51', 'Plot # 1203, Road # 47/A, DOHS, Mirpur, Dhaka. ', 1, 0, 1, '2015-01-18', '2015-01-18', 20, 20280, '23.7363000000', '90.4100152000', '01766 02 03 07'),
(100, 30, 3366, 'NULL', 0, 9, 1, '2015-01-18 04:39:02', 'House # 1197, R 47/A, DOHS, Mirpur Dhaka.', 1, 0, 1, '2015-01-18', '2015-01-18', 20, 728, '23.7362987000', '90.4100204000', '01766 02 03 07'),
(101, 30, 456.9, 'NULL', 0, 9, 1, '2015-01-18 04:47:08', '&quot;Momin&#039;s Sheikh Lodge&quot;, Plot # 37/A, Road # 5, Nazir Road, Cantonment Bazar, Dhaka.', 1, 0, 1, '2015-01-18', '2015-01-18', 30, 682.5, '23.7362950000', '90.4100216000', '01819 81 46 70'),
(102, 33, 2574, 'NULL', 0, 9, 1, '2015-01-18 13:08:16', '&quot; Ejab Arshinagar&quot;, House # 14-16, Road # 17, Sec # 12, Uttara, Dhaka.', 1, 0, 1, '2015-01-19', '2015-01-19', 33, 4950.66, '23.7362988000', '90.4100199000', '01847- 06 62 97'),
(103, 35, 1859.8999999999999, 'NULL', 0, 9, 1, '2015-01-18 13:13:51', 'Online Super Market, Lake City, Mati Kata, Cantonment.', 1, 0, 1, '2015-01-19', '2015-01-19', 35, 4226.95, 'NULL', 'NULL', '01730 54 55 93'),
(104, 30, 1407, 'NULL', 0, 9, 1, '2015-01-19 04:19:11', 'Plot # 1106, Road # 42, DOHS, Mirpur.', 1, 0, 1, '2015-01-19', '2015-01-19', 20, 1375.4, '23.7363068000', '90.4100239000', '01912-624623'),
(105, 32, 3566.4, 'NULL', 0, 9, 5, '2015-01-20 05:09:10', 'House # 71, Road # 08, Block # F, Bashundhara.', 1, 0, 1, '2015-01-20', '2015-01-20', 32, 2491.84, '23.7363062000', '90.4100053000', '01748 12 10 23 '),
(106, 35, 2056.6, 'NULL', 0, 9, 7, '2015-01-20 06:38:32', 'Self Delivery. Allo Bazar', 1, 0, 1, '2015-01-20', '2015-01-20', 35, 0, '23.7363649000', '90.4097146000', '01777 78 67 15'),
(107, 35, 6160, 'NULL', 0, 9, 7, '2015-01-20 08:08:12', 'allow bazar', 1, 0, 1, '2015-01-20', '2015-01-20', 35, 0, '23.7363102000', '90.4100132000', '017777 86 715'),
(108, 32, 627.2, 'NULL', 0, 9, 5, '2015-01-22 04:01:39', 'House  # 71, Road # 8, Block # F, Bashundhara', 1, 0, 1, '2015-01-22', '2015-01-22', 32, 0, '23.7362948000', '90.4100360000', '01748 12 10 23 '),
(109, 30, 390, 'NULL', 0, 9, 1, '2015-01-22 04:08:53', 'Plot # 1203, Road # 47/ A , DOHS, Mirpur.', 1, 0, 1, '2015-01-24', '2015-01-22', 20, 0, '23.7362839000', '90.4100353000', '01712 74 86 44'),
(110, 30, 46723.2, 'NULL', 0, 9, 6, '2015-01-22 05:21:09', 'Plot # 1270, Road # 10 New , (16 old),  DOHS, Mirpur, Dhaka.', 1, 0, 1, '2015-01-24', '2015-01-22', 30, 39678.6, '23.7362812000', '90.4100332000', 'Mr. Hossain : 01670 93 81 19'),
(111, 0, 0, 'NULL', 0, 9, 1, '2015-01-22 05:30:41', '&quot;Protik Ruporsree&quot; Plot # 78, Road # 12/4, South Banosree, Dhaka.', 1, 0, 1, '2015-01-24', '2015-01-22', 0, 0, '23.7362839000', '90.4100353000', '01683 60 85 93 '),
(112, 32, 2016, 'NULL', 0, 9, 5, '2015-01-22 07:29:23', '5/4/H, Mohonpur, shamoly, Dhaka.', 1, 0, 1, '2015-01-24', '2015-01-22', 32, 0, '23.7363416000', '90.4098318000', '01733 21 55 73'),
(113, 35, 4070.4999999999995, 'NULL', 0, 9, 1, '2015-01-22 08:21:26', 'Shekkor Nagar, Sirajdikhan, Munshigang.', 1, 0, 1, '2015-01-22', '2015-01-22', 35, 3203.2, '23.7363778000', '90.4096727000', '01813 37 26 46'),
(114, 35, 280, 'NULL', 0, 9, 7, '2015-01-24 04:03:37', 'Self Delivery ', 1, 0, 1, '2015-01-24', '2015-01-24', 0, 0, '23.7362762000', '90.4100574000', '01684 06 97 70'),
(115, 32, 1363.2, 'NULL', 0, 9, 5, '2015-01-24 05:29:03', 'Self Delivery ', 1, 0, 1, '2015-01-24', '2015-01-24', 32, 848.64, '23.7363075000', '90.4100281000', '01845 87 76 48'),
(116, 32, 513.6, 'NULL', 0, 9, 5, '2015-01-24 07:09:56', 'House # 71, Road # 08, Block # F, Bashundhara, Dhaka.', 1, 0, 1, '2015-01-24', '2015-01-24', 32, 0, '23.7363925000', '90.4096628000', '01748 12 10 23'),
(117, 35, 427, 'NULL', 0, 9, 1, '2015-01-24 07:33:34', 'Shekhor Nagar, SIrajdikhan, Munshigang.', 1, 0, 1, '2015-01-24', '2015-01-24', 35, 0, '23.7362552000', '90.4100023000', '01813 37 26 46'),
(118, 0, 0, 'NULL', 0, 9, 1, '2015-01-24 12:36:40', '&quot;Protik Ruporsree&quot; Plot # 78, Road # 12/4, South Banosree, Dhaka.', 1, 0, 1, '2015-01-24', '2015-01-24', 0, 0, '23.7362899000', '90.4100371000', '01683 60 85 93'),
(119, 30, 3197.7, 'NULL', 0, 9, 5, '2015-01-24 13:10:24', '&quot;Living Blue Stone&quot;, House # 68, Road # 10/B,  Sector # 10, Uttara.', 1, 0, 1, '2015-01-26', '2015-01-25', 30, 5678.4, '23.7362899000', '90.4100371000', '01988 13 70 21 '),
(120, 30, 6264.9, 'NULL', 0, 9, 1, '2015-01-25 05:10:03', 'Kunjo Korobi, House # 305, Road # 21, Mohakhali, DOHS', 1, 0, 1, '2015-01-26', '2015-01-25', 30, 1950, '23.7362552000', '90.4100023000', '01819-71 05 15'),
(121, 32, 172.8, 'NULL', 0, 9, 1, '2015-01-25 08:50:33', 'Army Head Quarter, Multipurpose Complex, Cantonment, Dhaka.', 1, 0, 1, '2015-01-26', '2015-01-25', 25, 227.5, '23.7362926000', '90.4100369000', '017130-73 41 16'),
(122, 25, 2268.75, 'NULL', 0, 9, 1, '2015-01-26 05:15:48', 'House # 17, Road # 04, Block # K, Baridhara, Dhaka.', 1, 0, 1, '2015-01-28', '2015-01-26', 0, 0, '23.7362899000', '90.4100371000', '01730 09 57 95'),
(123, 35, 847, 'NULL', 0, 9, 1, '2015-01-26 05:27:19', '37, SMC Tower, Banani, Dhaka.', 1, 0, 1, '2015-01-26', '2015-01-26', 35, 5596.5, '23.7362926000', '90.4100369000', '01721 72 14 58'),
(124, 35, 2944.5499999999997, 'NULL', 0, 9, 1, '2015-01-27 05:19:57', 'House # 58/11, KadamTola, Wasa road, Bashabo, dhaka.', 1, 0, 1, '2015-01-27', '2015-01-27', 30, 1435.2, '23.7362845000', '90.4101580000', '01922 14 21 26 '),
(125, 30, 1656, 'NULL', 0, 9, 1, '2015-01-27 06:25:23', 'Prim Rose Hill Appartment, Plot # 5, Road # 14, Block # J, Baridhara Model Town.', 1, 100, 1, '2015-01-28', '2015-01-27', 30, 0, '23.7362881000', '90.4100366000', '01819-71 05 15'),
(126, 25, 435, 'NULL', 0, 9, 1, '2015-01-27 06:33:46', 'Plot # 17, Road # 4, Block # K, Baridhara,Dhaka.', 1, 100, 1, '2015-01-28', '2015-01-27', 0, 0, '23.7362948000', '90.4100360000', '01862-72 58 72'),
(127, 34, 1440.92, 'NULL', 0, 9, 1, '2015-01-27 08:42:57', 'Art- n Nazmohol, Plot # 13, Road # 6, Rupnagar, Mirpur, Dhaka.', 1, 0, 1, '2015-01-28', '2015-01-27', 28, 16827.72, '23.7363929000', '90.4096626000', '0168 67 81 20'),
(128, 30, 7674.599999999999, 'NULL', 0, 9, 5, '2015-01-28 04:11:03', 'House # 69, Road # 4/A, Block # F,  Bashundhara,', 1, 0, 1, '2015-01-28', '2015-01-28', 30, 6618.3, '23.7362775000', '90.4100300000', '01739 01 00 97 '),
(129, 0, 0, 'fixed price ( pipe =40% , Fitt = 35% )', 0, 9, 1, '2015-01-28 07:34:28', 'Building # C-1, C-2, D-1, Holding # 78, Road # 12/A, Block # J , South  Bonoshree, Dhaka.', 1, 0, 1, '2015-01-28', '2015-01-28', 0, 0, '23.7362593000', '90.4102067000', '01683 60 85 93'),
(130, 30, 1475.3999999999999, 'NULL', 0, 9, 6, '2015-01-29 04:06:24', 'House # 5, Road # 1, Block # B, Aftabnagar R/A, Merul Badda, Dhaka.', 1, 0, 1, '2015-01-29', '2015-01-29', 30, 631.8, '23.7362881000', '90.4100366000', '01711 54 43 37'),
(131, 0, 0, 'NULL', 0, 9, 6, '2015-01-29 05:01:49', 'House # 82/10, 11 Bir Uttam , ZIaur Rahman Road, Banani, Dhaka.', 1, 0, 1, '2015-01-29', '2015-01-29', 30, 2121.6, '23.7362924000', '90.4100368000', '0189 13 43 42'),
(132, 35, 51992.5035, 'NULL', 0, 9, 1, '2015-01-29 06:09:35', '&quot;Tropical Rahman Villa&quot;, Plot # 52, Aowal Ave, Sector # 06, Uttara, Dhaka.', 1, 0, 1, '2015-01-29', '2015-01-29', 35, 14268.8, '23.7362824000', '90.4100326000', '01722 92 58 24'),
(133, 20, 23202, 'NULL', 0, 9, 5, '2015-01-29 06:19:00', 'House # 52/9, West Raza Bazar, Dalibari Road.', 1, 0, 1, '2015-01-29', '2015-01-29', 20, 10166, '23.7362839000', '90.4100353000', '01742 18 28 18'),
(134, 35, 866.25, 'NULL', 0, 9, 7, '2015-01-29 09:46:24', 'Self Delivery', 1, 0, 1, '2015-01-29', '2015-01-29', 30, 0, '23.7362926000', '90.4100369000', '01922 14 21 26'),
(135, 33, 6534, 'NULL', 0, 9, 1, '2015-01-29 10:55:12', '45/1, R.K Mission Road, Dhaka.', 1, 0, 1, '2015-01-29', '2015-01-29', 33, 0, '23.7362888000', '90.4100325000', '01847 06 62 95'),
(136, 0, 0, 'NULL', 0, 9, 1, '2015-01-31 04:31:16', 'Building # C-1, C-2, D-1, Holding # 78, Road # 12-A, Block # J, South Bonoshree', 1, 0, 1, '2015-01-31', '2015-01-31', 0, 0, '23.7362899000', '90.4100371000', '01683 60 85 93'),
(137, 30, 84, 'NULL', 0, 9, 1, '2015-01-31 04:40:33', 'Primrose Hill Apartment, Plot # 05, Road # 14, B- J, Baridhara Model Town, Dhaka.', 1, 0, 1, '2015-01-31', '2015-01-31', 30, 0, '23.7362824000', '90.4100326000', '01819 71 05 15'),
(138, 35, 378, 'NULL', 0, 9, 1, '2015-01-31 04:51:12', '37 SMC Tower, Banani, Dhaka.', 1, 0, 1, '2015-01-31', '2015-01-31', 35, 0, '23.7362899000', '90.4100371000', '01721 72 14 58'),
(139, 30, 666.003, 'NULL', 0, 9, 6, '2015-01-31 04:59:25', 'Plot # 1270, Road # 16 (Old), Road # 10(New), DOHS, Mirpur, Dhaka.', 1, 0, 1, '2015-02-01', '2015-01-31', 30, 0, '23.7362948000', '90.4100360000', '01670 93 81 19'),
(140, 35, 1776.25, 'NULL', 0, 9, 1, '2015-01-31 05:10:50', 'Plot # 1356, Road # 47/A, DOHS, Mirpur.', 1, 0, 1, '2015-02-01', '2015-01-31', 35, 2648.1, '23.7363771000', '90.4096730000', '01681 37 53 03'),
(141, 35, 3783.4999999999995, 'NULL', 0, 9, 1, '2015-01-31 05:21:46', 'Plot # 1231, 1233, Road # 47/A, DOHS, Mirpur.', 1, 0, 1, '2015-02-01', '2015-01-31', 35, 2275, '23.7362607000', '90.4100000000', '01621 35 53 03'),
(143, 32, 1990.4, 'NULL', 0, 9, 1, '2015-01-31 09:29:27', '106/Ka, Box Culvart Road, Naya Palton', 1, 0, 1, '2015-01-31', '2015-01-31', 0, 0, '23.7363051000', '90.4099941000', '01962 32 84 91'),
(144, 0, 0, 'NULL', 0, 9, 1, '2015-01-31 11:40:13', 'Protik Ruposree, Building C1, D1,  House # 78, Road 12/4, Block # J, South Bonosree', 1, 0, 1, '2015-02-08', '2015-02-01', 0, 0, '23.7363042000', '90.4099882000', '01683 60 85 93'),
(145, 35, 909.9999999999999, 'NULL', 0, 9, 1, '2015-02-01 11:20:24', '14/E, Mirbagh, Moghbazar, Dhaka 01678-029821', 1, 60, 1, '2015-02-02', '2015-02-01', 35, 0, '23.7362954000', '90.4099931000', ' : 01678-02 98 21'),
(146, 100, 8500, 'NULL', 0, 9, 1, '2015-02-02 05:56:20', 'Protik Ruposree, Building # C1, D1, House # 72, Road # 12/4, Block # J, South Bonosree, Dhaka.', 1, 0, 1, '2015-02-08', '2015-02-02', 0, 0, '23.7363826000', '90.4096933000', '01683 60 85 93'),
(147, 0, 0, 'NULL', 0, 9, 1, '2015-02-02 06:03:49', 'Protik Ruposree, Building # C1, D1, House # 72, Road # 12/4, Block # J, South Bonosree, Dhaka.', 1, 0, 1, '2015-02-02', '2015-02-02', 0, 0, '23.7363030000', '90.4100226000', ''),
(148, 35, 5057.5, 'NULL', 0, 9, 1, '2015-02-02 11:54:47', 'Professors Garden 70-71, Transmeter Road , Faydabad, Abdullahpur, Dhaka.', 1, 0, 1, '2015-02-04', '2015-02-03', 35, 34848.45, '23.7363015000', '90.4099971000', '01724 69 34 32'),
(149, 35, 69386.1035, 'NULL', 0, 9, 1, '2015-02-02 12:25:31', '&quot;Trust Asset Mou&quot;, Plot # 1244, Main Road , Mirpur, Dhaka.', 1, 0, 1, '2015-02-09', '2015-02-03', 35, 0, '23.7363051000', '90.4100238000', '01731 04 50 74'),
(150, 35, 0, 'NULL', 0, 9, 1, '2015-02-02 12:31:10', ' &quot;Trust Asset Mou&quot;, Plot # 1244, Main Road , Mirpur, Dhaka. ', 1, 0, 1, '2015-02-04', '2015-02-03', 35, 57057, '23.7363051000', '90.4099891000', 'Contact No : 01731 04 50 74'),
(151, 0, 0, 'NULL', 0, 9, 1, '2015-02-04 04:50:21', 'Box Culvert Road, Self Delivery', 1, 0, 1, '2015-02-04', '2015-02-04', 27, 242.19000000000003, '23.7362904000', '90.4099624000', '01732-93 25 33'),
(152, 35, 46711, 'NULL', 0, 9, 1, '2015-02-04 11:15:47', 'Balitha Saha Belesswar, SutiPara, Dhamrai, Dhaka.', 1, 0, 1, '2015-02-04', '2015-02-04', 35, 71494.15, '23.7363017000', '90.4100227000', '01711 18 16 73'),
(153, 30, 681, 'NULL', 0, 9, 1, '2015-02-04 11:48:56', 'Plot # 50, Road # 13, Sec # 03, Uttara,Dhaka.', 1, 0, 1, '2015-02-10', '2015-02-04', 30, 6552, '23.7363143000', '90.4099898000', '01710 95 41 59 '),
(154, 32, 4983.36, 'NULL', 0, 9, 5, '2015-02-05 09:12:09', '48 Purana Paltan Lane, Dhaka.', 1, 0, 1, '2015-02-07', '2015-02-05', 32, 3748.16, '23.8103320000', '90.4125181000', '01837 21 87 49'),
(155, 30, 10530, 'NULL', 0, 9, 1, '2015-02-07 03:57:21', 'Plot # 53, 54, Road # 02, Block # D, Shahidbagh, Kalapani, Kalshi mor,Mirpur-12, Dhaka.', 1, 0, 1, '2015-02-08', '2015-02-07', 20, 4843.8, '23.7363803000', '90.4096892000', '01843 88 86 28'),
(156, 30, 7985.4, 'NULL', 0, 9, 5, '2015-02-07 04:18:51', 'Techvan Rose, House # 3/2, Road # 3, BakshiBazar, Lane, Dhaka.', 1, 0, 1, '2015-02-08', '2015-02-07', 30, 5202.599999999999, '23.7362976000', '90.4100127000', '01723 21 85 59'),
(157, 0, 0, 'NULL', 0, 9, 1, '2015-02-07 07:38:54', 'Protik Ruporsree,Building # C1, D1, House # 78, Road # 12/4, Block # J , South Bonoshree, Dhaka.', 1, 0, 1, '2015-02-08', '2015-02-07', 0, 0, '23.7363150000', '90.4099834000', '01683 60 85 93'),
(158, 0, 0, 'NULL', 0, 9, 1, '2015-02-07 07:57:04', '&quot;Protik Ruposhree&quot;, Building # A2, C1,D1, House # 78, Road 12/A, Block # J, South Bonosree, Dhaka.', 1, 0, 1, '2015-02-08', '2015-02-07', 0, 0, '23.7363098000', '90.4100041000', '01683 60 85 93 , 01824 83 26 73'),
(159, 30, 1998, 'NULL', 0, 9, 5, '2015-02-08 04:16:45', ' &quot;Living Blue Stone&quot;, House # 68, Road # 10/B, Sector # 10, Uttara.', 1, 0, 1, '2015-02-08', '2015-02-08', 30, 0, '23.7364314000', '90.4096540000', '01988 13 70 21'),
(160, 32, 27173.760000000002, 'NULL', 0, 9, 6, '2015-02-08 05:24:35', '&quot;Assure Shireen Height&quot;, House # 12, Road # 12, Sector # 01, Uttara, Dhaka.', 1, 0, 1, '2015-02-09', '2015-02-08', 32, 30143.36, '23.7363792000', '90.4096742000', '01755 64 04 73'),
(161, 30, 5700.003, 'NULL', 0, 9, 1, '2015-02-08 05:29:36', ' Plot # 53, 54, Road # 02, Block # D, Shahidbagh, Kalapani, Kalshi mor,Mirpur-12, Dhaka.', 1, 0, 1, '2015-02-08', '2015-02-08', 20, 0, '23.7363016000', '90.4099822000', '01843 88 86 82'),
(162, 32, 0.0032, 'NULL', 0, 9, 6, '2015-02-08 05:48:33', 'House # 12, Road # 12, Sector # 01, Uttara , Dhaka.', 1, 0, 1, '2015-02-09', '2015-02-08', 32, 0, '23.7362392000', '90.4099933000', '01755 64 04 73'),
(163, 34, 0.0034000000000000002, 'NULL', 0, 9, 1, '2015-02-08 08:56:21', 'Art N Nazmohol, Plot # 13, Road # 6, Rupnagar, Mirpur, Dhaka.', 1, 0, 1, '2015-02-09', '2015-02-08', 28, 0, '23.7363023000', '90.4097460000', '0168 67 81 20'),
(164, 32, 73520, 'NULL', 0, 9, 6, '2015-02-08 09:47:57', 'Assure Berlin Palace, House # 25, Road # 4/A, Monsurabad Housing Society, Mohammadpur, Dhaka.', 1, 0, 1, '2015-02-16', '2015-02-08', 32, 77188.8, '23.7363108000', '90.4099998000', '01730 33 34 87'),
(165, 32, 0.0032, 'NULL', 0, 9, 6, '2015-02-08 10:05:30', 'Assure Berlin Palace, House 3 25, Road # 4/A, Monsurabad Housing  Society, Mohammad Pur,Dhaka', 1, 0, 1, '2015-02-09', '2015-02-08', 32, 0, '23.7363806000', '90.4096892000', '01730 33 34 87'),
(166, 30, 2659.5, 'NULL', 0, 9, 1, '2015-02-09 04:39:31', '23/2 West Agargaon, Dhaka', 1, 0, 1, '2015-02-09', '2015-02-09', 30, 1368.8999999999999, '23.7363056000', '90.4099743000', '01711 89 88 50'),
(167, 35, 297.5, 'NULL', 0, 9, 7, '2015-02-09 05:07:30', 'Self Delivery, Allo Bazar, Dhaka.', 1, 0, 1, '2015-02-09', '2015-02-09', 30, 717.6, '23.7363051000', '90.4099777000', '01777 78 67 15'),
(168, 30, 10878, 'NULL', 0, 9, 1, '2015-02-09 06:39:12', 'Plot # 50, Road # 13, Sector # 03, Uttara, Dhaka.', 1, 0, 1, '2015-02-10', '2015-02-09', 30, 9691.5, '23.7363912000', '90.4097227000', '01757 63 38 37'),
(169, 35, 0, 'NULL', 0, 9, 1, '2015-02-09 08:04:27', ' Professors Garden 70-71, Transmeter Road , Faydabad, Abdullahpur, Dhaka.', 1, 0, 1, '2015-02-09', '2015-02-09', 35, 30869.999999999996, '23.7362812000', '90.4100074000', '01724 69 34 32'),
(170, 34, 20173.22, 'NULL', 0, 5, 6, '2015-02-09 09:04:45', 'Utah Fashion Ltd. Shaha, Gazipur, ', 1, 0, 1, '2015-02-15', '2015-02-09', 34, 9927.320000000002, '23.7362911000', '90.4099918000', '01922 66 01 21'),
(171, 30, 516, 'NULL', 0, 9, 5, '2015-02-10 04:45:27', 'House # 68 , Road # 10 / B ,  Sec # 10 .Uttara ', 1, 0, 1, '2015-02-10', '2015-02-10', 30, 0, '23.7363012000', '90.4099827000', '01988 13 70 21'),
(172, 30, 493.2, 'NULL', 0, 9, 1, '2015-02-10 06:39:14', '53/2 West Agargao, Dhaka.', 1, 0, 1, '2015-02-10', '2015-02-10', 30, 0, '23.7363012000', '90.4099827000', '01711 89 88 50'),
(173, 20, 200, 'NULL', 0, 9, 5, '2015-02-11 03:58:43', 'House # 52/9, West Rayarbazar, Dhalibari, Dhaka.', 1, 0, 1, '2015-02-11', '2015-02-11', 20, 0, '23.7363654000', '90.4100149000', '01742 18 28 18'),
(174, 100, 8500, 'NULL', 0, 9, 1, '2015-02-11 05:03:27', 'Professor Garden 70-71, Transmeter Raod, Faydabad, Abdullah pur,Dhaka.', 1, 0, 1, '2015-02-09', '2015-02-11', 100, 0, '23.7363828000', '90.4100195000', '01724 69 34 32'),
(175, 35, 0, 'By Mistaken Huijia 1/2&quot; pipe was posted as sales return, so that, this purchase is done for make the statement in balance.(By Tanvir)', 0, 9, 1, '2015-02-11 05:13:43', 'Professors Garden 70-71, Transmeter Road , Faydabad, Abdullahpur, Dhaka. ', 1, 0, 1, '2015-02-09', '2015-02-09', 35, 7220.849999999999, '23.7363752000', '90.4100200000', ' 01724 69 34 32'),
(176, 30, 2656.203, 'NULL', 0, 9, 1, '2015-02-11 05:22:49', 'Momen&#039;s Jui, Plot # 442, Road # 07, DOHS, Baridhara. Dhaka.', 1, 0, 1, '2015-02-12', '2015-02-11', 30, 2047.5, '23.7363814000', '90.4100154000', '01819-71 05 15'),
(177, 30, 315, 'NULL', 0, 9, 7, '2015-02-11 05:43:11', 'Self Delivery.', 1, 0, 1, '2015-02-11', '2015-02-11', 30, 6934.2, '23.7363866000', '90.4100174000', '01729 86 94 73 '),
(178, 35, 1249.5, 'NULL', 0, 9, 7, '2015-02-11 12:15:36', 'Self Delivery, Allo Bazar, Dhaka.', 1, 0, 1, '2015-02-11', '2015-02-11', 30, 2012.3999999999999, '23.7363791000', '90.4100188000', '01913 05 69 44'),
(179, 30, 95340, 'NULL', 0, 9, 1, '2015-02-12 04:11:04', '88/2 Damal COurt, Dhaka Cantonment, Dhaka.', 1, 0, 1, '2015-02-12', '2015-02-12', 30, 58164.6, '23.7363842000', '90.4100181000', '01938 13 86 84'),
(180, 35, 9342.55, 'NULL', 0, 9, 5, '2015-02-12 05:21:27', 'House # 151/2, West Rampura, Powerhouse Mosque Near.', 1, 0, 1, '2015-02-12', '2015-02-12', 35, 9436.699999999999, 'NULL', 'NULL', '01763 03 36 46'),
(181, 100, 8500, 'NULL', 0, 9, 1, '2015-02-12 06:42:40', '88/2, Damal Court, Dhaka Cantonment, Dhaka.', 1, 0, 1, '2015-02-12', '2015-02-12', 30, 0, '23.7363600000', '90.4100134000', 'Mr. Sumon - 01938 13 86 84 '),
(182, 30, 395.4, 'NULL', 0, 9, 1, '2015-02-12 13:22:49', 'Self Delivery By Ekramul', 1, 0, 1, '2015-02-12', '2015-02-12', 30, 0, '23.7363649000', '90.4100136000', '01710 95 41 59'),
(183, 34, 725.9000000000001, 'NULL', 0, 9, 1, '2015-02-14 04:29:17', 'Art N Nazmohol, Plot # 13, Road # 6, Rupnagar, Mirpur, Dhaka. ', 1, 0, 1, '2015-02-14', '2015-02-14', 28, 0, '23.7363416000', '90.4098467000', ' 0168 67 81 20'),
(184, 30, 60, 'NULL', 0, 9, 7, '2015-02-14 05:58:50', 'Self Delivery', 1, 0, 1, '2015-02-14', '2015-02-14', 30, 409.5, '23.7364318000', '90.4100285000', ' 01729 86 94 73'),
(185, 35, 11532.5, 'NULL', 0, 9, 1, '2015-02-14 10:08:41', 'Balitha Saha Belesswar, SutiPara, Dhamrai, Dhaka.', 1, 0, 1, '2015-02-14', '2015-02-14', 35, 0, '23.7366537000', '90.4095329000', '01711 18 16 73'),
(186, 35, 154, 'NULL', 0, 9, 5, '2015-02-15 04:01:08', 'House # 151/2, West Rampura, Powerhouse mosque Near.', 1, 0, 1, '2015-02-15', '2015-02-15', 35, 0, '23.7363600000', '90.4100134000', '01763 03 36 46'),
(187, 30, 289.5, 'NULL', 0, 9, 5, '2015-02-15 04:12:55', '17 Tobkhana Road, Segun bagicha, Dhaka.', 1, 0, 1, '2015-02-15', '2015-02-15', 0, 0, '23.7366502000', '90.4095346000', '01710 27 73 90'),
(188, 34, 448.8, 'NULL', 0, 9, 6, '2015-02-15 04:21:02', 'Utah Fashions Ltd. Shalna , Gazipur,Dhaka', 1, 0, 1, '2015-02-15', '2015-02-15', 34, 0, '23.7364391000', '90.4100339000', 'Mr. Al alim: 01922 66 01 21 '),
(189, 35, 39278.75, 'NULL', 0, 9, 1, '2015-02-15 04:55:46', '&quot;Trust Asset KUmKum&quot;, Plot # 1215, Ave # 10, Mirpur, DOHS, Dhaka.', 1, 0, 1, '2015-02-17', '2015-02-15', 35, 30198.35, '23.7363591000', '90.4100139000', '01942 22 38 58 '),
(190, 30, 1968, 'NULL', 0, 9, 5, '2015-02-15 05:06:26', 'House # 269, Road # 4/A, Block # F, Bashundhara R/A, Dhaka.', 1, 0, 1, '2015-02-17', '2015-02-15', 30, 0, '23.7363649000', '90.4100136000', '01739 01 00 97'),
(192, 32, 7129.6, 'NULL', 0, 9, 5, '2015-02-15 05:32:40', '5/4/H, Mohonpur, shamoly, Dhaka', 1, 0, 1, '2015-02-16', '2015-02-15', 32, 3931.2000000000003, '23.7363588000', '90.4100138000', ' 01733 21 55 73'),
(193, 32, 1581.44, 'NULL', 0, 9, 5, '2015-02-15 05:44:56', '&quot;Index Josna Dhara&quot;, House # 27, Road # 3/B, Sec # 09, Uttara, Dhaka.', 1, 0, 1, '2015-02-17', '2015-02-15', 32, 1493.44, 'NULL', 'NULL', '01822 82 82 76'),
(194, 30, 1666.5, 'NULL', 0, 9, 5, '2015-02-15 05:53:40', 'House # 269, Road # 4/A, Block # F, Bashundhara R/A, Dhaka', 1, 0, 1, '2015-02-17', '2015-02-15', 30, 0, '23.7364242000', '90.4100212000', '01739 01 00 97'),
(195, 32, 1408, 'NULL', 0, 9, 6, '2015-02-15 06:21:05', 'Assure Berlin Palace, House # 25, Road # 4/A, Monsurabad Housing society, Mohammadpur, Dhaka.', 1, 0, 1, '2015-02-16', '2015-02-15', 32, 0, '23.7363649000', '90.4100136000', '01730 33 34 87'),
(196, 30, 8501.103, 'NULL', 0, 9, 5, '2015-02-15 08:32:20', 'KBG Tower, Near Abul Abul Hotel', 1, 0, 1, '2015-02-15', '2015-02-15', 30, 10760.1, '23.7367139000', '90.4094681000', '01712 46 31 81'),
(197, 35, 10977.4, 'NULL', 0, 9, 1, '2015-02-16 05:12:13', 'House # 58/11, KadamTola, Wasa road, Bashabo, Dhaka. ', 1, 0, 1, '2015-02-16', '2015-02-16', 30, 2047.5, '23.7367395000', '90.4094332000', '01922 14 21 26'),
(198, 35, 24788.399999999998, 'NULL', 0, 9, 1, '2015-02-16 11:55:57', 'Plot # 2/D, Bashtola, Nurerchala, J Block, Baridhara, Dhaka. ', 1, 0, 1, '2015-02-17', '2015-02-17', 35, 29552.249999999996, '23.7363588000', '90.4100138000', '01676 15 33 13'),
(199, 30, 0, 'NULL', 0, 9, 5, '2015-02-17 04:24:04', ' KBG Tower, Near Abul Abul Hotel', 1, 0, 1, '2015-02-15', '2015-02-15', 30, 1185.6, '23.7363812000', '90.4100161000', '01712 46 31 81'),
(200, 35, 1736, 'NULL', 0, 9, 7, '2015-02-17 10:58:36', 'Self Delivery', 1, 0, 1, '2015-02-17', '2015-02-17', 0, 0, '23.7367032000', '90.4094580000', '01684 06 97 70'),
(201, 30, 1101, 'NULL', 0, 9, 5, '2015-02-18 04:21:25', 'K B G Tower , Abul Hotel Malibagh Dhaka.', 1, 0, 1, '2015-02-18', '2015-02-18', 30, 0, '23.7366562000', '90.4095866000', '01922 05 02 18'),
(202, 0, 0, 'NULL', 0, 9, 5, '2015-02-18 04:44:25', '5 / 4 / H , Mohon Pur Shamoly Dhaka.', 1, 0, 1, '2015-02-18', '2015-02-18', 0, 0, '23.7366568000', '90.4095466000', '01733 21 55 73'),
(203, 33, 52349.22, 'NULL', 0, 9, 1, '2015-02-18 12:53:58', '45/1 R. K Mission Road. Dhaka', 1, 0, 1, '2015-02-19', '2015-02-19', 33, 39849.810000000005, '23.7364360000', '90.4100337000', '01847 06 62 95'),
(204, 30, 4206, 'NULL', 0, 9, 1, '2015-02-18 12:57:48', ' 5/3, Mohonpur, Ring Road, Shamoli, Dhaka.', 1, 0, 1, '2015-02-19', '2015-02-19', 30, 7183.8, 'NULL', 'NULL', '01833 31 41 71'),
(205, 30, 6025.2, 'NULL', 0, 9, 1, '2015-02-19 07:32:26', 'Plot # 1325, Road # 26/A, Mirpur, DOHS, Dhaka.', 1, 0, 1, '2015-02-19', '2015-02-19', 30, 5335.2, '23.7366531000', '90.4095520000', '01680 04 20 54'),
(206, 0, 0, 'NULL', 0, 9, 1, '2015-02-19 09:55:24', '45 / 1 , R K Mission  Road , Dhaka .', 1, 0, 1, '2015-02-19', '2015-02-19', 0, 0, '23.7366516000', '90.4095544000', '01847 06 62 95'),
(207, 35, 2825.5499999999997, 'NULL', 0, 9, 7, '2015-02-22 05:51:15', 'House # 58/11, Kadam Tola, Wasa Road, Bashabo, Dhaka.', 1, 0, 1, '2015-02-22', '2015-02-22', 30, 3182.4, '23.7364359000', '90.4100502000', '01922 14 21 26'),
(208, 35, 8919.75, 'NULL', 0, 9, 7, '2015-02-22 06:03:02', 'Alloo Bazar, Dhaka.', 1, 0, 1, '2015-02-22', '2015-02-22', 30, 2691, '23.7364434000', '90.4100402000', '01913 05 69 44'),
(209, 35, 4193, 'NULL', 0, 9, 1, '2015-02-22 10:07:34', 'self delivery', 1, 0, 1, '2015-02-22', '2015-02-22', 35, 0, '23.7364469000', '90.4100497000', '01674 59 23 88'),
(210, 30, 855, 'NULL', 0, 9, 1, '2015-02-23 04:55:29', 'Self Delivery', 1, 0, 1, '2015-02-23', '2015-02-23', 30, 1809.6, '23.7364248000', '90.4100326000', '01760 58 23 39'),
(211, 35, 32549.999999999996, 'NULL', 0, 9, 1, '2015-02-23 06:18:10', 'Plot # 09, 2 No. Khilji Road Shamoly, Dhaka. (A.R Sanitary)', 1, 0, 1, '2015-02-23', '2015-02-23', 35, 39589.549999999996, '23.7364441000', '90.4100435000', '01711 18 16 73'),
(212, 35, 3577, 'NULL', 0, 9, 7, '2015-02-23 07:42:05', 'Alloo Bazar, ', 1, 0, 1, '2015-02-23', '2015-02-23', 30, 0, '23.7364582000', '90.4100683000', '01913 05 69 44'),
(213, 35, 7878.499999999999, 'NULL', 0, 9, 1, '2015-02-24 05:00:47', 'House # 1215, 1231, Ave# 10, DOHS, Mirpur. ', 1, 0, 1, '2015-02-24', '2015-02-24', 35, 0, '23.7363310000', '90.4101495000', '01942 22 38 58'),
(214, 0, 0, 'NULL', 0, 9, 1, '2015-02-24 10:52:23', 'House # 78, Road # 12/A, Block #J, South Bonosree, Dhaka.', 1, 0, 1, '2015-02-25', '2015-02-24', 0, 0, '23.7364363000', '90.4100259000', 'Jewel : 01683 60 85 93, Monir : 01824 83 26 73'),
(215, 30, 225, 'NULL', 0, 9, 1, '2015-02-24 11:41:02', 'Plot # 1325, Road # 26/A, Mirpur, DOHS, Dhaka.', 1, 0, 1, '2015-02-24', '2015-02-24', 30, 0, '23.7366568000', '90.4095466000', '01680 04 20 54'),
(216, 35, 1102.5, 'NULL', 0, 9, 1, '2015-02-24 11:44:06', ' Balitha Saha Belesswar, SutiPara, Dhamrai, Dhaka.', 1, 0, 1, '2015-02-24', '2015-02-24', 35, 0, 'NULL', 'NULL', '01711 18 16 73'),
(217, 32, 1100.8, 'NULL', 0, 9, 5, '2015-02-25 04:08:57', ' 5/4/H, Mohonpur, shamoly, Dhaka', 1, 0, 1, '2015-02-25', '2015-02-25', 32, 0, '23.7366636000', '90.4096042000', '01733 21 55 73'),
(218, 30, 3540, 'NULL', 0, 9, 1, '2015-02-25 08:28:54', 'Plot # 50, Road # 13, Sec # 03, Uttara,Dhaka', 1, 0, 1, '2015-02-26', '2015-02-25', 30, 4914, '23.7364404000', '90.4100563000', '01710 95 41 59'),
(219, 33, 1320, 'NULL', 0, 9, 1, '2015-02-25 08:43:04', 'Ejab Alifa Siddique, 45/1, R.K Mission Road, Dhaka', 1, 0, 1, '2015-02-26', '2015-02-25', 33, 0, 'NULL', 'NULL', '01847 06 62 95'),
(220, 30, 1260, 'NULL', 0, 9, 1, '2015-02-26 03:43:05', '&quot;Kingdom Nirupoma&quot;. 88/2 Damal Court, Dhaka Cantonment, Dhaka. ', 1, 0, 1, '2015-02-26', '2015-02-26', 30, 0, '23.7366516000', '90.4095544000', ' 01938 13 86 84'),
(221, 34, 25061.4, 'NULL', 0, 9, 1, '2015-02-26 04:01:31', 'Art-N-Nazmohol, Plot # 13, Road# 6, Rupnagar Housing, Mirpur, Dhaka.', 1, 0, 1, '2015-02-26', '2015-02-26', 28, 4277, '23.7366546000', '90.4095514000', '01678 67 81 24'),
(222, 30, 63, 'NULL', 0, 9, 5, '2015-02-28 04:11:41', 'KBG Tower, Near Abul Hotel.', 1, 0, 1, '2015-02-28', '2015-02-28', 30, 1567.8, '23.7366529000', '90.4095512000', '01922 05 02 18'),
(223, 32, 150.4, 'NULL', 0, 9, 1, '2015-02-28 04:17:35', 'Box Culvert Road, Purana Paltan, Dhaka.', 1, 0, 1, '2015-02-28', '2015-02-28', 32, 0, '23.7364582000', '90.4100683000', '01952 71 33 50'),
(224, 0, 0, 'NULL', 0, 9, 1, '2015-02-28 08:45:04', 'Protik Ruposhree, Building # B2, C1, C2, &amp; D1, House # 78, Road # 12/4, Block # J, South Bonoshree. Dhaka.', 1, 0, 1, '2015-03-01', '2015-03-01', 0, 0, '23.7366529000', '90.4095512000', '01683 60 85 93 '),
(225, 30, 80.1, 'NULL', 0, 9, 1, '2015-02-28 11:04:27', ' 5/3, Mohonpur, Ring Road, Shamoli, Dhaka.', 1, 0, 1, '2015-03-01', '2015-02-28', 30, 0, '23.7364786000', '90.4097605000', '01833 31 41 71'),
(226, 0, 0, 'NULL', 0, 9, 1, '2015-03-01 04:59:46', ' Protik Ruposhree, Building # B2, C1, C2, &amp; D1, House # 78, Road # 12/4, Block # J, South Bonoshree. Dhaka. ', 1, 0, 1, '2015-03-02', '2015-03-01', 0, 0, '23.7366516000', '90.4095544000', '01683 60 85 93'),
(227, 34, 0, 'NULL', 0, 9, 1, '2015-03-01 05:04:02', 'Art-N-Nazmohol, Plot # 13, Road# 6, Rupnagar Housing, Mirpur, Dhaka.', 1, 0, 1, '2015-03-02', '2015-03-01', 28, 12892.880000000001, '23.7366531000', '90.4095520000', ' 01678 67 81 24'),
(228, 30, 219, 'NULL', 0, 9, 5, '2015-03-02 04:54:18', 'House # 269, Road # 4/A, Block # F, Bashundhara R/A, Dhaka.', 1, 0, 1, '2015-02-17', '2015-02-15', 30, 0, '23.7363268000', '90.4101541000', '01739 01 09 97'),
(229, 35, 1260, 'NULL', 0, 9, 1, '2015-03-02 05:34:13', '2/D, Bashtola, Nurerchala, J Block, Baridhara, Dhaka', 1, 0, 1, '2015-03-02', '2015-03-02', 35, 7302.749999999999, '23.7363935000', '90.4100321000', '01674 59 23 88'),
(230, 0, 0, 'Labor Bill for Loading &amp; Unloading purpose,, Deducted from Purchase Return bill(which is showing as transport bill).', 1, 8, 1, '2015-03-02 08:21:45', 'Navana Engineering, Rupnagar, Gabtoli, Mirpur, Dhaka.', NULL, 500, 1, '2015-02-28', '2015-02-28', 44, 61741.68, '23.7363310000', '90.4101495000', ''),
(231, 25, 337.5, 'NULL', 0, 9, 1, '2015-03-02 12:12:43', 'House # 3/1, Block # D, Lalmatia, Dhanmondi, Dhaka', 1, 0, 1, '2015-03-02', '2015-03-02', 20, 0, '23.7364444000', '90.4100399000', ' 01718-128000 (Engr. Jahangir)'),
(232, 35, 10682.699999999999, 'NULL', 0, 9, 7, '2015-03-03 05:22:18', 'Self Delivery', 1, 0, 1, '2015-03-03', '2015-03-03', 0, 0, '23.8103320000', '90.4125181000', '01964 49 95 13'),
(233, 35, 0, 'NULL', 0, 9, 7, '2015-03-03 06:28:00', 'Sel Delivery, Allo Bazar, Dhaka.', 1, 0, 1, '2015-03-03', '2015-03-03', 30, 1591.2, '23.7364486000', '90.4100470000', '01913 05 69 44'),
(234, 30, 3321.6, 'NULL', 0, 9, 1, '2015-03-03 09:21:02', ' Plot # 50, Road # 13, Sec # 03, Uttara Model Town, Uttara, Dhaka ', 1, 500, 1, '2015-03-04', '2015-03-03', 30, 6996.599999999999, '23.7364271000', '90.4100251000', '01710 95 41 59'),
(235, 35, 114590, 'NULL', 0, 9, 1, '2015-03-03 10:31:38', ' Balitha Saha Belesswar, SutiPara, Dhamrai, Dhaka.', 1, 0, 1, '2015-03-03', '2015-03-03', 35, 156702, '23.7364271000', '90.4100251000', '01711 18 16 73');
INSERT INTO `sales_details` (`idsales`, `sales_discount_f_rate`, `sales_discount_f_ammount`, `sales_comments`, `sales_ispurchase_return`, `iduser`, `idstaff`, `sales_entrytime`, `sales_delivery_address`, `idproduct_catagory`, `sales_transport`, `idpestablishment`, `sales_details_billing_date`, `sales_details_chalan_date`, `sales_discount_p_rate`, `sales_discount_p_ammount`, `sales_gps_a`, `sales_gps_b`, `contact_number`) VALUES
(236, 50, 72875, 'NULL', 0, 9, 1, '2015-03-03 10:34:59', 'Balitha Saha Belesswar, SutiPara, Dhamrai, Dhaka.', 1, 0, 1, '2015-03-03', '2015-03-03', 0, 0, 'NULL', 'NULL', '01711 18 16 73'),
(237, 31, 1044.7, 'NULL', 0, 9, 5, '2015-03-03 14:12:11', 'House # 2, Road 5/A, Sector # 5, Uttara, Dhaka.', 1, 0, 1, '2015-03-04', '2015-03-03', 0, 0, '23.7366532000', '90.4095543000', '01733 77 72 48'),
(238, 35, 0.00035, 'NULL', 0, 9, 1, '2015-03-04 11:05:45', 'Balitha Saha Belesswar, SutiPara, Dhamrai, Dhaka.', 1, 0, 1, '2015-03-07', '2015-03-04', 35, 0, '23.8103320000', '90.4125181000', '01711 18 16 73'),
(239, 32, 8186.56, 'NULL', 0, 9, 6, '2015-03-05 04:49:20', '&quot;Assure Rose D Rowshan&quot;, Plot # 1, Road # 13, Sector # 14, Uttara, Dhaka', 1, 0, 1, NULL, '2015-03-05', 32, 5299.84, '23.7366778000', '90.4095038000', '01730 33 34 89'),
(240, 32, 14567.36032, 'NULL', 0, 9, 6, '2015-03-05 05:01:36', '&quot;Assure Rose D Rowshan&quot;, Plot # 1, Road # 13, Sector # 14, Uttara, Dhaka', 1, 0, 1, NULL, '2015-03-05', 32, 14223.04, 'NULL', 'NULL', '01730 33 34 89'),
(241, 30, 10035.000299999998, 'NULL', 0, 9, 1, '2015-03-05 05:12:29', 'Plot # 1203, Road # 47/A, DOHS, Mirpur, Dhaka.', 1, 0, 1, '2015-03-07', '2015-03-05', 20, 0, '23.7366717000', '90.4095020000', '01912 62 46 23'),
(242, 0, 0, 'NULL', 0, 9, 1, '2015-03-05 06:26:50', 'Self Delivery', 1, 0, 1, '2015-03-05', '2015-03-05', 25, 227.5, '23.7366529000', '90.4095512000', 'Mr. Monir : 01742 00 92 00'),
(243, 30, 0, 'NULL', 0, 9, 1, '2015-03-05 06:36:55', 'House # 1325, Road # 26/A, Mirpur, DOHS, Dhaka.', 1, 0, 1, '2015-03-07', '2015-03-05', 30, 3439.7999999999997, '23.7366529000', '90.4095512000', ' 01680 04 20 54'),
(244, 35, 2113.2999999999997, 'NULL', 0, 9, 7, '2015-03-07 07:35:51', '119 S K Das Road, Gandaria Dhaka 1204 ', 1, 0, 1, '2015-03-07', '2015-03-07', 35, 2925.6499999999996, '23.7363658000', '90.4100203000', '01913 48 03 40 , 017777 86 718 ');

-- --------------------------------------------------------

--
-- Table structure for table `sales_stock_product_output`
--

DROP TABLE IF EXISTS `sales_stock_product_output`;
CREATE TABLE IF NOT EXISTS `sales_stock_product_output` (
  `idsales` int(10) unsigned NOT NULL,
  `idstock_product_output` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales_stock_product_output`
--

INSERT INTO `sales_stock_product_output` (`idsales`, `idstock_product_output`) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(3, 5),
(4, 6),
(5, 7),
(6, 8),
(6, 9),
(6, 10),
(6, 11),
(6, 12),
(6, 13),
(6, 14),
(6, 15),
(6, 16),
(6, 17),
(6, 18),
(7, 19),
(7, 20),
(7, 21),
(7, 22),
(7, 23),
(7, 24),
(7, 25),
(7, 26),
(7, 27),
(7, 28),
(7, 29),
(7, 30),
(7, 31),
(8, 32),
(8, 33),
(8, 34),
(8, 35),
(8, 36),
(8, 37),
(8, 38),
(8, 39),
(8, 40),
(8, 41),
(8, 42),
(8, 43),
(8, 44),
(8, 45),
(8, 46),
(8, 47),
(8, 48),
(8, 49),
(8, 50),
(8, 51),
(8, 52),
(8, 53),
(8, 54),
(8, 55),
(8, 56),
(9, 57),
(10, 58),
(10, 59),
(11, 60),
(11, 61),
(11, 62),
(11, 63),
(11, 64),
(11, 65),
(12, 66),
(12, 67),
(12, 68),
(12, 69),
(12, 70),
(12, 71),
(13, 72),
(13, 73),
(13, 74),
(13, 75),
(13, 76),
(13, 77),
(13, 78),
(14, 79),
(14, 80),
(14, 81),
(14, 82),
(14, 83),
(15, 84),
(15, 85),
(15, 86),
(15, 87),
(15, 88),
(15, 89),
(15, 90),
(16, 91),
(16, 92),
(16, 93),
(16, 94),
(16, 95),
(16, 96),
(16, 97),
(16, 98),
(16, 99),
(16, 100),
(16, 101),
(16, 102),
(16, 103),
(16, 104),
(16, 105),
(16, 106),
(16, 107),
(16, 108),
(16, 109),
(16, 110),
(16, 111),
(16, 112),
(16, 113),
(16, 114),
(16, 115),
(16, 116),
(16, 117),
(16, 118),
(16, 119),
(17, 120),
(17, 121),
(18, 122),
(18, 123),
(18, 124),
(18, 125),
(19, 126),
(19, 127),
(19, 128),
(19, 129),
(19, 130),
(19, 131),
(19, 132),
(19, 133),
(19, 134),
(19, 135),
(19, 136),
(19, 137),
(19, 138),
(20, 139),
(20, 140),
(20, 141),
(20, 142),
(20, 143),
(20, 144),
(21, 145),
(21, 146),
(21, 147),
(21, 148),
(21, 149),
(22, 150),
(23, 151),
(23, 152),
(23, 153),
(23, 154),
(24, 155),
(24, 156),
(24, 157),
(24, 158),
(24, 159),
(24, 160),
(25, 161),
(25, 162),
(25, 163),
(25, 164),
(25, 165),
(25, 166),
(25, 167),
(25, 168),
(26, 169),
(26, 170),
(27, 171),
(27, 172),
(27, 173),
(27, 174),
(27, 175),
(27, 176),
(27, 177),
(27, 178),
(27, 179),
(27, 180),
(27, 181),
(27, 182),
(27, 183),
(27, 184),
(27, 185),
(27, 186),
(27, 187),
(27, 188),
(27, 189),
(27, 190),
(27, 191),
(27, 192),
(27, 193),
(27, 194),
(27, 195),
(27, 196),
(27, 197),
(27, 198),
(27, 199),
(27, 200),
(27, 201),
(27, 202),
(27, 203),
(27, 204),
(27, 205),
(27, 206),
(27, 207),
(28, 208),
(29, 209),
(30, 210),
(30, 211),
(30, 212),
(30, 213),
(31, 214),
(31, 215),
(31, 216),
(31, 217),
(32, 218),
(32, 219),
(32, 220),
(32, 221),
(33, 222),
(34, 223),
(35, 224),
(35, 225),
(36, 226),
(36, 227),
(36, 228),
(36, 229),
(36, 230),
(36, 231),
(36, 232),
(36, 233),
(36, 234),
(36, 235),
(36, 236),
(37, 237),
(37, 238),
(37, 239),
(37, 240),
(37, 241),
(37, 242),
(37, 243),
(37, 244),
(37, 245),
(37, 246),
(37, 247),
(37, 248),
(37, 249),
(37, 250),
(37, 251),
(37, 252),
(37, 253),
(37, 254),
(37, 255),
(37, 256),
(38, 257),
(38, 258),
(38, 259),
(38, 260),
(38, 261),
(38, 262),
(38, 263),
(39, 264),
(40, 265),
(40, 266),
(40, 267),
(40, 268),
(40, 269),
(40, 270),
(40, 271),
(41, 272),
(41, 273),
(41, 274),
(41, 275),
(41, 276),
(41, 277),
(41, 278),
(41, 279),
(41, 280),
(41, 281),
(41, 282),
(41, 283),
(41, 284),
(41, 285),
(41, 286),
(41, 287),
(41, 288),
(41, 289),
(41, 290),
(42, 291),
(42, 292),
(42, 293),
(43, 294),
(43, 295),
(43, 296),
(43, 297),
(43, 298),
(44, 299),
(45, 300),
(45, 301),
(45, 302),
(45, 303),
(46, 304),
(46, 305),
(46, 306),
(46, 307),
(46, 308),
(46, 309),
(46, 310),
(46, 311),
(46, 312),
(46, 313),
(46, 314),
(46, 315),
(46, 316),
(46, 317),
(46, 318),
(46, 319),
(46, 320),
(46, 321),
(47, 322),
(47, 323),
(47, 324),
(47, 325),
(47, 326),
(47, 327),
(47, 328),
(47, 329),
(47, 330),
(47, 331),
(47, 332),
(47, 333),
(47, 334),
(47, 335),
(47, 336),
(47, 337),
(47, 338),
(47, 339),
(47, 340),
(47, 341),
(47, 342),
(47, 343),
(47, 344),
(47, 345),
(47, 346),
(47, 347),
(47, 348),
(47, 349),
(47, 350),
(48, 351),
(49, 352),
(49, 353),
(49, 354),
(49, 355),
(49, 356),
(49, 357),
(49, 358),
(49, 359),
(50, 360),
(50, 361),
(50, 362),
(50, 363),
(50, 364),
(50, 365),
(50, 366),
(50, 367),
(51, 368),
(51, 369),
(51, 370),
(52, 371),
(52, 372),
(52, 373),
(52, 374),
(53, 375),
(53, 376),
(53, 377),
(53, 378),
(53, 379),
(53, 380),
(54, 381),
(54, 382),
(55, 383),
(55, 384),
(55, 385),
(55, 386),
(55, 387),
(55, 388),
(55, 389),
(55, 390),
(55, 391),
(56, 392),
(57, 393),
(57, 394),
(58, 395),
(59, 396),
(60, 397),
(60, 398),
(60, 399),
(60, 400),
(60, 401),
(60, 402),
(60, 403),
(60, 404),
(60, 405),
(60, 406),
(60, 407),
(60, 408),
(60, 409),
(60, 410),
(60, 411),
(60, 412),
(60, 413),
(61, 414),
(61, 415),
(61, 416),
(62, 417),
(62, 418),
(62, 419),
(62, 420),
(62, 421),
(63, 422),
(63, 423),
(63, 424),
(63, 425),
(63, 426),
(63, 427),
(63, 428),
(64, 429),
(64, 430),
(64, 431),
(64, 432),
(64, 433),
(64, 434),
(64, 435),
(64, 436),
(64, 437),
(64, 438),
(64, 439),
(64, 440),
(65, 441),
(65, 442),
(65, 443),
(65, 444),
(65, 445),
(65, 446),
(65, 447),
(65, 448),
(65, 449),
(65, 450),
(65, 451),
(66, 452),
(67, 453),
(67, 454),
(68, 455),
(68, 456),
(68, 457),
(68, 458),
(69, 459),
(69, 460),
(70, 461),
(70, 462),
(70, 463),
(70, 464),
(70, 465),
(70, 466),
(70, 467),
(70, 468),
(70, 469),
(70, 470),
(70, 471),
(70, 472),
(70, 473),
(70, 474),
(70, 475),
(70, 476),
(70, 477),
(70, 478),
(70, 479),
(70, 480),
(70, 481),
(71, 482),
(71, 483),
(71, 484),
(71, 485),
(71, 486),
(71, 487),
(71, 488),
(71, 489),
(71, 490),
(71, 491),
(71, 492),
(71, 493),
(71, 494),
(71, 495),
(71, 496),
(71, 497),
(71, 498),
(72, 499),
(72, 500),
(72, 501),
(72, 502),
(72, 503),
(72, 504),
(72, 505),
(72, 506),
(73, 507),
(73, 508),
(73, 509),
(73, 510),
(73, 511),
(73, 512),
(73, 513),
(73, 514),
(73, 515),
(73, 516),
(73, 517),
(74, 518),
(76, 539),
(76, 540),
(76, 541),
(76, 542),
(76, 543),
(76, 544),
(76, 545),
(76, 546),
(76, 547),
(76, 548),
(76, 549),
(76, 550),
(76, 551),
(76, 552),
(76, 553),
(76, 554),
(76, 555),
(76, 556),
(76, 557),
(76, 558),
(77, 559),
(77, 560),
(77, 561),
(77, 562),
(77, 563),
(77, 564),
(77, 565),
(77, 566),
(77, 567),
(77, 568),
(77, 569),
(77, 570),
(77, 571),
(77, 572),
(77, 573),
(77, 574),
(78, 575),
(78, 576),
(78, 577),
(78, 578),
(78, 579),
(78, 580),
(78, 581),
(78, 582),
(78, 583),
(78, 584),
(78, 585),
(78, 586),
(79, 587),
(79, 588),
(80, 589),
(80, 590),
(80, 591),
(80, 592),
(80, 593),
(80, 594),
(80, 595),
(80, 596),
(80, 597),
(80, 598),
(80, 599),
(80, 600),
(80, 601),
(80, 602),
(80, 603),
(80, 604),
(80, 605),
(81, 606),
(81, 607),
(81, 608),
(82, 609),
(82, 610),
(84, 619),
(84, 620),
(84, 621),
(84, 622),
(84, 623),
(84, 624),
(84, 625),
(84, 626),
(84, 627),
(84, 628),
(84, 629),
(84, 630),
(84, 631),
(84, 632),
(84, 633),
(83, 634),
(83, 635),
(83, 636),
(83, 637),
(83, 638),
(83, 639),
(83, 640),
(83, 641),
(85, 642),
(85, 643),
(85, 644),
(85, 645),
(85, 646),
(85, 647),
(85, 648),
(85, 649),
(86, 650),
(86, 651),
(86, 652),
(86, 653),
(86, 654),
(86, 655),
(86, 656),
(86, 657),
(86, 658),
(86, 659),
(86, 660),
(86, 661),
(86, 662),
(86, 663),
(86, 664),
(86, 665),
(86, 666),
(86, 667),
(87, 668),
(87, 669),
(87, 670),
(87, 671),
(87, 672),
(87, 673),
(87, 674),
(87, 675),
(88, 676),
(88, 677),
(88, 678),
(88, 679),
(89, 680),
(89, 681),
(89, 682),
(89, 683),
(89, 684),
(89, 685),
(89, 686),
(89, 687),
(89, 688),
(89, 689),
(89, 690),
(89, 691),
(89, 692),
(89, 693),
(89, 694),
(90, 695),
(91, 696),
(91, 697),
(91, 698),
(92, 699),
(93, 700),
(94, 701),
(95, 702),
(95, 703),
(95, 704),
(95, 705),
(95, 706),
(96, 707),
(96, 708),
(96, 709),
(96, 710),
(96, 711),
(96, 712),
(96, 713),
(96, 714),
(96, 715),
(96, 716),
(96, 717),
(96, 718),
(96, 719),
(96, 720),
(96, 721),
(96, 722),
(96, 723),
(96, 724),
(97, 725),
(97, 726),
(97, 727),
(97, 728),
(97, 729),
(98, 730),
(98, 731),
(98, 732),
(98, 733),
(98, 734),
(98, 735),
(98, 736),
(99, 737),
(99, 738),
(99, 739),
(99, 740),
(99, 741),
(99, 742),
(99, 743),
(99, 744),
(99, 745),
(99, 746),
(99, 747),
(99, 748),
(99, 749),
(99, 750),
(99, 751),
(99, 752),
(99, 753),
(99, 754),
(99, 755),
(99, 756),
(99, 757),
(99, 758),
(99, 759),
(99, 760),
(99, 761),
(99, 762),
(99, 763),
(100, 764),
(100, 765),
(100, 766),
(100, 767),
(101, 768),
(101, 769),
(101, 770),
(101, 771),
(101, 772),
(102, 773),
(102, 774),
(102, 775),
(102, 776),
(103, 777),
(103, 778),
(103, 779),
(103, 780),
(103, 781),
(103, 782),
(103, 783),
(103, 784),
(103, 785),
(103, 786),
(103, 787),
(104, 788),
(104, 789),
(104, 790),
(104, 791),
(104, 792),
(105, 793),
(105, 794),
(105, 795),
(105, 796),
(105, 797),
(105, 798),
(105, 799),
(105, 800),
(105, 801),
(105, 802),
(105, 803),
(105, 804),
(105, 805),
(105, 806),
(105, 807),
(105, 808),
(106, 809),
(106, 810),
(106, 811),
(106, 812),
(106, 813),
(106, 814),
(106, 815),
(106, 816),
(106, 817),
(107, 818),
(107, 819),
(107, 820),
(107, 821),
(108, 822),
(108, 823),
(109, 824),
(110, 825),
(110, 826),
(110, 827),
(110, 828),
(110, 829),
(110, 830),
(110, 831),
(110, 832),
(110, 833),
(110, 834),
(110, 835),
(110, 836),
(110, 837),
(110, 838),
(110, 839),
(110, 840),
(110, 841),
(110, 842),
(110, 843),
(110, 844),
(110, 845),
(110, 846),
(110, 847),
(110, 848),
(110, 849),
(110, 850),
(110, 851),
(110, 852),
(110, 853),
(110, 854),
(110, 855),
(110, 856),
(110, 857),
(110, 858),
(110, 859),
(110, 860),
(110, 861),
(110, 862),
(111, 863),
(111, 864),
(111, 865),
(111, 866),
(112, 867),
(112, 868),
(112, 869),
(113, 870),
(113, 871),
(113, 872),
(113, 873),
(113, 874),
(113, 875),
(113, 876),
(113, 877),
(113, 878),
(113, 879),
(113, 880),
(113, 881),
(113, 882),
(113, 883),
(113, 884),
(113, 885),
(113, 886),
(113, 887),
(113, 888),
(113, 889),
(113, 890),
(114, 891),
(115, 892),
(115, 893),
(115, 894),
(115, 895),
(115, 896),
(115, 897),
(116, 898),
(116, 899),
(116, 900),
(116, 901),
(117, 902),
(118, 903),
(119, 904),
(119, 905),
(119, 906),
(119, 907),
(119, 908),
(119, 909),
(119, 910),
(119, 911),
(119, 912),
(119, 913),
(119, 914),
(119, 915),
(119, 916),
(119, 917),
(119, 918),
(119, 919),
(119, 920),
(119, 921),
(119, 922),
(119, 923),
(119, 924),
(119, 925),
(119, 926),
(120, 927),
(120, 928),
(120, 929),
(120, 930),
(120, 931),
(120, 932),
(120, 933),
(120, 934),
(120, 935),
(120, 936),
(121, 937),
(121, 938),
(121, 939),
(121, 940),
(121, 941),
(122, 942),
(122, 943),
(122, 944),
(122, 945),
(122, 946),
(122, 947),
(123, 948),
(123, 949),
(123, 950),
(123, 951),
(123, 952),
(124, 953),
(124, 954),
(124, 955),
(124, 956),
(124, 957),
(124, 958),
(124, 959),
(124, 960),
(124, 961),
(124, 962),
(125, 963),
(125, 964),
(125, 965),
(125, 966),
(125, 967),
(126, 968),
(126, 969),
(127, 970),
(127, 971),
(127, 972),
(127, 973),
(127, 974),
(127, 975),
(127, 976),
(127, 977),
(127, 978),
(127, 979),
(127, 980),
(128, 981),
(128, 982),
(128, 983),
(128, 984),
(128, 985),
(128, 986),
(128, 987),
(128, 988),
(128, 989),
(128, 990),
(128, 991),
(129, 992),
(129, 993),
(129, 994),
(129, 995),
(129, 996),
(129, 997),
(129, 998),
(129, 999),
(129, 1000),
(129, 1001),
(129, 1002),
(129, 1003),
(129, 1004),
(129, 1005),
(129, 1006),
(130, 1007),
(130, 1008),
(130, 1009),
(130, 1010),
(130, 1011),
(130, 1012),
(130, 1013),
(130, 1014),
(130, 1015),
(130, 1016),
(130, 1017),
(130, 1018),
(130, 1019),
(130, 1020),
(130, 1021),
(130, 1022),
(131, 1023),
(131, 1024),
(132, 1025),
(132, 1026),
(132, 1027),
(132, 1028),
(132, 1029),
(132, 1030),
(132, 1031),
(132, 1032),
(132, 1033),
(132, 1034),
(132, 1035),
(132, 1036),
(132, 1037),
(132, 1038),
(132, 1039),
(132, 1040),
(132, 1041),
(133, 1042),
(133, 1043),
(133, 1044),
(133, 1045),
(133, 1046),
(133, 1047),
(133, 1048),
(133, 1049),
(133, 1050),
(133, 1051),
(133, 1052),
(133, 1053),
(133, 1054),
(133, 1055),
(133, 1056),
(133, 1057),
(133, 1058),
(133, 1059),
(133, 1060),
(133, 1061),
(133, 1062),
(133, 1063),
(133, 1064),
(134, 1065),
(135, 1066),
(136, 1067),
(136, 1068),
(136, 1069),
(137, 1070),
(138, 1071),
(139, 1072),
(139, 1073),
(140, 1074),
(140, 1075),
(140, 1076),
(140, 1077),
(140, 1078),
(141, 1079),
(141, 1080),
(141, 1081),
(141, 1082),
(141, 1083),
(141, 1084),
(141, 1085),
(141, 1086),
(143, 1101),
(143, 1102),
(144, 1103),
(144, 1104),
(144, 1105),
(144, 1106),
(144, 1107),
(144, 1108),
(144, 1109),
(144, 1110),
(144, 1111),
(144, 1112),
(144, 1113),
(144, 1114),
(144, 1115),
(145, 1116),
(146, 1117),
(147, 1118),
(148, 1119),
(148, 1120),
(148, 1121),
(148, 1122),
(148, 1123),
(148, 1124),
(148, 1125),
(148, 1126),
(149, 1127),
(149, 1128),
(149, 1129),
(149, 1130),
(149, 1131),
(149, 1132),
(149, 1133),
(149, 1134),
(149, 1135),
(149, 1136),
(149, 1137),
(149, 1138),
(149, 1139),
(149, 1140),
(149, 1141),
(149, 1142),
(149, 1143),
(149, 1144),
(149, 1145),
(149, 1146),
(149, 1147),
(149, 1148),
(149, 1149),
(149, 1150),
(149, 1151),
(149, 1152),
(149, 1153),
(149, 1154),
(149, 1155),
(149, 1156),
(149, 1157),
(149, 1158),
(149, 1159),
(149, 1160),
(149, 1161),
(149, 1162),
(149, 1163),
(149, 1164),
(149, 1165),
(149, 1166),
(149, 1167),
(149, 1168),
(149, 1169),
(149, 1170),
(149, 1171),
(149, 1172),
(149, 1173),
(149, 1174),
(150, 1175),
(150, 1176),
(150, 1177),
(150, 1178),
(150, 1179),
(151, 1180),
(152, 1181),
(152, 1182),
(152, 1183),
(152, 1184),
(152, 1185),
(152, 1186),
(152, 1187),
(152, 1188),
(152, 1189),
(152, 1190),
(152, 1191),
(152, 1192),
(152, 1193),
(152, 1194),
(152, 1195),
(152, 1196),
(152, 1197),
(152, 1198),
(152, 1199),
(152, 1200),
(152, 1201),
(152, 1202),
(152, 1203),
(152, 1204),
(152, 1205),
(152, 1206),
(152, 1207),
(152, 1208),
(152, 1209),
(153, 1210),
(153, 1211),
(153, 1212),
(153, 1213),
(154, 1214),
(154, 1215),
(154, 1216),
(154, 1217),
(154, 1218),
(154, 1219),
(154, 1220),
(154, 1221),
(154, 1222),
(154, 1223),
(154, 1224),
(154, 1225),
(154, 1226),
(154, 1227),
(154, 1228),
(154, 1229),
(155, 1230),
(155, 1231),
(155, 1232),
(155, 1233),
(155, 1234),
(155, 1235),
(155, 1236),
(155, 1237),
(155, 1238),
(155, 1239),
(155, 1240),
(155, 1241),
(155, 1242),
(156, 1243),
(156, 1244),
(156, 1245),
(156, 1246),
(156, 1247),
(156, 1248),
(156, 1249),
(156, 1250),
(156, 1251),
(156, 1252),
(156, 1253),
(157, 1254),
(157, 1255),
(158, 1256),
(158, 1257),
(158, 1258),
(158, 1259),
(158, 1260),
(158, 1261),
(158, 1262),
(158, 1263),
(158, 1264),
(158, 1265),
(158, 1266),
(158, 1267),
(158, 1268),
(158, 1269),
(158, 1270),
(158, 1271),
(158, 1272),
(159, 1273),
(159, 1274),
(159, 1275),
(160, 1276),
(160, 1277),
(160, 1278),
(160, 1279),
(160, 1280),
(160, 1281),
(160, 1282),
(160, 1283),
(160, 1284),
(160, 1285),
(160, 1286),
(160, 1287),
(160, 1288),
(160, 1289),
(160, 1290),
(160, 1291),
(160, 1292),
(160, 1293),
(160, 1294),
(160, 1295),
(160, 1296),
(160, 1297),
(160, 1298),
(160, 1299),
(160, 1300),
(160, 1301),
(160, 1302),
(160, 1303),
(160, 1304),
(160, 1305),
(160, 1306),
(160, 1307),
(160, 1308),
(160, 1309),
(160, 1310),
(160, 1311),
(160, 1312),
(161, 1313),
(161, 1314),
(162, 1315),
(163, 1316),
(164, 1317),
(164, 1318),
(164, 1319),
(164, 1320),
(164, 1321),
(164, 1322),
(164, 1323),
(164, 1324),
(164, 1325),
(164, 1326),
(164, 1327),
(164, 1328),
(164, 1329),
(164, 1330),
(164, 1331),
(164, 1332),
(164, 1333),
(164, 1334),
(164, 1335),
(164, 1336),
(164, 1337),
(164, 1338),
(165, 1339),
(166, 1340),
(166, 1341),
(166, 1342),
(166, 1343),
(166, 1344),
(166, 1345),
(166, 1346),
(166, 1347),
(166, 1348),
(166, 1349),
(166, 1350),
(166, 1351),
(166, 1352),
(166, 1353),
(166, 1354),
(167, 1355),
(167, 1356),
(168, 1357),
(168, 1358),
(168, 1359),
(168, 1360),
(168, 1361),
(168, 1362),
(168, 1363),
(168, 1364),
(168, 1365),
(168, 1366),
(168, 1367),
(168, 1368),
(168, 1369),
(168, 1370),
(168, 1371),
(168, 1372),
(168, 1373),
(168, 1374),
(168, 1375),
(168, 1376),
(168, 1377),
(168, 1378),
(168, 1379),
(169, 1380),
(170, 1381),
(170, 1382),
(170, 1383),
(170, 1384),
(170, 1385),
(170, 1386),
(170, 1387),
(170, 1388),
(170, 1389),
(170, 1390),
(170, 1391),
(170, 1392),
(170, 1393),
(170, 1394),
(170, 1395),
(170, 1396),
(170, 1397),
(170, 1398),
(170, 1399),
(170, 1400),
(170, 1401),
(170, 1402),
(170, 1403),
(170, 1404),
(170, 1405),
(170, 1406),
(170, 1407),
(170, 1408),
(170, 1409),
(170, 1410),
(171, 1411),
(171, 1412),
(172, 1413),
(172, 1414),
(173, 1415),
(174, 1416),
(175, 1417),
(176, 1418),
(176, 1419),
(176, 1420),
(176, 1421),
(176, 1422),
(176, 1423),
(176, 1424),
(176, 1425),
(177, 1426),
(177, 1427),
(177, 1428),
(178, 1429),
(178, 1430),
(178, 1431),
(179, 1432),
(179, 1433),
(179, 1434),
(179, 1435),
(179, 1436),
(179, 1437),
(179, 1438),
(179, 1439),
(179, 1440),
(179, 1441),
(179, 1442),
(179, 1443),
(179, 1444),
(179, 1445),
(179, 1446),
(179, 1447),
(179, 1448),
(179, 1449),
(179, 1450),
(179, 1451),
(179, 1452),
(179, 1453),
(179, 1454),
(179, 1455),
(179, 1456),
(180, 1457),
(180, 1458),
(180, 1459),
(180, 1460),
(180, 1461),
(180, 1462),
(180, 1463),
(180, 1464),
(180, 1465),
(180, 1466),
(180, 1467),
(180, 1468),
(180, 1469),
(180, 1470),
(180, 1471),
(180, 1472),
(180, 1473),
(180, 1474),
(180, 1475),
(181, 1476),
(182, 1477),
(183, 1478),
(183, 1479),
(183, 1480),
(183, 1481),
(184, 1482),
(184, 1483),
(185, 1484),
(185, 1485),
(186, 1486),
(187, 1487),
(187, 1488),
(188, 1489),
(189, 1490),
(189, 1491),
(189, 1492),
(189, 1493),
(189, 1494),
(189, 1495),
(189, 1496),
(189, 1497),
(189, 1498),
(189, 1499),
(189, 1500),
(189, 1501),
(189, 1502),
(189, 1503),
(189, 1504),
(189, 1505),
(189, 1506),
(189, 1507),
(189, 1508),
(189, 1509),
(189, 1510),
(189, 1511),
(189, 1512),
(189, 1513),
(190, 1514),
(190, 1515),
(190, 1516),
(190, 1517),
(190, 1518),
(190, 1519),
(190, 1520),
(190, 1521),
(190, 1522),
(190, 1523),
(192, 1534),
(192, 1535),
(192, 1536),
(193, 1537),
(193, 1538),
(193, 1539),
(193, 1540),
(193, 1541),
(193, 1542),
(193, 1543),
(193, 1544),
(193, 1545),
(193, 1546),
(194, 1557),
(194, 1558),
(194, 1559),
(194, 1560),
(194, 1561),
(194, 1562),
(194, 1563),
(194, 1564),
(194, 1565),
(195, 1566),
(196, 1577),
(196, 1578),
(196, 1579),
(196, 1580),
(196, 1581),
(196, 1582),
(196, 1583),
(196, 1584),
(196, 1585),
(196, 1586),
(196, 1587),
(196, 1588),
(196, 1589),
(196, 1590),
(196, 1591),
(196, 1592),
(196, 1593),
(196, 1594),
(196, 1595),
(196, 1596),
(196, 1597),
(196, 1598),
(197, 1599),
(197, 1600),
(197, 1601),
(197, 1602),
(197, 1603),
(197, 1604),
(197, 1605),
(197, 1606),
(197, 1607),
(197, 1608),
(198, 1609),
(198, 1610),
(198, 1611),
(198, 1612),
(198, 1613),
(198, 1614),
(198, 1615),
(198, 1616),
(198, 1617),
(198, 1618),
(198, 1619),
(198, 1620),
(198, 1621),
(198, 1622),
(198, 1623),
(198, 1624),
(198, 1625),
(198, 1626),
(198, 1627),
(198, 1628),
(198, 1629),
(198, 1630),
(198, 1631),
(198, 1632),
(198, 1633),
(198, 1634),
(198, 1635),
(198, 1636),
(198, 1637),
(198, 1638),
(199, 1639),
(200, 1640),
(200, 1641),
(200, 1642),
(200, 1643),
(200, 1644),
(201, 1645),
(201, 1646),
(201, 1647),
(202, 1648),
(202, 1649),
(203, 1650),
(203, 1651),
(203, 1652),
(203, 1653),
(203, 1654),
(203, 1655),
(203, 1656),
(203, 1657),
(203, 1658),
(203, 1659),
(203, 1660),
(203, 1661),
(203, 1662),
(203, 1663),
(203, 1664),
(203, 1665),
(203, 1666),
(203, 1667),
(203, 1668),
(203, 1669),
(203, 1670),
(203, 1671),
(203, 1672),
(203, 1673),
(203, 1674),
(203, 1675),
(203, 1676),
(203, 1677),
(203, 1678),
(203, 1679),
(203, 1680),
(203, 1681),
(203, 1682),
(203, 1683),
(203, 1684),
(203, 1685),
(203, 1686),
(203, 1687),
(203, 1688),
(203, 1689),
(203, 1690),
(204, 1691),
(204, 1692),
(204, 1693),
(204, 1694),
(204, 1695),
(204, 1696),
(204, 1697),
(204, 1698),
(205, 1699),
(205, 1700),
(205, 1701),
(205, 1702),
(205, 1703),
(205, 1704),
(205, 1705),
(205, 1706),
(205, 1707),
(205, 1708),
(205, 1709),
(205, 1710),
(205, 1711),
(205, 1712),
(205, 1713),
(205, 1714),
(205, 1715),
(206, 1716),
(206, 1717),
(207, 1718),
(207, 1719),
(207, 1720),
(207, 1721),
(207, 1722),
(207, 1723),
(207, 1724),
(207, 1725),
(207, 1726),
(207, 1727),
(207, 1728),
(207, 1729),
(208, 1730),
(208, 1731),
(208, 1732),
(208, 1733),
(208, 1734),
(208, 1735),
(208, 1736),
(208, 1737),
(208, 1738),
(208, 1739),
(208, 1740),
(209, 1741),
(209, 1742),
(209, 1743),
(210, 1744),
(210, 1745),
(210, 1746),
(211, 1747),
(211, 1748),
(211, 1749),
(211, 1750),
(211, 1751),
(211, 1752),
(211, 1753),
(211, 1754),
(211, 1755),
(211, 1756),
(211, 1757),
(211, 1758),
(211, 1759),
(211, 1760),
(211, 1761),
(212, 1762),
(212, 1763),
(212, 1764),
(212, 1765),
(212, 1766),
(212, 1767),
(213, 1768),
(213, 1769),
(213, 1770),
(213, 1771),
(213, 1772),
(213, 1773),
(213, 1774),
(213, 1775),
(214, 1776),
(214, 1777),
(215, 1778),
(216, 1779),
(217, 1780),
(217, 1781),
(218, 1782),
(218, 1783),
(218, 1784),
(218, 1785),
(219, 1786),
(220, 1787),
(221, 1788),
(221, 1789),
(221, 1790),
(221, 1791),
(221, 1792),
(221, 1793),
(221, 1794),
(221, 1795),
(221, 1796),
(221, 1797),
(221, 1798),
(221, 1799),
(221, 1800),
(221, 1801),
(221, 1802),
(221, 1803),
(221, 1804),
(221, 1805),
(222, 1806),
(222, 1807),
(222, 1808),
(223, 1809),
(223, 1810),
(224, 1811),
(224, 1812),
(224, 1813),
(224, 1814),
(224, 1815),
(224, 1816),
(224, 1817),
(224, 1818),
(224, 1819),
(224, 1820),
(224, 1821),
(224, 1822),
(224, 1823),
(224, 1824),
(225, 1825),
(226, 1826),
(226, 1827),
(227, 1828),
(228, 1829),
(229, 1830),
(229, 1831),
(229, 1832),
(229, 1833),
(229, 1834),
(229, 1835),
(230, 1836),
(230, 1837),
(230, 1838),
(230, 1839),
(231, 1840),
(232, 1841),
(232, 1842),
(232, 1843),
(232, 1844),
(232, 1845),
(233, 1846),
(234, 1847),
(234, 1848),
(234, 1849),
(234, 1850),
(234, 1851),
(234, 1852),
(234, 1853),
(235, 1854),
(235, 1855),
(235, 1856),
(235, 1857),
(235, 1858),
(235, 1859),
(235, 1860),
(235, 1861),
(235, 1862),
(235, 1863),
(235, 1864),
(235, 1865),
(235, 1866),
(235, 1867),
(235, 1868),
(235, 1869),
(235, 1870),
(235, 1871),
(235, 1872),
(235, 1873),
(235, 1874),
(235, 1875),
(235, 1876),
(235, 1877),
(235, 1878),
(235, 1879),
(235, 1880),
(235, 1881),
(236, 1882),
(236, 1883),
(237, 1884),
(237, 1885),
(237, 1886),
(238, 1887),
(239, 1888),
(239, 1889),
(239, 1890),
(239, 1891),
(239, 1892),
(239, 1893),
(239, 1894),
(239, 1895),
(239, 1896),
(239, 1897),
(239, 1898),
(239, 1899),
(239, 1900),
(239, 1901),
(239, 1902),
(239, 1903),
(239, 1904),
(240, 1905),
(240, 1906),
(240, 1907),
(240, 1908),
(240, 1909),
(240, 1910),
(240, 1911),
(240, 1912),
(240, 1913),
(240, 1914),
(240, 1915),
(240, 1916),
(240, 1917),
(240, 1918),
(240, 1919),
(240, 1920),
(241, 1921),
(241, 1922),
(241, 1923),
(241, 1924),
(241, 1925),
(241, 1926),
(241, 1927),
(242, 1928),
(243, 1929),
(244, 1930),
(244, 1931),
(244, 1932),
(244, 1933),
(244, 1934),
(244, 1935),
(244, 1936),
(244, 1937),
(244, 1938),
(244, 1939),
(244, 1940),
(244, 1941),
(244, 1942),
(244, 1943),
(244, 1944);

-- --------------------------------------------------------

--
-- Table structure for table `sales_type`
--

DROP TABLE IF EXISTS `sales_type`;
CREATE TABLE IF NOT EXISTS `sales_type` (
`idsales_type` smallint(5) unsigned NOT NULL,
  `sales_type_details_en` varchar(64) NOT NULL,
  `sales_type_details_bn` varchar(64) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales_type`
--

INSERT INTO `sales_type` (`idsales_type`, `sales_type_details_en`, `sales_type_details_bn`) VALUES
(1, 'Cash', ''),
(2, 'Credit', '');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
`idstaff` int(10) unsigned NOT NULL,
  `staff_name` varchar(64) NOT NULL,
  `staff_balance` double NOT NULL DEFAULT '0' COMMENT '+ mean company have to pay him, - mean staff have to pay him',
  `idpost` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`idstaff`, `staff_name`, `staff_balance`, `idpost`) VALUES
(1, 'Md. Jamal Uddin', -171990, 15),
(2, 'Md. Ashraful Alam', 16000, 31),
(3, 'Ashraf Mohammad Hossain', -19000, 27),
(4, 'Md. Ali Haider Mitul', -45000, 32),
(5, 'Riaz Uddin Howlader', -54131, 17),
(6, 'Md. Aminur Rahman', -45000, 17),
(7, 'Office Executive', 0, 19),
(8, 'Md. Lipu Sheikh', -39600, 26),
(9, 'Md. Rubel', -26000, 21),
(10, 'Shamima Akter Moni', -15000, 33),
(11, 'Shahanaz Ahamed', -15000, 33),
(12, 'Motia Parvin', -15000, 33),
(13, 'Tanvir Ahmed Khan', -15000, 16);

--
-- Triggers `staff`
--
DROP TRIGGER IF EXISTS `trigger___add_staff`;
DELIMITER $$
CREATE TRIGGER `trigger___add_staff` AFTER INSERT ON `staff`
 FOR EACH ROW BEGIN
	DECLARE is_propiter INT;
	SET is_propiter := (SELECT iddivision FROM staff s LEFT JOIN post p USING(idpost) WHERE idstaff = NEW.idstaff AND iddivision = 1 LIMIT 1);
	IF is_propiter = 1 THEN
		INSERT INTO `propiter` VALUES (NEW.idstaff, NEW.staff_name);
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `staff_attendance`
--

DROP TABLE IF EXISTS `staff_attendance`;
CREATE TABLE IF NOT EXISTS `staff_attendance` (
`idstaff_attendance` int(10) unsigned NOT NULL,
  `idstaff` int(10) unsigned NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` tinyint(3) unsigned NOT NULL COMMENT '1 means entry or  2 means exit'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_details`
--

DROP TABLE IF EXISTS `staff_details`;
CREATE TABLE IF NOT EXISTS `staff_details` (
`idstaff` int(10) unsigned NOT NULL,
  `staff_ob` double NOT NULL,
  `staff_comments` varchar(20) NOT NULL,
  `staff_reg_date` date NOT NULL,
  `staff_entrytime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `staff_comission` double NOT NULL DEFAULT '0',
  `staff_mobile` varchar(20) NOT NULL DEFAULT ' ',
  `staff_sallary` double unsigned NOT NULL,
  `father_name` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `education` varchar(20) NOT NULL,
  `permantnt_address` varchar(45) NOT NULL,
  `nid` varchar(20) NOT NULL,
  `reference` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_details`
--

INSERT INTO `staff_details` (`idstaff`, `staff_ob`, `staff_comments`, `staff_reg_date`, `staff_entrytime`, `staff_comission`, `staff_mobile`, `staff_sallary`, `father_name`, `dob`, `education`, `permantnt_address`, `nid`, `reference`) VALUES
(1, -60000, 'Department of Market', '2014-11-09', '2014-12-21 06:08:24', 1, '01777786716', 35000, 'Late Md. badur Raham', '2014-11-09', 'Diploma in Civil Eng', 'Village-Lemua C/A,Post- Lemua Bazar,P/S-Feni ', '2694811048744', 'Syed Murad Ahamed'),
(2, 0, 'None', '2014-11-01', '2014-11-10 01:15:28', 0, '8801777743701', 0, 'Md. Nurul Alam', '1990-06-25', 'B.Sc. In CSE', 'Noyabazar, Ati Bazar, Keranigonj, Dhaka', '-', 'Md. Kamrul Islam'),
(3, 0, 'Department of Accoun', '2014-11-10', '2014-11-10 17:49:34', 0, '01777786717', 15000, 'Late Azmal Hossain', '2014-11-10', 'BSS', '539/C,Khilgaon', '19812693623607090', 'Md. Kamrul Islam'),
(4, 0, 'Department of Accoun', '2014-11-10', '2014-11-10 17:57:34', 0, '01777786718', 15000, 'Late Md. Hanif', '1985-03-20', 'HSC', '5, Nazira Bazar Lane, Dhaka', '2694070190187', 'Syed Murad Ahamed'),
(5, 0, 'Department of Market', '2014-11-10', '2014-11-10 18:03:47', 0, '01777786721', 15000, 'Abdul Sattar Howlade', '1977-07-15', 'MA', '134/1,West Kafrul,Dhaka', '0117738531236', 'Md. Jamal Uddin'),
(6, 0, 'Nill', '2014-11-02', '2014-12-03 19:56:59', 1, '017777-86722', 15000, 'Md. Altaf Hossain', '1976-12-31', 'M.Com', '271,Arambagh,Noyatola', '19760253456', 'Nill'),
(7, 0, 'Office Sale Only', '2013-01-01', '2014-12-03 22:39:41', 0, 'Nill', 0, 'nill', '0013-01-01', 'nill', 'Nill', 'Nill', 'Nill'),
(8, 0, 'O.D Sir Car Driver', '2014-10-12', '2014-12-18 12:53:12', 0, '01930-494413', 13000, 'Md. Hemayet Hossain', '0000-00-00', 'Class 8', 'Vill- Raitkandi, P.O- Shajail, Kashiani, Gopa', '2010413443316', 'Mr. Badol'),
(9, 0, 'Delivery Person', '2011-03-07', '2014-12-18 12:58:37', 0, '01777786723', 8000, 'Md. Abdul Aziz', '1993-01-01', 'Class 8', '25 East Matherteck', '01777786723', 'Md. Sir'),
(10, 0, 'Director Wife', '2014-12-18', '2014-12-18 13:04:03', 0, '01777786703', 5000, 'Late. Md. Golam Hai', '1976-02-04', 'M.Com', 'Nil', 'Nil', 'Md. Sir'),
(11, 0, 'Director Wife', '2014-12-18', '2014-12-18 13:06:34', 0, '01777786704', 5000, 'Late. Md. Shahabuddi', '1986-12-07', 'M.Com', 'Nil', 'Nil', 'OD. Sir'),
(12, 0, 'Director Wife ', '2014-12-18', '2014-12-18 13:08:25', 0, '01777786705', 5000, 'nill', '1978-04-02', 'M.Com', 'Nill', 'Nill', 'Marketing Director'),
(13, 0, 'Account', '2014-04-01', '2015-02-22 12:30:10', 0, '01777786706', 15000, 'Md. Shahabuddin Khan', '1986-12-07', 'Graduate', '69 SOuth Moushundi, Narinda Dhaka-1100', '2698877386507', 'Syed Murad Ahamed');

-- --------------------------------------------------------

--
-- Table structure for table `staff_grant`
--

DROP TABLE IF EXISTS `staff_grant`;
CREATE TABLE IF NOT EXISTS `staff_grant` (
`idstaff_grant` int(10) unsigned NOT NULL,
  `staff_grant_date` date NOT NULL,
  `idtransaction_head` int(10) unsigned NOT NULL,
  `staff_grant_ammount` double NOT NULL,
  `staff_grant_status` tinyint(1) NOT NULL DEFAULT '0',
  `idstaff` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `staff_grant`
--
DROP TRIGGER IF EXISTS `trigger___add_staff_grant`;
DELIMITER $$
CREATE TRIGGER `trigger___add_staff_grant` AFTER INSERT ON `staff_grant`
 FOR EACH ROW BEGIN
	IF NEW.staff_grant_status = 1 THEN
		UPDATE staff SET staff_balance = staff_balance + NEW.staff_grant_ammount WHERE idstaff = NEW.idstaff;
	END IF;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `trigger___edit_staff_grant`;
DELIMITER $$
CREATE TRIGGER `trigger___edit_staff_grant` AFTER UPDATE ON `staff_grant`
 FOR EACH ROW BEGIN
  IF OLD.staff_grant_status = 1 THEN
    	IF @software_ln = 1 THEN
        	SET @software_error := ("সংশোধনযোগ্য নয়");
		ELSE
		   SET @software_error := ("Not Editable Now");		   
      END IF;
		CALL ___can_not_do_now();

  END IF;

	IF NEW.staff_grant_status = 1 AND OLD.staff_grant_status = 0 THEN
		UPDATE staff SET staff_balance = staff_balance + OLD.staff_grant_ammount - NEW.staff_grant_ammount WHERE idstaff = NEW.idstaff;
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `staff_grant_details`
--

DROP TABLE IF EXISTS `staff_grant_details`;
CREATE TABLE IF NOT EXISTS `staff_grant_details` (
`idstaff_grant` int(10) unsigned NOT NULL,
  `staff_grant_comments` varchar(64) NOT NULL,
  `staff_grant_entrytime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `iduser` int(10) unsigned DEFAULT NULL,
  `idstaff` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment`
--

DROP TABLE IF EXISTS `stock_adjustment`;
CREATE TABLE IF NOT EXISTS `stock_adjustment` (
`idstock_adjustment` int(10) unsigned NOT NULL,
  `stock_adjustment_date` date NOT NULL,
  `stock_adjustment_comments` varchar(64) NOT NULL,
  `iduser` int(10) unsigned NOT NULL,
  `idstaff` int(10) unsigned NOT NULL,
  `stock_adjustment_entrytime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stock_adjustment`
--

INSERT INTO `stock_adjustment` (`idstock_adjustment`, `stock_adjustment_date`, `stock_adjustment_comments`, `iduser`, `idstaff`, `stock_adjustment_entrytime`) VALUES
(1, '2014-12-08', 'Opening Stock Adjustment', 1, 1, '2014-12-09 07:49:44');

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment_stock_product_input`
--

DROP TABLE IF EXISTS `stock_adjustment_stock_product_input`;
CREATE TABLE IF NOT EXISTS `stock_adjustment_stock_product_input` (
  `idstock_adjustment` int(10) unsigned NOT NULL,
  `idstock_product_input` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stock_adjustment_stock_product_input`
--

INSERT INTO `stock_adjustment_stock_product_input` (`idstock_adjustment`, `idstock_product_input`) VALUES
(1, 297),
(1, 298),
(1, 299),
(1, 300),
(1, 301),
(1, 302),
(1, 303),
(1, 304),
(1, 305),
(1, 306),
(1, 307),
(1, 308),
(1, 309),
(1, 310),
(1, 311),
(1, 312),
(1, 313),
(1, 314),
(1, 315),
(1, 316),
(1, 317),
(1, 318),
(1, 319),
(1, 320),
(1, 321),
(1, 322),
(1, 323),
(1, 324),
(1, 325),
(1, 326),
(1, 327),
(1, 328),
(1, 329),
(1, 330),
(1, 331),
(1, 332),
(1, 333),
(1, 334),
(1, 335),
(1, 336),
(1, 337),
(1, 338),
(1, 339),
(1, 340),
(1, 341),
(1, 342),
(1, 343),
(1, 344),
(1, 345),
(1, 346),
(1, 347),
(1, 348),
(1, 349),
(1, 350),
(1, 351),
(1, 352),
(1, 353),
(1, 354),
(1, 355),
(1, 356),
(1, 357),
(1, 358),
(1, 359),
(1, 360),
(1, 361),
(1, 362),
(1, 363),
(1, 364),
(1, 365),
(1, 366),
(1, 367),
(1, 368),
(1, 369),
(1, 370),
(1, 371),
(1, 372),
(1, 373),
(1, 374),
(1, 375),
(1, 376),
(1, 377),
(1, 378),
(1, 379),
(1, 380),
(1, 381),
(1, 382),
(1, 383),
(1, 384),
(1, 385),
(1, 386),
(1, 387),
(1, 388),
(1, 389),
(1, 390),
(1, 391),
(1, 392),
(1, 393),
(1, 394),
(1, 395),
(1, 396),
(1, 397),
(1, 398),
(1, 399),
(1, 400),
(1, 401),
(1, 402),
(1, 403),
(1, 404),
(1, 405),
(1, 406),
(1, 407),
(1, 408),
(1, 409),
(1, 410),
(1, 411),
(1, 412),
(1, 413),
(1, 414),
(1, 415),
(1, 416),
(1, 417),
(1, 418),
(1, 419),
(1, 420),
(1, 421),
(1, 422),
(1, 423),
(1, 424),
(1, 425),
(1, 426),
(1, 427),
(1, 428),
(1, 429),
(1, 430),
(1, 431),
(1, 432),
(1, 433),
(1, 434),
(1, 435),
(1, 436),
(1, 437),
(1, 438),
(1, 439),
(1, 440),
(1, 441),
(1, 442),
(1, 443),
(1, 444),
(1, 445),
(1, 446),
(1, 447),
(1, 448),
(1, 449),
(1, 450),
(1, 451),
(1, 452),
(1, 453),
(1, 454),
(1, 455),
(1, 456),
(1, 457),
(1, 458),
(1, 459),
(1, 460),
(1, 461),
(1, 462),
(1, 463),
(1, 464),
(1, 465),
(1, 466),
(1, 467),
(1, 468),
(1, 469),
(1, 470),
(1, 471),
(1, 472),
(1, 473),
(1, 474),
(1, 475),
(1, 476),
(1, 477),
(1, 478),
(1, 479),
(1, 480),
(1, 481),
(1, 482),
(1, 483),
(1, 484),
(1, 485),
(1, 486),
(1, 487),
(1, 488),
(1, 489),
(1, 490),
(1, 491),
(1, 492),
(1, 493),
(1, 494),
(1, 495),
(1, 496),
(1, 497),
(1, 498),
(1, 499),
(1, 500),
(1, 501),
(1, 502),
(1, 503),
(1, 504),
(1, 505),
(1, 506),
(1, 507),
(1, 508),
(1, 509),
(1, 510),
(1, 511),
(1, 512),
(1, 513),
(1, 514),
(1, 515),
(1, 516),
(1, 517),
(1, 518),
(1, 519),
(1, 520),
(1, 521),
(1, 522),
(1, 523),
(1, 524),
(1, 525),
(1, 526),
(1, 527),
(1, 528),
(1, 529),
(1, 530),
(1, 531),
(1, 532),
(1, 533),
(1, 534),
(1, 535),
(1, 536),
(1, 537),
(1, 538),
(1, 539),
(1, 540),
(1, 541),
(1, 542),
(1, 543),
(1, 544),
(1, 545),
(1, 546),
(1, 547),
(1, 548),
(1, 549),
(1, 550),
(1, 551),
(1, 552),
(1, 553),
(1, 554),
(1, 555),
(1, 556),
(1, 557),
(1, 558),
(1, 559),
(1, 560),
(1, 561),
(1, 562),
(1, 563),
(1, 564),
(1, 565),
(1, 566),
(1, 567),
(1, 568),
(1, 569);

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment_stock_product_output`
--

DROP TABLE IF EXISTS `stock_adjustment_stock_product_output`;
CREATE TABLE IF NOT EXISTS `stock_adjustment_stock_product_output` (
  `idstock_adjustment` int(10) unsigned NOT NULL,
  `idstock_product_output` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stock_product_input`
--

DROP TABLE IF EXISTS `stock_product_input`;
CREATE TABLE IF NOT EXISTS `stock_product_input` (
`idstock_product_input` int(10) unsigned NOT NULL,
  `stock_product_input_date` date NOT NULL,
  `idproduct` int(10) unsigned NOT NULL,
  `stock_product_input_qunatity` double unsigned NOT NULL,
  `stock_product_input_price` double unsigned NOT NULL DEFAULT '0',
  `idpestablishment` int(10) unsigned NOT NULL,
  `stock_product_input_type` tinyint(3) unsigned NOT NULL COMMENT '1 sales, 2 purchase, 3 adjust, 4 transfer, 5 production, 6 gift, 7 sales return, 8 purchase return',
  `stock_product_input_status` tinyint(1) NOT NULL COMMENT '1 mean confirmed 0 mean not confirmed'
) ENGINE=InnoDB AUTO_INCREMENT=793 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stock_product_input`
--

INSERT INTO `stock_product_input` (`idstock_product_input`, `stock_product_input_date`, `idproduct`, `stock_product_input_qunatity`, `stock_product_input_price`, `idpestablishment`, `stock_product_input_type`, `stock_product_input_status`) VALUES
(297, '2014-12-08', 1, 19201, 23, 1, 3, 1),
(298, '2014-12-08', 2, 858, 35, 1, 3, 1),
(299, '2014-12-08', 3, 4797, 51, 1, 3, 1),
(300, '2014-12-08', 4, 13, 79, 1, 3, 1),
(301, '2014-12-08', 5, 117, 98, 1, 3, 1),
(302, '2014-12-08', 6, 3471, 152, 1, 3, 1),
(303, '2014-12-08', 7, 4204, 11, 1, 3, 1),
(304, '2014-12-08', 8, 3414, 15, 1, 3, 1),
(305, '2014-12-08', 9, 2039, 25, 1, 3, 1),
(306, '2014-12-08', 10, 389, 37, 1, 3, 1),
(307, '2014-12-08', 11, 1977, 55, 1, 3, 1),
(308, '2014-12-08', 12, 57, 89, 1, 3, 1),
(309, '2014-12-08', 13, 3337, 18, 1, 3, 1),
(310, '2014-12-08', 14, 2548, 20, 1, 3, 1),
(311, '2014-12-08', 15, 759, 25, 1, 3, 1),
(312, '2014-12-08', 16, 420, 32, 1, 3, 1),
(313, '2014-12-08', 17, 392, 35, 1, 3, 1),
(314, '2014-12-08', 18, 150, 42, 1, 3, 1),
(315, '2014-12-08', 19, 300, 50, 1, 3, 1),
(316, '2014-12-08', 20, 456, 55, 1, 3, 1),
(317, '2014-12-08', 21, 524, 59, 1, 3, 1),
(318, '2014-12-08', 22, 313, 65, 1, 3, 1),
(319, '2014-12-08', 23, 180, 80, 1, 3, 1),
(320, '2014-12-08', 24, 165, 90, 1, 3, 1),
(321, '2014-12-08', 25, 106, 95, 1, 3, 1),
(322, '2014-12-08', 26, 374, 115, 1, 3, 1),
(323, '2014-12-08', 27, 1667, 110, 1, 3, 1),
(324, '2014-12-08', 28, 283, 155, 1, 3, 1),
(325, '2014-12-08', 29, 61, 305, 1, 3, 1),
(326, '2014-12-08', 30, 126, 550, 1, 3, 1),
(327, '2014-12-08', 31, 158, 750, 1, 3, 1),
(328, '2014-12-08', 32, 15, 1080, 1, 3, 1),
(329, '2014-12-08', 33, 1460, 115, 1, 3, 1),
(330, '2014-12-08', 34, 2645, 120, 1, 3, 1),
(331, '2014-12-08', 35, 1954, 130, 1, 3, 1),
(332, '2014-12-08', 36, 384, 150, 1, 3, 1),
(333, '2014-12-08', 37, 78, 285, 1, 3, 1),
(334, '2014-12-08', 38, 1771, 110, 1, 3, 1),
(335, '2014-12-08', 39, 1867, 145, 1, 3, 1),
(336, '2014-12-08', 40, 335, 295, 1, 3, 1),
(337, '2014-12-08', 41, 132, 540, 1, 3, 1),
(338, '2014-12-08', 42, 120, 659, 1, 3, 1),
(339, '2014-12-08', 43, 22, 1000, 1, 3, 1),
(340, '2014-12-08', 44, 5718, 18, 1, 3, 1),
(341, '2014-12-08', 45, 2237, 30, 1, 3, 1),
(342, '2014-12-08', 46, 413, 40, 1, 3, 1),
(343, '2014-12-08', 47, 250, 80, 1, 3, 1),
(344, '2014-12-08', 48, 395, 125, 1, 3, 1),
(345, '2014-12-08', 49, 152, 220, 1, 3, 1),
(346, '2014-12-08', 53, 7198, 35, 1, 3, 1),
(347, '2014-12-08', 54, 910, 40, 1, 3, 1),
(348, '2014-12-08', 55, 381, 45, 1, 3, 1),
(349, '2014-12-08', 56, 315, 95, 1, 3, 1),
(350, '2014-12-08', 57, 221, 96, 1, 3, 1),
(351, '2014-12-08', 58, 269, 98, 1, 3, 1),
(352, '2014-12-08', 59, 320, 98, 1, 3, 1),
(353, '2014-12-08', 60, 922, 100, 1, 3, 1),
(354, '2014-12-08', 61, 163, 105, 1, 3, 1),
(355, '2014-12-08', 62, 135, 135, 1, 3, 1),
(356, '2014-12-08', 63, 180, 205, 1, 3, 1),
(357, '2014-12-08', 64, 68, 210, 1, 3, 1),
(358, '2014-12-08', 65, 109, 215, 1, 3, 1),
(359, '2014-12-08', 66, 62, 220, 1, 3, 1),
(360, '2014-12-08', 67, 127, 250, 1, 3, 1),
(361, '2014-12-08', 68, 280, 125, 1, 3, 1),
(362, '2014-12-08', 69, 150, 150, 1, 3, 1),
(363, '2014-12-08', 70, 104, 170, 1, 3, 1),
(364, '2014-12-08', 71, 196, 50, 1, 3, 1),
(365, '2014-12-08', 72, 279, 75, 1, 3, 1),
(366, '2014-12-08', 73, 13777, 13, 1, 3, 1),
(367, '2014-12-08', 74, 5078, 20, 1, 3, 1),
(368, '2014-12-08', 75, 1022, 35, 1, 3, 1),
(369, '2014-12-08', 76, 843, 70, 1, 3, 1),
(370, '2014-12-08', 77, 581, 110, 1, 3, 1),
(371, '2014-12-08', 78, 38, 185, 1, 3, 1),
(372, '2014-12-08', 79, 7506, 30, 1, 3, 1),
(373, '2014-12-08', 80, 961, 35, 1, 3, 1),
(374, '2014-12-08', 81, 45, 40, 1, 3, 1),
(375, '2014-12-08', 82, 270, 70, 1, 3, 1),
(376, '2014-12-08', 83, 230, 90, 1, 3, 1),
(377, '2014-12-08', 84, 199, 100, 1, 3, 1),
(378, '2014-12-08', 85, 385, 110, 1, 3, 1),
(379, '2014-12-08', 86, 294, 120, 1, 3, 1),
(380, '2014-12-08', 87, 230, 130, 1, 3, 1),
(381, '2014-12-08', 88, 115, 185, 1, 3, 1),
(382, '2014-12-08', 89, 94, 210, 1, 3, 1),
(383, '2014-12-08', 90, 76, 215, 1, 3, 1),
(384, '2014-12-08', 91, 86, 220, 1, 3, 1),
(385, '2014-12-08', 92, 62, 250, 1, 3, 1),
(386, '2014-12-08', 93, 131, 260, 1, 3, 1),
(387, '2014-12-08', 94, 39, 99, 1, 3, 1),
(388, '2014-12-08', 95, 4279, 125, 1, 3, 1),
(389, '2014-12-08', 96, 451, 125, 1, 3, 1),
(390, '2014-12-08', 97, 273, 165, 1, 3, 1),
(391, '2014-12-08', 98, 342, 115, 1, 3, 1),
(392, '2014-12-08', 99, 194, 150, 1, 3, 1),
(393, '2014-12-08', 100, 80, 170, 1, 3, 1),
(394, '2014-12-08', 101, 78, 320, 1, 3, 1),
(395, '2014-12-08', 102, 2340, 180, 1, 3, 1),
(396, '2014-12-08', 103, 1316, 245, 1, 3, 1),
(397, '2014-12-08', 104, 839, 290, 1, 3, 1),
(398, '2014-12-08', 105, 120, 435, 1, 3, 1),
(399, '2014-12-08', 106, 212, 695, 1, 3, 1),
(400, '2014-12-08', 107, 55, 885, 1, 3, 1),
(401, '2014-12-08', 108, 364, 280, 1, 3, 1),
(402, '2014-12-08', 109, 224, 420, 1, 3, 1),
(403, '2014-12-08', 110, 216, 560, 1, 3, 1),
(404, '2014-12-08', 111, 76, 800, 1, 3, 1),
(405, '2014-12-08', 112, 79, 980, 1, 3, 1),
(406, '2014-12-08', 113, 70, 1480, 1, 3, 1),
(407, '2014-12-08', 114, 469, 280, 1, 3, 1),
(408, '2014-12-08', 115, 275, 420, 1, 3, 1),
(409, '2014-12-08', 116, 92, 560, 1, 3, 1),
(410, '2014-12-08', 117, 90, 800, 1, 3, 1),
(411, '2014-12-08', 118, 99, 980, 1, 3, 1),
(412, '2014-12-08', 119, 30, 1480, 1, 3, 1),
(413, '2014-12-08', 120, 1793, 375, 1, 3, 1),
(414, '2014-12-08', 121, 1116, 465, 1, 3, 1),
(415, '2014-12-08', 122, 552, 500, 1, 3, 1),
(416, '2014-12-08', 123, 32, 750, 1, 3, 1),
(417, '2014-12-08', 124, 313, 1400, 1, 3, 1),
(418, '2014-12-08', 125, 91, 1700, 1, 3, 1),
(419, '2014-12-08', 126, 928, 950, 1, 3, 1),
(420, '2014-12-08', 127, 137, 1190, 1, 3, 1),
(421, '2014-12-08', 128, 737, 790, 1, 3, 1),
(422, '2014-12-08', 129, 513, 210, 1, 3, 1),
(423, '2014-12-08', 130, 736, 280, 1, 3, 1),
(424, '2014-12-08', 131, 69, 365, 1, 3, 1),
(425, '2014-12-08', 132, 57, 460, 1, 3, 1),
(426, '2014-12-08', 133, 214, 698, 1, 3, 1),
(427, '2014-12-08', 134, 68, 935, 1, 3, 1),
(428, '2014-12-08', 135, 2222, 12, 1, 3, 1),
(429, '2014-12-08', 136, 842, 20, 1, 3, 1),
(430, '2014-12-08', 137, 638, 35, 1, 3, 1),
(431, '2014-12-08', 138, 240, 50, 1, 3, 1),
(432, '2014-12-08', 139, 494, 75, 1, 3, 1),
(433, '2014-12-08', 140, 283, 105, 1, 3, 1),
(434, '2014-12-08', 141, 4843, 12, 1, 3, 1),
(435, '2014-12-08', 142, 2987, 14, 1, 3, 1),
(436, '2014-12-08', 143, 1991, 20, 1, 3, 1),
(437, '2014-12-08', 144, 1252, 30, 1, 3, 1),
(438, '2014-12-08', 145, 0, 42, 1, 3, 1),
(439, '2014-12-08', 146, 0, 52, 1, 3, 1),
(440, '2014-12-08', 147, 9472, 10, 1, 3, 1),
(441, '2014-12-08', 148, 1799, 14, 1, 3, 1),
(442, '2014-12-08', 149, 1729, 18, 1, 3, 1),
(443, '2014-12-08', 150, 0, 38, 1, 3, 1),
(444, '2014-12-08', 151, 12, 85, 1, 3, 1),
(445, '2014-12-08', 152, 0, 105, 1, 3, 1),
(446, '2014-12-08', 153, 113, 8500, 1, 3, 1),
(447, '2014-12-08', 154, 112, 2000, 1, 3, 1),
(448, '2014-12-08', 155, 0, 21, 1, 3, 1),
(449, '2014-12-08', 156, 0, 27, 1, 3, 1),
(450, '2014-12-08', 157, 0, 35, 1, 3, 1),
(451, '2014-12-08', 158, 0, 62, 1, 3, 1),
(452, '2014-12-08', 159, 0, 69, 1, 3, 1),
(453, '2014-12-08', 160, 0, 78, 1, 3, 1),
(454, '2014-12-08', 161, 0, 130, 1, 3, 1),
(455, '2014-12-08', 162, 0, 156, 1, 3, 1),
(456, '2014-12-08', 163, 0, 215, 1, 3, 1),
(457, '2014-12-08', 164, 0, 14.5, 1, 3, 1),
(458, '2014-12-08', 165, 0, 21, 1, 3, 1),
(459, '2014-12-08', 166, 0, 29, 1, 3, 1),
(460, '2014-12-08', 167, 0, 43, 1, 3, 1),
(461, '2014-12-08', 168, 0, 49, 1, 3, 1),
(462, '2014-12-08', 169, 0, 65, 1, 3, 1),
(463, '2014-12-08', 170, 0, 35, 1, 3, 1),
(464, '2014-12-08', 171, 0, 38, 1, 3, 1),
(465, '2014-12-08', 172, 0, 42, 1, 3, 1),
(466, '2014-12-08', 173, 0, 129, 1, 3, 1),
(467, '2014-12-08', 174, 0, 490, 1, 3, 1),
(468, '2014-12-08', 175, 0, 2600, 1, 3, 1),
(469, '2014-12-08', 176, 0, 115, 1, 3, 1),
(470, '2014-12-08', 177, 0, 595, 1, 3, 1),
(471, '2014-12-08', 178, 0, 158, 1, 3, 1),
(472, '2014-12-08', 179, 0, 188, 1, 3, 1),
(473, '2014-12-08', 180, 0, 640, 1, 3, 1),
(474, '2014-12-08', 181, 0, 41, 1, 3, 1),
(475, '2014-12-08', 182, 0, 45, 1, 3, 1),
(476, '2014-12-08', 183, 0, 58, 1, 3, 1),
(477, '2014-12-08', 184, 0, 179, 1, 3, 1),
(478, '2014-12-08', 185, 0, 778, 1, 3, 1),
(479, '2014-12-08', 186, 0, 2800, 1, 3, 1),
(480, '2014-12-08', 187, 0, 198, 1, 3, 1),
(481, '2014-12-08', 188, 0, 1230, 1, 3, 1),
(482, '2014-12-08', 189, 0, 198, 1, 3, 1),
(483, '2014-12-08', 190, 0, 380, 1, 3, 1),
(484, '2014-12-08', 191, 0, 285, 1, 3, 1),
(485, '2014-12-08', 192, 0, 138, 1, 3, 1),
(486, '2014-12-08', 193, 0, 295, 1, 3, 1),
(487, '2014-12-08', 194, 0, 1350, 1, 3, 1),
(488, '2014-12-08', 195, 0, 215, 1, 3, 1),
(489, '2014-12-08', 196, 0, 950, 1, 3, 1),
(490, '2014-12-08', 197, 0, 2700, 1, 3, 1),
(491, '2014-12-08', 198, 0, 385, 1, 3, 1),
(492, '2014-12-08', 199, 0, 1150, 1, 3, 1),
(493, '2014-12-08', 200, 0, 268, 1, 3, 1),
(494, '2014-12-08', 201, 0, 390, 1, 3, 1),
(495, '2014-12-08', 202, 0, 190, 1, 3, 1),
(496, '2014-12-08', 203, 0, 195, 1, 3, 1),
(497, '2014-12-08', 204, 0, 199, 1, 3, 1),
(498, '2014-12-08', 205, 0, 960, 1, 3, 1),
(499, '2014-12-08', 206, 0, 480, 1, 3, 1),
(500, '2014-12-08', 207, 0, 875, 1, 3, 1),
(501, '2014-12-08', 208, 0, 195, 1, 3, 1),
(502, '2014-12-08', 209, 0, 350, 1, 3, 1),
(503, '2014-12-08', 210, 0, 480, 1, 3, 1),
(504, '2014-12-08', 211, 0, 1050, 1, 3, 1),
(505, '2014-12-08', 212, 0, 100, 1, 3, 1),
(506, '2014-12-08', 213, 0, 275, 1, 3, 1),
(507, '2014-12-08', 214, 0, 750, 1, 3, 1),
(508, '2014-12-08', 215, 0, 40, 1, 3, 1),
(509, '2014-12-08', 216, 0, 135, 1, 3, 1),
(510, '2014-12-08', 217, 0, 295, 1, 3, 1),
(511, '2014-12-08', 218, 0, 30, 1, 3, 1),
(512, '2014-12-08', 219, 0, 42, 1, 3, 1),
(513, '2014-12-08', 220, 0, 75, 1, 3, 1),
(514, '2014-12-08', 221, 0, 475, 1, 3, 1),
(515, '2014-12-08', 222, 0, 430, 1, 3, 1),
(516, '2014-12-08', 223, 0, 350, 1, 3, 1),
(517, '2014-12-08', 231, 150, 185, 1, 3, 1),
(518, '2014-12-08', 232, 63, 1090, 1, 3, 1),
(519, '2014-12-08', 233, 373, 120, 1, 3, 1),
(520, '2014-12-08', 234, 16, 850, 1, 3, 1),
(521, '2014-12-08', 235, 55, 265, 1, 3, 1),
(522, '2014-12-08', 236, 0, 230, 1, 3, 1),
(523, '2014-12-08', 237, 7, 135, 1, 3, 1),
(524, '2014-12-08', 238, 240, 268, 1, 3, 1),
(525, '2014-12-08', 239, 0, 780, 1, 3, 1),
(526, '2014-12-08', 240, 74, 1200, 1, 3, 1),
(527, '2014-12-08', 241, 191, 3675, 1, 3, 1),
(528, '2014-12-08', 242, 0, 150, 1, 3, 1),
(529, '2014-12-08', 243, 0, 344, 1, 3, 1),
(530, '2014-12-08', 244, 31866, 26, 1, 3, 1),
(531, '2014-12-08', 245, 396, 39, 1, 3, 1),
(532, '2014-12-08', 246, 2570, 55, 1, 3, 1),
(533, '2014-12-08', 247, 356, 87, 1, 3, 1),
(534, '2014-12-08', 248, 7226, 105, 1, 3, 1),
(535, '2014-12-08', 249, 1525, 158, 1, 3, 1),
(536, '2014-12-08', 250, 240, 125, 1, 3, 1),
(537, '2014-12-08', 251, 0, 255, 1, 3, 1),
(538, '2014-12-08', 252, 174, 260, 1, 3, 1),
(539, '2014-12-08', 253, 262, 125, 1, 3, 1),
(540, '2014-12-08', 254, 0, 240, 1, 3, 1),
(541, '2014-12-08', 255, 174, 254, 1, 3, 1),
(542, '2014-12-08', 256, 50, 395, 1, 3, 1),
(543, '2014-12-08', 257, 54, 880, 1, 3, 1),
(544, '2014-12-08', 258, 56, 1090, 1, 3, 1),
(545, '2014-12-08', 259, 0, 248, 1, 3, 1),
(546, '2014-12-08', 260, 0, 225, 1, 3, 1),
(547, '2014-12-08', 261, 0, 320, 1, 3, 1),
(548, '2014-12-08', 262, 120, 199, 1, 3, 1),
(549, '2014-12-08', 263, 130, 195, 1, 3, 1),
(550, '2014-12-08', 264, 379, 315, 1, 3, 1),
(551, '2014-12-08', 265, 415, 425, 1, 3, 1),
(552, '2014-12-08', 266, 9, 500, 1, 3, 1),
(553, '2014-12-08', 267, 0, 800, 1, 3, 1),
(554, '2014-12-08', 268, 474, 1175, 1, 3, 1),
(555, '2014-12-08', 269, 113, 1350, 1, 3, 1),
(556, '2014-12-08', 270, 409, 120, 1, 3, 1),
(557, '2014-12-08', 271, 0, 130, 1, 3, 1),
(558, '2014-12-08', 272, 200, 150, 1, 3, 1),
(559, '2014-12-08', 273, 294, 135, 1, 3, 1),
(560, '2014-12-08', 274, 26, 2950, 1, 3, 1),
(561, '2014-12-08', 275, 155, 4900, 1, 3, 1),
(562, '2014-12-08', 276, 45, 540, 1, 3, 1),
(563, '2014-12-08', 277, 70, 895, 1, 3, 1),
(564, '2014-12-08', 278, 64, 1175, 1, 3, 1),
(565, '2014-12-08', 279, 60, 1700, 1, 3, 1),
(566, '2014-12-08', 280, 40, 950, 1, 3, 1),
(567, '2014-12-08', 281, 48, 1295, 1, 3, 1),
(568, '2014-12-08', 282, 60, 595, 1, 3, 1),
(569, '2014-12-08', 283, 105, 295, 1, 3, 1),
(571, '2014-12-09', 78, 50, 145, 1, 1, 1),
(572, '2014-12-09', 5, 3003, 47.55244, 1, 1, 1),
(573, '2014-12-10', 4, 2002, 36.363636, 1, 1, 1),
(574, '2014-12-13', 2, 10010, 17.9021, 1, 1, 1),
(575, '2014-12-14', 94, 3000, 95, 1, 1, 1),
(576, '2014-12-17', 65, 11, 215, 1, 1, 1),
(577, '2014-12-17', 78, 36, 185, 1, 1, 1),
(578, '2014-12-17', 94, 280, 99, 1, 1, 1),
(579, '2014-12-17', 33, 130, 115, 1, 1, 1),
(580, '2014-12-18', 10, 24, 37, 1, 1, 1),
(581, '2014-12-18', 14, 4, 20, 1, 1, 1),
(582, '2014-12-18', 248, 169, 105, 1, 1, 1),
(583, '2014-12-18', 247, 39, 87, 1, 1, 1),
(584, '2014-12-18', 246, 26, 55, 1, 1, 1),
(585, '2014-12-18', 3, 52, 55, 1, 1, 1),
(586, '2014-12-18', 67, 6, 250, 1, 1, 1),
(587, '2014-12-18', 66, 4, 220, 1, 1, 1),
(588, '2014-12-18', 60, 11, 100, 1, 1, 1),
(589, '2014-12-18', 57, 1, 96, 1, 1, 1),
(590, '2014-12-18', 55, 10, 45, 1, 1, 1),
(591, '2014-12-18', 61, 1, 105, 1, 1, 1),
(592, '2014-12-18', 48, 1, 125, 1, 1, 1),
(593, '2014-12-18', 78, 4, 185, 1, 1, 1),
(594, '2014-12-18', 77, 5, 110, 1, 1, 1),
(595, '2014-12-18', 76, 1, 70, 1, 1, 1),
(596, '2014-12-18', 86, 15, 120, 1, 1, 1),
(597, '2014-12-18', 12, 4, 89, 1, 1, 1),
(598, '2014-12-18', 11, 10, 55, 1, 1, 1),
(599, '2014-12-18', 10, 24, 37, 1, 1, 1),
(600, '2014-12-18', 20, 4, 55, 1, 1, 1),
(601, '2014-12-18', 18, 4, 42, 1, 1, 1),
(602, '2014-12-18', 15, 1, 25, 1, 1, 1),
(603, '2014-12-18', 107, 1, 885, 1, 1, 1),
(604, '2014-12-18', 106, 6, 695, 1, 1, 1),
(605, '2014-12-18', 268, 4, 1175, 1, 1, 1),
(606, '2014-12-18', 266, 1, 500, 1, 1, 1),
(607, '2014-12-18', 125, 1, 1700, 1, 1, 1),
(608, '2014-12-18', 83, 17, 90, 1, 1, 1),
(609, '2014-12-18', 98, 150, 115, 1, 1, 1),
(610, '2014-12-18', 68, 100, 125, 1, 1, 1),
(611, '2014-12-20', 94, 50, 115, 1, 1, 1),
(612, '2014-12-22', 35, 50, 130, 1, 1, 1),
(613, '2014-12-28', 68, 28, 125, 1, 1, 1),
(614, '2014-12-28', 35, 7, 130, 1, 1, 1),
(615, '2014-12-28', 98, 25, 115, 1, 1, 1),
(616, '2014-12-28', 33, 35, 115, 1, 1, 1),
(617, '2014-12-28', 96, 7, 125, 1, 1, 1),
(618, '2014-12-30', 127, 9, 1190, 1, 1, 1),
(619, '2015-01-01', 78, 28, 187, 1, 1, 1),
(620, '2015-01-03', 126, 5, 950, 1, 1, 1),
(621, '2015-01-03', 120, 30, 375, 1, 1, 1),
(622, '2015-01-03', 20, 11, 55, 1, 1, 1),
(623, '2015-01-03', 102, 52, 180, 1, 1, 1),
(624, '2015-01-06', 73, 100, 17, 1, 1, 1),
(625, '2015-01-06', 74, 100, 22, 1, 1, 1),
(626, '2015-01-11', 128, 15, 790, 1, 1, 1),
(627, '2015-01-13', 78, 1, 200, 1, 1, 1),
(628, '2015-01-13', 126, 12, 950, 1, 1, 1),
(629, '2015-01-13', 78, 20, 175, 1, 1, 1),
(630, '2015-01-14', 78, 40, 175, 1, 1, 1),
(631, '2015-01-14', 12, 50, 90, 1, 1, 1),
(632, '2015-01-15', 68, 140, 125, 1, 1, 1),
(633, '2015-01-12', 53, 64, 35, 1, 1, 1),
(634, '2015-01-12', 73, 100, 13, 1, 1, 1),
(635, '2015-01-12', 44, 194, 18, 1, 1, 1),
(636, '2015-01-12', 27, 168, 110, 1, 1, 1),
(637, '2015-01-12', 33, 40, 115, 1, 1, 1),
(638, '2015-01-12', 46, 10, 40, 1, 1, 1),
(639, '2015-01-12', 55, 1, 45, 1, 1, 1),
(640, '2015-01-12', 57, 1, 96, 1, 1, 1),
(641, '2015-01-12', 45, 260, 30, 1, 1, 1),
(642, '2015-01-12', 12, 4, 89, 1, 1, 1),
(643, '2015-01-12', 38, 64, 110, 1, 1, 1),
(644, '2015-01-12', 265, 2, 425, 1, 1, 1),
(645, '2015-01-12', 103, 12, 245, 1, 1, 1),
(646, '2015-01-12', 8, 30, 15, 1, 1, 1),
(647, '2015-01-12', 7, 25, 11, 1, 1, 1),
(648, '2015-01-12', 22, 2, 65, 1, 1, 1),
(649, '2015-01-12', 18, 2, 42, 1, 1, 1),
(650, '2015-01-12', 74, 140, 20, 1, 1, 1),
(651, '2015-01-12', 81, 5, 40, 1, 1, 1),
(652, '2015-01-12', 1, 286, 23, 1, 1, 1),
(653, '2015-01-19', 5, 195, 98, 1, 1, 1),
(654, '2015-01-21', 145, 450, 7.5, 1, 1, 1),
(655, '2015-01-21', 29, 4, 130, 1, 1, 1),
(656, '2015-01-21', 78, 4, 87.5, 1, 1, 1),
(657, '2015-01-22', 32, 4, 0.01, 1, 1, 1),
(658, '2015-01-22', 1, 30004, 12.3183575, 1, 1, 1),
(659, '2015-01-22', 2, 8125, 17.92, 1, 1, 1),
(660, '2015-01-24', 78, 4, 185, 1, 1, 1),
(661, '2015-01-24', 29, 4, 305, 1, 1, 1),
(662, '2015-01-24', 29, 5, 260, 1, 1, 1),
(663, '2015-01-24', 12, 4, 120.25, 1, 1, 1),
(664, '2015-01-25', 28, 12, 155, 1, 1, 1),
(665, '2015-01-25', 38, 7, 110, 1, 1, 1),
(666, '2015-01-25', 13, 1, 18, 1, 1, 1),
(667, '2015-01-25', 99, 10, 150, 1, 1, 1),
(668, '2015-01-25', 33, 6, 115, 1, 1, 1),
(669, '2015-01-25', 35, 2, 130, 1, 1, 1),
(670, '2015-01-25', 96, 3, 125, 1, 1, 1),
(671, '2015-01-25', 98, 14, 115, 1, 1, 1),
(672, '2015-01-25', 108, 1, 280, 1, 1, 1),
(673, '2015-01-25', 120, 1, 375, 1, 1, 1),
(674, '2015-01-25', 68, 10, 125, 1, 1, 1),
(675, '2015-01-27', 5, 10010, 47.552448, 1, 1, 1),
(676, '2015-01-27', 4, 2002, 36.363636, 1, 1, 1),
(677, '2015-01-27', 3, 2002, 27.412587, 1, 1, 1),
(678, '2015-01-27', 84, 4, 100, 1, 1, 1),
(679, '2015-01-27', 18, 6, 42, 1, 1, 1),
(680, '2015-01-27', 33, 25, 115, 1, 1, 1),
(681, '2015-01-28', 27, 30, 110, 1, 1, 1),
(682, '2015-01-28', 68, 20, 125, 1, 1, 1),
(683, '2015-01-28', 126, 30, 950, 1, 1, 1),
(684, '2015-01-29', 7, 4800, 3, 1, 1, 1),
(685, '2015-01-29', 8, 3200, 4, 1, 1, 1),
(686, '2015-01-29', 9, 1350, 7, 1, 1, 1),
(687, '2015-01-29', 12, 232, 27, 1, 1, 1),
(688, '2015-01-29', 21, 300, 14, 1, 1, 1),
(689, '2015-01-29', 73, 24000, 4, 1, 1, 1),
(690, '2015-01-29', 74, 10000, 6, 1, 1, 1),
(691, '2015-01-29', 75, 1425, 11, 1, 1, 1),
(692, '2015-01-29', 76, 450, 22, 1, 1, 1),
(693, '2015-01-29', 78, 300, 59, 1, 1, 1),
(694, '2015-01-29', 79, 8645, 5, 1, 1, 1),
(695, '2015-01-29', 81, 400, 8, 1, 1, 1),
(696, '2015-01-29', 44, 9000, 5, 1, 1, 1),
(697, '2015-01-29', 45, 4680, 8, 1, 1, 1),
(698, '2015-01-29', 46, 204, 13, 1, 1, 1),
(699, '2015-01-29', 49, 80, 61, 1, 1, 1),
(700, '2015-01-29', 53, 3960, 7, 1, 1, 1),
(701, '2015-01-29', 54, 570, 10, 1, 1, 1),
(702, '2015-01-29', 64, 144, 40, 1, 1, 1),
(703, '2015-01-29', 38, 2100, 28, 1, 1, 1),
(704, '2015-01-29', 42, 102, 162, 1, 1, 1),
(705, '2015-01-29', 43, 90, 211, 1, 1, 1),
(706, '2015-01-29', 27, 4200, 38, 1, 1, 1),
(707, '2015-01-29', 237, 540, 39, 1, 1, 1),
(708, '2015-01-29', 28, 400, 53, 1, 1, 1),
(709, '2015-01-29', 29, 200, 88, 1, 1, 1),
(710, '2015-01-29', 32, 120, 290, 1, 1, 1),
(711, '2015-01-29', 94, 13750, 32, 1, 1, 1),
(712, '2015-01-29', 96, 600, 34, 1, 1, 1),
(713, '2015-01-29', 33, 5000, 36, 1, 1, 1),
(714, '2015-01-29', 35, 1050, 41, 1, 1, 1),
(715, '2015-01-29', 147, 12000, 1, 1, 1, 1),
(716, '2015-01-29', 103, 720, 14, 1, 1, 1),
(717, '2015-01-29', 107, 120, 76, 1, 1, 1),
(718, '2015-01-29', 121, 960, 154, 1, 1, 1),
(719, '2015-01-29', 123, 40, 319, 1, 1, 1),
(720, '2015-01-29', 130, 400, 25, 1, 1, 1),
(721, '2015-01-29', 131, 110, 42, 1, 1, 1),
(722, '2015-01-29', 153, 30, 1409, 1, 1, 1),
(723, '2015-01-07', 94, 200, 99, 1, 1, 1),
(724, '2015-01-28', 284, 100, 12.6, 1, 1, 1),
(725, '2015-01-31', 145, 253, 7.5, 1, 1, 0),
(726, '2015-01-31', 234, 8, 850, 1, 1, 1),
(727, '2015-01-31', 145, 253, 6, 1, 1, 1),
(728, '2015-01-31', 1, 52, 23, 1, 1, 1),
(729, '2015-01-31', 2, 26, 35, 1, 1, 1),
(730, '2015-01-31', 7, 7, 11, 1, 1, 1),
(731, '2015-01-31', 8, 5, 15, 1, 1, 1),
(732, '2015-01-31', 27, 8, 110, 1, 1, 1),
(733, '2015-01-31', 38, 2, 110, 1, 1, 1),
(734, '2015-01-31', 44, 15, 18, 1, 1, 1),
(735, '2015-01-31', 45, 5, 30, 1, 1, 1),
(736, '2015-01-31', 53, 2, 35, 1, 1, 1),
(737, '2015-01-31', 33, 6, 115, 1, 1, 1),
(738, '2015-01-31', 35, 2, 130, 1, 1, 1),
(739, '2015-01-31', 73, 20, 13, 1, 1, 1),
(740, '2015-01-31', 74, 6, 20, 1, 1, 1),
(741, '2015-01-31', 79, 7, 30, 1, 1, 1),
(742, '2015-01-31', 94, 14, 99, 1, 1, 1),
(743, '2015-01-31', 147, 25, 10, 1, 1, 1),
(744, '2015-02-01', 44, 22, 18, 1, 1, 1),
(745, '2015-02-01', 7, 8, 11, 1, 1, 1),
(746, '2015-02-01', 73, 3, 13, 1, 1, 1),
(747, '2015-02-01', 102, 3, 180, 1, 1, 1),
(748, '2015-02-01', 27, 1, 110, 1, 1, 1),
(749, '2015-02-01', 148, 1, 14, 1, 1, 1),
(750, '2015-02-07', 284, 110, 12.6, 1, 1, 1),
(751, '2015-02-01', 5, 1599, 56.84, 1, 1, 1),
(752, '2015-02-08', 73, 1000, 13, 1, 1, 0),
(753, '2015-02-10', 2, 1300, 39, 1, 1, 1),
(754, '2015-02-10', 53, 66, 35, 1, 1, 1),
(755, '2015-02-10', 71, 14, 50, 1, 1, 1),
(756, '2015-02-10', 38, 8, 110, 1, 1, 1),
(757, '2015-02-09', 1, 897, 23, 1, 1, 1),
(758, '2015-02-09', 5, 897, 98, 1, 1, 1),
(759, '2015-02-12', 31, 2, 750, 1, 1, 1),
(760, '2015-02-12', 12, 36, 95, 1, 1, 1),
(761, '2015-02-12', 78, 36, 200, 1, 1, 1),
(762, '2015-02-12', 64, 15, 210, 1, 1, 1),
(763, '2015-02-12', 140, 6, 155, 1, 1, 1),
(764, '2015-02-12', 125, 5, 1700, 1, 1, 1),
(765, '2015-02-15', 77, 1500, 105, 1, 1, 1),
(766, '2015-02-15', 60, 1000, 105, 1, 1, 1),
(767, '2015-02-15', 6, 2, 0.01, 1, 1, 1),
(768, '2015-02-15', 6, 24, 0.01, 1, 1, 1),
(769, '2015-02-18', 3, 3003, 27.4126, 1, 1, 1),
(770, '2015-02-18', 6, 5005, 73.8462, 1, 1, 1),
(771, '2015-02-17', 131, 30, 365, 1, 1, 1),
(772, '2015-02-07', 5, 2300, 85, 1, 1, 1),
(773, '2015-02-08', 5, 7700, 85, 1, 1, 1),
(774, '2015-02-19', 2, 10010, 17.9021, 1, 1, 1),
(775, '2015-02-24', 145, 500, 6, 1, 1, 1),
(776, '2015-02-24', 67, 60, 215, 1, 1, 1),
(777, '2015-02-24', 55, 200, 50, 1, 1, 1),
(778, '2015-02-25', 63, 3, 205, 1, 1, 1),
(779, '2015-02-28', 284, 131, 12.6, 1, 1, 1),
(780, '2015-02-28', 1, 8580, 12.32, 1, 1, 1),
(781, '2015-02-28', 2, 10010, 17.9021, 1, 1, 1),
(782, '2015-03-02', 78, 3, 185, 1, 1, 1),
(783, '2015-03-02', 77, 4, 110, 1, 1, 1),
(784, '2015-03-02', 60, 4, 100, 1, 1, 1),
(785, '2015-03-02', 12, 2, 89, 1, 1, 1),
(786, '2015-03-02', 11, 3, 55, 1, 1, 1),
(787, '2015-03-02', 106, 3, 695, 1, 1, 1),
(788, '2015-03-02', 122, 2, 500, 1, 1, 1),
(789, '2015-03-02', 1, 11830, 22, 1, 1, 1),
(790, '2015-03-03', 57, 300, 99, 1, 1, 1),
(791, '2015-03-03', 105, 50, 265, 1, 1, 1),
(792, '2015-03-03', 30, 115, 472, 1, 1, 1);

--
-- Triggers `stock_product_input`
--
DROP TRIGGER IF EXISTS `trigger___add_stock_product_input`;
DELIMITER $$
CREATE TRIGGER `trigger___add_stock_product_input` BEFORE INSERT ON `stock_product_input`
 FOR EACH ROW BEGIN

	DECLARE QUANTITY INT DEFAULT 0;
	
	IF NEW.stock_product_input_status = 1 THEN		
		UPDATE pestablishment_product 
		SET ammount =  ammount + NEW.stock_product_input_qunatity
		WHERE idproduct = NEW.idproduct AND idpestablishment = NEW.idpestablishment;
	END IF;

	IF NEW.stock_product_input_status = 0 THEN		
		UPDATE pestablishment_product_demand 
		SET in_ammount =  in_ammount + NEW.stock_product_input_qunatity
		WHERE idproduct = NEW.idproduct AND idpestablishment = NEW.idpestablishment;
	END IF;

END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `trigger___delete_stock_product_input`;
DELIMITER $$
CREATE TRIGGER `trigger___delete_stock_product_input` BEFORE DELETE ON `stock_product_input`
 FOR EACH ROW BEGIN
	DECLARE QUANTITY INT DEFAULT 0;

	IF OLD.stock_product_input_status = 0 THEN		
		UPDATE pestablishment_product_demand 
		SET in_ammount =  in_ammount - OLD.stock_product_input_qunatity
		WHERE idproduct = OLD.idproduct AND idpestablishment = OLD.idpestablishment;
	END IF;
	
   
	IF OLD.stock_product_input_status = 1 THEN
		SET QUANTITY := (SELECT ammount FROM pestablishment_product WHERE idproduct = OLD.idproduct AND idpestablishment = OLD.idpestablishment);
		IF QUANTITY  - OLD.stock_product_input_qunatity > 0 THEN
			UPDATE pestablishment_product 
			SET ammount =  ammount  - OLD.stock_product_input_qunatity
			WHERE idproduct = OLD.idproduct AND idpestablishment = OLD.idpestablishment;
		ELSE
    		IF @software_ln = 1 THEN
			   SET @software_error := (SELECT CONCAT(pestablishment_name, ' à¦œà¦¾à§Ÿà¦—à¦¾à§Ÿ ' , product_name, ' ',  FORMAT(ammount,2), ' à¦¸à¦‚à¦–à§à¦¯à¦• à¦…à¦¾à¦›à§‡ ') FROM pestablishment_product LEFT JOIN product USING (idproduct) LEFT JOIN pestablishment USING(idpestablishment) WHERE idproduct = OLD.idproduct AND idpestablishment = OLD.idpestablishment);		   
			ELSE
			   SET @software_error := (SELECT CONCAT(product_name,' Stock Is ' ,  FORMAT(ammount,2), ' On ', pestablishment_name) FROM pestablishment_product LEFT JOIN product USING (idproduct) LEFT JOIN pestablishment USING(idpestablishment) WHERE idproduct = OLD.idproduct AND idpestablishment = OLD.idpestablishment);		   
      	END IF;
			CALL ___fault_negative_stockt();
		END IF;
	END IF;
	
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `trigger___edit_stock_product_input`;
DELIMITER $$
CREATE TRIGGER `trigger___edit_stock_product_input` BEFORE UPDATE ON `stock_product_input`
 FOR EACH ROW BEGIN
	DECLARE QUANTITY INT DEFAULT 0;
   IF OLD.stock_product_input_status = 1 THEN
    	IF @software_ln = 1 THEN
        	SET @software_error := ("সংশোধনযোগ্য নয়");
		ELSE
		   SET @software_error := ("Not Editable Now");		   
      END IF;
		CALL ___can_not_do_now();

   END IF;

	IF NEW.stock_product_input_status = 1 AND OLD.stock_product_input_status = 0 THEN		
		UPDATE pestablishment_product 
		SET ammount =  ammount + NEW.stock_product_input_qunatity
		WHERE idproduct = NEW.idproduct AND idpestablishment = NEW.idpestablishment;

		UPDATE pestablishment_product_demand 
		SET in_ammount =  in_ammount - NEW.stock_product_input_qunatity
		WHERE idproduct = NEW.idproduct AND idpestablishment = NEW.idpestablishment;

	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stock_product_output`
--

DROP TABLE IF EXISTS `stock_product_output`;
CREATE TABLE IF NOT EXISTS `stock_product_output` (
`idstock_product_output` int(10) unsigned NOT NULL COMMENT '1 sales, 2 purchase, 3 adjust, 4 transfer, 5 production, 6 gift, 7 sales return, 8 purchase return',
  `stock_product_output_date` date NOT NULL,
  `idproduct` int(10) unsigned NOT NULL,
  `stock_product_output_qunatity` double NOT NULL,
  `stock_product_output_price` double NOT NULL DEFAULT '0',
  `idpestablishment` int(10) unsigned NOT NULL,
  `stock_product_output_type` tinyint(3) unsigned NOT NULL,
  `stock_product_output_status` tinyint(1) NOT NULL COMMENT '1 mean confirmed 0 mean not confirmed'
) ENGINE=InnoDB AUTO_INCREMENT=1945 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `stock_product_output`
--

INSERT INTO `stock_product_output` (`idstock_product_output`, `stock_product_output_date`, `idproduct`, `stock_product_output_qunatity`, `stock_product_output_price`, `idpestablishment`, `stock_product_output_type`, `stock_product_output_status`) VALUES
(1, '2014-12-09', 3, 52, 51, 1, 1, 1),
(2, '2014-12-09', 75, 20, 35, 1, 1, 1),
(3, '2014-12-09', 2, 65, 35, 1, 1, 1),
(4, '2014-12-09', 65, 11, 215, 1, 1, 1),
(5, '2014-12-09', 78, 36, 185, 1, 1, 1),
(6, '2014-12-09', 78, 10, 185, 1, 1, 1),
(7, '2014-12-11', 60, 20, 100, 1, 1, 1),
(8, '2014-12-13', 2, 195, 35, 1, 1, 1),
(9, '2014-12-13', 3, 299, 51, 1, 1, 1),
(10, '2014-12-13', 4, 195, 79, 1, 1, 1),
(11, '2014-12-13', 5, 130, 98, 1, 1, 1),
(12, '2014-12-13', 18, 10, 42, 1, 1, 1),
(13, '2014-12-13', 45, 6, 30, 1, 1, 1),
(14, '2014-12-13', 55, 18, 45, 1, 1, 1),
(15, '2014-12-13', 75, 12, 35, 1, 1, 1),
(16, '2014-12-13', 76, 6, 70, 1, 1, 1),
(17, '2014-12-13', 77, 7, 110, 1, 1, 1),
(18, '2014-12-13', 83, 4, 90, 1, 1, 1),
(19, '2014-12-13', 2, 26, 35, 1, 1, 1),
(20, '2014-12-13', 3, 52, 51, 1, 1, 1),
(21, '2014-12-13', 8, 36, 15, 1, 1, 1),
(22, '2014-12-13', 9, 18, 25, 1, 1, 1),
(23, '2014-12-13', 15, 36, 25, 1, 1, 1),
(24, '2014-12-13', 21, 6, 65, 1, 1, 1),
(25, '2014-12-13', 26, 6, 115, 1, 1, 1),
(26, '2014-12-13', 46, 36, 45, 1, 1, 1),
(27, '2014-12-13', 55, 18, 50, 1, 1, 1),
(28, '2014-12-13', 75, 36, 35, 1, 1, 1),
(29, '2014-12-13', 81, 12, 50, 1, 1, 1),
(30, '2014-12-13', 104, 12, 385, 1, 1, 1),
(31, '2014-12-13', 131, 9, 400, 1, 1, 1),
(32, '2014-12-13', 1, 3003, 23, 1, 1, 1),
(33, '2014-12-13', 2, 104, 35, 1, 1, 1),
(34, '2014-12-13', 3, 117, 51, 1, 1, 1),
(35, '2014-12-13', 4, 117, 79, 1, 1, 1),
(36, '2014-12-13', 6, 156, 152, 1, 1, 1),
(37, '2014-12-13', 7, 60, 11, 1, 1, 1),
(38, '2014-12-13', 12, 20, 89, 1, 1, 1),
(39, '2014-12-13', 15, 7, 25, 1, 1, 1),
(40, '2014-12-13', 27, 144, 110, 1, 1, 1),
(41, '2014-12-13', 44, 200, 18, 1, 1, 1),
(42, '2014-12-13', 53, 14, 35, 1, 1, 1),
(43, '2014-12-13', 67, 6, 250, 1, 1, 1),
(44, '2014-12-13', 73, 200, 13, 1, 1, 1),
(45, '2014-12-13', 78, 12, 185, 1, 1, 1),
(46, '2014-12-13', 68, 100, 125, 1, 1, 1),
(47, '2014-12-13', 18, 7, 42, 1, 1, 1),
(48, '2014-12-13', 54, 14, 40, 1, 1, 1),
(49, '2014-12-13', 56, 14, 95, 1, 1, 1),
(50, '2014-12-13', 59, 14, 98, 1, 1, 1),
(51, '2014-12-13', 136, 7, 20, 1, 1, 1),
(52, '2014-12-13', 98, 150, 115, 1, 1, 1),
(53, '2014-12-13', 102, 42, 180, 1, 1, 1),
(54, '2014-12-13', 129, 42, 210, 1, 1, 1),
(55, '2014-12-13', 268, 1, 1175, 1, 1, 1),
(56, '2014-12-13', 269, 2, 1350, 1, 1, 1),
(57, '2014-12-13', 94, 39, 99, 1, 1, 1),
(58, '2014-12-13', 78, 2, 185, 1, 1, 1),
(59, '2014-12-13', 81, 6, 40, 1, 1, 1),
(60, '2014-12-13', 3, 195, 51, 1, 1, 1),
(61, '2014-12-13', 4, 247, 79, 1, 1, 1),
(62, '2014-12-13', 5, 273, 98, 1, 1, 1),
(63, '2014-12-13', 75, 10, 35, 1, 1, 1),
(64, '2014-12-13', 78, 23, 185, 1, 1, 1),
(65, '2014-12-13', 81, 3, 40, 1, 1, 1),
(66, '2014-12-14', 3, 104, 51, 1, 1, 1),
(67, '2014-12-14', 4, 104, 79, 1, 1, 1),
(68, '2014-12-14', 9, 7, 25, 1, 1, 1),
(69, '2014-12-14', 10, 7, 37, 1, 1, 1),
(70, '2014-12-14', 75, 4, 35, 1, 1, 1),
(71, '2014-12-14', 76, 4, 70, 1, 1, 1),
(72, '2014-12-14', 1, 104, 23, 1, 1, 1),
(73, '2014-12-14', 3, 39, 51, 1, 1, 1),
(74, '2014-12-14', 4, 39, 79, 1, 1, 1),
(75, '2014-12-14', 5, 39, 98, 1, 1, 1),
(76, '2014-12-14', 27, 20, 110, 1, 1, 1),
(77, '2014-12-14', 73, 50, 13, 1, 1, 1),
(78, '2014-12-14', 94, 20, 99, 1, 1, 1),
(79, '2014-12-14', 1, 52, 23, 1, 1, 1),
(80, '2014-12-14', 38, 10, 110, 1, 1, 1),
(81, '2014-12-14', 44, 30, 18, 1, 1, 1),
(82, '2014-12-14', 94, 20, 99, 1, 1, 1),
(83, '2014-12-14', 147, 30, 10, 1, 1, 1),
(84, '2014-12-14', 1, 286, 23, 1, 1, 1),
(85, '2014-12-14', 33, 5, 115, 1, 1, 1),
(86, '2014-12-14', 38, 3, 115, 1, 1, 1),
(87, '2014-12-14', 94, 10, 115, 1, 1, 1),
(88, '2014-12-14', 44, 12, 20, 1, 1, 1),
(89, '2014-12-14', 73, 12, 17, 1, 1, 1),
(90, '2014-12-14', 126, 6, 950, 1, 1, 1),
(91, '2014-12-14', 1, 208, 23, 1, 1, 1),
(92, '2014-12-14', 2, 208, 35, 1, 1, 1),
(93, '2014-12-14', 3, 117, 51, 1, 1, 1),
(94, '2014-12-14', 5, 143, 98, 1, 1, 1),
(95, '2014-12-14', 7, 20, 11, 1, 1, 1),
(96, '2014-12-14', 8, 20, 15, 1, 1, 1),
(97, '2014-12-14', 9, 12, 25, 1, 1, 1),
(98, '2014-12-14', 11, 12, 55, 1, 1, 1),
(99, '2014-12-14', 13, 15, 18, 1, 1, 1),
(100, '2014-12-14', 27, 30, 110, 1, 1, 1),
(101, '2014-12-14', 28, 12, 155, 1, 1, 1),
(102, '2014-12-14', 38, 15, 110, 1, 1, 1),
(103, '2014-12-14', 44, 24, 18, 1, 1, 1),
(104, '2014-12-14', 45, 18, 30, 1, 1, 1),
(105, '2014-12-14', 53, 15, 35, 1, 1, 1),
(106, '2014-12-14', 73, 60, 13, 1, 1, 1),
(107, '2014-12-14', 74, 50, 20, 1, 1, 1),
(108, '2014-12-14', 75, 20, 35, 1, 1, 1),
(109, '2014-12-14', 77, 8, 110, 1, 1, 1),
(110, '2014-12-14', 69, 10, 150, 1, 1, 1),
(111, '2014-12-14', 68, 40, 125, 1, 1, 1),
(112, '2014-12-14', 87, 1, 130, 1, 1, 1),
(113, '2014-12-14', 31, 1, 750, 1, 1, 1),
(114, '2014-12-14', 29, 12, 305, 1, 1, 1),
(115, '2014-12-14', 61, 6, 105, 1, 1, 1),
(116, '2014-12-14', 79, 12, 30, 1, 1, 1),
(117, '2014-12-14', 98, 40, 115, 1, 1, 1),
(118, '2014-12-14', 99, 12, 150, 1, 1, 1),
(119, '2014-12-14', 106, 1, 695, 1, 1, 1),
(120, '2014-12-14', 94, 111, 99, 1, 1, 1),
(121, '2014-12-14', 125, 1, 1700, 1, 1, 1),
(122, '2014-12-15', 2, 364, 35, 1, 1, 1),
(123, '2014-12-15', 73, 400, 13, 1, 1, 1),
(124, '2014-12-15', 74, 150, 20, 1, 1, 1),
(125, '2014-12-15', 79, 40, 30, 1, 1, 1),
(126, '2014-12-15', 1, 520, 23, 1, 1, 1),
(127, '2014-12-15', 2, 273, 35, 1, 1, 1),
(128, '2014-12-15', 7, 20, 11, 1, 1, 1),
(129, '2014-12-15', 8, 4, 15, 1, 1, 1),
(130, '2014-12-15', 38, 8, 110, 1, 1, 1),
(131, '2014-12-15', 44, 26, 18, 1, 1, 1),
(132, '2014-12-15', 45, 18, 30, 1, 1, 1),
(133, '2014-12-15', 73, 47, 13, 1, 1, 1),
(134, '2014-12-15', 74, 92, 20, 1, 1, 1),
(135, '2014-12-15', 79, 59, 30, 1, 1, 1),
(136, '2014-12-15', 94, 127, 99, 1, 1, 1),
(137, '2014-12-15', 120, 15, 375, 1, 1, 1),
(138, '2014-12-15', 121, 20, 465, 1, 1, 1),
(139, '2014-12-15', 7, 16, 11, 1, 1, 1),
(140, '2014-12-15', 44, 24, 18, 1, 1, 1),
(141, '2014-12-15', 45, 9, 30, 1, 1, 1),
(142, '2014-12-15', 73, 16, 13, 1, 1, 1),
(143, '2014-12-15', 74, 6, 20, 1, 1, 1),
(144, '2014-12-15', 96, 9, 125, 1, 1, 1),
(145, '2014-12-15', 7, 52, 11, 1, 1, 1),
(146, '2014-12-15', 27, 125, 110, 1, 1, 1),
(147, '2014-12-15', 44, 68, 18, 1, 1, 1),
(148, '2014-12-15', 33, 5, 115, 1, 1, 1),
(149, '2014-12-15', 73, 12, 13, 1, 1, 1),
(150, '2014-12-15', 27, 410, 110, 1, 1, 1),
(151, '2014-12-17', 33, 40, 115, 1, 1, 1),
(152, '2014-12-17', 35, 10, 130, 1, 1, 1),
(153, '2014-12-17', 96, 10, 125, 1, 1, 1),
(154, '2014-12-17', 94, 40, 99, 1, 1, 1),
(155, '2014-12-17', 45, 15, 30, 1, 1, 1),
(156, '2014-12-17', 60, 8, 100, 1, 1, 1),
(157, '2014-12-17', 31, 2, 750, 1, 1, 1),
(158, '2014-12-17', 139, 1, 75, 1, 1, 1),
(159, '2014-12-17', 96, 20, 125, 1, 1, 1),
(160, '2014-12-17', 147, 30, 10, 1, 1, 1),
(161, '2014-12-17', 10, 24, 37, 1, 1, 1),
(162, '2014-12-17', 47, 24, 80, 1, 1, 1),
(163, '2014-12-17', 75, 9, 35, 1, 1, 1),
(164, '2014-12-17', 77, 6, 110, 1, 1, 1),
(165, '2014-12-17', 78, 24, 185, 1, 1, 1),
(166, '2014-12-17', 65, 11, 215, 1, 1, 1),
(167, '2014-12-17', 30, 24, 550, 1, 1, 1),
(168, '2014-12-17', 123, 12, 750, 1, 1, 1),
(169, '2014-12-17', 33, 100, 115, 1, 1, 1),
(170, '2014-12-17', 94, 150, 99, 1, 1, 1),
(171, '2014-12-17', 1, 221, 23, 1, 1, 1),
(172, '2014-12-17', 2, 104, 35, 1, 1, 1),
(173, '2014-12-17', 5, 195, 98, 1, 1, 1),
(174, '2014-12-17', 6, 117, 152, 1, 1, 1),
(175, '2014-12-17', 7, 15, 11, 1, 1, 1),
(176, '2014-12-17', 11, 2, 55, 1, 1, 1),
(177, '2014-12-17', 12, 12, 89, 1, 1, 1),
(178, '2014-12-17', 15, 6, 25, 1, 1, 1),
(179, '2014-12-17', 27, 20, 110, 1, 1, 1),
(180, '2014-12-17', 38, 10, 110, 1, 1, 1),
(181, '2014-12-17', 44, 35, 18, 1, 1, 1),
(182, '2014-12-17', 45, 15, 30, 1, 1, 1),
(183, '2014-12-17', 49, 2, 220, 1, 1, 1),
(184, '2014-12-17', 53, 20, 35, 1, 1, 1),
(185, '2014-12-17', 60, 18, 100, 1, 1, 1),
(186, '2014-12-17', 67, 6, 250, 1, 1, 1),
(187, '2014-12-17', 33, 35, 115, 1, 1, 1),
(188, '2014-12-17', 73, 50, 13, 1, 1, 1),
(189, '2014-12-17', 74, 20, 20, 1, 1, 1),
(190, '2014-12-17', 77, 10, 110, 1, 1, 1),
(191, '2014-12-17', 78, 8, 185, 1, 1, 1),
(192, '2014-12-17', 139, 3, 75, 1, 1, 1),
(193, '2014-12-17', 65, 8, 215, 1, 1, 1),
(194, '2014-12-17', 14, 4, 20, 1, 1, 1),
(195, '2014-12-17', 140, 2, 105, 1, 1, 1),
(196, '2014-12-17', 137, 4, 35, 1, 1, 1),
(197, '2014-12-17', 136, 26, 20, 1, 1, 1),
(198, '2014-12-17', 32, 1, 1080, 1, 1, 1),
(199, '2014-12-17', 79, 12, 30, 1, 1, 1),
(200, '2014-12-17', 94, 40, 99, 1, 1, 1),
(201, '2014-12-17', 106, 6, 695, 1, 1, 1),
(202, '2014-12-17', 107, 3, 885, 1, 1, 1),
(203, '2014-12-17', 265, 7, 425, 1, 1, 1),
(204, '2014-12-17', 268, 6, 1175, 1, 1, 1),
(205, '2014-12-17', 269, 1, 1350, 1, 1, 1),
(206, '2014-12-17', 147, 40, 10, 1, 1, 1),
(207, '2014-12-17', 153, 1, 8500, 1, 1, 1),
(208, '2014-12-17', 94, 14, 99, 1, 1, 1),
(209, '2014-12-18', 21, 4, 59, 1, 1, 1),
(210, '2014-12-18', 4, 52, 79, 1, 1, 1),
(211, '2014-12-18', 76, 10, 70, 1, 1, 1),
(212, '2014-12-18', 12, 1, 89, 1, 1, 1),
(213, '2014-12-18', 22, 3, 65, 1, 1, 1),
(214, '2014-12-18', 2, 39, 35, 1, 1, 1),
(215, '2014-12-18', 4, 156, 79, 1, 1, 1),
(216, '2014-12-18', 10, 15, 37, 1, 1, 1),
(217, '2014-12-18', 76, 10, 70, 1, 1, 1),
(218, '2014-12-20', 3, 130, 51, 1, 1, 1),
(219, '2014-12-20', 4, 52, 79, 1, 1, 1),
(220, '2014-12-20', 5, 208, 98, 1, 1, 1),
(221, '2014-12-20', 75, 10, 35, 1, 1, 1),
(222, '2014-12-20', 94, 50, 115, 1, 1, 1),
(223, '2014-12-20', 73, 50, 17, 1, 1, 1),
(224, '2014-12-21', 49, 1, 220, 1, 1, 1),
(225, '2014-12-21', 91, 1, 220, 1, 1, 1),
(226, '2014-12-21', 2, 247, 35, 1, 1, 1),
(227, '2014-12-21', 3, 104, 51, 1, 1, 1),
(228, '2014-12-21', 4, 130, 79, 1, 1, 1),
(229, '2014-12-21', 5, 39, 98, 1, 1, 1),
(230, '2014-12-21', 6, 208, 152, 1, 1, 1),
(231, '2014-12-21', 15, 6, 25, 1, 1, 1),
(232, '2014-12-21', 74, 40, 20, 1, 1, 1),
(233, '2014-12-21', 18, 10, 42, 1, 1, 1),
(234, '2014-12-21', 84, 4, 100, 1, 1, 1),
(235, '2014-12-21', 121, 20, 465, 1, 1, 1),
(236, '2014-12-21', 147, 150, 10, 1, 1, 1),
(237, '2014-12-21', 1, 143, 23, 1, 1, 1),
(238, '2014-12-21', 2, 52, 35, 1, 1, 1),
(239, '2014-12-21', 27, 3, 130, 1, 1, 1),
(240, '2014-12-21', 237, 2, 135, 1, 1, 1),
(241, '2014-12-21', 38, 3, 115, 1, 1, 1),
(242, '2014-12-21', 233, 2, 135, 1, 1, 1),
(243, '2014-12-21', 44, 15, 20, 1, 1, 1),
(244, '2014-12-21', 45, 12, 35, 1, 1, 1),
(245, '2014-12-21', 33, 10, 115, 1, 1, 1),
(246, '2014-12-21', 35, 3, 135, 1, 1, 1),
(247, '2014-12-21', 73, 15, 17, 1, 1, 1),
(248, '2014-12-21', 74, 10, 22, 1, 1, 1),
(249, '2014-12-21', 36, 3, 170, 1, 1, 1),
(250, '2014-12-21', 135, 2, 12, 1, 1, 1),
(251, '2014-12-21', 79, 10, 30, 1, 1, 1),
(252, '2014-12-21', 94, 15, 115, 1, 1, 1),
(253, '2014-12-21', 96, 5, 144, 1, 1, 1),
(254, '2014-12-21', 98, 3, 118, 1, 1, 1),
(255, '2014-12-21', 108, 3, 280, 1, 1, 1),
(256, '2014-12-21', 130, 2, 300, 1, 1, 1),
(257, '2014-12-21', 45, 15, 30, 1, 1, 1),
(258, '2014-12-21', 92, 5, 250, 1, 1, 1),
(259, '2014-12-21', 94, 10, 99, 1, 1, 1),
(260, '2014-12-21', 132, 5, 460, 1, 1, 1),
(261, '2014-12-21', 133, 5, 698, 1, 1, 1),
(262, '2014-12-21', 134, 5, 935, 1, 1, 1),
(263, '2014-12-21', 147, 60, 10, 1, 1, 1),
(264, '2014-12-21', 74, 5, 22, 1, 1, 1),
(265, '2014-12-22', 1, 507, 23, 1, 1, 1),
(266, '2014-12-22', 7, 50, 11, 1, 1, 1),
(267, '2014-12-22', 8, 50, 15, 1, 1, 1),
(268, '2014-12-22', 33, 50, 115, 1, 1, 1),
(269, '2014-12-22', 35, 74, 130, 1, 1, 1),
(270, '2014-12-22', 109, 24, 420, 1, 1, 1),
(271, '2014-12-22', 147, 50, 10, 1, 1, 1),
(272, '2014-12-22', 1, 1196, 23, 1, 1, 1),
(273, '2014-12-22', 7, 150, 11, 1, 1, 1),
(274, '2014-12-22', 13, 20, 18, 1, 1, 1),
(275, '2014-12-22', 27, 30, 110, 1, 1, 1),
(276, '2014-12-22', 38, 60, 110, 1, 1, 1),
(277, '2014-12-22', 44, 250, 18, 1, 1, 1),
(278, '2014-12-22', 33, 130, 115, 1, 1, 1),
(279, '2014-12-22', 73, 300, 13, 1, 1, 1),
(280, '2014-12-22', 135, 30, 12, 1, 1, 1),
(281, '2014-12-22', 68, 20, 125, 1, 1, 1),
(282, '2014-12-22', 79, 20, 30, 1, 1, 1),
(283, '2014-12-22', 94, 130, 99, 1, 1, 1),
(284, '2014-12-22', 98, 30, 115, 1, 1, 1),
(285, '2014-12-22', 102, 70, 180, 1, 1, 1),
(286, '2014-12-22', 114, 30, 280, 1, 1, 1),
(287, '2014-12-22', 120, 26, 375, 1, 1, 1),
(288, '2014-12-22', 126, 24, 950, 1, 1, 1),
(289, '2014-12-22', 147, 150, 10, 1, 1, 1),
(290, '2014-12-22', 153, 1, 8500, 1, 1, 1),
(291, '2014-12-22', 1, 1196, 23, 1, 1, 1),
(292, '2014-12-22', 31, 6, 750, 1, 1, 1),
(293, '2014-12-22', 29, 6, 305, 1, 1, 1),
(294, '2014-12-22', 1, 494, 23, 1, 1, 1),
(295, '2014-12-22', 73, 80, 13, 1, 1, 1),
(296, '2014-12-22', 74, 15, 20, 1, 1, 1),
(297, '2014-12-22', 79, 30, 30, 1, 1, 1),
(298, '2014-12-22', 94, 55, 99, 1, 1, 1),
(299, '2014-12-22', 34, 12, 120, 1, 1, 1),
(300, '2014-12-23', 3, 130, 51, 1, 1, 1),
(301, '2014-12-23', 4, 78, 79, 1, 1, 1),
(302, '2014-12-23', 10, 6, 37, 1, 1, 1),
(303, '2014-12-23', 40, 6, 295, 1, 1, 1),
(304, '2014-12-23', 1, 247, 23, 1, 1, 1),
(305, '2014-12-23', 3, 403, 51, 1, 1, 1),
(306, '2014-12-23', 9, 24, 25, 1, 1, 1),
(307, '2014-12-23', 27, 50, 110, 1, 1, 1),
(308, '2014-12-23', 38, 50, 110, 1, 1, 1),
(309, '2014-12-23', 44, 30, 18, 1, 1, 1),
(310, '2014-12-23', 46, 12, 40, 1, 1, 1),
(311, '2014-12-23', 33, 80, 115, 1, 1, 1),
(312, '2014-12-23', 73, 40, 13, 1, 1, 1),
(313, '2014-12-23', 75, 24, 35, 1, 1, 1),
(314, '2014-12-23', 54, 80, 40, 1, 1, 1),
(315, '2014-12-23', 80, 24, 35, 1, 1, 1),
(316, '2014-12-23', 110, 8, 560, 1, 1, 1),
(317, '2014-12-23', 29, 12, 305, 1, 1, 1),
(318, '2014-12-23', 40, 12, 295, 1, 1, 1),
(319, '2014-12-23', 14, 15, 20, 1, 1, 1),
(320, '2014-12-23', 94, 100, 99, 1, 1, 1),
(321, '2014-12-23', 108, 10, 280, 1, 1, 1),
(322, '2014-12-23', 6, 117, 152, 1, 1, 1),
(323, '2014-12-23', 67, 4, 250, 1, 1, 1),
(324, '2014-12-23', 91, 1, 220, 1, 1, 1),
(325, '2014-12-23', 65, 4, 215, 1, 1, 1),
(326, '2014-12-23', 78, 8, 185, 1, 1, 1),
(327, '2014-12-23', 124, 7, 1400, 1, 1, 1),
(328, '2014-12-23', 125, 1, 1700, 1, 1, 1),
(329, '2014-12-23', 32, 1, 1080, 1, 1, 1),
(330, '2014-12-23', 31, 3, 750, 1, 1, 1),
(331, '2014-12-23', 77, 6, 110, 1, 1, 1),
(332, '2014-12-23', 48, 1, 125, 1, 1, 1),
(333, '2014-12-23', 61, 3, 105, 1, 1, 1),
(334, '2014-12-23', 87, 2, 130, 1, 1, 1),
(335, '2014-12-23', 75, 4, 35, 1, 1, 1),
(336, '2014-12-23', 3, 13, 51, 1, 1, 1),
(337, '2014-12-23', 5, 26, 98, 1, 1, 1),
(338, '2014-12-23', 12, 6, 89, 1, 1, 1),
(339, '2014-12-23', 122, 7, 500, 1, 1, 1),
(340, '2014-12-23', 64, 1, 210, 1, 1, 1),
(341, '2014-12-23', 73, 14, 13, 1, 1, 1),
(342, '2014-12-23', 94, 7, 99, 1, 1, 1),
(343, '2014-12-23', 33, 4, 115, 1, 1, 1),
(344, '2014-12-23', 44, 8, 18, 1, 1, 1),
(345, '2014-12-23', 7, 3, 11, 1, 1, 1),
(346, '2014-12-23', 126, 2, 950, 1, 1, 1),
(347, '2014-12-23', 120, 1, 375, 1, 1, 1),
(348, '2014-12-23', 147, 11, 10, 1, 1, 1),
(349, '2014-12-23', 1, 104, 23, 1, 1, 1),
(350, '2014-12-23', 74, 1, 20, 1, 1, 1),
(351, '2014-12-24', 94, 150, 99, 1, 1, 1),
(352, '2014-12-24', 1, 299, 23, 1, 1, 1),
(353, '2014-12-24', 7, 6, 11, 1, 1, 1),
(354, '2014-12-24', 38, 10, 110, 1, 1, 1),
(355, '2014-12-24', 44, 20, 18, 1, 1, 1),
(356, '2014-12-24', 53, 14, 35, 1, 1, 1),
(357, '2014-12-24', 33, 8, 115, 1, 1, 1),
(358, '2014-12-24', 73, 90, 13, 1, 1, 1),
(359, '2014-12-24', 94, 30, 99, 1, 1, 1),
(360, '2014-12-27', 244, 195, 23, 1, 1, 1),
(361, '2014-12-27', 73, 70, 17, 1, 1, 1),
(362, '2014-12-27', 94, 40, 115, 1, 1, 1),
(363, '2014-12-27', 44, 30, 20, 1, 1, 1),
(364, '2014-12-27', 7, 30, 11, 1, 1, 1),
(365, '2014-12-27', 27, 10, 130, 1, 1, 1),
(366, '2014-12-27', 135, 30, 12, 1, 1, 1),
(367, '2014-12-27', 126, 8, 950, 1, 1, 1),
(368, '2014-12-28', 125, 3, 1700, 1, 1, 1),
(369, '2014-12-28', 3, 91, 51, 1, 1, 1),
(370, '2014-12-28', 9, 8, 25, 1, 1, 1),
(371, '2014-12-28', 1, 247, 23, 1, 1, 1),
(372, '2014-12-28', 7, 20, 11, 1, 1, 1),
(373, '2014-12-28', 44, 15, 18, 1, 1, 1),
(374, '2014-12-28', 74, 40, 20, 1, 1, 1),
(375, '2014-12-28', 3, 195, 51, 1, 1, 1),
(376, '2014-12-28', 5, 65, 98, 1, 1, 1),
(377, '2014-12-28', 6, 52, 152, 1, 1, 1),
(378, '2014-12-28', 31, 3, 750, 1, 1, 1),
(379, '2014-12-28', 29, 4, 305, 1, 1, 1),
(380, '2014-12-28', 143, 24, 20, 1, 1, 1),
(381, '2014-12-28', 11, 20, 60, 1, 1, 1),
(382, '2014-12-28', 127, 4, 1190, 1, 1, 1),
(383, '2014-12-28', 8, 4, 15, 1, 1, 1),
(384, '2014-12-28', 27, 5, 130, 1, 1, 1),
(385, '2014-12-28', 28, 3, 165, 1, 1, 1),
(386, '2014-12-28', 73, 6, 17, 1, 1, 1),
(387, '2014-12-28', 74, 3, 22, 1, 1, 1),
(388, '2014-12-28', 79, 8, 30, 1, 1, 1),
(389, '2014-12-28', 94, 12, 115, 1, 1, 1),
(390, '2014-12-28', 129, 1, 230, 1, 1, 1),
(391, '2014-12-28', 130, 2, 300, 1, 1, 1),
(392, '2014-12-28', 11, 5, 60, 1, 1, 1),
(393, '2014-12-30', 29, 3, 305, 1, 1, 1),
(394, '2014-12-30', 61, 1, 105, 1, 1, 1),
(395, '2014-12-30', 127, 9, 1190, 1, 1, 1),
(396, '2014-12-30', 128, 9, 825, 1, 1, 1),
(397, '2015-01-01', 1, 299, 23, 1, 1, 1),
(398, '2015-01-01', 2, 52, 35, 1, 1, 1),
(399, '2015-01-01', 3, 169, 51, 1, 1, 1),
(400, '2015-01-01', 4, 143, 79, 1, 1, 1),
(401, '2015-01-01', 5, 78, 98, 1, 1, 1),
(402, '2015-01-01', 8, 3, 15, 1, 1, 1),
(403, '2015-01-01', 9, 12, 25, 1, 1, 1),
(404, '2015-01-01', 10, 25, 37, 1, 1, 1),
(405, '2015-01-01', 11, 8, 55, 1, 1, 1),
(406, '2015-01-01', 15, 20, 25, 1, 1, 1),
(407, '2015-01-01', 55, 2, 45, 1, 1, 1),
(408, '2015-01-01', 73, 6, 13, 1, 1, 1),
(409, '2015-01-01', 74, 7, 20, 1, 1, 1),
(410, '2015-01-01', 75, 5, 35, 1, 1, 1),
(411, '2015-01-01', 22, 3, 65, 1, 1, 1),
(412, '2015-01-01', 61, 5, 105, 1, 1, 1),
(413, '2015-01-01', 58, 12, 98, 1, 1, 1),
(414, '2015-01-01', 1, 793, 23, 1, 1, 1),
(415, '2015-01-01', 2, 208, 35, 1, 1, 1),
(416, '2015-01-01', 73, 50, 13, 1, 1, 1),
(417, '2015-01-01', 1, 403, 23, 1, 1, 1),
(418, '2015-01-01', 27, 35, 110, 1, 1, 1),
(419, '2015-01-01', 29, 12, 305, 1, 1, 1),
(420, '2015-01-01', 31, 12, 750, 1, 1, 1),
(421, '2015-01-01', 121, 32, 465, 1, 1, 1),
(422, '2015-01-01', 6, 364, 152, 1, 1, 1),
(423, '2015-01-01', 12, 12, 89, 1, 1, 1),
(424, '2015-01-01', 49, 2, 220, 1, 1, 1),
(425, '2015-01-01', 67, 20, 250, 1, 1, 1),
(426, '2015-01-01', 78, 30, 185, 1, 1, 1),
(427, '2015-01-01', 43, 4, 1000, 1, 1, 1),
(428, '2015-01-01', 32, 4, 1080, 1, 1, 1),
(429, '2015-01-03', 1, 403, 23, 1, 1, 1),
(430, '2015-01-03', 2, 104, 35, 1, 1, 1),
(431, '2015-01-03', 3, 195, 51, 1, 1, 1),
(432, '2015-01-03', 7, 50, 11, 1, 1, 1),
(433, '2015-01-03', 8, 36, 15, 1, 1, 1),
(434, '2015-01-03', 55, 30, 45, 1, 1, 1),
(435, '2015-01-03', 33, 80, 115, 1, 1, 1),
(436, '2015-01-03', 73, 150, 13, 1, 1, 1),
(437, '2015-01-03', 75, 60, 35, 1, 1, 1),
(438, '2015-01-03', 79, 50, 30, 1, 1, 1),
(439, '2015-01-03', 94, 300, 99, 1, 1, 1),
(440, '2015-01-03', 147, 100, 10, 1, 1, 1),
(441, '2015-01-03', 1, 39, 23, 1, 1, 1),
(442, '2015-01-03', 7, 4, 11, 1, 1, 1),
(443, '2015-01-03', 13, 7, 20, 1, 1, 1),
(444, '2015-01-03', 27, 6, 130, 1, 1, 1),
(445, '2015-01-03', 28, 3, 165, 1, 1, 1),
(446, '2015-01-03', 33, 6, 115, 1, 1, 1),
(447, '2015-01-03', 73, 15, 17, 1, 1, 1),
(448, '2015-01-03', 74, 5, 22, 1, 1, 1),
(449, '2015-01-03', 79, 4, 30, 1, 1, 1),
(450, '2015-01-03', 94, 5, 115, 1, 1, 1),
(451, '2015-01-03', 102, 3, 220, 1, 1, 1),
(452, '2015-01-03', 1, 39, 23, 1, 1, 1),
(453, '2015-01-06', 73, 100, 17, 1, 1, 1),
(454, '2015-01-06', 74, 100, 22, 1, 1, 1),
(455, '2015-01-06', 3, 78, 51, 1, 1, 1),
(456, '2015-01-06', 4, 234, 79, 1, 1, 1),
(457, '2015-01-06', 5, 312, 98, 1, 1, 1),
(458, '2015-01-06', 76, 12, 70, 1, 1, 1),
(459, '2015-01-06', 73, 100, 13, 1, 1, 1),
(460, '2015-01-06', 74, 100, 20, 1, 1, 1),
(461, '2015-01-07', 1, 1495, 23, 1, 1, 1),
(462, '2015-01-07', 2, 195, 35, 1, 1, 1),
(463, '2015-01-07', 3, 403, 51, 1, 1, 1),
(464, '2015-01-07', 5, 455, 98, 1, 1, 1),
(465, '2015-01-07', 9, 40, 25, 1, 1, 1),
(466, '2015-01-07', 11, 40, 55, 1, 1, 1),
(467, '2015-01-07', 15, 10, 25, 1, 1, 1),
(468, '2015-01-07', 21, 5, 59, 1, 1, 1),
(469, '2015-01-07', 27, 100, 110, 1, 1, 1),
(470, '2015-01-07', 44, 50, 18, 1, 1, 1),
(471, '2015-01-07', 45, 40, 30, 1, 1, 1),
(472, '2015-01-07', 53, 115, 35, 1, 1, 1),
(473, '2015-01-07', 60, 15, 100, 1, 1, 1),
(474, '2015-01-07', 33, 50, 115, 1, 1, 1),
(475, '2015-01-07', 73, 300, 13, 1, 1, 1),
(476, '2015-01-07', 77, 35, 110, 1, 1, 1),
(477, '2015-01-07', 79, 150, 30, 1, 1, 1),
(478, '2015-01-07', 94, 200, 99, 1, 1, 1),
(479, '2015-01-07', 103, 60, 245, 1, 1, 1),
(480, '2015-01-07', 130, 60, 280, 1, 1, 1),
(481, '2015-01-07', 147, 300, 10, 1, 1, 1),
(482, '2015-01-07', 9, 2, 25, 1, 1, 1),
(483, '2015-01-07', 11, 12, 55, 1, 1, 1),
(484, '2015-01-07', 12, 2, 89, 1, 1, 1),
(485, '2015-01-07', 73, 10, 13, 1, 1, 1),
(486, '2015-01-07', 75, 2, 35, 1, 1, 1),
(487, '2015-01-07', 77, 16, 110, 1, 1, 1),
(488, '2015-01-07', 78, 3, 185, 1, 1, 1),
(489, '2015-01-07', 277, 1, 1080, 1, 1, 1),
(490, '2015-01-07', 31, 1, 750, 1, 1, 1),
(491, '2015-01-07', 43, 1, 1000, 1, 1, 1),
(492, '2015-01-07', 65, 1, 215, 1, 1, 1),
(493, '2015-01-07', 248, 169, 105, 1, 1, 1),
(494, '2015-01-07', 249, 78, 158, 1, 1, 1),
(495, '2015-01-07', 93, 1, 260, 1, 1, 1),
(496, '2015-01-07', 107, 2, 885, 1, 1, 1),
(497, '2015-01-07', 131, 1, 365, 1, 1, 1),
(498, '2015-01-07', 134, 1, 935, 1, 1, 1),
(499, '2015-01-07', 1, 39, 23, 1, 1, 1),
(500, '2015-01-07', 2, 26, 35, 1, 1, 1),
(501, '2015-01-07', 27, 2, 130, 1, 1, 1),
(502, '2015-01-07', 28, 1, 165, 1, 1, 1),
(503, '2015-01-07', 74, 5, 22, 1, 1, 1),
(504, '2015-01-07', 79, 3, 30, 1, 1, 1),
(505, '2015-01-07', 129, 1, 230, 1, 1, 1),
(506, '2015-01-07', 130, 1, 300, 1, 1, 1),
(507, '2015-01-08', 1, 1001, 23, 1, 1, 1),
(508, '2015-01-08', 7, 100, 11, 1, 1, 1),
(509, '2015-01-08', 44, 250, 18, 1, 1, 1),
(510, '2015-01-08', 33, 150, 115, 1, 1, 1),
(511, '2015-01-08', 73, 500, 13, 1, 1, 1),
(512, '2015-01-08', 154, 2, 2000, 1, 1, 1),
(513, '2015-01-08', 94, 250, 99, 1, 1, 1),
(514, '2015-01-08', 102, 80, 180, 1, 1, 1),
(515, '2015-01-08', 120, 50, 375, 1, 1, 1),
(516, '2015-01-08', 126, 30, 950, 1, 1, 1),
(517, '2015-01-08', 147, 150, 10, 1, 1, 1),
(518, '2015-01-08', 27, 6, 110, 1, 1, 1),
(539, '2015-01-08', 7, 24, 11, 1, 1, 1),
(540, '2015-01-08', 8, 6, 15, 1, 1, 1),
(541, '2015-01-08', 9, 6, 25, 1, 1, 1),
(542, '2015-01-08', 13, 10, 18, 1, 1, 1),
(543, '2015-01-08', 15, 16, 25, 1, 1, 1),
(544, '2015-01-08', 27, 52, 110, 1, 1, 1),
(545, '2015-01-08', 44, 60, 18, 1, 1, 1),
(546, '2015-01-08', 45, 24, 30, 1, 1, 1),
(547, '2015-01-08', 53, 184, 35, 1, 1, 1),
(548, '2015-01-08', 33, 48, 115, 1, 1, 1),
(549, '2015-01-08', 73, 280, 13, 1, 1, 1),
(550, '2015-01-08', 74, 216, 20, 1, 1, 1),
(551, '2015-01-08', 244, 1703, 26, 1, 1, 1),
(552, '2015-01-08', 2, 2197, 39, 1, 1, 1),
(553, '2015-01-08', 246, 208, 55, 1, 1, 1),
(554, '2015-01-08', 79, 30, 30, 1, 1, 1),
(555, '2015-01-08', 94, 80, 99, 1, 1, 1),
(556, '2015-01-08', 265, 14, 425, 1, 1, 1),
(557, '2015-01-08', 126, 12, 950, 1, 1, 1),
(558, '2015-01-08', 147, 120, 10, 1, 1, 1),
(559, '2015-01-10', 1, 403, 23, 1, 1, 1),
(560, '2015-01-10', 2, 455, 35, 1, 1, 1),
(561, '2015-01-10', 7, 10, 11, 1, 1, 1),
(562, '2015-01-10', 27, 8, 110, 1, 1, 1),
(563, '2015-01-10', 44, 120, 18, 1, 1, 1),
(564, '2015-01-10', 45, 80, 30, 1, 1, 1),
(565, '2015-01-10', 33, 60, 115, 1, 1, 1),
(566, '2015-01-10', 35, 35, 130, 1, 1, 1),
(567, '2015-01-10', 73, 100, 13, 1, 1, 1),
(568, '2015-01-10', 74, 120, 20, 1, 1, 1),
(569, '2015-01-10', 101, 14, 320, 1, 1, 1),
(570, '2015-01-10', 79, 70, 30, 1, 1, 1),
(571, '2015-01-10', 94, 80, 99, 1, 1, 1),
(572, '2015-01-10', 96, 30, 125, 1, 1, 1),
(573, '2015-01-10', 130, 14, 280, 1, 1, 1),
(574, '2015-01-10', 147, 100, 10, 1, 1, 1),
(575, '2015-01-10', 1, 13, 23, 1, 1, 1),
(576, '2015-01-10', 2, 13, 35, 1, 1, 1),
(577, '2015-01-10', 44, 4, 18, 1, 1, 1),
(578, '2015-01-10', 45, 2, 30, 1, 1, 1),
(579, '2015-01-10', 33, 4, 115, 1, 1, 1),
(580, '2015-01-10', 73, 6, 13, 1, 1, 1),
(581, '2015-01-10', 74, 4, 20, 1, 1, 1),
(582, '2015-01-10', 79, 2, 30, 1, 1, 1),
(583, '2015-01-10', 94, 4, 99, 1, 1, 1),
(584, '2015-01-10', 103, 1, 245, 1, 1, 1),
(585, '2015-01-10', 121, 1, 465, 1, 1, 1),
(586, '2015-01-10', 126, 1, 950, 1, 1, 1),
(587, '2015-01-10', 39, 8, 160, 1, 1, 1),
(588, '2015-01-10', 234, 5, 850, 1, 1, 1),
(589, '2015-01-10', 1, 429, 23, 1, 1, 1),
(590, '2015-01-10', 2, 208, 35, 1, 1, 1),
(591, '2015-01-10', 3, 104, 51, 1, 1, 1),
(592, '2015-01-10', 7, 30, 11, 1, 1, 1),
(593, '2015-01-10', 44, 50, 18, 1, 1, 1),
(594, '2015-01-10', 53, 24, 35, 1, 1, 1),
(595, '2015-01-10', 55, 6, 45, 1, 1, 1),
(596, '2015-01-10', 33, 56, 115, 1, 1, 1),
(597, '2015-01-10', 73, 50, 13, 1, 1, 1),
(598, '2015-01-10', 79, 36, 30, 1, 1, 1),
(599, '2015-01-10', 264, 12, 315, 1, 1, 1),
(600, '2015-01-10', 265, 6, 425, 1, 1, 1),
(601, '2015-01-10', 126, 36, 950, 1, 1, 1),
(602, '2015-01-10', 81, 4, 40, 1, 1, 1),
(603, '2015-01-10', 94, 70, 99, 1, 1, 1),
(604, '2015-01-10', 147, 60, 10, 1, 1, 1),
(605, '2015-01-10', 148, 18, 14, 1, 1, 1),
(606, '2015-01-11', 7, 24, 11, 1, 1, 1),
(607, '2015-01-11', 8, 24, 15, 1, 1, 1),
(608, '2015-01-11', 27, 60, 110, 1, 1, 1),
(609, '2015-01-11', 1, 195, 23, 1, 1, 1),
(610, '2015-01-11', 27, 30, 130, 1, 1, 1),
(619, '2015-01-12', 1, 832, 23, 1, 1, 1),
(620, '2015-01-12', 2, 299, 35, 1, 1, 1),
(621, '2015-01-12', 7, 100, 11, 1, 1, 1),
(622, '2015-01-12', 27, 20, 110, 1, 1, 1),
(623, '2015-01-12', 44, 80, 18, 1, 1, 1),
(624, '2015-01-12', 53, 50, 35, 1, 1, 1),
(625, '2015-01-12', 33, 50, 115, 1, 1, 1),
(626, '2015-01-12', 73, 100, 13, 1, 1, 1),
(627, '2015-01-12', 68, 20, 125, 1, 1, 1),
(628, '2015-01-12', 79, 55, 30, 1, 1, 1),
(629, '2015-01-12', 94, 100, 99, 1, 1, 1),
(630, '2015-01-12', 98, 30, 115, 1, 1, 1),
(631, '2015-01-12', 265, 20, 425, 1, 1, 1),
(632, '2015-01-12', 147, 100, 10, 1, 1, 1),
(633, '2015-01-12', 38, 20, 110, 1, 1, 1),
(634, '2015-01-12', 2, 78, 35, 1, 1, 1),
(635, '2015-01-12', 5, 91, 98, 1, 1, 1),
(636, '2015-01-12', 6, 104, 152, 1, 1, 1),
(637, '2015-01-12', 11, 10, 55, 1, 1, 1),
(638, '2015-01-12', 77, 10, 110, 1, 1, 1),
(639, '2015-01-12', 78, 0, 185, 1, 1, 1),
(640, '2015-01-12', 31, 1, 750, 1, 1, 1),
(641, '2015-01-12', 32, 1, 1080, 1, 1, 1),
(642, '2015-01-12', 1, 377, 23, 1, 1, 1),
(643, '2015-01-12', 2, 104, 35, 1, 1, 1),
(644, '2015-01-12', 44, 100, 18, 1, 1, 1),
(645, '2015-01-12', 45, 20, 30, 1, 1, 1),
(646, '2015-01-12', 74, 20, 20, 1, 1, 1),
(647, '2015-01-12', 79, 50, 30, 1, 1, 1),
(648, '2015-01-12', 94, 25, 99, 1, 1, 1),
(649, '2015-01-12', 147, 30, 10, 1, 1, 1),
(650, '2015-01-13', 2, 195, 35, 1, 1, 1),
(651, '2015-01-13', 5, 260, 98, 1, 1, 1),
(652, '2015-01-13', 6, 195, 152, 1, 1, 1),
(653, '2015-01-13', 12, 8, 89, 1, 1, 1),
(654, '2015-01-13', 26, 8, 115, 1, 1, 1),
(655, '2015-01-13', 45, 20, 30, 1, 1, 1),
(656, '2015-01-13', 48, 8, 125, 1, 1, 1),
(657, '2015-01-13', 67, 8, 250, 1, 1, 1),
(658, '2015-01-13', 74, 40, 20, 1, 1, 1),
(659, '2015-01-13', 77, 8, 110, 1, 1, 1),
(660, '2015-01-13', 78, 20, 185, 1, 1, 1),
(661, '2015-01-13', 140, 4, 105, 1, 1, 1),
(662, '2015-01-13', 42, 4, 659, 1, 1, 1),
(663, '2015-01-13', 65, 4, 215, 1, 1, 1),
(664, '2015-01-13', 148, 40, 14, 1, 1, 1),
(665, '2015-01-13', 106, 8, 695, 1, 1, 1),
(666, '2015-01-13', 107, 4, 885, 1, 1, 1),
(667, '2015-01-13', 125, 2, 1700, 1, 1, 1),
(668, '2015-01-14', 11, 16, 55, 1, 1, 1),
(669, '2015-01-14', 12, 16, 89, 1, 1, 1),
(670, '2015-01-14', 44, 200, 18, 1, 1, 1),
(671, '2015-01-14', 45, 300, 30, 1, 1, 1),
(672, '2015-01-14', 49, 2, 220, 1, 1, 1),
(673, '2015-01-14', 64, 32, 210, 1, 1, 1),
(674, '2015-01-14', 24, 2, 90, 1, 1, 1),
(675, '2015-01-14', 140, 4, 105, 1, 1, 1),
(676, '2015-01-14', 74, 250, 20, 1, 1, 1),
(677, '2015-01-14', 77, 5, 110, 1, 1, 1),
(678, '2015-01-14', 31, 6, 750, 1, 1, 1),
(679, '2015-01-14', 79, 150, 30, 1, 1, 1),
(680, '2015-01-14', 2, 728, 22.72, 1, 1, 1),
(681, '2015-01-14', 6, 1742, 91.2, 1, 1, 1),
(682, '2015-01-14', 11, 294, 35.75, 1, 1, 1),
(683, '2015-01-14', 49, 25, 143, 1, 1, 1),
(684, '2015-01-14', 60, 369, 65, 1, 1, 1),
(685, '2015-01-14', 67, 32, 162.5, 1, 1, 1),
(686, '2015-01-14', 77, 123, 71.5, 1, 1, 1),
(687, '2015-01-14', 78, 30, 120.25, 1, 1, 1),
(688, '2015-01-14', 139, 123, 48.75, 1, 1, 1),
(689, '2015-01-14', 32, 8, 702, 1, 1, 1),
(690, '2015-01-14', 154, 1, 2000, 1, 1, 1),
(691, '2015-01-14', 248, 5525, 58.8, 1, 1, 1),
(692, '2015-01-14', 107, 24, 575.25, 1, 1, 1),
(693, '2015-01-14', 134, 12, 607.75, 1, 1, 1),
(694, '2015-01-14', 153, 1, 0, 1, 1, 1),
(695, '2015-01-15', 12, 12, 89, 1, 1, 1),
(696, '2015-01-15', 74, 300, 20, 1, 1, 1),
(697, '2015-01-15', 136, 10, 20, 1, 1, 1),
(698, '2015-01-15', 135, 10, 12, 1, 1, 1),
(699, '2015-01-15', 78, 4, 185, 1, 1, 1),
(700, '2015-01-15', 78, 3, 185, 1, 1, 1),
(701, '2015-01-15', 94, 7, 99, 1, 1, 1),
(702, '2015-01-17', 73, 50, 13, 1, 1, 1),
(703, '2015-01-17', 75, 40, 35, 1, 1, 1),
(704, '2015-01-17', 54, 50, 40, 1, 1, 1),
(705, '2015-01-17', 110, 6, 560, 1, 1, 1),
(706, '2015-01-17', 40, 12, 295, 1, 1, 1),
(707, '2015-01-17', 1, 338, 23, 1, 1, 1),
(708, '2015-01-17', 2, 104, 35, 1, 1, 1),
(709, '2015-01-17', 7, 4, 11, 1, 1, 1),
(710, '2015-01-17', 13, 5, 18, 1, 1, 1),
(711, '2015-01-17', 27, 35, 110, 1, 1, 1),
(712, '2015-01-17', 39, 2, 145, 1, 1, 1),
(713, '2015-01-17', 44, 35, 18, 1, 1, 1),
(714, '2015-01-17', 45, 5, 30, 1, 1, 1),
(715, '2015-01-17', 53, 6, 35, 1, 1, 1),
(716, '2015-01-17', 33, 12, 115, 1, 1, 1),
(717, '2015-01-17', 35, 2, 130, 1, 1, 1),
(718, '2015-01-17', 73, 65, 13, 1, 1, 1),
(719, '2015-01-17', 74, 25, 20, 1, 1, 1),
(720, '2015-01-17', 79, 15, 30, 1, 1, 1),
(721, '2015-01-17', 94, 55, 99, 1, 1, 1),
(722, '2015-01-17', 103, 12, 245, 1, 1, 1),
(723, '2015-01-17', 265, 8, 425, 1, 1, 1),
(724, '2015-01-17', 147, 80, 10, 1, 1, 1),
(725, '2015-01-17', 1, 702, 23, 1, 1, 1),
(726, '2015-01-17', 33, 50, 115, 1, 1, 1),
(727, '2015-01-17', 73, 50, 13, 1, 1, 1),
(728, '2015-01-17', 94, 100, 99, 1, 1, 1),
(729, '2015-01-17', 147, 50, 10, 1, 1, 1),
(730, '2015-01-17', 48, 10, 125, 1, 1, 1),
(731, '2015-01-17', 77, 25, 110, 1, 1, 1),
(732, '2015-01-17', 106, 13, 695, 1, 1, 1),
(733, '2015-01-17', 130, 25, 280, 1, 1, 1),
(734, '2015-01-17', 133, 13, 698, 1, 1, 1),
(735, '2015-01-17', 128, 9, 790, 1, 1, 1),
(736, '2015-01-17', 31, 10, 750, 1, 1, 1),
(737, '2015-01-18', 1, 1794, 23, 1, 1, 1),
(738, '2015-01-18', 2, 598, 35, 1, 1, 1),
(739, '2015-01-18', 3, 208, 51, 1, 1, 1),
(740, '2015-01-18', 4, 104, 79, 1, 1, 1),
(741, '2015-01-18', 5, 208, 98, 1, 1, 1),
(742, '2015-01-18', 10, 10, 37, 1, 1, 1),
(743, '2015-01-18', 11, 10, 55, 1, 1, 1),
(744, '2015-01-18', 13, 36, 18, 1, 1, 1),
(745, '2015-01-18', 15, 10, 25, 1, 1, 1),
(746, '2015-01-18', 27, 130, 110, 1, 1, 1),
(747, '2015-01-18', 38, 20, 110, 1, 1, 1),
(748, '2015-01-18', 44, 160, 18, 1, 1, 1),
(749, '2015-01-18', 45, 100, 30, 1, 1, 1),
(750, '2015-01-18', 55, 15, 45, 1, 1, 1),
(751, '2015-01-18', 60, 10, 100, 1, 1, 1),
(752, '2015-01-18', 73, 300, 13, 1, 1, 1),
(753, '2015-01-18', 74, 200, 20, 1, 1, 1),
(754, '2015-01-18', 75, 20, 35, 1, 1, 1),
(755, '2015-01-18', 77, 12, 110, 1, 1, 1),
(756, '2015-01-18', 136, 10, 20, 1, 1, 1),
(757, '2015-01-18', 57, 10, 96, 1, 1, 1),
(758, '2015-01-18', 18, 10, 42, 1, 1, 1),
(759, '2015-01-18', 29, 8, 305, 1, 1, 1),
(760, '2015-01-18', 31, 8, 750, 1, 1, 1),
(761, '2015-01-18', 79, 150, 30, 1, 1, 1),
(762, '2015-01-18', 94, 43, 99, 1, 1, 1),
(763, '2015-01-18', 121, 36, 465, 1, 1, 1),
(764, '2015-01-18', 2, 104, 35, 1, 1, 1),
(765, '2015-01-18', 74, 200, 20, 1, 1, 1),
(766, '2015-01-18', 31, 8, 750, 1, 1, 1),
(767, '2015-01-18', 29, 4, 305, 1, 1, 1),
(768, '2015-01-18', 2, 65, 35, 1, 1, 1),
(769, '2015-01-18', 33, 4, 115, 1, 1, 1),
(770, '2015-01-18', 73, 10, 13, 1, 1, 1),
(771, '2015-01-18', 74, 12, 20, 1, 1, 1),
(772, '2015-01-18', 94, 7, 99, 1, 1, 1),
(773, '2015-01-18', 1, 494, 23, 1, 1, 1),
(774, '2015-01-18', 2, 104, 35, 1, 1, 1),
(775, '2015-01-18', 27, 50, 110, 1, 1, 1),
(776, '2015-01-18', 33, 20, 115, 1, 1, 1),
(777, '2015-01-18', 1, 208, 23, 1, 1, 1),
(778, '2015-01-18', 3, 143, 51, 1, 1, 1),
(779, '2015-01-18', 44, 24, 18, 1, 1, 1),
(780, '2015-01-18', 46, 5, 40, 1, 1, 1),
(781, '2015-01-18', 33, 10, 115, 1, 1, 1),
(782, '2015-01-18', 73, 24, 13, 1, 1, 1),
(783, '2015-01-18', 75, 10, 35, 1, 1, 1),
(784, '2015-01-18', 54, 12, 40, 1, 1, 1),
(785, '2015-01-18', 80, 4, 35, 1, 1, 1),
(786, '2015-01-18', 94, 10, 99, 1, 1, 1),
(787, '2015-01-18', 264, 4, 315, 1, 1, 1),
(788, '2015-01-19', 1, 299, 23, 1, 1, 1),
(789, '2015-01-19', 44, 30, 18, 1, 1, 1),
(790, '2015-01-19', 73, 50, 13, 1, 1, 1),
(791, '2015-01-19', 74, 100, 20, 1, 1, 1),
(792, '2015-01-19', 79, 50, 30, 1, 1, 1),
(793, '2015-01-20', 3, 39, 51, 1, 1, 1),
(794, '2015-01-20', 5, 39, 98, 1, 1, 1),
(795, '2015-01-20', 6, 13, 152, 1, 1, 1),
(796, '2015-01-20', 9, 4, 25, 1, 1, 1),
(797, '2015-01-20', 75, 8, 35, 1, 1, 1),
(798, '2015-01-20', 77, 6, 110, 1, 1, 1),
(799, '2015-01-20', 65, 1, 215, 1, 1, 1),
(800, '2015-01-20', 61, 1, 105, 1, 1, 1),
(801, '2015-01-20', 30, 1, 550, 1, 1, 1),
(802, '2015-01-20', 31, 2, 750, 1, 1, 1),
(803, '2015-01-20', 104, 2, 290, 1, 1, 1),
(804, '2015-01-20', 40, 4, 295, 1, 1, 1),
(805, '2015-01-20', 265, 3, 425, 1, 1, 1),
(806, '2015-01-20', 266, 2, 500, 1, 1, 1),
(807, '2015-01-20', 268, 2, 1175, 1, 1, 1),
(808, '2015-01-20', 269, 1, 1350, 1, 1, 1),
(809, '2015-01-20', 27, 8, 130, 1, 1, 1),
(810, '2015-01-20', 44, 4, 20, 1, 1, 1),
(811, '2015-01-20', 45, 6, 35, 1, 1, 1),
(812, '2015-01-20', 53, 4, 35, 1, 1, 1),
(813, '2015-01-20', 35, 4, 135, 1, 1, 1),
(814, '2015-01-20', 73, 50, 17, 1, 1, 1),
(815, '2015-01-20', 74, 18, 22, 1, 1, 1),
(816, '2015-01-20', 94, 4, 115, 1, 1, 1),
(817, '2015-01-20', 96, 15, 144, 1, 1, 1),
(818, '2015-01-20', 11, 25, 60, 1, 1, 1),
(819, '2015-01-20', 77, 20, 125, 1, 1, 1),
(820, '2015-01-20', 72, 20, 85, 1, 1, 1),
(821, '2015-01-20', 127, 10, 1190, 1, 1, 1),
(822, '2015-01-22', 78, 4, 185, 1, 1, 1),
(823, '2015-01-22', 29, 4, 305, 1, 1, 1),
(824, '2015-01-22', 22, 20, 65, 1, 1, 1),
(825, '2015-01-22', 1, 1703, 23, 1, 1, 1),
(826, '2015-01-22', 2, 546, 35, 1, 1, 1),
(827, '2015-01-22', 3, 195, 51, 1, 1, 1),
(828, '2015-01-22', 5, 351, 98, 1, 1, 1),
(829, '2015-01-22', 6, 195, 152, 1, 1, 1),
(830, '2015-01-22', 8, 20, 15, 1, 1, 1),
(831, '2015-01-22', 11, 25, 55, 1, 1, 1),
(832, '2015-01-22', 12, 15, 89, 1, 1, 1),
(833, '2015-01-22', 21, 6, 59, 1, 1, 1),
(834, '2015-01-22', 27, 115, 110, 1, 1, 1),
(835, '2015-01-22', 38, 20, 110, 1, 1, 1),
(836, '2015-01-22', 44, 200, 18, 1, 1, 1),
(837, '2015-01-22', 45, 80, 30, 1, 1, 1),
(838, '2015-01-22', 53, 80, 35, 1, 1, 1),
(839, '2015-01-22', 55, 24, 45, 1, 1, 1),
(840, '2015-01-22', 60, 16, 100, 1, 1, 1),
(841, '2015-01-22', 67, 5, 250, 1, 1, 1),
(842, '2015-01-22', 49, 2, 220, 1, 1, 1),
(843, '2015-01-22', 33, 120, 115, 1, 1, 1),
(844, '2015-01-22', 73, 400, 13, 1, 1, 1),
(845, '2015-01-22', 74, 150, 20, 1, 1, 1),
(846, '2015-01-22', 77, 18, 110, 1, 1, 1),
(847, '2015-01-22', 137, 12, 35, 1, 1, 1),
(848, '2015-01-22', 136, 25, 20, 1, 1, 1),
(849, '2015-01-22', 135, 20, 12, 1, 1, 1),
(850, '2015-01-22', 31, 6, 750, 1, 1, 1),
(851, '2015-01-22', 65, 6, 215, 1, 1, 1),
(852, '2015-01-22', 32, 2, 1080, 1, 1, 1),
(853, '2015-01-22', 140, 3, 105, 1, 1, 1),
(854, '2015-01-22', 79, 120, 30, 1, 1, 1),
(855, '2015-01-22', 94, 270, 99, 1, 1, 1),
(856, '2015-01-22', 106, 5, 695, 1, 1, 1),
(857, '2015-01-22', 265, 35, 425, 1, 1, 1),
(858, '2015-01-22', 266, 5, 500, 1, 1, 1),
(859, '2015-01-22', 268, 5, 1175, 1, 1, 1),
(860, '2015-01-22', 269, 2, 1350, 1, 1, 1),
(861, '2015-01-22', 126, 30, 950, 1, 1, 1),
(862, '2015-01-22', 147, 270, 10, 1, 1, 1),
(863, '2015-01-21', 11, 400, 35.75, 1, 1, 1),
(864, '2015-01-21', 12, 4, 120.25, 1, 1, 1),
(865, '2015-01-21', 145, 450, 7.5, 1, 1, 1),
(866, '2015-01-21', 32, 2, 702, 1, 1, 1),
(867, '2015-01-22', 45, 50, 30, 1, 1, 1),
(868, '2015-01-22', 53, 100, 35, 1, 1, 1),
(869, '2015-01-22', 73, 100, 13, 1, 1, 1),
(870, '2015-01-22', 2, 91, 35, 1, 1, 1),
(871, '2015-01-22', 3, 117, 51, 1, 1, 1),
(872, '2015-01-22', 8, 4, 15, 1, 1, 1),
(873, '2015-01-22', 9, 10, 25, 1, 1, 1),
(874, '2015-01-22', 233, 2, 120, 1, 1, 1),
(875, '2015-01-22', 45, 8, 30, 1, 1, 1),
(876, '2015-01-22', 46, 2, 40, 1, 1, 1),
(877, '2015-01-22', 55, 2, 45, 1, 1, 1),
(878, '2015-01-22', 35, 8, 130, 1, 1, 1),
(879, '2015-01-22', 74, 20, 20, 1, 1, 1),
(880, '2015-01-22', 75, 20, 35, 1, 1, 1),
(881, '2015-01-22', 40, 2, 295, 1, 1, 1),
(882, '2015-01-22', 235, 1, 265, 1, 1, 1),
(883, '2015-01-22', 81, 2, 40, 1, 1, 1),
(884, '2015-01-22', 96, 8, 125, 1, 1, 1),
(885, '2015-01-22', 103, 3, 245, 1, 1, 1),
(886, '2015-01-22', 104, 5, 290, 1, 1, 1),
(887, '2015-01-22', 121, 2, 465, 1, 1, 1),
(888, '2015-01-22', 122, 2, 500, 1, 1, 1),
(889, '2015-01-22', 127, 2, 1190, 1, 1, 1),
(890, '2015-01-22', 147, 10, 10, 1, 1, 1),
(891, '2015-01-22', 74, 40, 20, 1, 1, 1),
(892, '2015-01-24', 3, 52, 51, 1, 1, 1),
(893, '2015-01-24', 9, 6, 25, 1, 1, 1),
(894, '2015-01-24', 46, 1, 40, 1, 1, 1),
(895, '2015-01-24', 75, 10, 35, 1, 1, 1),
(896, '2015-01-24', 29, 3, 305, 1, 1, 1),
(897, '2015-01-24', 134, 3, 935, 1, 1, 1),
(898, '2015-01-24', 78, 4, 185, 1, 1, 1),
(899, '2015-01-24', 64, 1, 210, 1, 1, 1),
(900, '2015-01-24', 55, 1, 45, 1, 1, 1),
(901, '2015-01-24', 29, 2, 305, 1, 1, 1),
(902, '2015-01-24', 29, 4, 305, 1, 1, 1),
(903, '2015-01-24', 78, 4, 120.25, 1, 1, 1),
(904, '2015-01-24', 1, 91, 23, 1, 1, 1),
(905, '2015-01-24', 2, 52, 35, 1, 1, 1),
(906, '2015-01-24', 3, 39, 51, 1, 1, 1),
(907, '2015-01-24', 4, 52, 79, 1, 1, 1),
(908, '2015-01-24', 5, 91, 98, 1, 1, 1),
(909, '2015-01-24', 7, 6, 11, 1, 1, 1),
(910, '2015-01-24', 15, 5, 25, 1, 1, 1),
(911, '2015-01-24', 39, 4, 145, 1, 1, 1),
(912, '2015-01-24', 44, 12, 18, 1, 1, 1),
(913, '2015-01-24', 45, 5, 30, 1, 1, 1),
(914, '2015-01-24', 55, 5, 45, 1, 1, 1),
(915, '2015-01-24', 73, 20, 13, 1, 1, 1),
(916, '2015-01-24', 74, 16, 20, 1, 1, 1),
(917, '2015-01-24', 57, 5, 96, 1, 1, 1),
(918, '2015-01-24', 18, 5, 42, 1, 1, 1),
(919, '2015-01-24', 22, 5, 65, 1, 1, 1),
(920, '2015-01-24', 148, 5, 14, 1, 1, 1),
(921, '2015-01-24', 79, 10, 30, 1, 1, 1),
(922, '2015-01-24', 94, 18, 99, 1, 1, 1),
(923, '2015-01-24', 97, 4, 165, 1, 1, 1),
(924, '2015-01-24', 121, 4, 465, 1, 1, 1),
(925, '2015-01-24', 126, 3, 950, 1, 1, 1),
(926, '2015-01-24', 147, 18, 10, 1, 1, 1),
(927, '2015-01-25', 1, 104, 23, 1, 1, 1),
(928, '2015-01-25', 4, 52, 79, 1, 1, 1),
(929, '2015-01-25', 27, 112, 110, 1, 1, 1),
(930, '2015-01-25', 75, 6, 35, 1, 1, 1),
(931, '2015-01-25', 76, 6, 70, 1, 1, 1),
(932, '2015-01-25', 77, 5, 110, 1, 1, 1),
(933, '2015-01-25', 31, 2, 750, 1, 1, 1),
(934, '2015-01-25', 42, 2, 659, 1, 1, 1),
(935, '2015-01-25', 30, 2, 550, 1, 1, 1),
(936, '2015-01-25', 94, 35, 99, 1, 1, 1),
(937, '2015-01-25', 2, 26, 35, 1, 1, 1),
(938, '2015-01-25', 8, 4, 15, 1, 1, 1),
(939, '2015-01-25', 9, 4, 25, 1, 1, 1),
(940, '2015-01-25', 74, 5, 20, 1, 1, 1),
(941, '2015-01-25', 75, 8, 35, 1, 1, 1),
(942, '2015-01-26', 8, 25, 15, 1, 1, 1),
(943, '2015-01-26', 27, 10, 110, 1, 1, 1),
(944, '2015-01-26', 45, 100, 30, 1, 1, 1),
(945, '2015-01-26', 35, 20, 130, 1, 1, 1),
(946, '2015-01-26', 74, 25, 20, 1, 1, 1),
(947, '2015-01-26', 79, 50, 30, 1, 1, 1),
(948, '2015-01-26', 1, 247, 23, 1, 1, 1),
(949, '2015-01-26', 2, 143, 35, 1, 1, 1),
(950, '2015-01-26', 3, 104, 51, 1, 1, 1),
(951, '2015-01-26', 79, 50, 30, 1, 1, 1),
(952, '2015-01-26', 81, 23, 40, 1, 1, 1),
(953, '2015-01-27', 1, 208, 23, 1, 1, 1),
(954, '2015-01-27', 10, 14, 37, 1, 1, 1),
(955, '2015-01-27', 26, 2, 115, 1, 1, 1),
(956, '2015-01-27', 27, 20, 110, 1, 1, 1),
(957, '2015-01-27', 33, 25, 115, 1, 1, 1),
(958, '2015-01-27', 73, 70, 13, 1, 1, 1),
(959, '2015-01-27', 74, 30, 20, 1, 1, 1),
(960, '2015-01-27', 76, 5, 70, 1, 1, 1),
(961, '2015-01-27', 22, 2, 65, 1, 1, 1),
(962, '2015-01-27', 79, 20, 30, 1, 1, 1),
(963, '2015-01-27', 46, 6, 40, 1, 1, 1),
(964, '2015-01-27', 75, 19, 35, 1, 1, 1),
(965, '2015-01-27', 54, 6, 40, 1, 1, 1),
(966, '2015-01-27', 96, 19, 125, 1, 1, 1),
(967, '2015-01-27', 122, 4, 500, 1, 1, 1),
(968, '2015-01-27', 7, 40, 11, 1, 1, 1),
(969, '2015-01-27', 73, 100, 13, 1, 1, 1),
(970, '2015-01-27', 3, 143, 51, 1, 1, 1),
(971, '2015-01-27', 4, 104, 79, 1, 1, 1),
(972, '2015-01-27', 5, 455, 98, 1, 1, 1),
(973, '2015-01-27', 9, 6, 25, 1, 1, 1),
(974, '2015-01-27', 55, 12, 45, 1, 1, 1),
(975, '2015-01-27', 75, 20, 35, 1, 1, 1),
(976, '2015-01-27', 76, 5, 70, 1, 1, 1),
(977, '2015-01-27', 77, 6, 110, 1, 1, 1),
(978, '2015-01-27', 57, 8, 96, 1, 1, 1),
(979, '2015-01-27', 18, 10, 42, 1, 1, 1),
(980, '2015-01-27', 22, 10, 65, 1, 1, 1),
(981, '2015-01-28', 1, 702, 23, 1, 1, 1),
(982, '2015-01-28', 2, 169, 35, 1, 1, 1),
(983, '2015-01-28', 7, 10, 11, 1, 1, 1),
(984, '2015-01-28', 8, 10, 15, 1, 1, 1),
(985, '2015-01-28', 12, 3, 89, 1, 1, 1),
(986, '2015-01-28', 44, 50, 18, 1, 1, 1),
(987, '2015-01-28', 73, 100, 13, 1, 1, 1),
(988, '2015-01-28', 74, 50, 20, 1, 1, 1),
(989, '2015-01-28', 94, 80, 99, 1, 1, 1),
(990, '2015-01-28', 121, 19, 465, 1, 1, 1),
(991, '2015-01-28', 125, 3, 1700, 1, 1, 1),
(992, '2015-01-28', 1, 3224, 13.8, 1, 1, 1),
(993, '2015-01-28', 2, 884, 21, 1, 1, 1),
(994, '2015-01-28', 27, 120, 71.5, 1, 1, 1),
(995, '2015-01-28', 44, 215, 11.7, 1, 1, 1),
(996, '2015-01-28', 45, 23, 19.95, 1, 1, 1),
(997, '2015-01-28', 33, 185, 74.75, 1, 1, 1),
(998, '2015-01-28', 73, 339, 8.45, 1, 1, 1),
(999, '2015-01-28', 74, 193, 13, 1, 1, 1),
(1000, '2015-01-28', 79, 109, 19.5, 1, 1, 1),
(1001, '2015-01-28', 102, 46, 117, 1, 1, 1),
(1002, '2015-01-28', 103, 89, 147, 1, 1, 1),
(1003, '2015-01-28', 129, 46, 136.5, 1, 1, 1),
(1004, '2015-01-28', 130, 89, 182, 1, 1, 1),
(1005, '2015-01-28', 128, 96, 434.5, 1, 1, 1),
(1006, '2015-01-28', 147, 505, 6.5, 1, 1, 1),
(1007, '2015-01-29', 1, 52, 23, 1, 1, 1),
(1008, '2015-01-29', 2, 26, 35, 1, 1, 1),
(1009, '2015-01-29', 7, 7, 11, 1, 1, 1),
(1010, '2015-01-29', 8, 5, 15, 1, 1, 1),
(1011, '2015-01-29', 27, 8, 110, 1, 1, 1),
(1012, '2015-01-29', 38, 2, 110, 1, 1, 1),
(1013, '2015-01-29', 44, 15, 18, 1, 1, 1),
(1014, '2015-01-29', 45, 5, 30, 1, 1, 1),
(1015, '2015-01-29', 53, 2, 35, 1, 1, 1),
(1016, '2015-01-29', 33, 6, 115, 1, 1, 1),
(1017, '2015-01-29', 35, 2, 130, 1, 1, 1),
(1018, '2015-01-29', 73, 20, 13, 1, 1, 1),
(1019, '2015-01-29', 74, 6, 20, 1, 1, 1),
(1020, '2015-01-29', 79, 7, 30, 1, 1, 1),
(1021, '2015-01-29', 94, 14, 99, 1, 1, 1),
(1022, '2015-01-29', 147, 25, 10, 1, 1, 1),
(1023, '2015-01-29', 1, 169, 23, 1, 1, 1),
(1024, '2015-01-29', 2, 91, 35, 1, 1, 1),
(1025, '2015-01-29', 1, 1001, 23, 1, 1, 1),
(1026, '2015-01-29', 2, 507, 35, 1, 1, 1),
(1027, '2015-01-29', 7, 50, 11, 1, 1, 1),
(1028, '2015-01-29', 8, 50, 15, 1, 1, 1),
(1029, '2015-01-29', 27, 200, 110, 1, 1, 1),
(1030, '2015-01-29', 38, 200, 110, 1, 1, 1),
(1031, '2015-01-29', 44, 400, 18, 1, 1, 1),
(1032, '2015-01-29', 45, 100, 30, 1, 1, 1),
(1033, '2015-01-29', 33, 300, 115, 1, 1, 1),
(1034, '2015-01-29', 35, 50, 130, 1, 1, 1),
(1035, '2015-01-29', 73, 500, 13, 1, 1, 1),
(1036, '2015-01-29', 74, 200, 20, 1, 1, 1),
(1037, '2015-01-29', 136, 30, 20, 1, 1, 1),
(1038, '2015-01-29', 79, 100, 30, 1, 1, 1),
(1039, '2015-01-29', 94, 300, 99, 1, 1, 1),
(1040, '2015-01-29', 97, 50, 165, 1, 1, 1),
(1041, '2015-01-29', 153, 1, 0.01, 1, 1, 1),
(1042, '2015-01-29', 1, 1300, 23, 1, 1, 1),
(1043, '2015-01-29', 2, 598, 35, 1, 1, 1),
(1044, '2015-01-29', 7, 100, 11, 1, 1, 1),
(1045, '2015-01-29', 8, 60, 15, 1, 1, 1),
(1046, '2015-01-29', 27, 80, 110, 1, 1, 1),
(1047, '2015-01-29', 38, 40, 110, 1, 1, 1),
(1048, '2015-01-29', 44, 100, 18, 1, 1, 1),
(1049, '2015-01-29', 45, 100, 30, 1, 1, 1),
(1050, '2015-01-29', 53, 100, 35, 1, 1, 1),
(1051, '2015-01-29', 33, 100, 115, 1, 1, 1),
(1052, '2015-01-29', 35, 75, 130, 1, 1, 1),
(1053, '2015-01-29', 73, 200, 13, 1, 1, 1),
(1054, '2015-01-29', 74, 140, 20, 1, 1, 1),
(1055, '2015-01-29', 135, 40, 12, 1, 1, 1),
(1056, '2015-01-29', 136, 40, 20, 1, 1, 1),
(1057, '2015-01-29', 79, 40, 30, 1, 1, 1),
(1058, '2015-01-29', 94, 200, 99, 1, 1, 1),
(1059, '2015-01-29', 96, 60, 125, 1, 1, 1),
(1060, '2015-01-29', 102, 50, 180, 1, 1, 1),
(1061, '2015-01-29', 103, 30, 245, 1, 1, 1),
(1062, '2015-01-29', 121, 22, 465, 1, 1, 1),
(1063, '2015-01-29', 147, 100, 10, 1, 1, 1),
(1064, '2015-01-29', 153, 1, 8500, 1, 1, 1),
(1065, '2015-01-29', 94, 25, 99, 1, 1, 1),
(1066, '2015-01-29', 94, 200, 99, 1, 1, 1),
(1067, '2015-01-28', 284, 98, 15.94, 1, 1, 1),
(1068, '2015-01-28', 27, 73, 71.5, 1, 1, 1),
(1069, '2015-01-28', 94, 335, 64.35, 1, 1, 1),
(1070, '2015-01-31', 81, 7, 40, 1, 1, 1),
(1071, '2015-01-31', 81, 27, 40, 1, 1, 1),
(1072, '2015-01-31', 78, 12, 185, 1, 1, 1),
(1073, '2015-01-31', 153, 1, 0.01, 1, 1, 1),
(1074, '2015-01-31', 1, 156, 23, 1, 1, 1),
(1075, '2015-01-31', 3, 78, 51, 1, 1, 1),
(1076, '2015-01-31', 75, 15, 35, 1, 1, 1),
(1077, '2015-01-31', 77, 20, 110, 1, 1, 1),
(1078, '2015-01-31', 268, 2, 1175, 1, 1, 1),
(1079, '2015-01-31', 1, 52, 23, 1, 1, 1),
(1080, '2015-01-31', 3, 104, 51, 1, 1, 1),
(1081, '2015-01-31', 8, 36, 15, 1, 1, 1),
(1082, '2015-01-31', 9, 12, 25, 1, 1, 1),
(1083, '2015-01-31', 35, 36, 130, 1, 1, 1),
(1084, '2015-01-31', 75, 6, 35, 1, 1, 1),
(1085, '2015-01-31', 96, 36, 125, 1, 1, 1),
(1086, '2015-01-31', 104, 2, 290, 1, 1, 1),
(1101, '2015-01-31', 77, 2, 110, 1, 1, 1),
(1102, '2015-01-31', 31, 8, 750, 1, 1, 1),
(1103, '2015-02-01', 2, 403, 21, 1, 1, 1),
(1104, '2015-02-01', 5, 3094, 56.84, 1, 1, 1),
(1105, '2015-02-01', 11, 200, 35.75, 1, 1, 1),
(1106, '2015-02-01', 49, 1, 143, 1, 1, 1),
(1107, '2015-02-01', 60, 207, 65, 1, 1, 1),
(1108, '2015-02-01', 67, 26, 162.5, 1, 1, 1),
(1109, '2015-02-01', 77, 59, 71.5, 1, 1, 1),
(1110, '2015-02-01', 78, 25, 120.25, 1, 1, 1),
(1111, '2015-02-01', 139, 59, 48.75, 1, 1, 1),
(1112, '2015-02-01', 145, 253, 17.5, 1, 1, 1),
(1113, '2015-02-01', 32, 12, 702, 1, 1, 1),
(1114, '2015-02-01', 107, 12, 575.25, 1, 1, 1),
(1115, '2015-02-01', 134, 6, 607.75, 1, 1, 1),
(1116, '2015-02-01', 73, 200, 13, 1, 1, 1),
(1117, '2015-02-02', 153, 1, 8500, 1, 1, 1),
(1118, '2015-02-02', 11, 160, 35.75, 1, 1, 1),
(1119, '2015-02-03', 1, 52, 23, 1, 1, 1),
(1120, '2015-02-03', 2, 299, 35, 1, 1, 1),
(1121, '2015-02-03', 5, 897, 98, 1, 1, 1),
(1122, '2015-02-03', 11, 12, 55, 1, 1, 1),
(1123, '2015-02-03', 53, 40, 35, 1, 1, 1),
(1124, '2015-02-03', 73, 30, 13, 1, 1, 1),
(1125, '2015-02-03', 77, 20, 110, 1, 1, 1),
(1126, '2015-02-03', 59, 100, 98, 1, 1, 1),
(1127, '2015-02-03', 125, 2, 1700, 1, 1, 1),
(1128, '2015-02-03', 147, 200, 10, 1, 1, 1),
(1129, '2015-02-03', 153, 1, 0.01, 1, 1, 1),
(1130, '2015-02-03', 7, 60, 11, 1, 1, 1),
(1131, '2015-02-03', 8, 60, 15, 1, 1, 1),
(1132, '2015-02-03', 9, 36, 25, 1, 1, 1),
(1133, '2015-02-03', 11, 48, 55, 1, 1, 1),
(1134, '2015-02-03', 12, 18, 89, 1, 1, 1),
(1135, '2015-02-03', 13, 12, 18, 1, 1, 1),
(1136, '2015-02-03', 20, 6, 55, 1, 1, 1),
(1137, '2015-02-03', 21, 12, 59, 1, 1, 1),
(1138, '2015-02-03', 27, 24, 110, 1, 1, 1),
(1139, '2015-02-03', 28, 12, 155, 1, 1, 1),
(1140, '2015-02-03', 38, 48, 110, 1, 1, 1),
(1141, '2015-02-03', 39, 18, 145, 1, 1, 1),
(1142, '2015-02-03', 44, 100, 18, 1, 1, 1),
(1143, '2015-02-03', 45, 60, 30, 1, 1, 1),
(1144, '2015-02-03', 49, 4, 220, 1, 1, 1),
(1145, '2015-02-03', 55, 16, 45, 1, 1, 1),
(1146, '2015-02-03', 60, 26, 100, 1, 1, 1),
(1147, '2015-02-03', 67, 12, 250, 1, 1, 1),
(1148, '2015-02-03', 33, 72, 115, 1, 1, 1),
(1149, '2015-02-03', 36, 18, 150, 1, 1, 1),
(1150, '2015-02-03', 35, 48, 130, 1, 1, 1),
(1151, '2015-02-03', 73, 350, 13, 1, 1, 1),
(1152, '2015-02-03', 74, 200, 20, 1, 1, 1),
(1153, '2015-02-03', 77, 36, 110, 1, 1, 1),
(1154, '2015-02-03', 78, 12, 185, 1, 1, 1),
(1155, '2015-02-03', 68, 18, 125, 1, 1, 1),
(1156, '2015-02-03', 70, 12, 170, 1, 1, 1),
(1157, '2015-02-03', 139, 10, 75, 1, 1, 1),
(1158, '2015-02-03', 137, 12, 35, 1, 1, 1),
(1159, '2015-02-03', 136, 12, 20, 1, 1, 1),
(1160, '2015-02-03', 135, 18, 12, 1, 1, 1),
(1161, '2015-02-03', 71, 24, 50, 1, 1, 1),
(1162, '2015-02-03', 32, 4, 1080, 1, 1, 1),
(1163, '2015-02-03', 79, 100, 30, 1, 1, 1),
(1164, '2015-02-03', 93, 4, 260, 1, 1, 1),
(1165, '2015-02-03', 94, 136, 99, 1, 1, 1),
(1166, '2015-02-03', 97, 36, 165, 1, 1, 1),
(1167, '2015-02-03', 98, 18, 115, 1, 1, 1),
(1168, '2015-02-03', 100, 12, 170, 1, 1, 1),
(1169, '2015-02-03', 102, 100, 180, 1, 1, 1),
(1170, '2015-02-03', 103, 100, 245, 1, 1, 1),
(1171, '2015-02-03', 106, 12, 695, 1, 1, 1),
(1172, '2015-02-03', 107, 12, 885, 1, 1, 1),
(1173, '2015-02-03', 265, 36, 425, 1, 1, 1),
(1174, '2015-02-03', 124, 10, 1400, 1, 1, 1),
(1175, '2015-02-03', 1, 1196, 23, 1, 1, 1),
(1176, '2015-02-03', 2, 1001, 35, 1, 1, 1),
(1177, '2015-02-03', 3, 195, 51, 1, 1, 1),
(1178, '2015-02-03', 5, 702, 98, 1, 1, 1),
(1179, '2015-02-03', 6, 143, 152, 1, 1, 1),
(1180, '2015-02-04', 1, 39, 23, 1, 1, 1),
(1181, '2015-02-04', 244, 195, 26, 1, 1, 1),
(1182, '2015-02-04', 2, 1001, 39, 1, 1, 1),
(1183, '2015-02-04', 246, 1001, 55, 1, 1, 1),
(1184, '2015-02-04', 248, 1001, 105, 1, 1, 1),
(1185, '2015-02-04', 7, 30, 11, 1, 1, 1),
(1186, '2015-02-04', 9, 100, 25, 1, 1, 1),
(1187, '2015-02-04', 11, 100, 55, 1, 1, 1),
(1188, '2015-02-04', 13, 30, 18, 1, 1, 1),
(1189, '2015-02-04', 15, 50, 25, 1, 1, 1),
(1190, '2015-02-04', 44, 30, 18, 1, 1, 1),
(1191, '2015-02-04', 45, 100, 30, 1, 1, 1),
(1192, '2015-02-04', 46, 100, 40, 1, 1, 1),
(1193, '2015-02-04', 48, 30, 125, 1, 1, 1),
(1194, '2015-02-04', 55, 100, 45, 1, 1, 1),
(1195, '2015-02-04', 35, 100, 130, 1, 1, 1),
(1196, '2015-02-04', 73, 10, 13, 1, 1, 1),
(1197, '2015-02-04', 74, 100, 20, 1, 1, 1),
(1198, '2015-02-04', 75, 100, 35, 1, 1, 1),
(1199, '2015-02-04', 77, 100, 110, 1, 1, 1),
(1200, '2015-02-04', 61, 30, 105, 1, 1, 1),
(1201, '2015-02-04', 87, 30, 130, 1, 1, 1),
(1202, '2015-02-04', 31, 20, 750, 1, 1, 1),
(1203, '2015-02-04', 81, 50, 40, 1, 1, 1),
(1204, '2015-02-04', 94, 30, 99, 1, 1, 1),
(1205, '2015-02-04', 96, 100, 125, 1, 1, 1),
(1206, '2015-02-04', 106, 10, 695, 1, 1, 1),
(1207, '2015-02-04', 131, 30, 365, 1, 1, 1),
(1208, '2015-02-04', 126, 20, 950, 1, 1, 1),
(1209, '2015-02-04', 8, 100, 15, 1, 1, 1),
(1210, '2015-02-04', 11, 2, 55, 1, 1, 1),
(1211, '2015-02-04', 77, 6, 110, 1, 1, 1),
(1212, '2015-02-04', 31, 2, 750, 1, 1, 1),
(1213, '2015-02-04', 248, 208, 105, 1, 1, 1),
(1214, '2015-02-05', 1, 117, 23, 1, 1, 1),
(1215, '2015-02-05', 3, 52, 51, 1, 1, 1),
(1216, '2015-02-05', 5, 65, 98, 1, 1, 1),
(1217, '2015-02-05', 7, 15, 11, 1, 1, 1),
(1218, '2015-02-05', 11, 5, 55, 1, 1, 1),
(1219, '2015-02-05', 21, 2, 59, 1, 1, 1),
(1220, '2015-02-05', 48, 2, 125, 1, 1, 1),
(1221, '2015-02-05', 73, 25, 13, 1, 1, 1),
(1222, '2015-02-05', 75, 5, 35, 1, 1, 1),
(1223, '2015-02-05', 77, 6, 110, 1, 1, 1),
(1224, '2015-02-05', 31, 8, 750, 1, 1, 1),
(1225, '2015-02-05', 112, 3, 980, 1, 1, 1),
(1226, '2015-02-05', 113, 1, 1480, 1, 1, 1),
(1227, '2015-02-05', 110, 2, 560, 1, 1, 1),
(1228, '2015-02-05', 94, 15, 99, 1, 1, 1),
(1229, '2015-02-05', 104, 2, 290, 1, 1, 1),
(1230, '2015-02-07', 1, 598, 23, 1, 1, 1),
(1231, '2015-02-07', 2, 299, 35, 1, 1, 1),
(1232, '2015-02-07', 7, 100, 11, 1, 1, 1),
(1233, '2015-02-07', 8, 30, 15, 1, 1, 1),
(1234, '2015-02-07', 27, 50, 110, 1, 1, 1),
(1235, '2015-02-07', 38, 20, 110, 1, 1, 1),
(1236, '2015-02-07', 44, 100, 18, 1, 1, 1),
(1237, '2015-02-07', 45, 30, 30, 1, 1, 1),
(1238, '2015-02-07', 53, 20, 35, 1, 1, 1),
(1239, '2015-02-07', 73, 200, 13, 1, 1, 1),
(1240, '2015-02-07', 74, 100, 20, 1, 1, 1),
(1241, '2015-02-07', 79, 100, 30, 1, 1, 1),
(1242, '2015-02-07', 94, 150, 99, 1, 1, 1),
(1243, '2015-02-07', 1, 754, 23, 1, 1, 1),
(1244, '2015-02-07', 7, 24, 11, 1, 1, 1),
(1245, '2015-02-07', 38, 14, 110, 1, 1, 1),
(1246, '2015-02-07', 44, 30, 18, 1, 1, 1),
(1247, '2015-02-07', 45, 6, 30, 1, 1, 1),
(1248, '2015-02-07', 33, 60, 115, 1, 1, 1),
(1249, '2015-02-07', 73, 90, 13, 1, 1, 1),
(1250, '2015-02-07', 74, 20, 20, 1, 1, 1),
(1251, '2015-02-07', 81, 18, 40, 1, 1, 1),
(1252, '2015-02-07', 94, 66, 99, 1, 1, 1),
(1253, '2015-02-07', 121, 18, 465, 1, 1, 1),
(1254, '2015-02-07', 5, 1600, 56.84, 1, 1, 1),
(1255, '2015-02-07', 249, 598, 88.16, 1, 1, 1),
(1256, '2015-02-07', 1, 4303, 13.8, 1, 1, 1),
(1257, '2015-02-07', 2, 1183, 21, 1, 1, 1),
(1258, '2015-02-07', 27, 256, 71.5, 1, 1, 1),
(1259, '2015-02-07', 44, 288, 11.7, 1, 1, 1),
(1260, '2015-02-07', 45, 32, 19.95, 1, 1, 1),
(1261, '2015-02-07', 33, 248, 74.75, 1, 1, 1),
(1262, '2015-02-07', 73, 464, 8.45, 1, 1, 1),
(1263, '2015-02-07', 74, 260, 13, 1, 1, 1),
(1264, '2015-02-07', 284, 105, 15.94, 1, 1, 1),
(1265, '2015-02-07', 79, 152, 19.5, 1, 1, 1),
(1266, '2015-02-07', 94, 448, 64.35, 1, 1, 1),
(1267, '2015-02-07', 102, 64, 117, 1, 1, 1),
(1268, '2015-02-07', 103, 120, 147, 1, 1, 1);
INSERT INTO `stock_product_output` (`idstock_product_output`, `stock_product_output_date`, `idproduct`, `stock_product_output_qunatity`, `stock_product_output_price`, `idpestablishment`, `stock_product_output_type`, `stock_product_output_status`) VALUES
(1269, '2015-02-07', 129, 64, 136.5, 1, 1, 1),
(1270, '2015-02-07', 130, 120, 182, 1, 1, 1),
(1271, '2015-02-07', 128, 128, 434.5, 1, 1, 1),
(1272, '2015-02-07', 147, 688, 6.5, 1, 1, 1),
(1273, '2015-02-08', 28, 6, 155, 1, 1, 1),
(1274, '2015-02-08', 79, 5, 30, 1, 1, 1),
(1275, '2015-02-08', 121, 12, 465, 1, 1, 1),
(1276, '2015-02-08', 1, 988, 23, 1, 1, 1),
(1277, '2015-02-08', 2, 741, 35, 1, 1, 1),
(1278, '2015-02-08', 3, 130, 51, 1, 1, 1),
(1279, '2015-02-08', 4, 299, 79, 1, 1, 1),
(1280, '2015-02-08', 5, 156, 98, 1, 1, 1),
(1281, '2015-02-08', 7, 60, 11, 1, 1, 1),
(1282, '2015-02-08', 8, 58, 15, 1, 1, 1),
(1283, '2015-02-08', 9, 4, 25, 1, 1, 1),
(1284, '2015-02-08', 10, 11, 37, 1, 1, 1),
(1285, '2015-02-08', 11, 5, 55, 1, 1, 1),
(1286, '2015-02-08', 15, 8, 25, 1, 1, 1),
(1287, '2015-02-08', 27, 85, 110, 1, 1, 1),
(1288, '2015-02-08', 39, 20, 145, 1, 1, 1),
(1289, '2015-02-08', 44, 65, 18, 1, 1, 1),
(1290, '2015-02-08', 45, 115, 30, 1, 1, 1),
(1291, '2015-02-08', 47, 8, 80, 1, 1, 1),
(1292, '2015-02-08', 55, 8, 45, 1, 1, 1),
(1293, '2015-02-08', 60, 12, 100, 1, 1, 1),
(1294, '2015-02-08', 33, 25, 115, 1, 1, 1),
(1295, '2015-02-08', 35, 40, 130, 1, 1, 1),
(1296, '2015-02-08', 73, 125, 13, 1, 1, 1),
(1297, '2015-02-08', 74, 175, 20, 1, 1, 1),
(1298, '2015-02-08', 75, 10, 35, 1, 1, 1),
(1299, '2015-02-08', 77, 8, 110, 1, 1, 1),
(1300, '2015-02-08', 76, 8, 70, 1, 1, 1),
(1301, '2015-02-08', 80, 6, 35, 1, 1, 1),
(1302, '2015-02-08', 18, 4, 42, 1, 1, 1),
(1303, '2015-02-08', 22, 4, 65, 1, 1, 1),
(1304, '2015-02-08', 54, 12, 40, 1, 1, 1),
(1305, '2015-02-08', 57, 8, 96, 1, 1, 1),
(1306, '2015-02-08', 79, 110, 30, 1, 1, 1),
(1307, '2015-02-08', 81, 8, 40, 1, 1, 1),
(1308, '2015-02-08', 94, 170, 99, 1, 1, 1),
(1309, '2015-02-08', 121, 34, 465, 1, 1, 1),
(1310, '2015-02-08', 122, 4, 500, 1, 1, 1),
(1311, '2015-02-08', 123, 8, 750, 1, 1, 1),
(1312, '2015-02-08', 147, 220, 10, 1, 1, 1),
(1313, '2015-02-08', 126, 20, 950, 1, 1, 1),
(1314, '2015-02-08', 153, 1, 0.01, 1, 1, 1),
(1315, '2015-02-08', 153, 1, 0.01, 1, 1, 1),
(1316, '2015-02-08', 153, 1, 0.01, 1, 1, 1),
(1317, '2015-02-08', 1, 2990, 23, 1, 1, 1),
(1318, '2015-02-08', 2, 741, 35, 1, 1, 1),
(1319, '2015-02-08', 5, 1495, 98, 1, 1, 1),
(1320, '2015-02-08', 7, 75, 11, 1, 1, 1),
(1321, '2015-02-08', 8, 75, 15, 1, 1, 1),
(1322, '2015-02-08', 11, 45, 55, 1, 1, 1),
(1323, '2015-02-08', 13, 75, 18, 1, 1, 1),
(1324, '2015-02-08', 27, 225, 110, 1, 1, 1),
(1325, '2015-02-08', 44, 200, 18, 1, 1, 1),
(1326, '2015-02-08', 45, 60, 30, 1, 1, 1),
(1327, '2015-02-08', 53, 200, 35, 1, 1, 1),
(1328, '2015-02-08', 60, 125, 100, 1, 1, 1),
(1329, '2015-02-08', 33, 175, 115, 1, 1, 1),
(1330, '2015-02-08', 35, 60, 130, 1, 1, 1),
(1331, '2015-02-08', 73, 800, 13, 1, 1, 1),
(1332, '2015-02-08', 74, 200, 20, 1, 1, 1),
(1333, '2015-02-08', 139, 45, 75, 1, 1, 1),
(1334, '2015-02-08', 79, 250, 30, 1, 1, 1),
(1335, '2015-02-08', 94, 500, 99, 1, 1, 1),
(1336, '2015-02-08', 96, 60, 125, 1, 1, 1),
(1337, '2015-02-08', 121, 125, 465, 1, 1, 1),
(1338, '2015-02-08', 147, 600, 10, 1, 1, 1),
(1339, '2015-02-08', 153, 1, 0.01, 1, 1, 1),
(1340, '2015-02-09', 7, 10, 11, 1, 1, 1),
(1341, '2015-02-09', 8, 4, 15, 1, 1, 1),
(1342, '2015-02-09', 27, 6, 110, 1, 1, 1),
(1343, '2015-02-09', 38, 10, 110, 1, 1, 1),
(1344, '2015-02-09', 45, 5, 30, 1, 1, 1),
(1345, '2015-02-09', 33, 15, 115, 1, 1, 1),
(1346, '2015-02-09', 35, 5, 130, 1, 1, 1),
(1347, '2015-02-09', 73, 30, 13, 1, 1, 1),
(1348, '2015-02-09', 74, 6, 20, 1, 1, 1),
(1349, '2015-02-09', 71, 18, 50, 1, 1, 1),
(1350, '2015-02-09', 244, 117, 26, 1, 1, 1),
(1351, '2015-02-09', 245, 39, 39, 1, 1, 1),
(1352, '2015-02-09', 79, 8, 30, 1, 1, 1),
(1353, '2015-02-09', 94, 15, 99, 1, 1, 1),
(1354, '2015-02-09', 265, 3, 425, 1, 1, 1),
(1355, '2015-02-09', 1, 104, 23, 1, 1, 1),
(1356, '2015-02-09', 73, 50, 17, 1, 1, 1),
(1357, '2015-02-09', 7, 24, 11, 1, 1, 1),
(1358, '2015-02-09', 8, 6, 15, 1, 1, 1),
(1359, '2015-02-09', 10, 3, 37, 1, 1, 1),
(1360, '2015-02-09', 11, 24, 55, 1, 1, 1),
(1361, '2015-02-09', 27, 50, 110, 1, 1, 1),
(1362, '2015-02-09', 31, 2, 750, 1, 1, 1),
(1363, '2015-02-09', 44, 60, 18, 1, 1, 1),
(1364, '2015-02-09', 45, 24, 30, 1, 1, 1),
(1365, '2015-02-09', 55, 14, 45, 1, 1, 1),
(1366, '2015-02-09', 60, 16, 100, 1, 1, 1),
(1367, '2015-02-09', 33, 48, 115, 1, 1, 1),
(1368, '2015-02-09', 73, 378, 13, 1, 1, 1),
(1369, '2015-02-09', 74, 48, 20, 1, 1, 1),
(1370, '2015-02-09', 22, 9, 65, 1, 1, 1),
(1371, '2015-02-09', 18, 9, 42, 1, 1, 1),
(1372, '2015-02-09', 57, 9, 96, 1, 1, 1),
(1373, '2015-02-09', 135, 2, 12, 1, 1, 1),
(1374, '2015-02-09', 244, 299, 26, 1, 1, 1),
(1375, '2015-02-09', 247, 78, 87, 1, 1, 1),
(1376, '2015-02-09', 248, 169, 105, 1, 1, 1),
(1377, '2015-02-09', 79, 36, 30, 1, 1, 1),
(1378, '2015-02-09', 94, 80, 99, 1, 1, 1),
(1379, '2015-02-09', 147, 120, 10, 1, 1, 1),
(1380, '2015-02-09', 5, 900, 98, 1, 1, 1),
(1381, '2015-02-09', 1, 208, 23, 1, 1, 1),
(1382, '2015-02-09', 3, 104, 51, 1, 1, 1),
(1383, '2015-02-09', 5, 195, 98, 1, 1, 1),
(1384, '2015-02-09', 7, 24, 11, 1, 1, 1),
(1385, '2015-02-09', 9, 20, 25, 1, 1, 1),
(1386, '2015-02-09', 11, 20, 55, 1, 1, 1),
(1387, '2015-02-09', 27, 24, 110, 1, 1, 1),
(1388, '2015-02-09', 38, 24, 110, 1, 1, 1),
(1389, '2015-02-09', 44, 24, 18, 1, 1, 1),
(1390, '2015-02-09', 46, 15, 40, 1, 1, 1),
(1391, '2015-02-09', 48, 8, 125, 1, 1, 1),
(1392, '2015-02-09', 33, 40, 115, 1, 1, 1),
(1393, '2015-02-09', 73, 50, 13, 1, 1, 1),
(1394, '2015-02-09', 75, 30, 35, 1, 1, 1),
(1395, '2015-02-09', 54, 25, 40, 1, 1, 1),
(1396, '2015-02-09', 80, 15, 35, 1, 1, 1),
(1397, '2015-02-09', 40, 12, 295, 1, 1, 1),
(1398, '2015-02-09', 29, 12, 305, 1, 1, 1),
(1399, '2015-02-09', 14, 18, 20, 1, 1, 1),
(1400, '2015-02-09', 116, 6, 560, 1, 1, 1),
(1401, '2015-02-09', 110, 6, 560, 1, 1, 1),
(1402, '2015-02-09', 61, 8, 105, 1, 1, 1),
(1403, '2015-02-09', 87, 6, 130, 1, 1, 1),
(1404, '2015-02-09', 42, 8, 659, 1, 1, 1),
(1405, '2015-02-09', 31, 8, 750, 1, 1, 1),
(1406, '2015-02-09', 112, 4, 980, 1, 1, 1),
(1407, '2015-02-09', 118, 4, 980, 1, 1, 1),
(1408, '2015-02-09', 94, 40, 99, 1, 1, 1),
(1409, '2015-02-09', 108, 6, 280, 1, 1, 1),
(1410, '2015-02-09', 114, 6, 280, 1, 1, 1),
(1411, '2015-02-10', 60, 10, 100, 1, 1, 1),
(1412, '2015-02-10', 86, 6, 120, 1, 1, 1),
(1413, '2015-02-10', 27, 12, 110, 1, 1, 1),
(1414, '2015-02-10', 44, 18, 18, 1, 1, 1),
(1415, '2015-02-11', 147, 100, 10, 1, 1, 1),
(1416, '2015-02-11', 153, 1, 8500, 1, 1, 1),
(1417, '2015-02-09', 1, 897, 23, 1, 1, 1),
(1418, '2015-02-11', 2, 195, 35, 1, 1, 1),
(1419, '2015-02-11', 8, 12, 15, 1, 1, 1),
(1420, '2015-02-11', 13, 24, 18, 1, 1, 1),
(1421, '2015-02-11', 45, 24, 30, 1, 1, 1),
(1422, '2015-02-11', 73, 24, 13, 1, 1, 1),
(1423, '2015-02-11', 74, 48, 20, 1, 1, 1),
(1424, '2015-02-11', 96, 50, 125, 1, 1, 1),
(1425, '2015-02-11', 153, 1, 0.01, 1, 1, 1),
(1426, '2015-02-11', 2, 78, 35, 1, 1, 1),
(1427, '2015-02-11', 5, 208, 98, 1, 1, 1),
(1428, '2015-02-11', 75, 30, 35, 1, 1, 1),
(1429, '2015-02-11', 2, 78, 35, 1, 1, 1),
(1430, '2015-02-11', 3, 78, 51, 1, 1, 1),
(1431, '2015-02-11', 127, 3, 1190, 1, 1, 1),
(1432, '2015-02-12', 1, 2574, 23, 1, 1, 1),
(1433, '2015-02-12', 3, 1092, 51, 1, 1, 1),
(1434, '2015-02-12', 5, 806, 98, 1, 1, 1),
(1435, '2015-02-12', 8, 500, 15, 1, 1, 1),
(1436, '2015-02-12', 9, 80, 25, 1, 1, 1),
(1437, '2015-02-12', 11, 60, 60, 1, 1, 1),
(1438, '2015-02-12', 12, 36, 95, 1, 1, 1),
(1439, '2015-02-12', 21, 60, 65, 1, 1, 1),
(1440, '2015-02-12', 38, 200, 115, 1, 1, 1),
(1441, '2015-02-12', 44, 400, 18, 1, 1, 1),
(1442, '2015-02-12', 45, 700, 35, 1, 1, 1),
(1443, '2015-02-12', 73, 600, 13, 1, 1, 1),
(1444, '2015-02-12', 74, 800, 22, 1, 1, 1),
(1445, '2015-02-12', 75, 20, 35, 1, 1, 1),
(1446, '2015-02-12', 78, 36, 200, 1, 1, 1),
(1447, '2015-02-12', 140, 6, 155, 1, 1, 1),
(1448, '2015-02-12', 64, 15, 210, 1, 1, 1),
(1449, '2015-02-12', 137, 60, 35, 1, 1, 1),
(1450, '2015-02-12', 136, 300, 22, 1, 1, 1),
(1451, '2015-02-12', 135, 300, 12, 1, 1, 1),
(1452, '2015-02-12', 79, 200, 30, 1, 1, 1),
(1453, '2015-02-12', 94, 600, 115, 1, 1, 1),
(1454, '2015-02-12', 121, 100, 465, 1, 1, 1),
(1455, '2015-02-12', 124, 45, 1400, 1, 1, 1),
(1456, '2015-02-12', 125, 5, 1700, 1, 1, 1),
(1457, '2015-02-12', 2, 156, 35, 1, 1, 1),
(1458, '2015-02-12', 3, 130, 51, 1, 1, 1),
(1459, '2015-02-12', 4, 156, 79, 1, 1, 1),
(1460, '2015-02-12', 5, 26, 98, 1, 1, 1),
(1461, '2015-02-12', 7, 40, 11, 1, 1, 1),
(1462, '2015-02-12', 8, 20, 15, 1, 1, 1),
(1463, '2015-02-12', 10, 10, 37, 1, 1, 1),
(1464, '2015-02-12', 44, 30, 18, 1, 1, 1),
(1465, '2015-02-12', 48, 1, 125, 1, 1, 1),
(1466, '2015-02-12', 55, 15, 45, 1, 1, 1),
(1467, '2015-02-12', 73, 50, 13, 1, 1, 1),
(1468, '2015-02-12', 57, 6, 96, 1, 1, 1),
(1469, '2015-02-12', 62, 3, 135, 1, 1, 1),
(1470, '2015-02-12', 43, 1, 1000, 1, 1, 1),
(1471, '2015-02-12', 18, 6, 42, 1, 1, 1),
(1472, '2015-02-12', 94, 120, 99, 1, 1, 1),
(1473, '2015-02-12', 121, 12, 465, 1, 1, 1),
(1474, '2015-02-12', 7, 150, 11, 1, 1, 1),
(1475, '2015-02-12', 123, 3, 750, 1, 1, 1),
(1476, '2015-02-12', 153, 1, 8500, 1, 1, 1),
(1477, '2015-02-12', 42, 2, 659, 1, 1, 1),
(1478, '2015-02-14', 9, 5, 25, 1, 1, 1),
(1479, '2015-02-14', 15, 10, 25, 1, 1, 1),
(1480, '2015-02-14', 57, 10, 96, 1, 1, 1),
(1481, '2015-02-14', 81, 20, 40, 1, 1, 1),
(1482, '2015-02-14', 2, 39, 35, 1, 1, 1),
(1483, '2015-02-14', 74, 10, 20, 1, 1, 1),
(1484, '2015-02-14', 29, 70, 305, 1, 1, 1),
(1485, '2015-02-14', 104, 40, 290, 1, 1, 1),
(1486, '2015-02-15', 77, 4, 110, 1, 1, 1),
(1487, '2015-02-15', 121, 1, 465, 1, 1, 1),
(1488, '2015-02-15', 122, 1, 500, 1, 1, 1),
(1489, '2015-02-15', 77, 12, 110, 1, 1, 1),
(1490, '2015-02-15', 1, 1105, 23, 1, 1, 1),
(1491, '2015-02-15', 2, 195, 35, 1, 1, 1),
(1492, '2015-02-15', 3, 104, 51, 1, 1, 1),
(1493, '2015-02-15', 4, 117, 79, 1, 1, 1),
(1494, '2015-02-15', 5, 403, 98, 1, 1, 1),
(1495, '2015-02-15', 44, 300, 18, 1, 1, 1),
(1496, '2015-02-15', 45, 60, 30, 1, 1, 1),
(1497, '2015-02-15', 48, 12, 125, 1, 1, 1),
(1498, '2015-02-15', 55, 36, 45, 1, 1, 1),
(1499, '2015-02-15', 33, 180, 115, 1, 1, 1),
(1500, '2015-02-15', 73, 300, 13, 1, 1, 1),
(1501, '2015-02-15', 74, 60, 20, 1, 1, 1),
(1502, '2015-02-15', 77, 24, 110, 1, 1, 1),
(1503, '2015-02-15', 22, 10, 65, 1, 1, 1),
(1504, '2015-02-15', 18, 20, 42, 1, 1, 1),
(1505, '2015-02-15', 139, 10, 75, 1, 1, 1),
(1506, '2015-02-15', 137, 10, 35, 1, 1, 1),
(1507, '2015-02-15', 81, 20, 40, 1, 1, 1),
(1508, '2015-02-15', 94, 200, 99, 1, 1, 1),
(1509, '2015-02-15', 98, 80, 115, 1, 1, 1),
(1510, '2015-02-15', 106, 10, 695, 1, 1, 1),
(1511, '2015-02-15', 265, 45, 425, 1, 1, 1),
(1512, '2015-02-15', 147, 300, 10, 1, 1, 1),
(1513, '2015-02-15', 240, 10, 1200, 1, 1, 1),
(1514, '2015-02-15', 55, 1, 45, 1, 1, 1),
(1515, '2015-02-15', 74, 1, 20, 1, 1, 1),
(1516, '2015-02-15', 75, 10, 35, 1, 1, 1),
(1517, '2015-02-15', 77, 2, 110, 1, 1, 1),
(1518, '2015-02-15', 31, 2, 750, 1, 1, 1),
(1519, '2015-02-15', 29, 6, 305, 1, 1, 1),
(1520, '2015-02-15', 40, 2, 295, 1, 1, 1),
(1521, '2015-02-15', 104, 2, 290, 1, 1, 1),
(1522, '2015-02-15', 265, 1, 425, 1, 1, 1),
(1523, '2015-02-15', 266, 2, 500, 1, 1, 1),
(1534, '2015-02-15', 2, 351, 35, 1, 1, 1),
(1535, '2015-02-15', 55, 4, 45, 1, 1, 1),
(1536, '2015-02-15', 265, 52, 425, 1, 1, 1),
(1537, '2015-02-15', 1, 104, 23, 1, 1, 1),
(1538, '2015-02-15', 2, 65, 35, 1, 1, 1),
(1539, '2015-02-15', 27, 6, 110, 1, 1, 1),
(1540, '2015-02-15', 7, 12, 11, 1, 1, 1),
(1541, '2015-02-15', 53, 10, 35, 1, 1, 1),
(1542, '2015-02-15', 73, 30, 13, 1, 1, 1),
(1543, '2015-02-15', 79, 10, 30, 1, 1, 1),
(1544, '2015-02-15', 94, 20, 99, 1, 1, 1),
(1545, '2015-02-15', 121, 2, 465, 1, 1, 1),
(1546, '2015-02-15', 147, 20, 10, 1, 1, 1),
(1557, '2015-02-15', 81, 1, 40, 1, 1, 1),
(1558, '2015-02-15', 74, 1, 20, 1, 1, 1),
(1559, '2015-02-15', 75, 10, 35, 1, 1, 1),
(1560, '2015-02-15', 77, 2, 110, 1, 1, 1),
(1561, '2015-02-15', 31, 2, 750, 1, 1, 1),
(1562, '2015-02-15', 29, 6, 305, 1, 1, 1),
(1563, '2015-02-15', 40, 2, 295, 1, 1, 1),
(1564, '2015-02-15', 104, 2, 290, 1, 1, 1),
(1565, '2015-02-15', 265, 1, 425, 1, 1, 1),
(1566, '2015-02-15', 77, 40, 110, 1, 1, 1),
(1577, '2015-02-15', 2, 13, 35, 1, 1, 1),
(1578, '2015-02-15', 3, 26, 51, 1, 1, 1),
(1579, '2015-02-15', 5, 247, 98, 1, 1, 1),
(1580, '2015-02-15', 6, 65, 152, 1, 1, 1),
(1581, '2015-02-15', 11, 10, 55, 1, 1, 1),
(1582, '2015-02-15', 12, 8, 89, 1, 1, 1),
(1583, '2015-02-15', 48, 1, 125, 1, 1, 1),
(1584, '2015-02-15', 60, 1, 100, 1, 1, 1),
(1585, '2015-02-15', 77, 16, 110, 1, 1, 1),
(1586, '2015-02-15', 78, 12, 185, 1, 1, 1),
(1587, '2015-02-15', 32, 3, 1080, 1, 1, 1),
(1588, '2015-02-15', 31, 5, 750, 1, 1, 1),
(1589, '2015-02-15', 64, 8, 210, 1, 1, 1),
(1590, '2015-02-15', 90, 1, 215, 1, 1, 1),
(1591, '2015-02-15', 124, 1, 1400, 1, 1, 1),
(1592, '2015-02-15', 106, 5, 695, 1, 1, 1),
(1593, '2015-02-15', 107, 2, 885, 1, 1, 1),
(1594, '2015-02-15', 268, 1, 1175, 1, 1, 1),
(1595, '2015-02-15', 121, 1, 465, 1, 1, 1),
(1596, '2015-02-15', 122, 8, 500, 1, 1, 1),
(1597, '2015-02-15', 125, 1, 1700, 1, 1, 1),
(1598, '2015-02-15', 153, 1, 0.01, 1, 1, 1),
(1599, '2015-02-16', 2, 195, 35, 1, 1, 1),
(1600, '2015-02-16', 12, 6, 89, 1, 1, 1),
(1601, '2015-02-16', 49, 8, 220, 1, 1, 1),
(1602, '2015-02-16', 55, 4, 45, 1, 1, 1),
(1603, '2015-02-16', 74, 30, 20, 1, 1, 1),
(1604, '2015-02-16', 75, 6, 35, 1, 1, 1),
(1605, '2015-02-16', 78, 20, 185, 1, 1, 1),
(1606, '2015-02-16', 81, 4, 40, 1, 1, 1),
(1607, '2015-02-16', 107, 12, 885, 1, 1, 1),
(1608, '2015-02-16', 125, 8, 1700, 1, 1, 1),
(1609, '2015-02-16', 2, 403, 35, 1, 1, 1),
(1610, '2015-02-16', 3, 598, 51, 1, 1, 1),
(1611, '2015-02-16', 5, 104, 98, 1, 1, 1),
(1612, '2015-02-16', 8, 20, 15, 1, 1, 1),
(1613, '2015-02-16', 9, 36, 25, 1, 1, 1),
(1614, '2015-02-16', 12, 20, 89, 1, 1, 1),
(1615, '2015-02-16', 15, 12, 25, 1, 1, 1),
(1616, '2015-02-16', 21, 6, 59, 1, 1, 1),
(1617, '2015-02-16', 26, 6, 115, 1, 1, 1),
(1618, '2015-02-16', 45, 60, 30, 1, 1, 1),
(1619, '2015-02-16', 46, 20, 40, 1, 1, 1),
(1620, '2015-02-16', 48, 6, 125, 1, 1, 1),
(1621, '2015-02-16', 49, 6, 220, 1, 1, 1),
(1622, '2015-02-16', 55, 60, 45, 1, 1, 1),
(1623, '2015-02-16', 67, 12, 250, 1, 1, 1),
(1624, '2015-02-16', 74, 60, 20, 1, 1, 1),
(1625, '2015-02-16', 75, 36, 35, 1, 1, 1),
(1626, '2015-02-16', 77, 12, 110, 1, 1, 1),
(1627, '2015-02-16', 78, 10, 185, 1, 1, 1),
(1628, '2015-02-16', 87, 10, 130, 1, 1, 1),
(1629, '2015-02-16', 96, 120, 125, 1, 1, 1),
(1630, '2015-02-16', 121, 12, 465, 1, 1, 1),
(1631, '2015-02-16', 122, 12, 500, 1, 1, 1),
(1632, '2015-02-16', 124, 9, 1400, 1, 1, 1),
(1633, '2015-02-16', 125, 4, 1700, 1, 1, 1),
(1634, '2015-02-16', 147, 100, 10, 1, 1, 1),
(1635, '2015-02-16', 137, 12, 35, 1, 1, 1),
(1636, '2015-02-16', 136, 12, 20, 1, 1, 1),
(1637, '2015-02-16', 249, 195, 152, 1, 1, 1),
(1638, '2015-02-16', 93, 6, 260, 1, 1, 1),
(1639, '2015-02-15', 6, 26, 152, 1, 1, 1),
(1640, '2015-02-17', 53, 10, 35, 1, 1, 1),
(1641, '2015-02-17', 79, 10, 30, 1, 1, 1),
(1642, '2015-02-17', 94, 30, 99, 1, 1, 1),
(1643, '2015-02-17', 103, 4, 245, 1, 1, 1),
(1644, '2015-02-17', 147, 36, 10, 1, 1, 1),
(1645, '2015-02-18', 11, 10, 55, 1, 1, 1),
(1646, '2015-02-18', 29, 6, 305, 1, 1, 1),
(1647, '2015-02-18', 65, 6, 215, 1, 1, 1),
(1648, '2015-02-18', 154, 1, 500, 1, 1, 1),
(1649, '2015-02-18', 153, 1, 0.001, 1, 1, 1),
(1650, '2015-02-18', 1, 1001, 23, 1, 1, 1),
(1651, '2015-02-18', 2, 429, 35, 1, 1, 1),
(1652, '2015-02-18', 3, 221, 51, 1, 1, 1),
(1653, '2015-02-18', 5, 104, 98, 1, 1, 1),
(1654, '2015-02-18', 6, 403, 152, 1, 1, 1),
(1655, '2015-02-18', 7, 40, 11, 1, 1, 1),
(1656, '2015-02-18', 9, 20, 25, 1, 1, 1),
(1657, '2015-02-18', 11, 6, 55, 1, 1, 1),
(1658, '2015-02-18', 12, 40, 89, 1, 1, 1),
(1659, '2015-02-18', 21, 2, 59, 1, 1, 1),
(1660, '2015-02-18', 26, 10, 115, 1, 1, 1),
(1661, '2015-02-18', 44, 100, 18, 1, 1, 1),
(1662, '2015-02-18', 45, 40, 30, 1, 1, 1),
(1663, '2015-02-18', 48, 10, 125, 1, 1, 1),
(1664, '2015-02-18', 49, 16, 220, 1, 1, 1),
(1665, '2015-02-18', 53, 100, 35, 1, 1, 1),
(1666, '2015-02-18', 60, 2, 100, 1, 1, 1),
(1667, '2015-02-18', 67, 2, 250, 1, 1, 1),
(1668, '2015-02-18', 33, 80, 115, 1, 1, 1),
(1669, '2015-02-18', 73, 250, 13, 1, 1, 1),
(1670, '2015-02-18', 75, 42, 35, 1, 1, 1),
(1671, '2015-02-18', 77, 35, 110, 1, 1, 1),
(1672, '2015-02-18', 78, 52, 185, 1, 1, 1),
(1673, '2015-02-18', 65, 18, 215, 1, 1, 1),
(1674, '2015-02-18', 29, 2, 305, 1, 1, 1),
(1675, '2015-02-18', 64, 2, 210, 1, 1, 1),
(1676, '2015-02-18', 91, 6, 220, 1, 1, 1),
(1677, '2015-02-18', 37, 2, 285, 1, 1, 1),
(1678, '2015-02-18', 149, 2, 18, 1, 1, 1),
(1679, '2015-02-18', 79, 40, 30, 1, 1, 1),
(1680, '2015-02-18', 94, 300, 99, 1, 1, 1),
(1681, '2015-02-18', 96, 2, 125, 1, 1, 1),
(1682, '2015-02-18', 103, 20, 245, 1, 1, 1),
(1683, '2015-02-18', 104, 22, 290, 1, 1, 1),
(1684, '2015-02-18', 106, 20, 695, 1, 1, 1),
(1685, '2015-02-18', 107, 10, 885, 1, 1, 1),
(1686, '2015-02-18', 130, 27, 280, 1, 1, 1),
(1687, '2015-02-18', 131, 20, 365, 1, 1, 1),
(1688, '2015-02-18', 133, 20, 698, 1, 1, 1),
(1689, '2015-02-18', 134, 10, 935, 1, 1, 1),
(1690, '2015-02-18', 147, 300, 10, 1, 1, 1),
(1691, '2015-02-18', 1, 598, 23, 1, 1, 1),
(1692, '2015-02-18', 5, 104, 98, 1, 1, 1),
(1693, '2015-02-18', 13, 40, 18, 1, 1, 1),
(1694, '2015-02-18', 73, 50, 13, 1, 1, 1),
(1695, '2015-02-18', 75, 18, 35, 1, 1, 1),
(1696, '2015-02-18', 77, 12, 110, 1, 1, 1),
(1697, '2015-02-18', 94, 50, 99, 1, 1, 1),
(1698, '2015-02-18', 98, 50, 115, 1, 1, 1),
(1699, '2015-02-19', 6, 117, 152, 1, 1, 1),
(1700, '2015-02-19', 9, 8, 25, 1, 1, 1),
(1701, '2015-02-19', 11, 12, 55, 1, 1, 1),
(1702, '2015-02-19', 12, 10, 89, 1, 1, 1),
(1703, '2015-02-19', 49, 5, 220, 1, 1, 1),
(1704, '2015-02-19', 75, 12, 35, 1, 1, 1),
(1705, '2015-02-19', 77, 8, 110, 1, 1, 1),
(1706, '2015-02-19', 78, 8, 185, 1, 1, 1),
(1707, '2015-02-19', 140, 4, 105, 1, 1, 1),
(1708, '2015-02-19', 63, 3, 205, 1, 1, 1),
(1709, '2015-02-19', 43, 1, 1000, 1, 1, 1),
(1710, '2015-02-19', 65, 5, 215, 1, 1, 1),
(1711, '2015-02-19', 31, 4, 750, 1, 1, 1),
(1712, '2015-02-19', 42, 1, 659, 1, 1, 1),
(1713, '2015-02-19', 131, 4, 365, 1, 1, 1),
(1714, '2015-02-19', 268, 3, 1175, 1, 1, 1),
(1715, '2015-02-19', 269, 2, 1350, 1, 1, 1),
(1716, '2015-02-19', 153, 1, 8500, 1, 1, 1),
(1717, '2015-02-19', 154, 1, 2000, 1, 1, 1),
(1718, '2015-02-22', 3, 208, 51, 1, 1, 1),
(1719, '2015-02-22', 15, 2, 25, 1, 1, 1),
(1720, '2015-02-22', 27, 11, 110, 1, 1, 1),
(1721, '2015-02-22', 46, 3, 40, 1, 1, 1),
(1722, '2015-02-22', 55, 1, 45, 1, 1, 1),
(1723, '2015-02-22', 75, 8, 35, 1, 1, 1),
(1724, '2015-02-22', 57, 3, 96, 1, 1, 1),
(1725, '2015-02-22', 81, 6, 40, 1, 1, 1),
(1726, '2015-02-22', 103, 6, 245, 1, 1, 1),
(1727, '2015-02-22', 104, 2, 290, 1, 1, 1),
(1728, '2015-02-22', 121, 6, 465, 1, 1, 1),
(1729, '2015-02-22', 122, 2, 500, 1, 1, 1),
(1730, '2015-02-22', 1, 390, 23, 1, 1, 1),
(1731, '2015-02-22', 7, 20, 11, 1, 1, 1),
(1732, '2015-02-22', 27, 15, 130, 1, 1, 1),
(1733, '2015-02-22', 38, 10, 115, 1, 1, 1),
(1734, '2015-02-22', 44, 20, 20, 1, 1, 1),
(1735, '2015-02-22', 33, 5, 115, 1, 1, 1),
(1736, '2015-02-22', 73, 20, 17, 1, 1, 1),
(1737, '2015-02-22', 71, 10, 55, 1, 1, 1),
(1738, '2015-02-22', 94, 20, 115, 1, 1, 1),
(1739, '2015-02-22', 126, 10, 950, 1, 1, 1),
(1740, '2015-02-22', 153, 1, 8500, 1, 1, 1),
(1741, '2015-02-22', 237, 8, 135, 1, 1, 1),
(1742, '2015-02-22', 74, 120, 20, 1, 1, 1),
(1743, '2015-02-22', 153, 1, 8500, 1, 1, 1),
(1744, '2015-02-23', 1, 104, 23, 1, 1, 1),
(1745, '2015-02-23', 2, 104, 35, 1, 1, 1),
(1746, '2015-02-23', 126, 3, 950, 1, 1, 1),
(1747, '2015-02-23', 4, 1001, 87, 1, 1, 1),
(1748, '2015-02-23', 244, 1001, 26, 1, 1, 1),
(1749, '2015-02-23', 44, 50, 18, 1, 1, 1),
(1750, '2015-02-23', 33, 30, 115, 1, 1, 1),
(1751, '2015-02-23', 73, 100, 13, 1, 1, 1),
(1752, '2015-02-23', 76, 5, 70, 1, 1, 1),
(1753, '2015-02-23', 30, 60, 550, 1, 1, 1),
(1754, '2015-02-23', 14, 30, 20, 1, 1, 1),
(1755, '2015-02-23', 57, 100, 96, 1, 1, 1),
(1756, '2015-02-23', 83, 50, 90, 1, 1, 1),
(1757, '2015-02-23', 80, 50, 35, 1, 1, 1),
(1758, '2015-02-23', 17, 20, 35, 1, 1, 1),
(1759, '2015-02-23', 54, 100, 40, 1, 1, 1),
(1760, '2015-02-23', 94, 200, 99, 1, 1, 1),
(1761, '2015-02-23', 105, 30, 435, 1, 1, 1),
(1762, '2015-02-23', 27, 10, 130, 1, 1, 1),
(1763, '2015-02-23', 44, 50, 20, 1, 1, 1),
(1764, '2015-02-23', 73, 50, 17, 1, 1, 1),
(1765, '2015-02-23', 101, 6, 320, 1, 1, 1),
(1766, '2015-02-23', 94, 20, 115, 1, 1, 1),
(1767, '2015-02-23', 126, 3, 950, 1, 1, 1),
(1768, '2015-02-24', 13, 10, 18, 1, 1, 1),
(1769, '2015-02-24', 15, 10, 25, 1, 1, 1),
(1770, '2015-02-24', 21, 10, 59, 1, 1, 1),
(1771, '2015-02-24', 27, 150, 110, 1, 1, 1),
(1772, '2015-02-24', 60, 20, 100, 1, 1, 1),
(1773, '2015-02-24', 22, 10, 65, 1, 1, 1),
(1774, '2015-02-24', 18, 10, 42, 1, 1, 1),
(1775, '2015-02-24', 57, 20, 96, 1, 1, 1),
(1776, '2015-02-24', 145, 500, 17.5, 1, 1, 1),
(1777, '2015-02-24', 79, 500, 19.5, 1, 1, 1),
(1778, '2015-02-24', 67, 3, 250, 1, 1, 1),
(1779, '2015-02-24', 76, 45, 70, 1, 1, 1),
(1780, '2015-02-25', 73, 200, 13, 1, 1, 1),
(1781, '2015-02-25', 76, 12, 70, 1, 1, 1),
(1782, '2015-02-25', 28, 60, 155, 1, 1, 1),
(1783, '2015-02-25', 60, 14, 100, 1, 1, 1),
(1784, '2015-02-25', 77, 10, 110, 1, 1, 1),
(1785, '2015-02-25', 248, 156, 105, 1, 1, 1),
(1786, '2015-02-25', 67, 16, 250, 1, 1, 1),
(1787, '2015-02-26', 148, 300, 14, 1, 1, 1),
(1788, '2015-02-26', 2, 195, 35, 1, 1, 1),
(1789, '2015-02-26', 3, 65, 51, 1, 1, 1),
(1790, '2015-02-26', 4, 65, 79, 1, 1, 1),
(1791, '2015-02-26', 10, 10, 37, 1, 1, 1),
(1792, '2015-02-26', 11, 10, 55, 1, 1, 1),
(1793, '2015-02-26', 13, 30, 18, 1, 1, 1),
(1794, '2015-02-26', 27, 20, 110, 1, 1, 1),
(1795, '2015-02-26', 38, 50, 110, 1, 1, 1),
(1796, '2015-02-26', 44, 250, 18, 1, 1, 1),
(1797, '2015-02-26', 53, 40, 35, 1, 1, 1),
(1798, '2015-02-26', 33, 40, 115, 1, 1, 1),
(1799, '2015-02-26', 73, 500, 13, 1, 1, 1),
(1800, '2015-02-26', 74, 40, 20, 1, 1, 1),
(1801, '2015-02-26', 136, 5, 20, 1, 1, 1),
(1802, '2015-02-26', 79, 40, 30, 1, 1, 1),
(1803, '2015-02-26', 94, 250, 99, 1, 1, 1),
(1804, '2015-02-26', 102, 30, 180, 1, 1, 1),
(1805, '2015-02-26', 265, 36, 425, 1, 1, 1),
(1806, '2015-02-28', 5, 13, 98, 1, 1, 1),
(1807, '2015-02-28', 6, 26, 152, 1, 1, 1),
(1808, '2015-02-28', 75, 6, 35, 1, 1, 1),
(1809, '2015-02-28', 8, 10, 15, 1, 1, 1),
(1810, '2015-02-28', 74, 16, 20, 1, 1, 1),
(1811, '2015-03-01', 2, 1352, 21, 1, 1, 1),
(1812, '2015-03-01', 7, 289, 7.5, 1, 1, 1),
(1813, '2015-03-01', 44, 323, 11.7, 1, 1, 1),
(1814, '2015-03-01', 45, 35, 19.95, 1, 1, 1),
(1815, '2015-03-01', 33, 281, 74.75, 1, 1, 1),
(1816, '2015-03-01', 73, 519, 8.45, 1, 1, 1),
(1817, '2015-03-01', 74, 293, 13, 1, 1, 1),
(1818, '2015-03-01', 79, 169, 19.5, 1, 1, 1),
(1819, '2015-03-01', 94, 503, 64.35, 1, 1, 1),
(1820, '2015-03-01', 102, 70, 117, 1, 1, 1),
(1821, '2015-03-01', 103, 137, 147, 1, 1, 1),
(1822, '2015-03-01', 130, 137, 182, 1, 1, 1),
(1823, '2015-03-01', 128, 144, 434.5, 1, 1, 1),
(1824, '2015-03-01', 147, 770, 6.5, 1, 1, 1),
(1825, '2015-02-28', 12, 3, 89, 1, 1, 1),
(1826, '2015-03-01', 1, 4849, 13.8, 1, 1, 1),
(1827, '2015-03-01', 284, 138, 15.95, 1, 1, 1),
(1828, '2015-03-01', 1, 2002, 23, 1, 1, 1),
(1829, '2015-02-15', 131, 2, 365, 1, 1, 1),
(1830, '2015-03-02', 2, 130, 35, 1, 1, 1),
(1831, '2015-03-02', 3, 195, 51, 1, 1, 1),
(1832, '2015-03-02', 5, 65, 98, 1, 1, 1),
(1833, '2015-03-02', 75, 20, 35, 1, 1, 1),
(1834, '2015-03-02', 81, 10, 40, 1, 1, 1),
(1835, '2015-03-02', 96, 20, 125, 1, 1, 1),
(1836, '2015-02-28', 1, 4485, 22, 1, 1, 1),
(1837, '2015-02-28', 2, 871, 32, 1, 1, 1),
(1838, '2015-02-28', 4, 195, 65, 1, 1, 1),
(1839, '2015-02-28', 5, 13, 85, 1, 1, 1),
(1840, '2015-03-02', 269, 1, 1350, 1, 1, 1),
(1841, '2015-03-03', 27, 45, 110, 1, 1, 1),
(1842, '2015-03-03', 73, 200, 13, 1, 1, 1),
(1843, '2015-03-03', 94, 168, 99, 1, 1, 1),
(1844, '2015-03-03', 103, 20, 245, 1, 1, 1),
(1845, '2015-03-03', 147, 144, 10, 1, 1, 1),
(1846, '2015-03-03', 3, 104, 51, 1, 1, 1),
(1847, '2015-03-03', 2, 598, 39, 1, 1, 1),
(1848, '2015-03-03', 8, 12, 15, 1, 1, 1),
(1849, '2015-03-03', 38, 8, 110, 1, 1, 1),
(1850, '2015-03-03', 45, 12, 30, 1, 1, 1),
(1851, '2015-03-03', 33, 40, 115, 1, 1, 1),
(1852, '2015-03-03', 79, 10, 30, 1, 1, 1),
(1853, '2015-03-03', 94, 48, 99, 1, 1, 1),
(1854, '2015-03-03', 2, 4004, 35, 1, 1, 1),
(1855, '2015-03-03', 3, 2340, 51, 1, 1, 1),
(1856, '2015-03-03', 246, 663, 51, 1, 1, 1),
(1857, '2015-03-03', 4, 325, 79, 1, 1, 1),
(1858, '2015-03-03', 247, 312, 79, 1, 1, 1),
(1859, '2015-03-03', 7, 200, 11, 1, 1, 1),
(1860, '2015-03-03', 8, 100, 15, 1, 1, 1),
(1861, '2015-03-03', 9, 200, 25, 1, 1, 1),
(1862, '2015-03-03', 10, 200, 37, 1, 1, 1),
(1863, '2015-03-03', 45, 50, 30, 1, 1, 1),
(1864, '2015-03-03', 47, 50, 80, 1, 1, 1),
(1865, '2015-03-03', 36, 50, 150, 1, 1, 1),
(1866, '2015-03-03', 73, 100, 13, 1, 1, 1),
(1867, '2015-03-03', 74, 200, 20, 1, 1, 1),
(1868, '2015-03-03', 75, 200, 35, 1, 1, 1),
(1869, '2015-03-03', 76, 200, 70, 1, 1, 1),
(1870, '2015-03-03', 57, 300, 96, 1, 1, 1),
(1871, '2015-03-03', 54, 300, 40, 1, 1, 1),
(1872, '2015-03-03', 83, 100, 90, 1, 1, 1),
(1873, '2015-03-03', 80, 100, 35, 1, 1, 1),
(1874, '2015-03-03', 30, 150, 550, 1, 1, 1),
(1875, '2015-03-03', 29, 80, 305, 1, 1, 1),
(1876, '2015-03-03', 14, 30, 20, 1, 1, 1),
(1877, '2015-03-03', 244, 4004, 26, 1, 1, 1),
(1878, '2015-03-03', 79, 300, 30, 1, 1, 1),
(1879, '2015-03-03', 94, 300, 99, 1, 1, 1),
(1880, '2015-03-03', 104, 100, 290, 1, 1, 1),
(1881, '2015-03-03', 105, 100, 435, 1, 1, 1),
(1882, '2015-03-03', 240, 60, 1200, 1, 1, 1),
(1883, '2015-03-03', 274, 25, 2950, 1, 1, 1),
(1884, '2015-03-03', 9, 10, 25, 1, 1, 1),
(1885, '2015-03-03', 10, 10, 37, 1, 1, 1),
(1886, '2015-03-03', 77, 25, 110, 1, 1, 1),
(1887, '2015-03-04', 153, 1, 0.001, 1, 1, 1),
(1888, '2015-03-05', 5, 169, 98, 1, 1, 1),
(1889, '2015-03-05', 11, 8, 55, 1, 1, 1),
(1890, '2015-03-05', 15, 2, 25, 1, 1, 1),
(1891, '2015-03-05', 55, 3, 45, 1, 1, 1),
(1892, '2015-03-05', 60, 10, 100, 1, 1, 1),
(1893, '2015-03-05', 75, 2, 35, 1, 1, 1),
(1894, '2015-03-05', 76, 8, 70, 1, 1, 1),
(1895, '2015-03-05', 77, 12, 110, 1, 1, 1),
(1896, '2015-03-05', 31, 8, 750, 1, 1, 1),
(1897, '2015-03-05', 87, 4, 130, 1, 1, 1),
(1898, '2015-03-05', 18, 3, 42, 1, 1, 1),
(1899, '2015-03-05', 22, 4, 65, 1, 1, 1),
(1900, '2015-03-05', 57, 6, 96, 1, 1, 1),
(1901, '2015-03-05', 58, 2, 98, 1, 1, 1),
(1902, '2015-03-05', 81, 6, 40, 1, 1, 1),
(1903, '2015-03-05', 121, 26, 465, 1, 1, 1),
(1904, '2015-03-05', 122, 4, 500, 1, 1, 1),
(1905, '2015-03-05', 1, 1339, 23, 1, 1, 1),
(1906, '2015-03-05', 2, 390, 35, 1, 1, 1),
(1907, '2015-03-05', 8, 10, 15, 1, 1, 1),
(1908, '2015-03-05', 27, 42, 110, 1, 1, 1),
(1909, '2015-03-05', 44, 36, 18, 1, 1, 1),
(1910, '2015-03-05', 45, 20, 30, 1, 1, 1),
(1911, '2015-03-05', 53, 32, 35, 1, 1, 1),
(1912, '2015-03-05', 33, 2, 115, 1, 1, 1),
(1913, '2015-03-05', 35, 33, 130, 1, 1, 1),
(1914, '2015-03-05', 73, 270, 13, 1, 1, 1),
(1915, '2015-03-05', 74, 60, 20, 1, 1, 1),
(1916, '2015-03-05', 79, 60, 30, 1, 1, 1),
(1917, '2015-03-05', 94, 165, 99, 1, 1, 1),
(1918, '2015-03-05', 121, 20, 465, 1, 1, 1),
(1919, '2015-03-05', 147, 172, 10, 1, 1, 1),
(1920, '2015-03-05', 153, 1, 0.001, 1, 1, 1),
(1921, '2015-03-05', 27, 50, 110, 1, 1, 1),
(1922, '2015-03-05', 44, 150, 18, 1, 1, 1),
(1923, '2015-03-05', 45, 100, 30, 1, 1, 1),
(1924, '2015-03-05', 53, 100, 35, 1, 1, 1),
(1925, '2015-03-05', 73, 300, 13, 1, 1, 1),
(1926, '2015-03-05', 94, 150, 99, 1, 1, 1),
(1927, '2015-03-05', 153, 1, 0.001, 1, 1, 1),
(1928, '2015-03-05', 2, 26, 35, 1, 1, 1),
(1929, '2015-03-05', 5, 117, 98, 1, 1, 1),
(1930, '2015-03-07', 7, 3, 11, 1, 1, 1),
(1931, '2015-03-07', 27, 6, 110, 1, 1, 1),
(1932, '2015-03-07', 44, 11, 18, 1, 1, 1),
(1933, '2015-03-07', 46, 1, 40, 1, 1, 1),
(1934, '2015-03-07', 33, 2, 115, 1, 1, 1),
(1935, '2015-03-07', 73, 22, 13, 1, 1, 1),
(1936, '2015-03-07', 75, 20, 35, 1, 1, 1),
(1937, '2015-03-07', 101, 1, 198, 1, 1, 1),
(1938, '2015-03-07', 14, 2, 20, 1, 1, 1),
(1939, '2015-03-07', 29, 5, 305, 1, 1, 1),
(1940, '2015-03-07', 244, 104, 23, 1, 1, 1),
(1941, '2015-03-07', 246, 117, 51, 1, 1, 1),
(1942, '2015-03-07', 94, 12, 99, 1, 1, 1),
(1943, '2015-03-07', 120, 2, 375, 1, 1, 1),
(1944, '2015-03-07', 147, 19, 10, 1, 1, 1);

--
-- Triggers `stock_product_output`
--
DROP TRIGGER IF EXISTS `trigger___add_stock_product_output`;
DELIMITER $$
CREATE TRIGGER `trigger___add_stock_product_output` BEFORE INSERT ON `stock_product_output`
 FOR EACH ROW BEGIN
	DECLARE QUANTITY INT DEFAULT 0;

	IF NEW.stock_product_output_status = 0 THEN		
		UPDATE pestablishment_product_demand 
		SET out_ammount =  out_ammount + NEW.stock_product_output_qunatity
		WHERE idproduct = NEW.idproduct AND idpestablishment = NEW.idpestablishment;
	END IF;
	
   
	IF NEW.stock_product_output_status = 1 THEN
		SET QUANTITY := (SELECT ammount FROM pestablishment_product WHERE idproduct = NEW.idproduct AND idpestablishment = NEW.idpestablishment);
		IF QUANTITY  - NEW.stock_product_output_qunatity > 0 THEN
			UPDATE pestablishment_product 
			SET ammount =  ammount  - NEW.stock_product_output_qunatity
			WHERE idproduct = NEW.idproduct AND idpestablishment = NEW.idpestablishment;
		ELSE
    		IF @software_ln = 1 THEN
			   SET @software_error := (SELECT CONCAT(pestablishment_name, ' জায়গায় ' , product_name, ' ',  FORMAT(ammount,2), ' সংখ্যক অাছে ') FROM pestablishment_product LEFT JOIN product USING (idproduct) LEFT JOIN pestablishment USING(idpestablishment) WHERE idproduct = NEW.idproduct AND idpestablishment = NEW.idpestablishment);		   
			ELSE
			   SET @software_error := (SELECT CONCAT(product_name,' Stock Is ' ,  FORMAT(ammount,2), ' On ', pestablishment_name) FROM pestablishment_product LEFT JOIN product USING (idproduct) LEFT JOIN pestablishment USING(idpestablishment) WHERE idproduct = NEW.idproduct AND idpestablishment = NEW.idpestablishment);		   
      	END IF;
			CALL ___fault_crossing_creditlimit();
		END IF;
	END IF;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `trigger___delete_stock_product_output`;
DELIMITER $$
CREATE TRIGGER `trigger___delete_stock_product_output` BEFORE DELETE ON `stock_product_output`
 FOR EACH ROW BEGIN
	
	IF OLD.stock_product_output_status = 1 THEN		
		UPDATE pestablishment_product 
		SET ammount =  ammount + OLD.stock_product_output_qunatity
		WHERE idproduct = OLD.idproduct AND idpestablishment = OLD.idpestablishment;
	END IF;
	
	IF OLD.stock_product_output_status = 0 THEN		
		UPDATE pestablishment_product_demand 
		SET out_ammount =  out_ammount - OLD.stock_product_output_qunatity
		WHERE idproduct = OLD.idproduct AND idpestablishment = OLD.idpestablishment;
	END IF;

END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `trigger___edit_stock_product_output`;
DELIMITER $$
CREATE TRIGGER `trigger___edit_stock_product_output` BEFORE UPDATE ON `stock_product_output`
 FOR EACH ROW BEGIN
	DECLARE QUANTITY INT DEFAULT 0;
	
   IF OLD.stock_product_output_status = 1 THEN
    	IF @software_ln = 1 THEN
        	SET @software_error := ("সংশোধনযোগ্য নয়");
		ELSE
		   SET @software_error := ("Not Editable Now");		   
      END IF;
		CALL ___can_not_do_now();
   END IF;
	
	IF NEW.stock_product_output_status = 1 AND OLD.stock_product_output_status = 0 THEN
	
		SET QUANTITY := (SELECT ammount FROM pestablishment_product WHERE idproduct = NEW.idproduct AND idpestablishment = NEW.idpestablishment);
		
		IF QUANTITY - NEW.stock_product_output_qunatity >= 0 THEN
		
			UPDATE pestablishment_product 
			SET ammount =  ammount - NEW.stock_product_output_qunatity
			WHERE idproduct = NEW.idproduct AND idpestablishment = NEW.idpestablishment;
			
			UPDATE pestablishment_product_demand 
			SET out_ammount =  out_ammount - NEW.stock_product_output_qunatity
			WHERE idproduct = NEW.idproduct AND idpestablishment = NEW.idpestablishment;

			
		ELSE
    		IF @software_ln = 1 THEN
			   SET @software_error := (SELECT CONCAT(pestablishment_name, ' জায়গায় ' , product_name, ' ',  FORMAT(ammount,2), ' সংখ্যক অাছে ') FROM pestablishment_product LEFT JOIN product USING (idproduct) LEFT JOIN pestablishment USING(idpestablishment) WHERE idproduct = NEW.idproduct AND idpestablishment = NEW.idpestablishment);		   
			ELSE
			   SET @software_error := (SELECT CONCAT(product_name,' Stock Is ' ,  FORMAT(ammount,2), ' On ', pestablishment_name) FROM pestablishment_product LEFT JOIN product USING (idproduct) LEFT JOIN pestablishment USING(idpestablishment) WHERE idproduct = NEW.idproduct AND idpestablishment = NEW.idpestablishment);		   
      	END IF;
			CALL ___fault_crossing_creditlimit();
		END IF;
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stock_transfer`
--

DROP TABLE IF EXISTS `stock_transfer`;
CREATE TABLE IF NOT EXISTS `stock_transfer` (
`idstock_transfer` int(10) unsigned NOT NULL,
  `stock_transfer_date` date NOT NULL,
  `stock_transfer_comments` varchar(255) NOT NULL,
  `iduser` int(10) unsigned NOT NULL,
  `stock_transfer_entrytime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stock_transfer_stock_product_input_stock_product_output`
--

DROP TABLE IF EXISTS `stock_transfer_stock_product_input_stock_product_output`;
CREATE TABLE IF NOT EXISTS `stock_transfer_stock_product_input_stock_product_output` (
  `idstock_transfer` int(10) unsigned NOT NULL,
  `idstock_product_input` int(10) unsigned NOT NULL,
  `idstock_product_output` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `TEM_COM_copy`
--

DROP TABLE IF EXISTS `TEM_COM_copy`;
CREATE TABLE IF NOT EXISTS `TEM_COM_copy` (
  `idparty` int(10) unsigned NOT NULL DEFAULT '0',
  `company` varchar(128) DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `100000000` int(9) NOT NULL DEFAULT '0',
  `mobile` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `1` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `TEM_COM_copy`
--

INSERT INTO `TEM_COM_copy` (`idparty`, `company`, `balance`, `100000000`, `mobile`, `address`, `1`) VALUES
(5, 'Abiding Development &amp; Holdings Ltd (ADHL)', 234197.29999999987, 100000000, '+8801924585234', 'Akram Tower, Level-8, Suite-9, 199, Shahid Syed Nazrul Islam Sharani (15/5,BijoyNagar) Dhaka', 1),
(6, 'New Jharna Sanitary', 0, 100000000, '+8801972522945', '3, Darus-Salam Road, Mirpur-1, Dhaka', 1),
(7, 'Feni Dealer    ', 0.00000000005820766091346741, 100000000, '+8801721612270', 'Ritu Fashion House, Hazi Ibrahim Hossain Super Market, Trank Road, Feni', 1),
(8, 'Major Zakir', -9809.700000000004, 100000000, '+8801770252278', 'House # 212, Road # 10, DOHS, Mirpur-12, Dhaka', 1),
(9, 'Mr. Roni', 0, 100000000, '+8801819552000', 'Bhanga Press, Matbor Bari, Jatrabari', 1),
(10, 'Sami Real Estate &amp; Housing Ltd', -0.000000000014551915228366852, 100000000, '+8801714242739', '241, DIT Road (3rd Floor), Malibagh, Dhaka', 1),
(11, 'Maati Properties Ltd', 136291.75, 100000000, '+8801611594291', '84, Sheikh Rasel Square, Panthapath, Dhaka', 1),
(12, 'Sabbir &amp; Brothers ', 0, 100000000, '+8801199801563', 'Dhaka Tower,145/147, Hazi Osman Goni Road, Dhaka', 1),
(13, 'Utah Knitting &amp; Dyeing Ltd', 0, 100000000, '+8801713041180', 'House-13A,Road-117,Gulshan-1,Dhaka-1212', 1),
(14, 'Shandhani Life Housing &amp; Development Ltd.', -0.000000000007275957614183426, 100000000, '+8801833325967', '16, Motijheel C/A (4th Floor), Dhaka-1000', 1),
(15, 'Excel Real Estate &amp; Development Ltd.', 0, 100000000, '+8801779593951', '28, Topkhana Road, Dhaka-1000', 1),
(16, 'Victoria Properties Ltd.', 0, 100000000, '+8801931165591', 'House # 13, Road # 3, Block # E, Rampura Banashree, Dhaka.', 1),
(17, 'Hi-Q Developers Ltd.', -2144.75, 100000000, '+8802-9561749', '1/B, DIT Avenue (5th Floor), Motijheel C/A, Dhaka-1000', 1),
(18, 'Dhaka Polymer Ltd.', 0, 100000000, '+8801739622651', 'Green Road', 1),
(19, 'Md. Zahirul Islam', 0, 100000000, '+8801711662375', 'Rayer Bagh, Near Punom Cinama Hall, Dhaka.', 1),
(20, 'Shobuj Bhai (Gazipur)', 0.000000000014551915228366852, 100000000, '+8801753445615', 'Kashempur, Gazipur.', 1),
(21, 'Ideal Real Estate Ltd.', 68718.25, 100000000, '+8802-8113398,', 'Sultana Tower (8th Floor), 2 Mirpur Road, Kalabagan, Dhanmondi, Dhaka.', 1),
(22, 'Sarker Builders &amp; Developers Ltd.', 0, 100000000, '+8802-8932136', 'Plot # 10/A, Road # 7/D, Sec # 9, Uttara, Dhaka', 1),
(23, 'Mr. Barek', 5274.4, 100000000, '+8801726264825', '121/3/D, Ibrahimpur, Mirpur, Dhaka.', 1),
(24, 'Mohol Properties Ltd.', 0, 100000000, '+8801728262726', '20, Atish Dipanker, Bashaboo (2nd Floor), Dhaka.', 1),
(25, 'Babui Builders Ltd.', 0, 100000000, '+8802-8840541', 'Ka- 216, Hakim Plaza (2nd Floor), Badda, Dhaka.', 1),
(26, 'B. N Builders Ltd.', 1.3000000001629815, 100000000, '+8801711527067, ', '650/1, Bara Moghbazar, Dhaka-1217.', 1),
(27, 'Intex Properties Ltd.', 227314.90000000002, 100000000, '+8801841410698', 'D. K Tower (5th Floor), Bir Uttam C. R Datta Road, Hatirpool,Dhanmondi, Dhaka.', 1),
(28, 'A To Z Polymer Ltd.', 35045.90000000002, 100000000, '+8801712297814', 'Karwan Bazar, Dhaka.', 1),
(29, 'Genusys Ltd.', 0, 100000000, '+8801755639389', 'Sruti Tower (4th Floor), Plot # 08, Block # Ka, Sec # 06, Mirpur, Dhaka.', 1),
(30, 'Mim Sanitary', 0, 100000000, '+8801711682222', 'Gha- 24/1, Shajadpur, Gulshan, Dhaka.', 1),
(31, 'Lt. Col. Md. Mahabub', 0, 100000000, '+8801768962640', 'House # 229, Road # 4, Mirpur DOHS, Dhaka.', 1),
(32, 'Moon Group', 0, 100000000, '+8801775351538', '1/5, Mizan Tower, kallayanpur, Dhaka.', 1),
(33, 'Primex Building &amp; Materials Com. Ltd.', 0, 100000000, '+8802-85811069, ', '6A-6B, Attaturk Tower, 22 kamal Attaturk Avenue, banani, Dhaka.', 1),
(34, 'Can-Bangla Developers Ltd.', 0, 100000000, '+8801911457371', '105, Park Road, (Ground Floor), New DOHS, Mohakhali, Dhaka.', 1),
(35, 'Gtech Limited', 0.000000000014551915228366852, 100000000, '+8801721446886', 'House # 65, Road # 4, Block # D, Bashundhara, Dhaka.', 1),
(36, 'Md. Monir', 0, 100000000, '+880676563913', '59, Lal Chan Mokim Lane, Roth Khola', 1),
(37, 'H. S. Real Estate', 0, 100000000, '+8802-8714518,', 'House # 148, (Ground Floor), Road # 4, New DOHS, Mohakhali, Dhaka.', 1),
(38, 'Suncity Builders Ltd.', 0, 100000000, '+8802-8881136,', 'Estern Nibash, (2nd Floor), Suite # 204, 138 gulshan Avenue, Gulshan-2, Dhak-1212.', 1),
(39, 'Tristar Builders Ltd.', 0, 100000000, '+8801678079240', '20, Dilkusha C/A, (4th Floor), Dhaka-1000.', 1),
(40, 'Shara Housing Ltd.', 0, 100000000, '+8801728284718', 'House # 22/H, Road # 1, Block # D, Bashundhara R/A, Dhaka', 1),
(41, 'Architects Limited', 0, 100000000, '+8802-8154358, ', 'Apr # 4B, House # 42, Road # 9/A, Dhanmondi, Dhaka-1209.', 1),
(42, 'Md. Nazmul Hossain ', 0, 100000000, '+8801717247385', 'House # 77, Bir Uttam C. R Datta Road, Hatirpool, Dhanmondi, Dhaka.', 1),
(43, 'Dewan Holdings Ltd.', 0, 100000000, '+8802-9513567', 'Baitul View Tower, 56/1, Purana Paltan, Dhaka.', 1),
(44, 'Stone Town Developers Ltd.', -7125.599999999977, 100000000, '+8802-7211711, ', '583/C (2nd Floor), Shahid Baki Sharani, Malibagh Chowdhury Para, Dhaka,', 1),
(45, 'Heritage design &amp; Development Ltd.', 6057.600000000006, 100000000, '+8802-8833895, ', 'House # 500 (1st Floor), Road # 34, New D.O.H.S. Mohakhali, Dhaka.', 1),
(46, 'Kazi Zahid Imtiaz', 0, 100000000, '+880171124032', 'Confidance CNG Pump, Nandon, Chondra, Kaliyakar, Gazipur.', 1),
(51, 'Richmond Developers Ltd.', 0, 100000000, '+8802-8824239, +8802', 'Monarch (4th Floor), House # 74, Road # 21, Block # B, banani, Dhaka-1213', 1),
(52, 'Manama Developments Ltd.', 0, 100000000, '01719-795983', '14/11, Iqbal Road, Mohammadpur, Dhaka', 1),
(53, 'Heritage Real Estate Ltd.', -543, 100000000, '+8802-9103554', '160, Lake Circus (2nd Floor), Kolabagan, Mirpur Road, Dhanmondi, Dhaka-1205', 1),
(54, 'Md. Raju Chowdhury', 1463.0499999999884, 100000000, '+8801716865603', 'House # 27, Mirpur Post Office Road, Mirpur-2, Dhaka', 1),
(56, 'ATIL Sample for Marketing', 141178.7000000002, 100000000, '01913030931', '15/5,Bijoy Nagar', 1),
(57, 'A. R Real Estate Ltd.', 0, 100000000, '01741-782680', 'House # 131, Road # 4, Block # A, Banani, Dhaka.', 1),
(58, 'Articulation Developments Ltd.', 76.63999999978114, 100000000, '0167-8678122', '17/B, Monipuripara (1st Floor), Shangshad Avenue, Dhaka-1215.', 1),
(59, 'Isphahan Real Estate Ltd.', 0, 100000000, '01712835113', 'House # 288/5-6, Block # C, Khilgaon Chowdhury Para, Dhaka-1219.', 1),
(60, 'The Orbital (Bangladesh) Limited', 4838.019999999902, 100000000, '01730-734116', 'House # 434, Road # 30, New DOHS, Mohakhali, Dhaka', 1),
(61, 'Homes 71 Limited', 0.40000000002328306, 100000000, '01912-624623', 'House # 434, Main Road (Old), DOHS Mirpur, Dhaka-1216', 1),
(62, 'Col. Md. Saleh Ahamed', 0, 100000000, '01833325967', 'House # 1040, Road # 44, DOHS, Mirpur, Dhaka.', 1),
(63, 'Ancient Builders Limited', 0, 100000000, '+8801711-389795', '14, Bijoy Nagar, 3rd floor, Dhaka-1000.', 1),
(64, 'Unique Living Ltd.', 186642.3999999999, 100000000, '+880167-2013046', 'Padma House, Ground Floor, 117/1, Shantinagar, Dhaka.', 1),
(65, 'Annex Holding Ltd.', -17583.399999999965, 100000000, '+8801552-117549', 'Kha- 100/1, Khilkhet Namapara, Dhaka.', 1),
(66, 'Arena Holdings Ltd.', 0, 100000000, '01750444000', '8/2, New Eskaton, (Gausnagar), Ground Floor, Ramna, Dhaka', 1),
(69, 'City Polymer Ltd.', 0, 100000000, '+880167-5804444', 'House # 442/C, Shaheenbag, Mohakhali, Tejgaon, Dhaka-1225.', 1),
(70, 'Abdul High Sarker', 0, 100000000, '01712297814', 'Plot # 1203, Kawla, Uttara, Dhaka.', 1),
(71, 'Adept International ', 0, 100000000, '+8801917247385', 'Dilora Tower, (3rd Floor), House # 77, Bir Uttam C. R Datta Road, Hatirpool, Dhanmondi, Dhaka.', 1),
(72, 'Jamuna Sanitary', 0, 100000000, '+880167-6153313', '2/D, Bashtola, Nurerchala, J Block, Baridhara, Dhaka.', 1),
(73, 'Dr. Major Rehana Begum', 0, 100000000, '01931-80 95 18', 'House # 1046, Road # 44, DOHS Mirpur, Dhaka.', 1),
(74, 'Gemcon City Limited', 4585.189999999828, 100000000, '01713333307', 'House # 44, Road # 16 (27 Old), Dhanmondi, Dhaka', 1),
(75, 'Nirban Real Estate Limited', 0.0000000000009094947017729282, 100000000, '0183-33 116 08', 'House # 69/3, Road # 7/A, Dhanmondi, Dhaka', 1),
(76, 'Desun Garments Ltd.', 0, 100000000, '+8801712297814', '89/1, Birulia Road, Savar Bus Stand, Savar.', 1),
(77, 'Md. Saiful Islam ', 0, 100000000, '01819-20 24 92', '27, Ahamed Nagar, Paik Para, Mirpur-1, Dhaka.', 1),
(78, 'Md. Rakibul Hasan', 10686.75, 100000000, '01611-516 9 06', 'House # 105, Road # 1, DOHS Mohakhali, Dhaka', 1),
(79, 'Kingdom Builders Ltd.', 185444.30000000005, 100000000, '01678-041203', 'House # 470, Road # 31, DOHS Mohakhali, Dhaka', 1),
(80, 'Somerset Properties Ltd. ', -0.000000000003637978807091713, 100000000, '01912-07 59 45', 'House # 23/B, Road # 104, Gulshan-2', 1),
(81, 'Md. Nasir ', 0, 100000000, '01822- 87 12 04', '68, Shankar, West Dhanmondi, Dhaka', 1),
(82, 'Md. Mizanur Rahman', 0, 100000000, '01911-257133', 'House # 6/D, Topkhana Road, Shegunbagicha, Dhaka.', 1),
(83, 'Home Source Ltd.', 918.3000000000175, 100000000, '01819-211406', 'House # 3/1, Block # D, Lalmatia, Dhanmondi, Dhaka', 1),
(84, 'Doreen Interior', 0, 100000000, '01816-26 65 56', '60/B, Purana Paltan, Ground floor, Dhaka-1000', 1),
(85, 'Dipa Construction Ltd.', 0.000000000003637978807091713, 100000000, '01785-641768', '12/1, Mirpur-10, Dhaka', 1),
(86, 'Navana Engineering Ltd.', 0.6999999999970896, 100000000, '01833- 32 66 67', '125/A,Motijheel,C/A,Dhaka', 1),
(87, 'Olive Crown Resources Ltd.', 1501.4000000000233, 100000000, '01728-08 66 68', '40/1, Naya Paltan, (84, Shantinagar) (4th Floor), V.I.P Road, A.R Khan Trade Center, Dhaka-1000', 1),
(89, 'Hotel Switch garden', 0, 100000000, '01687-36 10 15', 'House # 89, Road # 13, Banani, Dhaka', 1),
(91, 'Rams Developments Ltd', 0, 100000000, '01922-10 61 17', 'House # 44 F/6 ( 2nd Floor), West Panthapath, Dhaka-1215', 1),
(92, 'New Borak Sanitary Ware', 0, 100000000, '0119-5-09 73 11', '16/2, Azom Road, Mohammadpur, Dhaka-1207', 1),
(93, 'Wealth Builders Ltd.', 498.3999999999942, 100000000, '01779-593951', '15/5, Bijoynagar, Dhaka', 1),
(94, 'Helal Senitary', 424.39999999999964, 100000000, '01718-348439', '48/3, Mirpur-1, Dhaka', 1),
(96, 'Md. Hanif', 0, 100000000, '01712-70 30 17', 'House # 8, Road # 1, Sec # 3, Uattara, Dhaka', 1),
(97, 'Md. Ali Haider (Mis Match)', 116289.4, 100000000, '01913-030931', '15/5, Bijoynagar, Dhaka.', 1),
(98, 'Rafique Construction Ltd', 0, 100000000, '01946-94 62 82', '33/1, (2nd Floor), Green Road, Dhanmondi, Dhaka.', 1),
(99, 'Dr. Majeda Khatun', 0, 100000000, '01741-638532', 'House # 425, Road # 7, Block # D, Bashundhara, Dhaka.', 1),
(100, 'Hazi Abul Hashem Chowdhury', 0.000000000014551915228366852, 100000000, '01819-53 47 38', 'Shanti Chaya, Shanti Company Road, Feni.', 1),
(101, 'Epic Properties Ltd', -0.000000000029103830456733704, 100000000, '01777786719', 'House # 81/3, Autis Dipankar Sharak, Sabujbagh, Bashaboo, Dhaka.', 1),
(102, 'Techven Properties Ltd', 110789.79999999999, 100000000, '01763-717585', 'House # 92 A, Mosjid Road, DOHS, Banani, Dhaka', 1),
(103, 'Sharmin Sanitary', 0, 100000000, '01621-54 75 90', 'Ga- 23/1, Shahjadpur, Dhaka.', 1),
(104, 'Green Agency', 0, 100000000, '01732-82 84 44', '27/1, Haazi Osman Goni Road, Allou Bazar Dhaka.', 1),
(106, 'Belal Hossain', 0, 100000000, '01718-483471', '1 No Siddique Bazar, Dhaka', 1),
(107, 'Apon Sanitary', 0, 100000000, '01923-47 39 59', '1 No Siddique Bazar, Dhaka.', 1),
(108, 'Home Stade Builders Ltd.', 0, 100000000, '01717-46 13 63 ', 'House# 7/2, (4th floor), Block # Ka, Main Road, Bashundhara, Dhaka.', 1),
(109, 'Bashir Ahamed', 0, 100000000, '01911-34 21 67', 'Ta 16/2, Middle Badda, Dhaka', 1),
(110, 'Islami Bank bangladesh Limited (Mr. Nasir Ahmed Howlader)', 0, 100000000, '01710966601', 'Islami Bank Shyamoli, Mirpur Road, Dhaka.', 1),
(111, 'Md. Karim', 0, 100000000, '01712- 28 23 09', 'House # 531/7, Road # 11, Baridhara DOHS, Dhaka', 1),
(112, 'Shohidul Islam', -0.000000000007275957614183426, 100000000, '01685-89 55  72', '51/1/ A1, South Mugda, Opside of Jheelpar Mosjid, Dhaka.', 1),
(113, 'Abdul Latif (Feni)', 0.000000000003637978807091713, 100000000, '01819-53 47 38', 'Mojlishpur, Mollabari, Cadet Collage Road, Feni', 1),
(114, 'Al Ihasan Realtor Ltd.', 1263.5, 100000000, '01678- 70 21 01', 'City Heart Building (10th Floor), Nayapaltan, Dhaka.', 1),
(115, 'Jamal Uddin', 0, 100000000, '01621-461370 (Ajomol', 'Khilkhtet East Namapara, Beside Water Tank, Dhaka', 1),
(116, 'Mojammel Haq', 0, 100000000, '01785-641764', 'House # 77, Akbor Shah Mosjid Road, Mirpur-1, Dhaka', 1),
(117, 'S.M Khalid Shams', 0.0000000000018189894035458565, 100000000, '01924-99 58 85', '264/2, Sultangonj, Rayer Bazar, Dhaka', 1),
(118, 'Thikana Properties Ltd', 465.3000000000029, 100000000, '01943-682246', 'House # 202/E, Road # 6, Mohammadia Housing Ltd, Mohammadpur, Dhaka', 1),
(119, 'M/s Talha Enterprise', 170052.60000000003, 100000000, '01913-056944', '21, Shahid Soyed Najrul Islam Sharani (North South Road), 26/1, Hazi Osman Goni Road, Dhaka-1000', 1),
(120, 'Cosmic Tower', -0.1999999999825377, 100000000, '01732-932533', '106/Ka, Nayapalton, Box Culvert Road, Motijheel, Dhaka.', 1),
(121, 'Md.Rafique Shaikh', 0.0000000000018189894035458565, 100000000, '01712-97 68 96', '184/1, Ahamed Nagar, Paik Para. Habuler Pukur Par, Near Of  Mosjid.', 1),
(122, 'Momin Real Estate Ltd', 156047.09999999998, 100000000, '01819-71 05 15', 'House # 387, Road # 29, Mohakhali D.O.H.S, Dhaka', 1),
(123, 'Md. Liton', 0, 100000000, '01830-940704', '42/2, Rayer Bazar, Dhaka', 1),
(124, 'Humayun Kabir Manik (Feni)', 0, 100000000, '01715-17 41 23', 'New Police Line, Feni Sadar, Feni', 1),
(125, 'Eastern Housing Limited', 285314.902, 100000000, '01724-866897', 'Islam Chamber, 125/A, Motijheel C/A, Dhaka-1000', 1),
(126, 'Rajdhani Sanitary', 0, 100000000, '01716-900612', 'Uttar badda, Shahjadpur', 1),
(127, 'Hazi Md. Shahjahan, ', 0, 100000000, '01819-534738', 'S.B Leather House, Saudagar Patti, Feni', 1),
(128, 'Nextus Builders &amp; Developers Ltd', 981, 100000000, '02-8835184', 'House # 30, Road # 10, block # D, Banani, Dhaka.', 1),
(129, 'Abul Hashem Khan', -0.000000000029103830456733704, 100000000, '01711-980350', 'House # 266-2, Isha-kha Road, Ahmed Nagar, Paikpara, Dhaka', 1),
(131, 'Progati Design &amp; Development Ltd', -426.8399999999965, 100000000, '01672-463373', 'Al-Raji Complex (3rd floor), Paltan, Dhaka', 1),
(132, 'Nurun Nobi', 0, 100000000, '01713-040446', 'House # 8, Road # 4, Sec # 12, Uttara, Dhaka', 1),
(133, 'L.B Trading Link International', -1266.2300000000105, 100000000, '02-8960668', 'Flat # 3D (3rd Fl.), House # 06, Road # 14/A,, Sec # 04, Uttara, Dhaka-1230', 1),
(134, 'Md. Miraz Hossain', 0, 100000000, '01712-976896', '151/1/A, Habuler Pukur Par Mosjid, Paikpara, Mirpur-1, Dhaka.', 1),
(136, 'Tushar Ahmed', 0, 100000000, '01671- 41 75 18 ', '137, Begum Rokeya Sharani, Mirpur # 10, Dhaka', 1),
(137, 'Cosmopolitan Homes Ltd.', 0, 100000000, '01678-029821', '22/2, Babor Road, Block # B, Mohammadpur, Dhaka.', 1),
(139, 'Advance Development Consultants Ltd', 0, 100000000, '01714-015732', '759, Satmasjid Road, Dhanmondi, Dhaka-1209', 1),
(140, 'Rans Real Estate Ltd', 0, 100000000, '01716-185740', 'House # 2015, Road # 14, D.O.H.S Mohakhali, Dhaka', 1),
(141, 'Tropical Homes Ltd', 0, 100000000, '01811-455873', 'Planers Tower, Bangla Motor, Dhaka', 1),
(142, 'C.P Bangladesh Co. Ltd.', 0, 100000000, '01744-310618', 'Valuka Farm-13, Valuka, Mymensingh. ', 1),
(143, 'Nahar Sanitary', 0, 100000000, '01715- 15 04 03', '61/2, Progati Sharani, Baridhara, Dhaka', 1),
(144, 'Janata Saniraty ', 0, 100000000, '01772-835496', '10/C, Savar Bus Stand, Savar, Dhaka.', 1),
(145, 'Core Development Ltd', 130.29999999999995, 100000000, '01771-13 75 13', 'House # 41, Road # 30, D.O.H.S Mohakhali, Dhaka', 1),
(146, 'Md. Maruf Hossain', 1171.4000000000015, 100000000, '01713 08 21 45', 'shampur', 1),
(147, 'Desh Polymer', 906.4499999999971, 100000000, '01837-31 48 84', 'House # 7, Road # 2, Block # A, Sec # 2, Mirpur, Dhaka', 1),
(148, 'Prakriti Development Ltd', 0.00000000005820766091346741, 100000000, '01911-14 21 26', 'House # 18, Shahid Taj Uddin Sharani, Moghbazar, Dhaka', 1),
(149, 'Southern Real Estate Ltd', 82587.99999999997, 100000000, '01718-53 28 44', 'House # 18 New (2nd Floor), Road # 7, Dhanmondi, Dhaka', 1),
(150, 'Sammi Sanitary', 0, 100000000, '01914-19 63 62', 'Chowrangi Market, Mirpur-10, Dhaka', 1),
(151, 'Hazi Sayed Zahir Ahsan Zahid', 0, 100000000, '01711-64 81 01', '69/1, Purana Paltan, Vip Roa, Oriental Trade Centre (4th Floor), Dhaka.', 1),
(152, 'Care Homes Ltd', 41.89999999999418, 100000000, '01912-923192', '380/B, Mirpur Road (3rd Floor), Dhanmondi-27, Dhaka', 1),
(153, 'Anayet Contractor ', 0, 100000000, '01792-22 42 23', '280, Mirpur-10, Dhaka', 1),
(154, 'Zahid Sanitary', 0, 100000000, '01726-35 26 47', 'Abdur Rashid Manson, Kawtoli, Brahmanbaria, Bangladesh', 1),
(155, 'Akaba Development Ltd', 0, 100000000, '01678-043383', '55/B, Purana Paltan', 1),
(156, 'Labib Group', 14316.25, 100000000, '01862-725872', 'House # 17, Road # 4, Block # K, Baridhara, Dhaka', 1),
(157, 'Md. Masum', -0.000000000014551915228366852, 100000000, '01915-703624', '512, Manda Battola, Dhaka.', 1),
(158, 'Reliance Holdings Ltd ', 0, 100000000, '01716-55 12 58', 'House # 119, Road # 1, Block # F, Banani, Dhaka', 1),
(159, 'Parents Fair Trade Int.', -0.1500000000014552, 100000000, '01818-17 73 32', '25, Shahid Sayeed nazrul Islam Sharani, Alu Bazar, Dhaka', 1),
(160, 'Configure Group', 0, 100000000, '01817-210928', 'House # 132, Road # 13/C, Block # E, Banani, Dhaka', 1),
(161, 'Estate Holdings Ltd', -650.7999999999884, 100000000, '01739-18 33 06', 'House # 5, Road # 2/D, Block # J, Baridhara', 1),
(162, 'Md. Shahjahan', -4730.300000000003, 100000000, '01856-41 53 53 ', 'Fagun, Rajendrapur, Gazipur. ', 1),
(163, 'Hero Sanitary', 642.3199999999961, 100000000, '01921-45 40 15', '11 No Bhavan Market, Gulshan-2, Dhaka.', 1),
(164, 'Parrot Development Ltd', 0, 100000000, '01911-35 69 27', '12-13, Rahman Chamber, Motijheel, Dhaka', 1),
(165, 'Anam Sanitary', -0.000000000029103830456733704, 100000000, '01712-09 34 76', 'Platinum Market, Gulshan-2, Dhaka', 1),
(166, 'Md. Salim', 0, 100000000, '01672-073043', 'House # 309, Alambagh, Jurain, Dhaka.', 1),
(167, 'Md. Bahar', 0, 100000000, '01818-49 10 00', 'House # Ta 135/1, Badda Gudara Ghat, Dhaka', 1),
(168, 'Ejab Development Ltd.', 375035.26999999996, 100000000, '01847- 06 62 97', '42, Mohakhali C/A, Dhaka', 1),
(169, 'Padma Diagnostic Center ', 0, 100000000, '01712-68 71 36', 'House # 245/2, Mouchak,Malibagh, Dhaka', 1),
(170, 'S.F Builders Ltd', 2575, 100000000, '01796-24 11 42', 'House # 890, Road # 17/A, Mirpur D.O.H.S, Dhaka ', 1),
(171, 'Col. Mr. Mannan', 671.5, 100000000, '01680-04 20 54', 'House # 275/277, Road # 3, Mirpur D.O.H.S, Dhaka', 1),
(172, 'Royal Stone Ltd', 6306.699999999997, 100000000, '01723-33 87 85', 'House # 54, Road # 10, Block # E, Banani, Dhaka', 1),
(173, 'Golden Agency', 0, 100000000, '01944- 72 80 85', '188/A, Nobijan Plaza, Siddiq Bazar, Dhaka', 1),
(174, 'Shuruchi Properties Ltd', -22253.550000000017, 100000000, '028858954', 'House # 331 (1st Floor0, Road # 22, New D.O.H.S Mohakhali, Dhaka', 1),
(175, 'Putul Properties Ltd', -0.000000000029103830456733704, 100000000, '02-8411538, 02-84115', 'House # 490, Road # 8, DOHS Baridhara, Dhaka', 1),
(176, 'Hazi Mohammad Alam', 8499.75, 100000000, '01711-23 07 54', '148Water Works Road, Chandi Ghat, Rohmatgonj.', 1),
(177, 'Nid Mohol Housing Ltd', 0, 100000000, '01719-48 50 96', '219/A, South Pirerbagh, Mirpur, Dhaka', 1),
(178, 'ACE Development Ltd', 1347.949999999997, 100000000, '01711-56 74 03', 'House # 339, Road # 29, Mohakhali D.O.H.S, Dhaka', 1),
(179, 'Md. Al-Amin', 0.000000000007275957614183426, 100000000, '01718-35 48 76', '140/1, Lake Circus, Kalabagan, Dhaka', 1),
(181, 'Exotica Homes Ltd', 1745.699999999997, 100000000, '01688-63 63 79', '464/C, Khilgaon, Dhaka', 1),
(182, 'Wind &amp; Light Development Ltd', 157064.12, 100000000, '01733-21 55 73', '17/C, SS Steel building, Panthapath, Dhaka', 1),
(183, 'Grameen Builders Ltd', 116.34999999997672, 100000000, '01730- 45 55 95', '13 Khilgi Road, Mohammadpur, Dhaka', 1),
(184, 'Index Companies ', 9705.800000000003, 100000000, '01712- 01 57 33', 'House # 34, Road # Block # K, Baridhara, Dhaka', 1),
(185, 'Araf Holdings Ltd', -1813.2799999999988, 100000000, '01819-552290', 'VIP Tower, (3rd floor), 51/1 Vip Road, Naya Paltan, Dhaka', 1),
(186, 'Md. Sohel', 10852.12, 100000000, '01819-71 05 15', 'House # 730, Purbo Faydabad, Dakhin Khan, Uttara, Dhaka', 1),
(187, 'Joty Enterprise', 4412.1500000000015, 100000000, '01817-51 42 96', '173 Inner Circuler Road, Arambagh, Motijheel, Dhaka', 1),
(188, 'Shuchona 5p', 0, 100000000, '029641100', 'Hydrolink Limited, Chandrashila Suvastu Tower, Suite-13A, 69/1, Panthapath, Dhaka', 1),
(189, 'Cdr. Baniz Ali', 1317.699999999997, 100000000, '01680-04 20 54', 'Plot # 1325, Road # 26/A, Mirpur D.O.H.S, Dhaka', 1),
(190, 'Ohee Builders Ltd', -2489.100000000006, 100000000, '01778-31 98 63', '323/1, D.I.T Road, Rampura, Dhaka', 1),
(191, 'Nur Hossain Khan', 0.7199999999720603, 100000000, '01952-71 33 50', '95, Naya Paltan, Dhaka', 1),
(192, 'Bangladesh Sanitary', 0, 100000000, '01937-94 28 23', '88/A, Sher-Sha-Suri Road, Mohammadpur, Dhaka', 1),
(193, 'Estate Management Partners Ltd', 17151.95000000001, 100000000, '02-9673379', 'House # 9, Road # 8, Dhanmondi, Dhaka', 1),
(194, 'Social Marketing Company', 405.45000000001164, 100000000, '01711-80 34 43', '33, Banani C/A, Dhaka', 1),
(195, 'Mezba Uddin Plaza', 0, 100000000, '017126-87136', '91 Mouchak, Dhaka', 1),
(196, 'Mr. Ariful', 0, 100000000, '0171-8560505', '62/5, Shiddeshwari (4th floor), Dhaka', 1),
(197, 'Vision Living Ltd.', 218543.55000000016, 100000000, '01711-38 24 16', 'House # 12, Road # 10, Sec # 4, Uttara, Dhaka', 1),
(198, 'Sany Sanitary', 0, 100000000, '01914-26 40 30', '98/2, Senpara Parbata, Mirpur-10, Dhaka', 1),
(199, 'Tani Construction Ltd', 5950.199999999997, 100000000, '01716-907806', 'House # 12, Road # 10, Sec # 4, Uttara, Dhaka', 1),
(200, 'AZ Sanitary', 0, 100000000, '01789-03 55 06', 'Dolphin Goli, Kalabagan, Dhaka', 1),
(201, 'Mr. Ruhul Amin', 0, 100000000, '01767- 84 78 74', 'Arai Hajar, Narayngonj.', 1),
(202, 'Col. Meher', 0.5, 100000000, '01720 99 77 00', 'House# 276, Road# 03, D.O.H.S, Mirpur, Dhaka.', 1),
(203, 'Trust Asset Limited', 224670.15000000002, 100000000, '02 8963629', 'House # 18, Road # 01, Sec # 05, Uttara Dhaka.', 1),
(204, 'Italian Real Estate &amp; Devlopments Ltd', 8.160000000003492, 100000000, '8919261', 'A B Super Market, Azampur Uttara Dhaka', 1),
(205, 'A R S Properties Ltd', 5954.799999999999, 100000000, '01937 70 59 31', '93/3 Badda Main Road ', 1),
(206, 'BOCL ', 16142, 100000000, '01917-43 24 33', 'Sultana Tower, (6th floor), 1st Lane, Kalabagan, Dhaka', 1),
(207, 'Seven Circle Development', 91208.6, 100000000, '02-8817690', '28, Gulshan-2, (7th Floor), Dhaka', 1),
(208, 'Orbit Bhaban', 20.639999999999418, 100000000, '02-7392407', '1/2, Orbit Manson, 21 Islampur, Dhaka', 1),
(209, 'Md. Momin Ullah Saymon', 0.6500000000014552, 100000000, '01680-24 28 27', '85/3, Arambagh, Motijheel, Dhaka', 1),
(210, 'ICL Real Estate Ltd', 215410.65, 100000000, '01711-82 34 34', '48, Bijoynagar, Dhaka', 1),
(211, 'Space Properties Ltd.', 212978.5, 100000000, '02-7175840 ', '47/4, Toyenbee Cirular Road, Dhaka', 1),
(212, 'Sena Kalyan Construction &amp; Developments', 8567.3, 100000000, '01730-79 24 02', 'House # 615, Road # Main Road, D.O.H.S, Mirpur, Dhaka', 1),
(213, 'Mr. Nazrul Islam', 8.25, 100000000, '01912-70 54 16', 'Sekher Nagar, Siraji Khan, Munshigonj', 1);

-- --------------------------------------------------------

--
-- Table structure for table `TEM_COM_DET_copy`
--

DROP TABLE IF EXISTS `TEM_COM_DET_copy`;
CREATE TABLE IF NOT EXISTS `TEM_COM_DET_copy` (
  `idparty` int(10) unsigned NOT NULL DEFAULT '0',
  `balance` double DEFAULT NULL,
  `company` varchar(128) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `0` int(1) NOT NULL DEFAULT '0',
  `2014-12-08` varchar(10) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `NULL` binary(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `TEM_COM_DET_copy`
--

INSERT INTO `TEM_COM_DET_copy` (`idparty`, `balance`, `company`, `mobile`, `0`, `2014-12-08`, `NULL`) VALUES
(205, 5954.799999999999, 'A R S Properties Ltd', '01937 70 59 31', 0, '2014-12-08', NULL),
(28, 35045.90000000002, 'A To Z Polymer Ltd.', '+8801712297814', 0, '2014-12-08', NULL),
(57, 0, 'A. R Real Estate Ltd.', '01741-782680', 0, '2014-12-08', NULL),
(70, 0, 'Abdul High Sarker', '01712297814', 0, '2014-12-08', NULL),
(113, 0.000000000003637978807091713, 'Abdul Latif (Feni)', '01819-53 47 38', 0, '2014-12-08', NULL),
(5, 234197.29999999987, 'Abiding Development &amp; Holdings Ltd (ADHL)', '+8801924585234', 0, '2014-12-08', NULL),
(129, -0.000000000029103830456733704, 'Abul Hashem Khan', '01711-980350', 0, '2014-12-08', NULL),
(178, 1347.949999999997, 'ACE Development Ltd', '01711-56 74 03', 0, '2014-12-08', NULL),
(71, 0, 'Adept International ', '+8801917247385', 0, '2014-12-08', NULL),
(139, 0, 'Advance Development Consultants Ltd', '01714-015732', 0, '2014-12-08', NULL),
(155, 0, 'Akaba Development Ltd', '01678-043383', 0, '2014-12-08', NULL),
(114, 1263.5, 'Al Ihasan Realtor Ltd.', '01678- 70 21 01', 0, '2014-12-08', NULL),
(165, -0.000000000029103830456733704, 'Anam Sanitary', '01712-09 34 76', 0, '2014-12-08', NULL),
(153, 0, 'Anayet Contractor ', '01792-22 42 23', 0, '2014-12-08', NULL),
(63, 0, 'Ancient Builders Limited', '+8801711-389795', 0, '2014-12-08', NULL),
(65, -17583.399999999965, 'Annex Holding Ltd.', '+8801552-117549', 0, '2014-12-08', NULL),
(107, 0, 'Apon Sanitary', '01923-47 39 59', 0, '2014-12-08', NULL),
(185, -1813.2799999999988, 'Araf Holdings Ltd', '01819-552290', 0, '2014-12-08', NULL),
(41, 0, 'Architects Limited', '+8802-8154358, ', 0, '2014-12-08', NULL),
(66, 0, 'Arena Holdings Ltd.', '01750444000', 0, '2014-12-08', NULL),
(58, 76.63999999978114, 'Articulation Developments Ltd.', '0167-8678122', 0, '2014-12-08', NULL),
(56, 141178.7000000002, 'ATIL Sample for Marketing', '01913030931', 0, '2014-12-08', NULL),
(200, 0, 'AZ Sanitary', '01789-03 55 06', 0, '2014-12-08', NULL),
(26, 1.3000000001629815, 'B. N Builders Ltd.', '+8801711527067, ', 0, '2014-12-08', NULL),
(25, 0, 'Babui Builders Ltd.', '+8802-8840541', 0, '2014-12-08', NULL),
(192, 0, 'Bangladesh Sanitary', '01937-94 28 23', 0, '2014-12-08', NULL),
(109, 0, 'Bashir Ahamed', '01911-34 21 67', 0, '2014-12-08', NULL),
(106, 0, 'Belal Hossain', '01718-483471', 0, '2014-12-08', NULL),
(206, 16142, 'BOCL ', '01917-43 24 33', 0, '2014-12-08', NULL),
(142, 0, 'C.P Bangladesh Co. Ltd.', '01744-310618', 0, '2014-12-08', NULL),
(34, 0, 'Can-Bangla Developers Ltd.', '+8801911457371', 0, '2014-12-08', NULL),
(152, 41.89999999999418, 'Care Homes Ltd', '01912-923192', 0, '2014-12-08', NULL),
(189, 1317.699999999997, 'Cdr. Baniz Ali', '01680-04 20 54', 0, '2014-12-08', NULL),
(69, 0, 'City Polymer Ltd.', '+880167-5804444', 0, '2014-12-08', NULL),
(62, 0, 'Col. Md. Saleh Ahamed', '01833325967', 0, '2014-12-08', NULL),
(202, 0.5, 'Col. Meher', '01720 99 77 00', 0, '2014-12-08', NULL),
(171, 671.5, 'Col. Mr. Mannan', '01680-04 20 54', 0, '2014-12-08', NULL),
(160, 0, 'Configure Group', '01817-210928', 0, '2014-12-08', NULL),
(145, 130.29999999999995, 'Core Development Ltd', '01771-13 75 13', 0, '2014-12-08', NULL),
(120, -0.1999999999825377, 'Cosmic Tower', '01732-932533', 0, '2014-12-08', NULL),
(137, 0, 'Cosmopolitan Homes Ltd.', '01678-029821', 0, '2014-12-08', NULL),
(147, 906.4499999999971, 'Desh Polymer', '01837-31 48 84', 0, '2014-12-08', NULL),
(76, 0, 'Desun Garments Ltd.', '+8801712297814', 0, '2014-12-08', NULL),
(43, 0, 'Dewan Holdings Ltd.', '+8802-9513567', 0, '2014-12-08', NULL),
(18, 0, 'Dhaka Polymer Ltd.', '+8801739622651', 0, '2014-12-08', NULL),
(85, 0.000000000003637978807091713, 'Dipa Construction Ltd.', '01785-641768', 0, '2014-12-08', NULL),
(84, 0, 'Doreen Interior', '01816-26 65 56', 0, '2014-12-08', NULL),
(99, 0, 'Dr. Majeda Khatun', '01741-638532', 0, '2014-12-08', NULL),
(73, 0, 'Dr. Major Rehana Begum', '01931-80 95 18', 0, '2014-12-08', NULL),
(125, 285314.902, 'Eastern Housing Limited', '01724-866897', 0, '2014-12-08', NULL),
(168, 375035.26999999996, 'Ejab Development Ltd.', '01847- 06 62 97', 0, '2014-12-08', NULL),
(101, -0.000000000029103830456733704, 'Epic Properties Ltd', '01777786719', 0, '2014-12-08', NULL),
(161, -650.7999999999884, 'Estate Holdings Ltd', '01739-18 33 06', 0, '2014-12-08', NULL),
(193, 17151.95000000001, 'Estate Management Partners Ltd', '02-9673379', 0, '2014-12-08', NULL),
(15, 0, 'Excel Real Estate &amp; Development Ltd.', '+8801779593951', 0, '2014-12-08', NULL),
(181, 1745.699999999997, 'Exotica Homes Ltd', '01688-63 63 79', 0, '2014-12-08', NULL),
(7, 0.00000000005820766091346741, 'Feni Dealer    ', '+8801721612270', 0, '2014-12-08', NULL),
(74, 4585.189999999828, 'Gemcon City Limited', '01713333307', 0, '2014-12-08', NULL),
(29, 0, 'Genusys Ltd.', '+8801755639389', 0, '2014-12-08', NULL),
(173, 0, 'Golden Agency', '01944- 72 80 85', 0, '2014-12-08', NULL),
(183, 116.34999999997672, 'Grameen Builders Ltd', '01730- 45 55 95', 0, '2014-12-08', NULL),
(104, 0, 'Green Agency', '01732-82 84 44', 0, '2014-12-08', NULL),
(35, 0.000000000014551915228366852, 'Gtech Limited', '+8801721446886', 0, '2014-12-08', NULL),
(37, 0, 'H. S. Real Estate', '+8802-8714518,', 0, '2014-12-08', NULL),
(100, 0.000000000014551915228366852, 'Hazi Abul Hashem Chowdhury', '01819-53 47 38', 0, '2014-12-08', NULL),
(127, 0, 'Hazi Md. Shahjahan, ', '01819-534738', 0, '2014-12-08', NULL),
(176, 8499.75, 'Hazi Mohammad Alam', '01711-23 07 54', 0, '2014-12-08', NULL),
(151, 0, 'Hazi Sayed Zahir Ahsan Zahid', '01711-64 81 01', 0, '2014-12-08', NULL),
(94, 424.39999999999964, 'Helal Senitary', '01718-348439', 0, '2014-12-08', NULL),
(45, 6057.600000000006, 'Heritage design &amp; Development Ltd.', '+8802-8833895, ', 0, '2014-12-08', NULL),
(53, -543, 'Heritage Real Estate Ltd.', '+8802-9103554', 0, '2014-12-08', NULL),
(163, 642.3199999999961, 'Hero Sanitary', '01921-45 40 15', 0, '2014-12-08', NULL),
(17, -2144.75, 'Hi-Q Developers Ltd.', '+8802-9561749', 0, '2014-12-08', NULL),
(83, 918.3000000000175, 'Home Source Ltd.', '01819-211406', 0, '2014-12-08', NULL),
(108, 0, 'Home Stade Builders Ltd.', '01717-46 13 63 ', 0, '2014-12-08', NULL),
(61, 0.40000000002328306, 'Homes 71 Limited', '01912-624623', 0, '2014-12-08', NULL),
(89, 0, 'Hotel Switch garden', '01687-36 10 15', 0, '2014-12-08', NULL),
(124, 0, 'Humayun Kabir Manik (Feni)', '01715-17 41 23', 0, '2014-12-08', NULL),
(210, 215410.65, 'ICL Real Estate Ltd', '01711-82 34 34', 0, '2014-12-08', NULL),
(21, 68718.25, 'Ideal Real Estate Ltd.', '+8802-8113398,', 0, '2014-12-08', NULL),
(184, 9705.800000000003, 'Index Companies ', '01712- 01 57 33', 0, '2014-12-08', NULL),
(27, 227314.90000000002, 'Intex Properties Ltd.', '+8801841410698', 0, '2014-12-08', NULL),
(110, 0, 'Islami Bank bangladesh Limited (Mr. Nasir Ahmed Howlader)', '01710966601', 0, '2014-12-08', NULL),
(59, 0, 'Isphahan Real Estate Ltd.', '01712835113', 0, '2014-12-08', NULL),
(204, 8.160000000003492, 'Italian Real Estate &amp; Devlopments Ltd', '8919261', 0, '2014-12-08', NULL),
(115, 0, 'Jamal Uddin', '01621-461370 (Ajomol', 0, '2014-12-08', NULL),
(72, 0, 'Jamuna Sanitary', '+880167-6153313', 0, '2014-12-08', NULL),
(144, 0, 'Janata Saniraty ', '01772-835496', 0, '2014-12-08', NULL),
(187, 4412.1500000000015, 'Joty Enterprise', '01817-51 42 96', 0, '2014-12-08', NULL),
(46, 0, 'Kazi Zahid Imtiaz', '+880171124032', 0, '2014-12-08', NULL),
(79, 185444.30000000005, 'Kingdom Builders Ltd.', '01678-041203', 0, '2014-12-08', NULL),
(133, -1266.2300000000105, 'L.B Trading Link International', '02-8960668', 0, '2014-12-08', NULL),
(156, 14316.25, 'Labib Group', '01862-725872', 0, '2014-12-08', NULL),
(31, 0, 'Lt. Col. Md. Mahabub', '+8801768962640', 0, '2014-12-08', NULL),
(119, 170052.60000000003, 'M/s Talha Enterprise', '01913-056944', 0, '2014-12-08', NULL),
(11, 136291.75, 'Maati Properties Ltd', '+8801611594291', 0, '2014-12-08', NULL),
(8, -9809.700000000004, 'Major Zakir', '+8801770252278', 0, '2014-12-08', NULL),
(52, 0, 'Manama Developments Ltd.', '01719-795983', 0, '2014-12-08', NULL),
(179, 0.000000000007275957614183426, 'Md. Al-Amin', '01718-35 48 76', 0, '2014-12-08', NULL),
(97, 116289.4, 'Md. Ali Haider (Mis Match)', '01913-030931', 0, '2014-12-08', NULL),
(167, 0, 'Md. Bahar', '01818-49 10 00', 0, '2014-12-08', NULL),
(96, 0, 'Md. Hanif', '01712-70 30 17', 0, '2014-12-08', NULL),
(111, 0, 'Md. Karim', '01712- 28 23 09', 0, '2014-12-08', NULL),
(123, 0, 'Md. Liton', '01830-940704', 0, '2014-12-08', NULL),
(146, 1171.4000000000015, 'Md. Maruf Hossain', '01713 08 21 45', 0, '2014-12-08', NULL),
(157, -0.000000000014551915228366852, 'Md. Masum', '01915-703624', 0, '2014-12-08', NULL),
(134, 0, 'Md. Miraz Hossain', '01712-976896', 0, '2014-12-08', NULL),
(82, 0, 'Md. Mizanur Rahman', '01911-257133', 0, '2014-12-08', NULL),
(209, 0.6500000000014552, 'Md. Momin Ullah Saymon', '01680-24 28 27', 0, '2014-12-08', NULL),
(36, 0, 'Md. Monir', '+880676563913', 0, '2014-12-08', NULL),
(81, 0, 'Md. Nasir ', '01822- 87 12 04', 0, '2014-12-08', NULL),
(42, 0, 'Md. Nazmul Hossain ', '+8801717247385', 0, '2014-12-08', NULL),
(54, 1463.0499999999884, 'Md. Raju Chowdhury', '+8801716865603', 0, '2014-12-08', NULL),
(78, 10686.75, 'Md. Rakibul Hasan', '01611-516 9 06', 0, '2014-12-08', NULL),
(77, 0, 'Md. Saiful Islam ', '01819-20 24 92', 0, '2014-12-08', NULL),
(166, 0, 'Md. Salim', '01672-073043', 0, '2014-12-08', NULL),
(162, -4730.300000000003, 'Md. Shahjahan', '01856-41 53 53 ', 0, '2014-12-08', NULL),
(186, 10852.12, 'Md. Sohel', '01819-71 05 15', 0, '2014-12-08', NULL),
(19, 0, 'Md. Zahirul Islam', '+8801711662375', 0, '2014-12-08', NULL),
(121, 0.0000000000018189894035458565, 'Md.Rafique Shaikh', '01712-97 68 96', 0, '2014-12-08', NULL),
(195, 0, 'Mezba Uddin Plaza', '017126-87136', 0, '2014-12-08', NULL),
(30, 0, 'Mim Sanitary', '+8801711682222', 0, '2014-12-08', NULL),
(24, 0, 'Mohol Properties Ltd.', '+8801728262726', 0, '2014-12-08', NULL),
(116, 0, 'Mojammel Haq', '01785-641764', 0, '2014-12-08', NULL),
(122, 156047.09999999998, 'Momin Real Estate Ltd', '01819-71 05 15', 0, '2014-12-08', NULL),
(32, 0, 'Moon Group', '+8801775351538', 0, '2014-12-08', NULL),
(196, 0, 'Mr. Ariful', '0171-8560505', 0, '2014-12-08', NULL),
(23, 5274.4, 'Mr. Barek', '+8801726264825', 0, '2014-12-08', NULL),
(213, 8.25, 'Mr. Nazrul Islam', '01912-70 54 16', 0, '2014-12-08', NULL),
(9, 0, 'Mr. Roni', '+8801819552000', 0, '2014-12-08', NULL),
(201, 0, 'Mr. Ruhul Amin', '01767- 84 78 74', 0, '2014-12-08', NULL),
(143, 0, 'Nahar Sanitary', '01715- 15 04 03', 0, '2014-12-08', NULL),
(86, 0.6999999999970896, 'Navana Engineering Ltd.', '01833- 32 66 67', 0, '2014-12-08', NULL),
(92, 0, 'New Borak Sanitary Ware', '0119-5-09 73 11', 0, '2014-12-08', NULL),
(6, 0, 'New Jharna Sanitary', '+8801972522945', 0, '2014-12-08', NULL),
(128, 981, 'Nextus Builders &amp; Developers Ltd', '02-8835184', 0, '2014-12-08', NULL),
(177, 0, 'Nid Mohol Housing Ltd', '01719-48 50 96', 0, '2014-12-08', NULL),
(75, 0.0000000000009094947017729282, 'Nirban Real Estate Limited', '0183-33 116 08', 0, '2014-12-08', NULL),
(191, 0.7199999999720603, 'Nur Hossain Khan', '01952-71 33 50', 0, '2014-12-08', NULL),
(132, 0, 'Nurun Nobi', '01713-040446', 0, '2014-12-08', NULL),
(190, -2489.100000000006, 'Ohee Builders Ltd', '01778-31 98 63', 0, '2014-12-08', NULL),
(87, 1501.4000000000233, 'Olive Crown Resources Ltd.', '01728-08 66 68', 0, '2014-12-08', NULL),
(208, 20.639999999999418, 'Orbit Bhaban', '02-7392407', 0, '2014-12-08', NULL),
(169, 0, 'Padma Diagnostic Center ', '01712-68 71 36', 0, '2014-12-08', NULL),
(159, -0.1500000000014552, 'Parents Fair Trade Int.', '01818-17 73 32', 0, '2014-12-08', NULL),
(164, 0, 'Parrot Development Ltd', '01911-35 69 27', 0, '2014-12-08', NULL),
(148, 0.00000000005820766091346741, 'Prakriti Development Ltd', '01911-14 21 26', 0, '2014-12-08', NULL),
(33, 0, 'Primex Building &amp; Materials Com. Ltd.', '+8802-85811069, ', 0, '2014-12-08', NULL),
(131, -426.8399999999965, 'Progati Design &amp; Development Ltd', '01672-463373', 0, '2014-12-08', NULL),
(175, -0.000000000029103830456733704, 'Putul Properties Ltd', '02-8411538, 02-84115', 0, '2014-12-08', NULL),
(98, 0, 'Rafique Construction Ltd', '01946-94 62 82', 0, '2014-12-08', NULL),
(126, 0, 'Rajdhani Sanitary', '01716-900612', 0, '2014-12-08', NULL),
(91, 0, 'Rams Developments Ltd', '01922-10 61 17', 0, '2014-12-08', NULL),
(140, 0, 'Rans Real Estate Ltd', '01716-185740', 0, '2014-12-08', NULL),
(158, 0, 'Reliance Holdings Ltd ', '01716-55 12 58', 0, '2014-12-08', NULL),
(51, 0, 'Richmond Developers Ltd.', '+8802-8824239, +8802', 0, '2014-12-08', NULL),
(172, 6306.699999999997, 'Royal Stone Ltd', '01723-33 87 85', 0, '2014-12-08', NULL),
(170, 2575, 'S.F Builders Ltd', '01796-24 11 42', 0, '2014-12-08', NULL),
(117, 0.0000000000018189894035458565, 'S.M Khalid Shams', '01924-99 58 85', 0, '2014-12-08', NULL),
(12, 0, 'Sabbir &amp; Brothers ', '+8801199801563', 0, '2014-12-08', NULL),
(10, -0.000000000014551915228366852, 'Sami Real Estate &amp; Housing Ltd', '+8801714242739', 0, '2014-12-08', NULL),
(150, 0, 'Sammi Sanitary', '01914-19 63 62', 0, '2014-12-08', NULL),
(198, 0, 'Sany Sanitary', '01914-26 40 30', 0, '2014-12-08', NULL),
(22, 0, 'Sarker Builders &amp; Developers Ltd.', '+8802-8932136', 0, '2014-12-08', NULL),
(212, 8567.3, 'Sena Kalyan Construction &amp; Developments', '01730-79 24 02', 0, '2014-12-08', NULL),
(207, 91208.6, 'Seven Circle Development', '02-8817690', 0, '2014-12-08', NULL),
(14, -0.000000000007275957614183426, 'Shandhani Life Housing &amp; Development Ltd.', '+8801833325967', 0, '2014-12-08', NULL),
(40, 0, 'Shara Housing Ltd.', '+8801728284718', 0, '2014-12-08', NULL),
(103, 0, 'Sharmin Sanitary', '01621-54 75 90', 0, '2014-12-08', NULL),
(20, 0.000000000014551915228366852, 'Shobuj Bhai (Gazipur)', '+8801753445615', 0, '2014-12-08', NULL),
(112, -0.000000000007275957614183426, 'Shohidul Islam', '01685-89 55  72', 0, '2014-12-08', NULL),
(188, 0, 'Shuchona 5p', '029641100', 0, '2014-12-08', NULL),
(174, -22253.550000000017, 'Shuruchi Properties Ltd', '028858954', 0, '2014-12-08', NULL),
(194, 405.45000000001164, 'Social Marketing Company', '01711-80 34 43', 0, '2014-12-08', NULL),
(80, -0.000000000003637978807091713, 'Somerset Properties Ltd. ', '01912-07 59 45', 0, '2014-12-08', NULL),
(149, 82587.99999999997, 'Southern Real Estate Ltd', '01718-53 28 44', 0, '2014-12-08', NULL),
(211, 212978.5, 'Space Properties Ltd.', '02-7175840 ', 0, '2014-12-08', NULL),
(44, -7125.599999999977, 'Stone Town Developers Ltd.', '+8802-7211711, ', 0, '2014-12-08', NULL),
(38, 0, 'Suncity Builders Ltd.', '+8802-8881136,', 0, '2014-12-08', NULL),
(199, 5950.199999999997, 'Tani Construction Ltd', '01716-907806', 0, '2014-12-08', NULL),
(102, 110789.79999999999, 'Techven Properties Ltd', '01763-717585', 0, '2014-12-08', NULL),
(60, 4838.019999999902, 'The Orbital (Bangladesh) Limited', '01730-734116', 0, '2014-12-08', NULL),
(118, 465.3000000000029, 'Thikana Properties Ltd', '01943-682246', 0, '2014-12-08', NULL),
(39, 0, 'Tristar Builders Ltd.', '+8801678079240', 0, '2014-12-08', NULL),
(141, 0, 'Tropical Homes Ltd', '01811-455873', 0, '2014-12-08', NULL),
(203, 224670.15000000002, 'Trust Asset Limited', '02 8963629', 0, '2014-12-08', NULL),
(136, 0, 'Tushar Ahmed', '01671- 41 75 18 ', 0, '2014-12-08', NULL),
(64, 186642.3999999999, 'Unique Living Ltd.', '+880167-2013046', 0, '2014-12-08', NULL),
(13, 0, 'Utah Knitting &amp; Dyeing Ltd', '+8801713041180', 0, '2014-12-08', NULL),
(16, 0, 'Victoria Properties Ltd.', '+8801931165591', 0, '2014-12-08', NULL),
(197, 218543.55000000016, 'Vision Living Ltd.', '01711-38 24 16', 0, '2014-12-08', NULL),
(93, 498.3999999999942, 'Wealth Builders Ltd.', '01779-593951', 0, '2014-12-08', NULL),
(182, 157064.12, 'Wind &amp; Light Development Ltd', '01733-21 55 73', 0, '2014-12-08', NULL),
(154, 0, 'Zahid Sanitary', '01726-35 26 47', 0, '2014-12-08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `TEM_DET_2_copy`
--

DROP TABLE IF EXISTS `TEM_DET_2_copy`;
CREATE TABLE IF NOT EXISTS `TEM_DET_2_copy` (
  `idparty` int(10) unsigned NOT NULL DEFAULT '0',
  `balance` double DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `0` int(1) NOT NULL DEFAULT '0',
  `2014-12-08` int(7) NOT NULL DEFAULT '0',
  `NULL` binary(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `TEM_DET_2_copy`
--

INSERT INTO `TEM_DET_2_copy` (`idparty`, `balance`, `name`, `mobile`, `0`, `2014-12-08`, `NULL`) VALUES
(5, 234197.29999999987, 'Syed Murad Ahamed', '+8801924585234', 0, 1994, NULL),
(6, 0, 'Mr. Shuvo', '+8801972522945', 0, 1994, NULL),
(7, 0.00000000005820766091346741, 'Md. Ekramul Haque', '+8801721612270', 0, 1994, NULL),
(8, -9809.700000000004, 'Major Zakir', '+8801770252278', 0, 1994, NULL),
(9, 0, 'Mr. Roni', '+8801819552000', 0, 1994, NULL),
(10, -0.000000000014551915228366852, 'Mr. Hedaytul Islam', '+8801714242739', 0, 1994, NULL),
(11, 136291.75, 'Mr. Utpol Kumar', '+8801611594291', 0, 1994, NULL),
(12, 0, 'Mr. Anwar', '+8801199801563', 0, 1994, NULL),
(13, 0, 'Mr. Based', '+8801713041180', 0, 1994, NULL),
(14, -0.000000000007275957614183426, 'Mr. Shahidur Rahman', '+8801833325967', 0, 1994, NULL),
(15, 0, 'Mr. Jamal', '+8801779593951', 0, 1994, NULL),
(16, 0, 'Director', '+8801931165591', 0, 1994, NULL),
(17, -2144.75, 'SM Abdur Rahman', '+8802-9561749', 0, 1994, NULL),
(18, 0, 'Mr. Kanchan', '+8801739622651', 0, 1994, NULL),
(19, 0, 'Mr. Zahirul Islam', '+8801711662375', 0, 1994, NULL),
(20, 0.000000000014551915228366852, 'Shobuj Bhai', '+8801753445615', 0, 1994, NULL),
(21, 68718.25, 'Anis Faruki', '+8802-8113398,', 0, 1994, NULL),
(22, 0, 'Mr. Tutue', '+8802-8932136', 0, 1994, NULL),
(23, 5274.4, 'Mr. Mizan', '+8801726264825', 0, 1994, NULL),
(24, 0, 'Mr. Litan', '+8801728262726', 0, 1994, NULL),
(25, 0, 'S.M Abdur Rahman', '+8802-8840541', 0, 1994, NULL),
(26, 1.3000000001629815, 'Mr. fazlu', '+8801711527067, ', 0, 1994, NULL),
(27, 227314.90000000002, 'Mr. Khorshed', '+8801841410698', 0, 1994, NULL),
(28, 35045.90000000002, 'Mr. Monir', '+8801712297814', 0, 1994, NULL),
(29, 0, 'Mr. Ratan', '+8801755639389', 0, 1994, NULL),
(30, 0, 'Mr. Jamal', '+8801711682222', 0, 1994, NULL),
(31, 0, 'Mr. Mahabub', '+8801768962640', 0, 1994, NULL),
(32, 0, 'Mr. Rasel', '+8801775351538', 0, 1994, NULL),
(33, 0, 'Mr. faruk', '+8802-85811069, ', 0, 1994, NULL),
(34, 0, 'Mr. Anisuzzaman', '+8801911457371', 0, 1994, NULL),
(35, 0.000000000014551915228366852, 'Mr. Ismail', '+8801721446886', 0, 1994, NULL),
(36, 0, 'Mr. Monir', '+880676563913', 0, 1994, NULL),
(37, 0, 'Mr. Mastakar Rahman', '+8802-8714518,', 0, 1994, NULL),
(38, 0, 'Mr. jahangir Hossain', '+8802-8881136,', 0, 1994, NULL),
(39, 0, 'Mr. Nasir Uddin', '+8801678079240', 0, 1994, NULL),
(40, 0, 'Mr. Bojlu', '+8801728284718', 0, 1994, NULL),
(41, 0, 'Mr. Ahrafuzzaman', '+8802-8154358, ', 0, 1994, NULL),
(42, 0, 'Mr. Sohel', '+8801717247385', 0, 1994, NULL),
(43, 0, 'Mr. Saymon', '+8802-9513567', 0, 1994, NULL),
(44, -7125.599999999977, 'Mr. Solayman', '+8802-7211711, ', 0, 1994, NULL),
(45, 6057.600000000006, 'Mr. Engr. Akram', '+8802-8833895, ', 0, 1994, NULL),
(46, 0, 'Mr. Alauddin', '+880171124032', 0, 1994, NULL),
(51, 0, 'Mr. Al Amin (Deputi Manager)', '+8802-8824239, +8802', 0, 1994, NULL),
(52, 0, 'Mr. Jon', '01719-795983', 0, 1994, NULL),
(53, -543, 'A. K. M Abdullah Al Baki', '+8802-9103554', 0, 1994, NULL),
(54, 1463.0499999999884, 'Md. Raju Chowdhury', '+8801716865603', 0, 1994, NULL),
(56, 141178.7000000002, 'Ali Haider', '01913030931', 0, 1994, NULL),
(57, 0, 'Engr. Sobhan', '01741-782680', 0, 1994, NULL),
(58, 76.63999999978114, 'Engr. Hasan', '0167-8678122', 0, 1994, NULL),
(59, 0, 'Md. Mahbubul Alam Khan', '01712835113', 0, 1994, NULL),
(60, 4838.019999999902, 'Gazi Md. Aftabuzzaman', '01730-734116', 0, 1994, NULL),
(61, 0.40000000002328306, 'Md. Jahangir Alam', '01912-624623', 0, 1994, NULL),
(62, 0, 'Col. Md. Saleh Ahamed', '01833325967', 0, 1994, NULL),
(63, 0, 'Engr: Rafiq', '+8801711-389795', 0, 1994, NULL),
(64, 186642.3999999999, 'Mr. Rubel', '+880167-2013046', 0, 1994, NULL),
(65, -17583.399999999965, 'Eng. Anowar Hossain', '+8801552-117549', 0, 1994, NULL),
(66, 0, 'Didder-e-Mostofa Pavel', '01750444000', 0, 1994, NULL),
(69, 0, 'Mr. Masum Parvez', '+880167-5804444', 0, 1994, NULL),
(70, 0, 'Md. Abdul High Sarker', '01712297814', 0, 1994, NULL),
(71, 0, 'Nazmul Hossain', '+8801917247385', 0, 1994, NULL),
(72, 0, 'Mr. Kamal', '+880167-6153313', 0, 1994, NULL),
(73, 0, 'Dr. Major Rehana Begum', '01931-80 95 18', 0, 1994, NULL),
(74, 4585.189999999828, 'Md. Anisur Rahman', '01713333307', 0, 1994, NULL),
(75, 0.0000000000009094947017729282, 'Mr. Rabbani', '0183-33 116 08', 0, 1994, NULL),
(76, 0, 'Mr. Monir', '+8801712297814', 0, 1994, NULL),
(77, 0, 'Md. Saiful Islam ', '01819-20 24 92', 0, 1994, NULL),
(78, 10686.75, 'Md. Rakibul Hasan', '01611-516 9 06', 0, 1994, NULL),
(79, 185444.30000000005, 'Mr. Osman (Engr.)', '01678-041203', 0, 1994, NULL),
(80, -0.000000000003637978807091713, 'Mr. Borhan Uddin', '01912-07 59 45', 0, 1994, NULL),
(81, 0, 'Md. Nasir (Contractor)', '01822- 87 12 04', 0, 1994, NULL),
(82, 0, 'Md. Mizanur Rahman', '01911-257133', 0, 1994, NULL),
(83, 918.3000000000175, 'Engr. Saidur Rahman', '01819-211406', 0, 1994, NULL),
(84, 0, 'A.S.M Asaduzzaman', '01816-26 65 56', 0, 1994, NULL),
(85, 0.000000000003637978807091713, 'Dipa Construction Ltd.', '01785-641768', 0, 1994, NULL),
(86, 0.6999999999970896, 'Mr. Mamun', '01833- 32 66 67', 0, 1994, NULL),
(87, 1501.4000000000233, 'Mr. Mamun', '01728-08 66 68', 0, 1994, NULL),
(89, 0, 'Mr. Jakir', '01687-36 10 15', 0, 1994, NULL),
(91, 0, 'Mr. Riopn', '01922-10 61 17', 0, 1994, NULL),
(92, 0, 'Md. Shahadat Hossain', '0119-5-09 73 11', 0, 1994, NULL),
(93, 498.3999999999942, 'Mr. jamal', '01779-593951', 0, 1994, NULL),
(94, 424.39999999999964, 'Mr. Helal', '01718-348439', 0, 1994, NULL),
(96, 0, 'Md. Hanif', '01712-70 30 17', 0, 1994, NULL),
(97, 116289.4, 'Md. Ali Haider', '01913-030931', 0, 1994, NULL),
(98, 0, 'Md. Shajahan', '01946-94 62 82', 0, 1994, NULL),
(99, 0, 'Dr. Majeda Khatun', '01741-638532', 0, 1994, NULL),
(100, 0.000000000014551915228366852, 'Hazi Abul Hashem Chowdhury', '01819-53 47 38', 0, 1994, NULL),
(101, -0.000000000029103830456733704, 'Md. Saymon', '01777786719', 0, 1994, NULL),
(102, 110789.79999999999, 'Md. Saymon', '01763-717585', 0, 1994, NULL),
(103, 0, 'Hanif Sharder', '01621-54 75 90', 0, 1994, NULL),
(104, 0, 'S M Abdur Rahman', '01732-82 84 44', 0, 1994, NULL),
(106, 0, 'Belal Hossain', '01718-483471', 0, 1994, NULL),
(107, 0, 'Md. Mizan', '01923-47 39 59', 0, 1994, NULL),
(108, 0, 'Md. Latif ', '01717-46 13 63 ', 0, 1994, NULL),
(109, 0, 'Bashir Ahamed', '01911-34 21 67', 0, 1994, NULL),
(110, 0, 'Nasir Ahmed Howlader', '01710966601', 0, 1994, NULL),
(111, 0, 'Md. Karim', '01712- 28 23 09', 0, 1994, NULL),
(112, -0.000000000007275957614183426, 'Shohidul Islam', '01685-89 55  72', 0, 1994, NULL),
(113, 0.000000000003637978807091713, 'Abdul Latif ', '01819-53 47 38', 0, 1994, NULL),
(114, 1263.5, 'Engr. Mosharaf Hossain', '01678- 70 21 01', 0, 1994, NULL),
(115, 0, 'Jamal Uddin', '01621-461370 (Ajomol', 0, 1994, NULL),
(116, 0, 'Mojammel Haq', '01785-641764', 0, 1994, NULL),
(117, 0.0000000000018189894035458565, 'S.M Khalid Shams', '01924-99 58 85', 0, 1994, NULL),
(118, 465.3000000000029, 'Mr. Jamal Uddin', '01943-682246', 0, 1994, NULL),
(119, 170052.60000000003, 'Md. Abu Talha', '01913-056944', 0, 1994, NULL),
(120, -0.1999999999825377, 'Jakir', '01732-932533', 0, 1994, NULL),
(121, 0.0000000000018189894035458565, 'Md.Rafique Shaikh', '01712-97 68 96', 0, 1994, NULL),
(122, 156047.09999999998, 'Md. Sujon (Purchase manager)', '01819-71 05 15', 0, 1994, NULL),
(123, 0, 'Md. Liton', '01830-940704', 0, 1994, NULL),
(124, 0, 'Humayun Kabir', '01715-17 41 23', 0, 1994, NULL),
(125, 285314.902, 'Zakir Hossain', '01724-866897', 0, 1994, NULL),
(126, 0, 'Mr. Azmir ', '01716-900612', 0, 1994, NULL),
(127, 0, 'Hazi Md. Shahjahan, ', '01819-534738', 0, 1994, NULL),
(128, 981, 'Md. Jamal Nasir', '02-8835184', 0, 1994, NULL),
(129, -0.000000000029103830456733704, 'Abul Hashem Khan', '01711-980350', 0, 1994, NULL),
(131, -426.8399999999965, 'Md. jamal Uddin', '01672-463373', 0, 1994, NULL),
(132, 0, 'Nurun Nobi', '01713-040446', 0, 1994, NULL),
(133, -1266.2300000000105, 'Md. Mijanur Rahman (Lavlu)', '02-8960668', 0, 1994, NULL),
(134, 0, 'Md. Miraz Hossain', '01712-976896', 0, 1994, NULL),
(136, 0, 'Tushar Ahmed', '01671- 41 75 18 ', 0, 1994, NULL),
(137, 0, 'Mr. Barek Sikder', '01678-029821', 0, 1994, NULL),
(139, 0, 'Kabir Mahmud Hassan', '01714-015732', 0, 1994, NULL),
(140, 0, 'Md. habib Hasan (Purchase)', '01716-185740', 0, 1994, NULL),
(141, 0, 'Mr. Sazzad', '01811-455873', 0, 1994, NULL),
(142, 0, 'Mehedi Hasan Babul', '01744-310618', 0, 1994, NULL),
(143, 0, 'Mr. Riaz', '01715- 15 04 03', 0, 1994, NULL),
(144, 0, 'Mr. Reaz', '01772-835496', 0, 1994, NULL),
(145, 130.29999999999995, 'Mr. Israfil', '01771-13 75 13', 0, 1994, NULL),
(146, 1171.4000000000015, 'Md. Maruf Hossain', '01713 08 21 45', 0, 1994, NULL),
(147, 906.4499999999971, 'Md. Tushar', '01837-31 48 84', 0, 1994, NULL),
(148, 0.00000000005820766091346741, 'Mr. Ekram', '01911-14 21 26', 0, 1994, NULL),
(149, 82587.99999999997, 'Md. Sanowar Hossain', '01718-53 28 44', 0, 1994, NULL),
(150, 0, 'Sammi Sanitary', '01914-19 63 62', 0, 1994, NULL),
(151, 0, 'Hazi Sayed Zahir Ahsan Zahid', '01711-64 81 01', 0, 1994, NULL),
(152, 41.89999999999418, 'Dr. Md. Sohel Al Beruni', '01912-923192', 0, 1994, NULL),
(153, 0, 'Mr. Anayet', '01792-22 42 23', 0, 1994, NULL),
(154, 0, 'Mr. Zahid', '01726-35 26 47', 0, 1994, NULL),
(155, 0, 'Mr. Jamal Uddin', '01678-043383', 0, 1994, NULL),
(156, 14316.25, 'Engr. Maksud Alam', '01862-725872', 0, 1994, NULL),
(157, -0.000000000014551915228366852, 'Md. Masum', '01915-703624', 0, 1994, NULL),
(158, 0, 'Md. Rokonuj zaman', '01716-55 12 58', 0, 1994, NULL),
(159, -0.1500000000014552, 'Md. Mesbah Uddin (Mizan)', '01818-17 73 32', 0, 1994, NULL),
(160, 0, 'Md. Rajib', '01817-210928', 0, 1994, NULL),
(161, -650.7999999999884, 'Engr. Abu Sayeed ', '01739-18 33 06', 0, 1994, NULL),
(162, -4730.300000000003, 'Md. Shahjahan', '01856-41 53 53 ', 0, 1994, NULL),
(163, 642.3199999999961, 'Md. Riaz', '01921-45 40 15', 0, 1994, NULL),
(164, 0, 'Md. Ripon', '01911-35 69 27', 0, 1994, NULL),
(165, -0.000000000029103830456733704, 'Mr. Anam', '01712-09 34 76', 0, 1994, NULL),
(166, 0, 'Md. Salim', '01672-073043', 0, 1994, NULL),
(167, 0, 'Md. Bahar', '01818-49 10 00', 0, 1994, NULL),
(168, 375035.26999999996, 'Md. Belayet', '01847- 06 62 97', 0, 1994, NULL),
(169, 0, 'Md. Nazrul Islam', '01712-68 71 36', 0, 1994, NULL),
(170, 2575, 'Md. Rafique (Manager)', '01796-24 11 42', 0, 1994, NULL),
(171, 671.5, 'Col. Mr. Mannan', '01680-04 20 54', 0, 1994, NULL),
(172, 6306.699999999997, 'Md. Saymon', '01723-33 87 85', 0, 1994, NULL),
(173, 0, 'Golden Agency', '01944- 72 80 85', 0, 1994, NULL),
(174, -22253.550000000017, 'Ayub Ali', '028858954', 0, 1994, NULL),
(175, -0.000000000029103830456733704, 'Sumaya Mostafa (Managing Director)', '02-8411538, 02-84115', 0, 1994, NULL),
(176, 8499.75, 'Hazi Mohammad Alam', '01711-23 07 54', 0, 1994, NULL),
(177, 0, 'Md. Moshiur Rahman', '01719-48 50 96', 0, 1994, NULL),
(178, 1347.949999999997, 'Md. Nuruzzman', '01711-56 74 03', 0, 1994, NULL),
(179, 0.000000000007275957614183426, 'Md. Al-Amin', '01718-35 48 76', 0, 1994, NULL),
(181, 1745.699999999997, 'Md. Sohidul Haq', '01688-63 63 79', 0, 1994, NULL),
(182, 157064.12, 'Md. Riaz uddin', '01733-21 55 73', 0, 1994, NULL),
(183, 116.34999999997672, 'Md. Jamal Uddin', '01730- 45 55 95', 0, 1994, NULL),
(184, 9705.800000000003, 'Md. Zakir Hossain Khan (Asst. Manager)', '01712- 01 57 33', 0, 1994, NULL),
(185, -1813.2799999999988, 'Shakawat Hossain Chowdhury Rashel', '01819-552290', 0, 1994, NULL),
(186, 10852.12, 'Md. Sohel ', '01819-71 05 15', 0, 1994, NULL),
(187, 4412.1500000000015, 'Md. Shafayet Hossain Titu', '01817-51 42 96', 0, 1994, NULL),
(188, 0, 'S.K Sajjad', '029641100', 0, 1994, NULL),
(189, 1317.699999999997, 'Cdr. Baniz Ali', '01680-04 20 54', 0, 1994, NULL),
(190, -2489.100000000006, 'Md. Saymon', '01778-31 98 63', 0, 1994, NULL),
(191, 0.7199999999720603, 'Nur Hossain Khan', '01952-71 33 50', 0, 1994, NULL),
(192, 0, 'Jashim Uddin', '01937-94 28 23', 0, 1994, NULL),
(193, 17151.95000000001, 'Mr. Shakil (Purchase Office)', '02-9673379', 0, 1994, NULL),
(194, 405.45000000001164, 'Md. Kashem', '01711-80 34 43', 0, 1994, NULL),
(195, 0, 'Md. Nazrul', '017126-87136', 0, 1994, NULL),
(196, 0, 'Mr. Afirul', '0171-8560505', 0, 1994, NULL),
(197, 218543.55000000016, 'Mr. Jamal', '01711-38 24 16', 0, 1994, NULL),
(198, 0, 'Md. Hemayet Hossain', '01914-26 40 30', 0, 1994, NULL),
(199, 5950.199999999997, 'Shirajul Islam', '01716-907806', 0, 1994, NULL),
(200, 0, 'Md. Riaz', '01789-03 55 06', 0, 1994, NULL),
(201, 0, 'Mr. Ruhul Amin', '01767- 84 78 74', 0, 1994, NULL),
(202, 0.5, 'Col. Meher', '01720 99 77 00', 0, 1994, NULL),
(203, 224670.15000000002, 'Engr Ruhul Amin', '02 8963629', 0, 1994, NULL),
(204, 8.160000000003492, 'Eng. Monir', '8919261', 0, 1994, NULL),
(205, 5954.799999999999, 'Md. Riaz', '01937 70 59 31', 0, 1994, NULL),
(206, 16142, 'Aminur Rahman', '01917-43 24 33', 0, 1994, NULL),
(207, 91208.6, 'Pranashker (Purchase)', '02-8817690', 0, 1994, NULL),
(208, 20.639999999999418, 'Md. Mosharaf Hossain', '02-7392407', 0, 1994, NULL),
(209, 0.6500000000014552, 'Md. Momin Ullah Saymon', '01680-24 28 27', 0, 1994, NULL),
(210, 215410.65, 'Mr. Anowar', '01711-82 34 34', 0, 1994, NULL),
(211, 212978.5, 'Mr. Shahidur Rahman', '02-7175840 ', 0, 1994, NULL),
(212, 8567.3, 'Mr. Mojibor', '01730-79 24 02', 0, 1994, NULL),
(213, 8.25, 'Mr. Nazrul Islam', '01912-70 54 16', 0, 1994, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `TEM_STOCK_copy`
--

DROP TABLE IF EXISTS `TEM_STOCK_copy`;
CREATE TABLE IF NOT EXISTS `TEM_STOCK_copy` (
  `idproduct` smallint(6) unsigned NOT NULL DEFAULT '0',
  `mrp` double unsigned DEFAULT NULL,
  `qty` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `TEM_STOCK_copy`
--

INSERT INTO `TEM_STOCK_copy` (`idproduct`, `mrp`, `qty`) VALUES
(1, 23, 19201),
(2, 35, 858),
(3, 51, 4797),
(4, 79, 13),
(5, 98, 117),
(6, 152, 3471),
(7, 11, 4204),
(8, 15, 3414),
(9, 25, 2039),
(10, 37, 389),
(11, 55, 1977),
(12, 89, 57),
(13, 18, 3337),
(14, 20, 2548),
(15, 25, 759),
(16, 32, 420),
(17, 35, 392),
(18, 42, 150),
(19, 50, 300),
(20, 55, 456),
(21, 59, 524),
(22, 65, 313),
(23, 80, 180),
(24, 90, 165),
(25, 95, 106),
(26, 115, 374),
(27, 110, 1667),
(28, 155, 283),
(29, 305, 61),
(30, 550, 126),
(31, 750, 158),
(32, 1080, 15),
(33, 115, 1460),
(34, 120, 2645),
(35, 130, 1954),
(36, 150, 384),
(37, 285, 78),
(38, 110, 1771),
(39, 145, 1867),
(40, 295, 335),
(41, 540, 132),
(42, 659, 120),
(43, 1000, 22),
(44, 18, 5718),
(45, 30, 2237),
(46, 40, 413),
(47, 80, 250),
(48, 125, 395),
(49, 220, 152),
(53, 35, 7198),
(54, 40, 910),
(55, 45, 381),
(56, 95, 315),
(57, 96, 221),
(58, 98, 269),
(59, 98, 320),
(60, 100, 922),
(61, 105, 163),
(62, 135, 135),
(63, 205, 180),
(64, 210, 68),
(65, 215, 109),
(66, 220, 62),
(67, 250, 127),
(68, 125, 280),
(69, 150, 150),
(70, 170, 104),
(71, 50, 196),
(72, 75, 279),
(73, 13, 13777),
(74, 20, 5078),
(75, 35, 1022),
(76, 70, 843),
(77, 110, 581),
(78, 185, 38),
(79, 30, 7506),
(80, 35, 961),
(81, 40, 45),
(82, 70, 270),
(83, 90, 230),
(84, 100, 199),
(85, 110, 385),
(86, 120, 294),
(87, 130, 230),
(88, 185, 115),
(89, 210, 94),
(90, 215, 76),
(91, 220, 86),
(92, 250, 62),
(93, 260, 131),
(94, 99, 39),
(95, 125, 4279),
(96, 125, 451),
(97, 165, 273),
(98, 115, 342),
(99, 150, 194),
(100, 170, 80),
(101, 320, 78),
(102, 180, 2340),
(103, 245, 1316),
(104, 290, 839),
(105, 435, 120),
(106, 695, 212),
(107, 885, 55),
(108, 280, 364),
(109, 420, 224),
(110, 560, 216),
(111, 800, 76),
(112, 980, 79),
(113, 1480, 70),
(114, 280, 469),
(115, 420, 275),
(116, 560, 92),
(117, 800, 90),
(118, 980, 99),
(119, 1480, 30),
(120, 375, 1793),
(121, 465, 1116),
(122, 500, 552),
(123, 750, 32),
(124, 1400, 313),
(125, 1700, 91),
(126, 950, 928),
(127, 1190, 137),
(128, 790, 737),
(129, 210, 513),
(130, 280, 736),
(131, 365, 69),
(132, 460, 57),
(133, 698, 214),
(134, 935, 68),
(135, 12, 2222),
(136, 20, 842),
(137, 35, 638),
(138, 50, 240),
(139, 75, 494),
(140, 105, 283),
(141, 12, 4843),
(142, 14, 2987),
(143, 20, 1991),
(144, 30, 1252),
(145, 42, 0),
(146, 52, 0),
(147, 10, 9472),
(148, 14, 1799),
(149, 18, 1729),
(150, 38, 0),
(151, 85, 12),
(152, 105, 0),
(153, 8500, 113),
(154, 2000, 112),
(155, 21, 0),
(156, 27, 0),
(157, 35, 0),
(158, 62, 0),
(159, 69, 0),
(160, 78, 0),
(161, 130, 0),
(162, 156, 0),
(163, 215, 0),
(164, 14.5, 0),
(165, 21, 0),
(166, 29, 0),
(167, 43, 0),
(168, 49, 0),
(169, 65, 0),
(170, 35, 0),
(171, 38, 0),
(172, 42, 0),
(173, 129, 0),
(174, 490, 0),
(175, 2600, 0),
(176, 115, 0),
(177, 595, 0),
(178, 158, 0),
(179, 188, 0),
(180, 640, 0),
(181, 41, 0),
(182, 45, 0),
(183, 58, 0),
(184, 179, 0),
(185, 778, 0),
(186, 2800, 0),
(187, 198, 0),
(188, 1230, 0),
(189, 198, 0),
(190, 380, 0),
(191, 285, 0),
(192, 138, 0),
(193, 295, 0),
(194, 1350, 0),
(195, 215, 0),
(196, 950, 0),
(197, 2700, 0),
(198, 385, 0),
(199, 1150, 0),
(200, 268, 0),
(201, 390, 0),
(202, 190, 0),
(203, 195, 0),
(204, 199, 0),
(205, 960, 0),
(206, 480, 0),
(207, 875, 0),
(208, 195, 0),
(209, 350, 0),
(210, 480, 0),
(211, 1050, 0),
(212, 100, 0),
(213, 275, 0),
(214, 750, 0),
(215, 40, 0),
(216, 135, 0),
(217, 295, 0),
(218, 30, 0),
(219, 42, 0),
(220, 75, 0),
(221, 475, 0),
(222, 430, 0),
(223, 350, 0),
(231, 185, 150),
(232, 1090, 63),
(233, 120, 373),
(234, 850, 16),
(235, 265, 55),
(236, 230, 0),
(237, 135, 7),
(238, 268, 240),
(239, 780, 0),
(240, 1200, 74),
(241, 3675, 191),
(242, 150, 0),
(243, 344, 0),
(244, 26, 31866),
(245, 39, 396),
(246, 55, 2570),
(247, 87, 356),
(248, 105, 7226),
(249, 158, 1525),
(250, 125, 240),
(251, 255, 0),
(252, 260, 174),
(253, 125, 262),
(254, 240, 0),
(255, 254, 174),
(256, 395, 50),
(257, 880, 54),
(258, 1090, 56),
(259, 248, 0),
(260, 225, 0),
(261, 320, 0),
(262, 199, 120),
(263, 195, 130),
(264, 315, 379),
(265, 425, 415),
(266, 500, 9),
(267, 800, 0),
(268, 1175, 474),
(269, 1350, 113),
(270, 120, 409),
(271, 130, 0),
(272, 150, 200),
(273, 135, 294),
(274, 2950, 26),
(275, 4900, 155),
(276, 540, 45),
(277, 895, 70),
(278, 1175, 64),
(279, 1700, 60),
(280, 950, 40),
(281, 1295, 48),
(282, 595, 60),
(283, 295, 105);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE IF NOT EXISTS `transaction` (
  `idtransaction` int(10) unsigned NOT NULL,
  `transaction_date` date NOT NULL,
  `idmestablishment` int(10) unsigned NOT NULL,
  `transaction_ammount` double NOT NULL,
  `idtransaction_head` int(10) unsigned NOT NULL,
  `transaction_type` tinyint(1) NOT NULL COMMENT '1 mean cash 2 mean cheque',
  `transaction_status` tinyint(1) NOT NULL COMMENT '1 mean confirmed 0 mean not confirmed\r\n ',
  `idstaff` int(10) unsigned DEFAULT NULL,
  `iduser` int(10) unsigned NOT NULL,
  `transaction_bounced` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'increment each time cheque is bounced'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`idtransaction`, `transaction_date`, `idmestablishment`, `transaction_ammount`, `idtransaction_head`, `transaction_type`, `transaction_status`, `idstaff`, `iduser`, `transaction_bounced`) VALUES
(1, '2014-12-09', 3, -70000, 13, 2, 1, 1, 1, 0),
(2, '2014-12-08', 3, -98010, 13, 1, 1, 1, 1, 0),
(3, '2014-12-09', 2, 2345, 14, 1, 1, 1, 1, 0),
(5, '2014-12-11', 3, -72500, 13, 2, 1, 1, 1, 0),
(6, '2014-12-10', 2, 1360, 14, 1, 1, 5, 1, 0),
(7, '2014-12-11', 2, 8000, 14, 1, 1, 7, 1, 0),
(8, '2014-12-13', 2, 12435, 14, 1, 1, 1, 1, 0),
(9, '2014-12-13', 2, 10000, 14, 1, 1, 5, 1, 0),
(10, '2014-12-09', 2, -640, 33, 1, 1, 1, 1, 0),
(11, '2014-12-09', 2, -340, 27, 1, 1, 1, 1, 0),
(12, '2014-12-09', 2, -20, 40, 1, 1, 1, 1, 0),
(14, '2014-12-09', 2, -1835, 39, 1, 1, 1, 1, 0),
(15, '2014-12-10', 2, -600, 70, 1, 1, 1, 1, 0),
(16, '2014-12-11', 2, -50, 27, 1, 1, 1, 1, 0),
(17, '2014-12-11', 2, -500, 39, 1, 1, 1, 1, 0),
(18, '2014-12-13', 2, -65, 39, 1, 1, 1, 1, 0),
(19, '2014-12-14', 2, -485, 37, 1, 1, 1, 1, 0),
(20, '2014-12-14', 2, -10000, 23, 1, 1, 1, 1, 0),
(21, '2014-12-14', 3, 10000, 22, 1, 1, 1, 1, 0),
(22, '2014-12-13', 2, -10000, 23, 1, 1, 1, 1, 0),
(23, '2014-12-13', 3, 10000, 22, 1, 1, 1, 1, 0),
(24, '2014-12-14', 2, 3400, 14, 1, 1, 1, 1, 0),
(25, '2014-12-14', 2, 44000, 14, 1, 1, 5, 1, 0),
(26, '2014-12-14', 2, 11038, 14, 1, 1, 1, 1, 0),
(27, '2014-12-08', 3, 154543, 14, 2, 1, 1, 1, 0),
(28, '2014-12-08', 3, 17000, 14, 2, 1, 5, 1, 0),
(29, '2014-12-08', 5, 1416879.3, 18, 1, 1, 1, 1, 0),
(30, '2014-12-11', 2, 20000, 18, 1, 1, 1, 1, 0),
(31, '2014-12-14', 2, -29300, 19, 1, 1, 1, 1, 0),
(32, '2014-12-14', 2, -65420, 19, 1, 1, 1, 1, 0),
(33, '2014-12-14', 2, 60000, 18, 1, 1, 1, 1, 0),
(34, '2014-12-11', 3, 212978, 14, 2, 1, 1, 1, 0),
(36, '2014-12-11', 1, 75800, 14, 2, 0, 1, 1, 0),
(38, '2014-12-11', 3, 255156, 14, 2, 1, 1, 1, 0),
(39, '2014-12-14', 3, 206978, 14, 2, 1, 1, 1, 0),
(40, '2014-12-11', 3, -1035, 26, 1, 1, 1, 1, 0),
(41, '2014-12-15', 3, 274640, 14, 2, 1, 6, 1, 0),
(42, '2014-12-15', 3, -325000, 19, 2, 1, 1, 1, 0),
(43, '2014-12-15', 2, -35000, 1, 1, 1, 1, 1, 0),
(44, '2014-12-15', 2, -15000, 1, 1, 1, 1, 1, 0),
(45, '2014-12-15', 2, -15000, 1, 1, 1, 1, 1, 0),
(46, '2014-12-15', 2, -15000, 1, 1, 1, 1, 1, 0),
(47, '2014-12-15', 2, -15000, 1, 1, 1, 1, 1, 0),
(48, '2014-12-15', 2, -650, 70, 1, 1, 1, 1, 0),
(49, '2014-12-18', 3, -100000, 19, 2, 1, 1, 1, 0),
(50, '2014-12-18', 3, -130000, 19, 2, 1, 1, 1, 0),
(51, '2014-12-18', 3, 69395.2, 14, 2, 1, 1, 1, 0),
(52, '2014-12-15', 2, 1317.7, 14, 1, 1, 1, 1, 0),
(53, '2014-12-15', 2, 182.3, 14, 1, 1, 1, 1, 0),
(54, '2014-12-15', 2, -98, 39, 1, 1, 1, 1, 0),
(55, '2014-12-15', 2, -13000, 1, 1, 1, 1, 1, 0),
(56, '2014-12-15', 2, -8000, 1, 1, 1, 1, 1, 0),
(57, '2014-12-15', 2, -5000, 11, 1, 1, 1, 1, 0),
(58, '2014-12-15', 2, -5000, 11, 1, 1, 1, 1, 0),
(59, '2014-12-15', 2, -5000, 11, 1, 1, 1, 1, 0),
(60, '2014-12-17', 2, -290, 45, 1, 1, 1, 1, 0),
(61, '2014-12-17', 2, -7000, 19, 1, 1, 1, 1, 0),
(62, '2014-12-18', 2, 14391, 14, 1, 1, 1, 1, 0),
(63, '2014-12-18', 2, 5275, 14, 1, 1, 1, 1, 0),
(64, '2014-12-18', 2, -20000, 23, 1, 1, 1, 1, 0),
(65, '2014-12-18', 4, 20000, 53, 1, 1, 1, 1, 0),
(66, '2014-12-18', 2, -2500, 3, 1, 1, 1, 1, 0),
(67, '2014-12-18', 2, -90, 39, 1, 1, 1, 1, 0),
(68, '2014-12-20', 2, -9795, 52, 1, 1, 1, 1, 0),
(69, '2014-12-20', 2, -362, 37, 1, 1, 1, 1, 0),
(70, '2014-12-20', 2, -75, 64, 1, 1, 1, 1, 0),
(71, '2014-12-20', 2, -1500, 30, 1, 1, 1, 1, 0),
(72, '2014-12-20', 2, -500, 30, 1, 1, 1, 1, 0),
(73, '2014-12-21', 3, -170000, 19, 2, 1, 1, 1, 0),
(74, '2014-12-21', 2, -4765, 52, 1, 1, 1, 1, 0),
(75, '2014-12-21', 2, 48000, 14, 1, 1, 1, 1, 0),
(76, '2014-12-21', 2, 7000, 14, 1, 1, 7, 1, 0),
(77, '2014-12-21', 2, -48000, 23, 1, 1, 1, 1, 0),
(78, '2014-12-21', 4, 48000, 53, 1, 1, 1, 1, 0),
(79, '2014-12-21', 2, -5000, 19, 1, 1, 1, 1, 0),
(80, '2014-12-22', 2, 1500, 14, 1, 1, 5, 1, 0),
(81, '2014-12-22', 2, 8940, 14, 1, 1, 7, 1, 0),
(83, '2014-12-22', 2, -1680, 39, 1, 1, 1, 1, 0),
(84, '2014-12-22', 2, -170, 40, 1, 1, 1, 1, 0),
(85, '2014-12-22', 2, -45, 26, 1, 1, 1, 1, 0),
(86, '2014-12-22', 2, -1060, 67, 1, 1, 1, 1, 0),
(87, '2014-12-21', 3, 150000, 14, 2, 1, 1, 1, 0),
(88, '2014-12-22', 2, -5000, 19, 1, 1, 1, 1, 0),
(89, '2014-12-22', 2, 1925, 14, 1, 1, 1, 1, 0),
(90, '2014-12-23', 2, -24195, 52, 1, 1, 1, 1, 0),
(91, '2014-12-23', 2, -2000, 41, 1, 1, 1, 1, 0),
(92, '2014-12-23', 2, -3695, 52, 1, 1, 1, 1, 0),
(93, '2014-12-23', 2, 20000, 14, 1, 1, 5, 1, 0),
(94, '2014-12-23', 2, -20000, 23, 1, 1, 1, 1, 0),
(95, '2014-12-23', 3, 20000, 53, 1, 1, 1, 1, 0),
(96, '2014-12-23', 2, 12000, 14, 1, 1, 7, 1, 0),
(97, '2014-12-23', 2, -4703, 62, 1, 1, 1, 1, 0),
(98, '2014-12-24', 2, -535, 39, 1, 1, 1, 1, 0),
(99, '2014-12-27', 2, 9600, 14, 1, 1, 1, 1, 0),
(100, '2014-12-28', 2, 5239, 14, 1, 1, 1, 1, 0),
(101, '2014-12-28', 3, -210000, 19, 2, 1, 1, 1, 0),
(102, '2014-12-28', 3, -20000, 19, 2, 1, 1, 1, 0),
(103, '2014-12-28', 3, -200000, 13, 2, 1, 1, 1, 0),
(104, '2014-12-28', 2, -5000, 19, 1, 1, 1, 1, 0),
(105, '2014-12-28', 2, 7000, 14, 1, 1, 7, 1, 0),
(106, '2014-12-28', 1, 975, 14, 2, 1, 6, 1, 0),
(107, '2014-12-28', 3, 975, 14, 2, 1, 6, 1, 0),
(108, '2014-12-29', 3, 20000, 14, 2, 1, 1, 1, 0),
(109, '2014-12-29', 2, -4000, 19, 1, 1, 1, 1, 0),
(110, '2014-12-29', 2, -160, 64, 1, 1, 1, 1, 0),
(111, '2014-12-29', 2, -140, 37, 1, 1, 1, 1, 0),
(112, '2014-12-29', 2, -105, 27, 1, 1, 1, 1, 0),
(113, '2014-12-29', 2, -115, 39, 1, 1, 1, 1, 0),
(114, '2014-12-30', 3, -200000, 13, 2, 1, 1, 1, 0),
(115, '2014-12-30', 2, -25000, 23, 1, 1, 1, 1, 0),
(116, '2014-12-30', 3, 25000, 53, 1, 1, 1, 1, 0),
(117, '2014-12-30', 2, 9488, 14, 1, 1, 1, 1, 0),
(118, '2014-12-30', 2, 4000, 14, 1, 1, 7, 1, 0),
(119, '2014-12-31', 2, 19700, 14, 1, 1, 6, 1, 0),
(121, '2014-12-30', 2, -500, 30, 1, 1, 1, 1, 0),
(122, '2014-12-31', 2, -15000, 19, 1, 1, 1, 1, 0),
(123, '2015-01-01', 3, 86520, 14, 2, 1, 5, 1, 0),
(124, '2014-12-30', 3, -1645, 26, 1, 1, 1, 1, 0),
(125, '2014-12-30', 4, -1575, 26, 1, 1, 1, 1, 0),
(126, '2015-01-06', 3, 141373, 14, 2, 1, 1, 1, 0),
(127, '2014-12-31', 5, 130000, 18, 1, 1, 1, 1, 0),
(128, '2014-12-31', 2, -135, 39, 1, 1, 1, 1, 0),
(129, '2015-01-01', 2, -5000, 51, 1, 1, 1, 1, 0),
(130, '2015-01-01', 2, -170, 27, 1, 1, 1, 1, 0),
(131, '2015-01-01', 2, -70, 37, 1, 1, 1, 1, 0),
(132, '2015-01-01', 2, -70, 39, 1, 1, 1, 1, 0),
(133, '2015-01-03', 2, 3500, 14, 1, 1, 4, 1, 0),
(134, '2015-01-03', 2, 640, 14, 1, 1, 1, 1, 0),
(135, '2015-01-03', 2, -9029, 52, 1, 1, 1, 1, 0),
(136, '2015-01-03', 2, -500, 30, 1, 1, 1, 1, 0),
(137, '2015-01-06', 2, 100000, 14, 1, 1, 5, 1, 0),
(138, '2015-01-06', 2, -100000, 23, 1, 1, 1, 1, 0),
(139, '2015-01-06', 3, 100000, 53, 1, 1, 1, 1, 0),
(140, '2015-01-06', 2, -4600, 3, 1, 1, 1, 1, 0),
(141, '2015-01-06', 2, 2145, 14, 1, 1, 1, 1, 0),
(142, '2015-01-07', 2, 1925, 14, 1, 1, 4, 1, 0),
(143, '2015-01-08', 2, 34800, 14, 1, 1, 4, 1, 0),
(144, '2015-01-08', 2, 528, 14, 1, 1, 4, 1, 0),
(145, '2015-01-08', 2, -15000, 19, 1, 1, 1, 1, 0),
(146, '2015-01-08', 2, -5000, 19, 1, 1, 1, 1, 0),
(147, '2015-01-08', 2, -3266, 31, 1, 1, 1, 1, 0),
(148, '2015-01-08', 2, -805, 39, 1, 1, 1, 1, 0),
(149, '2015-01-08', 2, -714, 70, 1, 1, 1, 1, 0),
(150, '2015-01-10', 2, -4405, 52, 1, 1, 1, 1, 0),
(151, '2015-01-10', 2, -170, 39, 1, 1, 1, 1, 0),
(152, '2015-01-10', 2, -600, 33, 1, 1, 1, 1, 0),
(153, '2015-01-11', 2, 10000, 14, 1, 1, 4, 1, 0),
(154, '2015-01-11', 2, 60000, 18, 1, 1, 1, 1, 0),
(155, '2015-01-11', 2, -300, 27, 1, 1, 1, 1, 0),
(156, '2015-01-11', 2, -310, 45, 1, 1, 1, 1, 0),
(157, '2015-01-11', 2, -500, 30, 1, 1, 1, 1, 0),
(158, '2015-01-12', 2, 50000, 14, 1, 1, 1, 1, 0),
(159, '2015-01-12', 2, 2500, 14, 1, 1, 1, 1, 0),
(160, '2015-01-12', 2, 138368, 14, 1, 1, 1, 1, 0),
(161, '2015-01-12', 2, -145000, 23, 1, 1, 1, 1, 0),
(162, '2015-01-12', 3, 145000, 53, 1, 1, 1, 1, 0),
(163, '2015-01-12', 2, -5000, 68, 1, 1, 1, 1, 0),
(164, '2015-01-12', 2, -5000, 11, 1, 1, 1, 1, 0),
(165, '2015-01-12', 2, -5000, 11, 1, 1, 1, 1, 0),
(166, '2015-01-12', 2, -5000, 11, 1, 1, 1, 1, 0),
(167, '2015-01-12', 2, -4391, 62, 1, 1, 1, 1, 0),
(168, '2015-01-12', 2, -2031, 6, 1, 1, 1, 1, 0),
(169, '2015-01-13', 3, -40000, 23, 2, 1, 1, 1, 0),
(170, '2015-01-13', 2, 40000, 53, 1, 1, 1, 1, 0),
(171, '2015-01-12', 2, -35000, 1, 1, 1, 1, 1, 0),
(172, '2015-01-12', 2, -15000, 1, 1, 1, 1, 1, 0),
(173, '2015-01-12', 2, -15000, 1, 1, 1, 1, 1, 0),
(174, '2015-01-12', 2, -15000, 1, 1, 1, 1, 1, 0),
(175, '2015-01-12', 2, -15000, 1, 1, 1, 1, 1, 0),
(176, '2015-01-12', 2, -8000, 1, 1, 1, 1, 1, 0),
(177, '2015-01-12', 2, -13000, 1, 1, 1, 1, 1, 0),
(178, '2015-01-12', 2, -5500, 19, 1, 1, 1, 1, 0),
(179, '2015-01-12', 2, -4000, 19, 1, 1, 1, 1, 0),
(180, '2015-01-12', 2, -4000, 19, 1, 1, 1, 1, 0),
(181, '2015-01-12', 2, -4000, 34, 1, 1, 1, 1, 0),
(182, '2015-01-13', 2, -1750, 13, 1, 1, 1, 1, 0),
(183, '2015-01-13', 2, 52931, 14, 1, 1, 1, 1, 0),
(185, '2015-01-13', 2, -53000, 23, 1, 1, 1, 1, 0),
(186, '2015-01-13', 3, 53000, 53, 1, 1, 1, 1, 0),
(187, '2015-01-13', 2, -32000, 19, 1, 1, 1, 1, 0),
(188, '2015-01-13', 3, -11000, 41, 2, 1, 1, 1, 0),
(189, '2015-01-13', 3, 26437, 14, 2, 1, 1, 1, 0),
(191, '2015-01-14', 2, 2500, 18, 1, 1, 1, 1, 0),
(192, '2015-01-14', 2, -8050, 13, 1, 1, 1, 1, 0),
(193, '2015-01-15', 2, 15000, 18, 1, 1, 1, 1, 0),
(194, '2015-01-15', 2, -15500, 40, 1, 1, 1, 1, 0),
(195, '2015-01-15', 2, -820, 39, 1, 1, 1, 1, 0),
(196, '2015-01-15', 2, -220, 27, 1, 1, 1, 1, 0),
(197, '2015-01-17', 3, -230000, 23, 2, 1, 1, 1, 0),
(198, '2015-01-17', 2, 230000, 53, 1, 1, 1, 1, 0),
(199, '2015-01-17', 2, -225000, 19, 1, 1, 1, 1, 0),
(200, '2015-01-17', 2, -160, 52, 1, 1, 1, 1, 0),
(201, '2015-01-17', 2, -5730, 52, 1, 1, 1, 1, 0),
(202, '2015-01-17', 2, -98, 64, 1, 1, 1, 1, 0),
(203, '2015-01-17', 2, -55, 27, 1, 1, 1, 1, 0),
(204, '2015-01-14', 3, 100991, 14, 2, 0, 1, 1, 0),
(205, '2015-01-17', 3, 20000, 14, 2, 1, 1, 1, 0),
(206, '2015-01-19', 2, 28417, 14, 1, 1, 7, 1, 0),
(207, '2015-01-19', 2, -28417, 23, 1, 1, 1, 1, 0),
(208, '2015-01-19', 3, 28417, 53, 1, 1, 1, 1, 0),
(209, '2015-01-15', 3, 13429, 14, 2, 1, 1, 1, 0),
(210, '2015-01-19', 2, 22200, 14, 1, 1, 1, 1, 0),
(211, '2015-01-20', 2, 19000, 14, 1, 1, 7, 1, 0),
(212, '2015-01-20', 2, 325000, 18, 1, 1, 1, 1, 0),
(213, '2015-01-20', 2, -350000, 23, 1, 1, 1, 1, 0),
(214, '2015-01-20', 3, 350000, 53, 1, 1, 1, 1, 0),
(215, '2015-01-20', 2, -10000, 23, 1, 1, 1, 1, 0),
(216, '2015-01-20', 4, 10000, 53, 1, 1, 1, 1, 0),
(217, '2015-01-21', 2, 11300, 14, 1, 1, 1, 1, 0),
(218, '2015-01-21', 2, 14206, 14, 1, 1, 5, 1, 0),
(219, '2015-01-21', 2, 50000, 14, 1, 1, 1, 1, 0),
(220, '2015-01-21', 2, -50000, 23, 1, 1, 1, 1, 0),
(221, '2015-01-21', 3, 50000, 53, 1, 1, 1, 1, 0),
(222, '2015-01-21', 2, -25000, 23, 1, 1, 1, 1, 0),
(223, '2015-01-21', 4, 25000, 53, 1, 1, 1, 1, 0),
(225, '2015-01-21', 2, -870, 13, 1, 1, 1, 1, 0),
(226, '2015-01-21', 2, -3375, 13, 1, 1, 1, 1, 0),
(227, '2015-01-22', 2, 520, 14, 1, 1, 4, 1, 0),
(228, '2015-01-22', 2, -19000, 19, 1, 1, 1, 1, 0),
(229, '2015-01-22', 2, -1050, 70, 1, 1, 1, 1, 0),
(230, '2015-01-22', 2, -786, 39, 1, 1, 1, 1, 0),
(231, '2015-01-22', 2, -60, 27, 1, 1, 1, 1, 0),
(232, '2015-01-22', 2, -30, 64, 1, 1, 1, 1, 0),
(233, '2015-01-22', 2, -23, 37, 1, 1, 1, 1, 0),
(234, '2015-01-24', 2, -780, 13, 1, 1, 1, 1, 0),
(235, '2015-01-22', 2, 46000, 14, 1, 1, 1, 1, 0),
(236, '2015-01-22', 2, 14300, 14, 1, 1, 1, 1, 0),
(237, '2015-01-22', 2, -40000, 23, 1, 1, 1, 1, 0),
(238, '2015-01-22', 3, 40000, 53, 1, 1, 1, 1, 0),
(239, '2015-01-24', 2, 19000, 18, 1, 1, 1, 1, 0),
(240, '2015-01-24', 2, 12000, 14, 1, 1, 7, 1, 0),
(241, '2015-01-24', 2, 1900, 14, 1, 1, 5, 1, 0),
(242, '2015-01-24', 2, -3690, 52, 1, 1, 1, 1, 0),
(243, '2015-01-24', 2, -480, 52, 1, 1, 1, 1, 0),
(244, '2015-01-24', 2, -19000, 19, 1, 1, 1, 1, 0),
(245, '2015-01-25', 2, -2000, 41, 1, 1, 1, 1, 0),
(246, '2015-01-25', 2, 199964, 18, 1, 1, 1, 1, 0),
(247, '2015-01-22', 4, 40650, 14, 2, 1, 1, 1, 0),
(249, '2015-01-25', 3, 101467, 14, 2, 1, 1, 1, 0),
(250, '2015-01-25', 1, 45579, 14, 2, 0, 1, 1, 0),
(251, '2015-01-25', 2, 105000, 18, 1, 1, 1, 1, 0),
(252, '2015-01-25', 2, -199964, 23, 1, 1, 1, 1, 0),
(253, '2015-01-25', 3, 199964, 53, 1, 1, 1, 1, 0),
(254, '2015-01-25', 2, -185000, 23, 1, 1, 1, 1, 0),
(255, '2015-01-25', 3, 185000, 53, 1, 1, 1, 1, 0),
(256, '2015-01-21', 3, 52406, 14, 2, 1, 1, 1, 0),
(257, '2014-12-08', 5, 3364652, 18, 1, 1, 1, 1, 0),
(258, '2015-01-05', 4, -63484, 19, 2, 1, 1, 1, 0),
(259, '2015-01-25', 4, -80000, 23, 2, 1, 1, 1, 0),
(260, '2015-01-25', 2, 80000, 53, 1, 1, 1, 1, 0),
(261, '2015-01-25', 2, 100000, 5, 1, 1, 1, 1, 0),
(262, '2015-01-25', 2, -100000, 23, 1, 1, 1, 1, 0),
(263, '2015-01-25', 3, 100000, 53, 1, 1, 1, 1, 0),
(264, '2015-01-26', 2, 1048, 14, 1, 1, 1, 1, 0),
(265, '2015-01-26', 2, 11967, 14, 1, 1, 1, 1, 0),
(266, '2015-01-26', 2, 19000, 18, 1, 1, 1, 1, 0),
(267, '2015-01-26', 2, -4000, 19, 1, 1, 1, 1, 0),
(268, '2015-01-27', 2, -35000, 23, 1, 1, 1, 1, 0),
(269, '2015-01-27', 4, 35000, 53, 1, 1, 1, 1, 0),
(270, '2015-01-27', 2, 20000, 14, 1, 1, 5, 1, 0),
(271, '2014-12-08', 5, 1880000, 18, 1, 1, 1, 1, 0),
(272, '2015-01-07', 3, -300000, 19, 1, 1, 1, 1, 0),
(273, '2015-01-14', 2, 200000, 18, 1, 1, 1, 1, 0),
(274, '2015-01-14', 2, -200000, 13, 1, 1, 1, 1, 0),
(275, '2015-01-25', 3, -175000, 19, 1, 1, 1, 1, 0),
(276, '2015-01-25', 3, -482990, 19, 1, 1, 1, 1, 0),
(277, '2015-01-28', 2, 340000, 18, 1, 1, 1, 1, 0),
(278, '2015-01-28', 2, 1250000, 18, 1, 1, 1, 1, 0),
(279, '2015-01-28', 2, 500000, 18, 1, 1, 1, 1, 0),
(280, '2015-01-29', 2, -500000, 19, 1, 1, 1, 1, 0),
(281, '2015-01-29', 2, -1250000, 13, 1, 1, 1, 1, 0),
(282, '2015-01-21', 3, -364569, 13, 1, 1, 1, 1, 0),
(283, '2015-01-28', 2, 50000, 14, 1, 1, 5, 1, 0),
(284, '2015-01-28', 2, 6530, 14, 1, 1, 1, 1, 0),
(285, '2015-01-28', 2, -40000, 23, 1, 1, 1, 1, 0),
(286, '2015-01-28', 3, 40000, 53, 1, 1, 1, 1, 0),
(287, '2015-01-28', 2, -1260, 13, 1, 1, 1, 1, 0),
(288, '2015-01-28', 2, -20000, 52, 1, 1, 1, 1, 0),
(289, '2015-01-28', 2, -2200, 70, 1, 1, 1, 1, 0),
(290, '2015-01-28', 2, -1900, 39, 1, 1, 1, 1, 0),
(291, '2015-01-29', 2, 1609, 14, 1, 1, 7, 1, 0),
(292, '2015-01-29', 2, -500, 62, 1, 1, 1, 1, 0),
(293, '2015-01-29', 2, -3590, 62, 1, 1, 1, 1, 0),
(294, '2015-01-29', 2, -75, 64, 1, 1, 1, 1, 0),
(295, '2015-01-29', 2, -134, 27, 1, 1, 1, 1, 0),
(296, '2015-01-29', 2, -1346, 39, 1, 1, 1, 1, 0),
(297, '2015-01-27', 3, 137900, 14, 2, 1, 1, 1, 0),
(298, '2015-02-08', 3, 100000, 14, 2, 1, 1, 1, 0),
(299, '2015-02-01', 3, 15508, 14, 2, 1, 5, 1, 0),
(300, '2015-02-01', 3, 598400, 14, 2, 1, 1, 1, 0),
(302, '2015-01-26', 3, -100000, 8, 2, 1, 1, 1, 0),
(303, '2015-01-22', 3, -200000, 13, 2, 1, 1, 1, 0),
(304, '2015-01-15', 3, 0, 13, 2, 1, 1, 1, 0),
(305, '2015-01-31', 2, 65000, 14, 1, 1, 5, 1, 0),
(306, '2015-01-31', 2, 4950, 14, 1, 1, 6, 1, 0),
(307, '2015-01-31', 2, -35000, 23, 1, 1, 1, 1, 0),
(308, '2015-01-31', 3, 35000, 53, 1, 1, 1, 1, 0),
(309, '2015-01-31', 2, -20000, 19, 1, 1, 1, 1, 0),
(310, '2015-01-31', 2, -1518, 13, 1, 1, 1, 1, 0),
(311, '2015-02-01', 2, -500, 62, 1, 1, 1, 1, 0),
(312, '2015-02-01', 2, -1060, 28, 1, 1, 1, 1, 0),
(313, '2015-02-01', 2, -355, 28, 1, 1, 1, 1, 0),
(314, '2015-02-01', 2, -3580, 52, 1, 1, 1, 1, 0),
(315, '2015-01-31', 3, -500, 55, 1, 1, 1, 1, 0),
(316, '2015-01-31', 3, -40, 26, 1, 1, 1, 1, 0),
(317, '2015-02-01', 3, -60, 26, 1, 1, 1, 1, 0),
(318, '2015-02-01', 2, 35000, 14, 1, 1, 5, 1, 0),
(319, '2015-02-01', 2, -35000, 19, 1, 1, 1, 1, 0),
(320, '2015-02-01', 3, 160669, 14, 2, 1, 1, 1, 0),
(321, '2015-02-02', 3, -100000, 19, 2, 1, 1, 1, 0),
(322, '2015-02-02', 2, 50000, 14, 1, 1, 1, 1, 0),
(323, '2015-02-02', 3, -507009, 19, 1, 1, 1, 1, 0),
(324, '2015-02-03', 2, 200000, 18, 1, 1, 1, 1, 0),
(325, '2015-02-03', 2, -200000, 13, 1, 1, 1, 1, 0),
(326, '2015-02-03', 3, 115, 26, 1, 1, 1, 1, 0),
(327, '2015-02-02', 3, -10, 26, 1, 1, 1, 1, 0),
(328, '2015-02-03', 2, -40000, 23, 1, 1, 1, 1, 0),
(329, '2015-02-03', 4, 40000, 53, 1, 1, 1, 1, 0),
(330, '2015-02-04', 3, -200000, 19, 2, 1, 1, 1, 0),
(331, '2015-02-04', 2, 660, 14, 1, 1, 1, 1, 0),
(332, '2015-02-04', 2, 50000, 14, 1, 1, 1, 1, 0),
(333, '2015-02-04', 2, 219520, 14, 1, 1, 1, 1, 0),
(334, '2015-02-04', 2, 200000, 18, 1, 1, 1, 1, 0),
(335, '2015-02-04', 2, -200000, 13, 1, 1, 1, 1, 0),
(336, '2015-02-05', 2, -200000, 23, 1, 1, NULL, 1, 0),
(337, '2015-02-05', 3, 200000, 53, 1, 1, NULL, 1, 0),
(338, '2015-02-05', 2, -14800, 86, 1, 1, 1, 1, 0),
(339, '2015-02-05', 2, -4500, 86, 1, 1, 1, 1, 0),
(340, '2015-02-05', 2, -11800, 41, 1, 1, NULL, 1, 0),
(341, '2015-02-05', 2, -2000, 41, 1, 1, NULL, 1, 0),
(342, '2015-02-05', 2, -1200, 41, 1, 1, NULL, 1, 0),
(343, '2015-02-05', 2, -900, 41, 1, 1, NULL, 1, 0),
(344, '2015-02-05', 2, -1500, 41, 1, 1, NULL, 1, 0),
(345, '2015-02-05', 2, -8000, 41, 1, 1, NULL, 1, 0),
(346, '2015-02-05', 2, 20000, 14, 1, 1, 5, 1, 0),
(347, '2015-02-05', 3, -80000, 23, 2, 1, NULL, 1, 0),
(348, '2015-02-05', 2, 80000, 53, 1, 1, NULL, 1, 0),
(349, '2015-02-05', 2, -95000, 19, 1, 1, NULL, 1, 0),
(350, '2015-02-05', 2, -5000, 36, 1, 1, NULL, 1, 0),
(351, '2015-02-05', 2, -415, 39, 1, 1, NULL, 1, 0),
(352, '2015-02-05', 2, -200, 27, 1, 1, NULL, 1, 0),
(353, '2015-02-05', 2, -32, 64, 1, 1, NULL, 1, 0),
(354, '2015-02-07', 2, 1750, 14, 1, 1, 1, 1, 0),
(355, '2015-02-07', 2, -500, 62, 1, 1, NULL, 1, 0),
(356, '2015-02-07', 2, -3485, 31, 1, 1, NULL, 1, 0),
(357, '2015-02-07', 2, -100, 72, 1, 1, NULL, 1, 0),
(358, '2015-02-07', 2, -50, 73, 1, 1, NULL, 1, 0),
(359, '2015-02-07', 2, -115, 74, 1, 1, NULL, 1, 0),
(360, '2015-02-07', 2, -230, 76, 1, 1, NULL, 1, 0),
(361, '2015-02-07', 2, -230, 77, 1, 1, NULL, 1, 0),
(362, '2015-02-07', 2, -267591, 21, 1, 1, NULL, 1, 0),
(363, '2015-02-07', 2, -2517, 78, 1, 1, NULL, 1, 0),
(364, '2015-02-07', 2, -5160, 79, 1, 1, NULL, 1, 0),
(365, '2015-02-07', 2, -3500, 80, 1, 1, NULL, 1, 0),
(366, '2015-02-07', 2, -2400, 81, 1, 1, NULL, 1, 0),
(367, '2015-02-07', 2, -8000, 83, 1, 1, NULL, 1, 0),
(368, '2015-02-07', 2, -50000, 85, 1, 1, NULL, 1, 0),
(369, '2015-02-08', 3, 210200, 14, 2, 1, 1, 1, 0),
(370, '2015-02-10', 3, 150000, 14, 2, 1, 1, 1, 0),
(371, '2015-02-07', 2, -280, 45, 1, 1, NULL, 1, 0),
(372, '2015-02-08', 2, -480, 33, 1, 1, NULL, 1, 0),
(373, '2015-02-08', 2, -1397, 13, 1, 1, NULL, 1, 0),
(374, '2015-02-09', 2, 1000, 14, 1, 1, 5, 1, 0),
(375, '2015-02-09', 2, -2250, 52, 1, 1, NULL, 1, 0),
(376, '2015-02-09', 2, -770, 70, 1, 1, NULL, 1, 0),
(377, '2015-02-10', 2, -2000, 34, 1, 1, NULL, 1, 0),
(378, '2015-02-10', 2, -2000, 19, 1, 1, NULL, 1, 0),
(379, '2015-02-11', 2, 16900, 14, 1, 1, 7, 1, 0),
(380, '2015-02-11', 2, -15000, 23, 1, 1, NULL, 1, 0),
(381, '2015-02-11', 4, 15000, 53, 1, 1, NULL, 1, 0),
(382, '2015-02-10', 3, 99977, 18, 1, 1, NULL, 1, 0),
(383, '2015-02-10', 3, 69977, 18, 1, 1, NULL, 1, 0),
(384, '2015-02-08', 3, -100000, 19, 2, 1, NULL, 1, 0),
(385, '2015-02-10', 3, -65000, 13, 2, 1, NULL, 1, 0),
(386, '2015-02-10', 3, -60000, 19, 2, 1, NULL, 1, 0),
(387, '2015-02-10', 3, -110000, 19, 2, 1, NULL, 1, 0),
(388, '2015-02-10', 3, -20000, 19, 2, 1, NULL, 1, 0),
(389, '2015-02-11', 3, 300000, 14, 2, 1, 1, 1, 0),
(390, '2015-02-11', 2, 5866, 14, 1, 1, 5, 1, 0),
(391, '2015-02-11', 2, 3000, 14, 1, 1, 7, 1, 0),
(392, '2015-02-12', 3, -66250, 13, 2, 1, NULL, 1, 0),
(393, '2015-02-11', 2, -7551, 52, 1, 1, NULL, 1, 0),
(394, '2015-02-11', 2, -600, 37, 1, 1, NULL, 1, 0),
(395, '2015-02-12', 2, 20000, 14, 1, 1, 6, 1, 0),
(396, '2015-02-12', 2, 28500, 14, 1, 1, 1, 1, 0),
(397, '2015-02-12', 2, 20000, 14, 1, 1, 5, 1, 0),
(398, '2015-02-12', 2, 7000, 14, 1, 1, 7, 1, 0),
(399, '2015-02-12', 2, -10, 64, 1, 1, NULL, 1, 0),
(400, '2015-02-12', 2, -310, 37, 1, 1, NULL, 1, 0),
(401, '2015-02-12', 2, -1778, 39, 1, 1, NULL, 1, 0),
(402, '2015-02-12', 2, -255, 27, 1, 1, NULL, 1, 0),
(403, '2015-02-12', 3, -200000, 19, 2, 1, NULL, 1, 0),
(404, '2015-02-12', 3, -300000, 13, 2, 1, NULL, 1, 0),
(405, '2015-02-12', 3, -30000, 19, 2, 1, NULL, 1, 0),
(406, '2015-02-11', 3, 65400, 14, 2, 1, 1, 1, 0),
(407, '2015-02-11', 3, 47300, 14, 2, 1, 1, 1, 0),
(408, '2015-02-14', 2, 1100, 14, 1, 1, 7, 1, 0),
(409, '2015-02-15', 2, 6000, 14, 1, 1, 1, 1, 0),
(410, '2015-02-15', 2, 9444, 14, 1, 1, 1, 1, 0),
(411, '2015-02-15', 2, 1400, 14, 1, 1, 1, 1, 0),
(412, '2015-02-15', 2, 675, 14, 1, 1, 5, 1, 0),
(413, '2015-02-15', 2, 49000, 14, 1, 1, 5, 1, 0),
(415, '2015-02-15', 2, -60000, 19, 1, 1, NULL, 1, 0),
(416, '2015-02-15', 2, -30000, 19, 1, 1, NULL, 1, 0),
(417, '2015-02-16', 2, -15000, 23, 1, 1, NULL, 1, 0),
(418, '2015-02-16', 3, 15000, 53, 1, 1, NULL, 1, 0),
(419, '2015-02-15', 2, -2000, 19, 1, 1, NULL, 1, 0),
(420, '2015-02-16', 2, 25164, 14, 1, 1, 1, 1, 0),
(421, '2015-02-16', 2, -1500, 41, 1, 1, NULL, 1, 0),
(422, '2015-02-16', 2, -5000, 41, 1, 1, NULL, 1, 0),
(423, '2015-02-16', 2, -15000, 41, 1, 1, NULL, 1, 0),
(424, '2015-02-17', 2, -2794, 30, 1, 1, NULL, 1, 0),
(425, '2015-02-17', 2, -3552, 30, 1, 1, NULL, 1, 0),
(426, '2015-02-17', 2, -20000, 19, 1, 1, NULL, 1, 0),
(427, '2015-02-17', 2, 16332, 14, 1, 1, 5, 1, 0),
(428, '2015-02-17', 2, 3224, 14, 1, 1, 7, 1, 0),
(429, '2015-02-08', 3, -200000, 13, 2, 1, NULL, 1, 0),
(430, '2015-02-18', 2, 20500, 14, 1, 1, 1, 1, 0),
(431, '2015-02-18', 2, -30000, 19, 1, 1, NULL, 1, 0),
(432, '2015-02-18', 2, 60000, 18, 1, 1, NULL, 1, 0),
(433, '2015-02-19', 2, -7677, 52, 1, 1, NULL, 1, 0),
(434, '2015-02-19', 2, -940, 52, 1, 1, NULL, 1, 0),
(435, '2015-02-19', 2, -460, 70, 1, 1, NULL, 1, 0),
(436, '2015-02-19', 2, -790, 32, 1, 1, NULL, 1, 0),
(437, '2015-02-19', 2, 1278, 14, 1, 1, 5, 1, 0),
(438, '2015-02-18', 3, -18000, 86, 2, 1, 1, 1, 0),
(439, '2015-02-19', 3, 8224, 14, 2, 1, 6, 1, 0),
(440, '2015-02-23', 2, 80000, 14, 2, 1, 1, 1, 0),
(441, '2015-02-19', 2, 7000, 14, 1, 1, 5, 1, 0),
(442, '2015-02-19', 2, -7000, 23, 1, 1, NULL, 1, 0),
(443, '2015-02-19', 3, 7000, 53, 1, 1, NULL, 1, 0),
(444, '2015-02-19', 2, -180, 37, 1, 1, NULL, 1, 0),
(445, '2015-02-19', 2, -102, 64, 1, 1, NULL, 1, 0),
(446, '2015-02-19', 2, -850, 39, 1, 1, NULL, 1, 0),
(447, '2015-02-22', 2, 15000, 14, 1, 1, 6, 1, 0),
(448, '2015-02-22', 2, 15000, 14, 1, 1, 5, 1, 0),
(449, '2015-02-22', 2, -35000, 1, 1, 1, NULL, 1, 0),
(450, '2015-02-22', 2, -15000, 1, 1, 1, NULL, 1, 0),
(451, '2015-02-22', 2, -15000, 1, 1, 1, NULL, 1, 0),
(452, '2015-02-22', 2, -15000, 1, 1, 1, NULL, 1, 0),
(453, '2015-02-22', 2, -15000, 1, 1, 1, NULL, 1, 0),
(454, '2015-02-22', 2, -10000, 1, 1, 1, NULL, 1, 0),
(455, '2015-02-22', 2, -13000, 1, 1, 1, NULL, 1, 0),
(456, '2015-02-22', 2, -600, 7, 1, 1, NULL, 1, 0),
(457, '2015-02-22', 2, -5000, 11, 1, 1, NULL, 1, 0),
(458, '2015-02-22', 2, -5000, 11, 1, 1, NULL, 1, 0),
(459, '2015-02-22', 2, -5000, 11, 1, 1, NULL, 1, 0),
(460, '2015-02-22', 2, 12673, 14, 1, 1, 1, 1, 0),
(461, '2015-02-22', 2, 2263, 14, 1, 1, 1, 1, 0),
(462, '2015-02-05', 4, -63484, 19, 2, 1, NULL, 1, 0),
(463, '2015-02-23', 4, -30000, 19, 2, 1, NULL, 1, 0),
(464, '2015-03-04', 3, 328593, 14, 2, 1, 1, 1, 0),
(466, '2015-02-23', 2, 6390, 14, 1, 1, 1, 1, 0),
(467, '2015-02-23', 2, 1500, 18, 1, 1, NULL, 1, 0),
(468, '2015-02-23', 2, -1500, 25, 1, 1, NULL, 1, 0),
(469, '2015-02-23', 2, -100000, 19, 1, 1, NULL, 1, 0),
(470, '2015-02-23', 2, -3257, 52, 1, 1, NULL, 1, 0),
(471, '2015-02-23', 2, -300, 70, 1, 1, NULL, 1, 0),
(472, '2015-02-24', 3, 13550, 14, 2, 1, 1, 1, 0),
(473, '2015-02-24', 1, 82100, 14, 2, 0, 1, 1, 0),
(474, '2015-02-24', 2, 750, 14, 1, 1, 1, 1, 0),
(475, '2015-02-24', 2, 17000, 14, 1, 1, 7, 1, 0),
(476, '2015-02-24', 2, 26300, 14, 1, 1, 5, 1, 0),
(477, '2015-02-24', 2, -3000, 13, 1, 1, NULL, 1, 0),
(478, '2015-02-24', 2, -20000, 23, 1, 1, NULL, 1, 0),
(479, '2015-02-24', 4, 20000, 53, 1, 1, NULL, 1, 0),
(480, '2015-02-24', 2, -16030, 13, 1, 1, NULL, 1, 0),
(481, '2015-02-26', 4, 295500, 14, 2, 1, 1, 1, 0),
(482, '2015-03-02', 3, 136000, 14, 2, 1, 1, 1, 0),
(483, '2015-03-01', 4, -300000, 13, 2, 1, NULL, 1, 0),
(484, '2015-02-26', 2, 3000, 14, 1, 1, 5, 1, 0),
(485, '2015-02-26', 2, 685, 14, 1, 1, 5, 1, 0),
(486, '2015-02-26', 2, 130, 14, 1, 1, 5, 1, 0),
(487, '2015-02-26', 3, -15000, 22, 2, 1, NULL, 1, 0),
(488, '2015-02-26', 2, -1500, 30, 1, 1, NULL, 1, 0),
(489, '2015-02-26', 2, -107, 22, 1, 1, NULL, 1, 0),
(490, '2015-02-26', 2, -70, 27, 1, 1, NULL, 1, 0),
(491, '2015-02-26', 2, -30, 64, 1, 1, NULL, 1, 0),
(492, '2015-02-26', 2, -465, 37, 1, 1, NULL, 1, 0),
(493, '2015-02-26', 2, -941, 39, 1, 1, NULL, 1, 0),
(494, '2015-02-26', 2, 50000, 14, 1, 1, 1, 1, 0),
(495, '2015-02-26', 2, -50000, 23, 1, 1, NULL, 1, 0),
(496, '2015-02-26', 3, 50000, 53, 1, 1, NULL, 1, 0),
(497, '2015-02-26', 2, 17000, 14, 1, 1, 5, 1, 0),
(498, '2015-02-26', 2, -17000, 23, 1, 1, NULL, 1, 0),
(499, '2015-02-26', 3, 17000, 53, 1, 1, NULL, 1, 0),
(500, '2015-02-28', 2, 26600, 14, 1, 1, 1, 1, 0),
(501, '2015-02-28', 2, 320, 14, 1, 1, 1, 1, 0),
(502, '2015-02-28', 2, -100, 86, 1, 1, 5, 1, 0),
(503, '2015-02-28', 2, -4320, 62, 1, 1, NULL, 1, 0),
(504, '2015-02-28', 2, -10000, 36, 1, 1, NULL, 1, 0),
(505, '2015-02-28', 2, -280, 52, 1, 1, NULL, 1, 0),
(506, '2015-02-28', 2, -2451, 52, 1, 1, NULL, 1, 0),
(507, '2015-03-01', 3, 25590, 14, 2, 1, 1, 1, 0),
(508, '2015-02-28', 2, -1650, 13, 1, 1, NULL, 1, 0),
(509, '2015-02-28', 2, -300, 70, 1, 1, NULL, 1, 0),
(510, '2015-02-28', 2, -6990, 3, 1, 1, NULL, 1, 0),
(511, '2015-03-01', 2, 19726, 14, 1, 1, 1, 1, 0),
(512, '2015-03-01', 2, -6000, 36, 1, 1, NULL, 1, 0),
(513, '2015-03-01', 3, 20810, 14, 2, 1, 5, 1, 0),
(514, '2015-03-02', 2, 705, 14, 1, 1, 5, 1, 0),
(515, '2015-03-02', 3, -135000, 23, 2, 1, NULL, 1, 0),
(516, '2015-03-02', 2, 135000, 53, 1, 1, NULL, 1, 0),
(517, '2015-03-02', 2, -150000, 19, 1, 1, NULL, 1, 0),
(518, '2015-03-03', 2, 150000, 18, 1, 1, NULL, 1, 0),
(519, '2015-03-03', 2, -150000, 23, 1, 1, NULL, 1, 0),
(520, '2015-03-03', 3, 150000, 53, 1, 1, NULL, 1, 0),
(521, '2015-03-02', 3, 26762, 14, 2, 1, 1, 1, 0),
(522, '2015-03-03', 3, -163000, 13, 2, 1, NULL, 1, 0),
(523, '2015-03-03', 1, -100000, 13, 2, 0, NULL, 1, 0),
(524, '2015-03-03', 1, -100000, 13, 2, 0, NULL, 1, 0),
(525, '2015-03-03', 3, -68000, 13, 2, 1, NULL, 1, 0),
(526, '2015-03-02', 2, -180, 70, 1, 1, NULL, 1, 0),
(527, '2015-03-02', 2, -200, 70, 1, 1, NULL, 1, 0),
(528, '2015-03-02', 2, -100, 81, 1, 1, NULL, 1, 0),
(529, '2015-03-03', 2, 19840, 14, 1, 1, 7, 1, 0),
(530, '2015-03-03', 2, 4000, 14, 1, 1, 7, 1, 0),
(531, '2015-03-03', 2, -25000, 23, 1, 1, NULL, 1, 0),
(532, '2015-03-03', 4, 25000, 53, 1, 1, NULL, 1, 0),
(533, '2015-03-03', 2, -1198, 32, 1, 1, NULL, 1, 0),
(534, '2015-03-03', 2, -300, 70, 1, 1, NULL, 1, 0),
(535, '2015-03-04', 2, 1012, 14, 1, 1, 1, 1, 0),
(536, '2015-03-04', 2, 300000, 14, 1, 1, 1, 1, 0),
(537, '2015-03-04', 2, -300000, 23, 1, 1, NULL, 1, 0),
(538, '2015-03-04', 4, 300000, 53, 1, 1, NULL, 1, 0),
(539, '2015-03-05', 2, 682, 14, 1, 1, 1, 1, 0),
(540, '2015-03-05', 2, 23000, 14, 1, 1, 5, 1, 0),
(541, '2015-03-05', 2, -480, 33, 1, 1, NULL, 1, 0),
(542, '2015-03-05', 2, -9, 64, 1, 1, NULL, 1, 0),
(543, '2015-03-05', 2, -15, 37, 1, 1, NULL, 1, 0),
(544, '2015-03-05', 2, -130, 27, 1, 1, NULL, 1, 0),
(545, '2015-03-05', 2, -1155, 39, 1, 1, NULL, 1, 0),
(546, '2015-03-05', 2, -12500, 41, 1, 1, NULL, 1, 0),
(547, '2015-03-02', 1, 50000, 14, 2, 1, 1, 1, 0),
(548, '2015-03-09', 2, -1000, 23, 1, 1, NULL, 1, 0),
(549, '2015-03-09', 6, 1000, 53, 1, 1, NULL, 1, 0),
(550, '2015-03-09', 2, -1000, 23, 1, 1, NULL, 1, 0),
(551, '2015-03-09', 6, 1000, 53, 1, 1, NULL, 1, 0),
(552, '2015-03-09', 6, 50, 14, 1, 1, 1, 1, 0),
(553, '2015-03-09', 6, 50, 14, 1, 1, 1, 1, 0),
(554, '2015-03-09', 6, 50, 14, 1, 1, 1, 1, 0),
(555, '2015-03-09', 6, 50, 14, 1, 1, 1, 1, 0),
(556, '2015-03-09', 3, -10000, 23, 1, 1, NULL, 1, 0),
(557, '2015-03-09', 7, 10000, 53, 1, 1, NULL, 1, 0),
(558, '2015-03-09', 7, -1000, 15, 1, 1, 6, 1, 0),
(559, '2015-03-09', 7, -500, 32, 1, 1, NULL, 1, 0);

--
-- Triggers `transaction`
--
DROP TRIGGER IF EXISTS `trigger___add_transaction`;
DELIMITER $$
CREATE TRIGGER `trigger___add_transaction` BEFORE INSERT ON `transaction`
 FOR EACH ROW BEGIN

   IF NEW.transaction_status = 1 THEN     
		UPDATE mestablishment SET mestablishment_balance = mestablishment_balance + NEW.transaction_ammount WHERE idmestablishment = NEW.idmestablishment;
	ELSE
   	 		IF @software_ln = 1 THEN
      	  		SET @software_error := '' ;
				ELSE
      	  		SET @software_error := 'NOT EDITABLE NOW';
	      	END IF;
	END IF;
	
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `trigger___delete_transaction`;
DELIMITER $$
CREATE TRIGGER `trigger___delete_transaction` BEFORE DELETE ON `transaction`
 FOR EACH ROW BEGIN
	DECLARE AMMOUNT DOUBLE DEFAULT 0.00;
	DECLARE NAME VARCHAR(64) CHARSET UTF8;

	
   IF OLD.transaction_status = 1 THEN 
		UPDATE mestablishment SET mestablishment_balance = mestablishment_balance - OLD.transaction_ammount WHERE idmestablishment = OLD.idmestablishment;
		UPDATE cheque_leaf SET cheque_leaf_status = 0 WHERE idcheque_leaf IN (SELECT * FROM (SELECT idcheque_leaf FROM transaction_cheque_leaf t LEFT JOIN cheque_leaf USING(idcheque_leaf) WHERE idtransaction = OLD.idtransaction) as a);
		 
		IF (SELECT COUNT(*) FROM transaction_company WHERE idtransaction = OLD.idtransaction) > 0 THEN
			UPDATE company 
				SET company_balance = company_balance + (SELECT transaction_ammount FROM transaction WHERE idtransaction = OLD.idtransaction) 
			WHERE idcompany IN (SELECT idcompany FROM transaction_company WHERE idtransaction = OLD.idtransaction);
		END IF;
		
		IF (SELECT COUNT(*) FROM transaction_staff WHERE idtransaction = OLD.idtransaction) > 0 THEN
			UPDATE staff 
				SET staff_balance = staff_balance - (SELECT transaction_ammount FROM transaction WHERE idtransaction = OLD.idtransaction) 
			WHERE idstaff IN (SELECT idstaff FROM transaction_staff WHERE idtransaction = OLD.idtransaction);
		END IF;
		
	END IF;
	
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `trigger___edit_transaction`;
DELIMITER $$
CREATE TRIGGER `trigger___edit_transaction` AFTER UPDATE ON `transaction`
 FOR EACH ROW BEGIN
	DECLARE AMMOUNT DOUBLE DEFAULT 0.00;
	DECLARE NAME VARCHAR(64) CHARSET UTF8;

   IF OLD.transaction_status = 1 THEN
    	IF @software_ln = 1 THEN
        	SET @software_error := ("সংশোধনযোগ্য নয়");
		ELSE
		   SET @software_error := ("Not Editable Now");		   
      END IF;
		CALL ___can_not_do_now();

   END IF;
	
   IF NEW.transaction_status = 1 AND OLD.transaction_status = 0 THEN 
		UPDATE mestablishment SET mestablishment_balance = mestablishment_balance + NEW.transaction_ammount WHERE idmestablishment = NEW.idmestablishment;
		 
		IF (SELECT COUNT(*) FROM transaction_company WHERE idtransaction = NEW.idtransaction) > 0 THEN
			UPDATE company 
				SET company_balance = company_balance - (SELECT transaction_ammount FROM transaction WHERE idtransaction = NEW.idtransaction) 
			WHERE idcompany IN (SELECT idcompany FROM transaction_company WHERE idtransaction = NEW.idtransaction);
		END IF;
	END IF;
	
   IF NEW.transaction_status = 1 AND OLD.transaction_status = 0 THEN 

		 
		IF (SELECT COUNT(*) FROM transaction_staff WHERE idtransaction = NEW.idtransaction) > 0 THEN
			UPDATE staff 
				SET staff_balance = staff_balance + (SELECT transaction_ammount FROM transaction WHERE idtransaction = NEW.idtransaction) 
			WHERE idstaff IN (SELECT idstaff FROM transaction_staff WHERE idtransaction = NEW.idtransaction);
		END IF;
	END IF;	
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_cheque_leaf`
--

DROP TABLE IF EXISTS `transaction_cheque_leaf`;
CREATE TABLE IF NOT EXISTS `transaction_cheque_leaf` (
  `idtransaction` int(10) unsigned NOT NULL,
  `idcheque_leaf` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_cheque_leaf`
--

INSERT INTO `transaction_cheque_leaf` (`idtransaction`, `idcheque_leaf`) VALUES
(1, 1),
(5, 2),
(42, 3),
(49, 4),
(50, 5),
(73, 6),
(101, 7),
(102, 8),
(103, 9),
(114, 10),
(169, 11),
(188, 12),
(197, 14),
(258, 92),
(259, 112),
(302, 16),
(303, 15),
(304, 13),
(321, 18),
(330, 21),
(347, 22),
(384, 24),
(385, 25),
(386, 27),
(387, 29),
(388, 30),
(392, 26),
(403, 31),
(404, 32),
(405, 33),
(429, 23),
(438, 28),
(462, 93),
(463, 113),
(483, 114),
(487, 34),
(515, 38),
(522, 35),
(523, 36),
(524, 37),
(525, 39);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_company`
--

DROP TABLE IF EXISTS `transaction_company`;
CREATE TABLE IF NOT EXISTS `transaction_company` (
  `idtransaction` int(10) unsigned NOT NULL,
  `idcompany` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction_company`
--

INSERT INTO `transaction_company` (`idtransaction`, `idcompany`) VALUES
(1, 220),
(2, 223),
(3, 26),
(5, 220),
(6, 224),
(7, 119),
(8, 165),
(9, 102),
(24, 26),
(25, 163),
(26, 148),
(27, 168),
(28, 193),
(34, 211),
(36, 64),
(38, 210),
(39, 203),
(41, 125),
(51, 225),
(52, 189),
(53, 171),
(62, 183),
(63, 23),
(75, 148),
(76, 119),
(80, 199),
(81, 86),
(87, 197),
(89, 148),
(93, 182),
(96, 119),
(99, 183),
(100, 60),
(103, 214),
(105, 119),
(106, 125),
(107, 125),
(108, 21),
(114, 214),
(117, 191),
(118, 119),
(119, 206),
(123, 207),
(126, 203),
(133, 119),
(134, 26),
(137, 182),
(141, 192),
(142, 119),
(143, 187),
(144, 146),
(153, 119),
(158, 27),
(159, 170),
(160, 208),
(182, 220),
(183, 183),
(189, 61),
(192, 71),
(204, 15),
(205, 21),
(206, 86),
(209, 101),
(210, 191),
(211, 119),
(217, 183),
(218, 163),
(219, 15),
(225, 220),
(226, 217),
(227, 86),
(234, 220),
(235, 194),
(236, 228),
(240, 119),
(241, 163),
(247, 131),
(249, 122),
(250, 58),
(256, 53),
(264, 60),
(265, 194),
(270, 102),
(274, 214),
(281, 223),
(282, 223),
(283, 230),
(284, 148),
(287, 217),
(291, 148),
(297, 141),
(298, 79),
(299, 193),
(300, 227),
(303, 214),
(304, 214),
(305, 230),
(306, 232),
(310, 217),
(318, 182),
(320, 61),
(322, 197),
(325, 214),
(331, 120),
(332, 15),
(333, 233),
(335, 214),
(338, 141),
(339, 227),
(346, 102),
(354, 137),
(369, 227),
(370, 168),
(373, 217),
(374, 204),
(379, 33),
(385, 220),
(389, 79),
(390, 229),
(391, 119),
(392, 220),
(395, 206),
(396, 208),
(397, 102),
(398, 119),
(404, 214),
(406, 64),
(407, 64),
(408, 33),
(409, 45),
(410, 235),
(411, 58),
(412, 236),
(413, 237),
(420, 148),
(427, 185),
(428, 86),
(429, 214),
(430, 72),
(437, 237),
(438, 210),
(439, 212),
(440, 72),
(441, 184),
(447, 206),
(448, 102),
(460, 148),
(461, 72),
(464, 203),
(466, 26),
(472, 233),
(473, 58),
(474, 233),
(475, 119),
(476, 174),
(477, 217),
(480, 217),
(481, 227),
(482, 233),
(483, 214),
(484, 163),
(485, 204),
(486, 145),
(494, 15),
(497, 102),
(500, 189),
(501, 191),
(502, 229),
(507, 21),
(508, 217),
(511, 208),
(513, 229),
(514, 237),
(521, 53),
(522, 220),
(523, 220),
(524, 220),
(525, 219),
(529, 86),
(530, 119),
(535, 83),
(536, 233),
(539, 238),
(540, 102),
(547, 197),
(552, 205),
(553, 205),
(554, 205),
(555, 205),
(558, 28);

--
-- Triggers `transaction_company`
--
DROP TRIGGER IF EXISTS `trigger___add_transaction_company`;
DELIMITER $$
CREATE TRIGGER `trigger___add_transaction_company` AFTER INSERT ON `transaction_company`
 FOR EACH ROW BEGIN

	DECLARE CL DOUBLE DEFAULT 0.00;
	DECLARE BL DOUBLE DEFAULT 0.00;
	DECLARE NAME VARCHAR(64) CHARSET UTF8;
		
	DECLARE AM DOUBLE DEFAULT 0.00;
	DECLARE ST INT DEFAULT 0;


	SET ST := (SELECT transaction_status FROM `transaction` WHERE idtransaction = NEW.idtransaction LIMIT 1);
	

	IF ST = 1  THEN
		UPDATE company 
		SET company_balance = company_balance - (SELECT transaction_ammount FROM transaction WHERE idtransaction = NEW.idtransaction) 
		WHERE idcompany = NEW.idcompany;

  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_details`
--

DROP TABLE IF EXISTS `transaction_details`;
CREATE TABLE IF NOT EXISTS `transaction_details` (
`idtransaction` int(10) unsigned NOT NULL,
  `transaction_cheque` varchar(64) DEFAULT NULL,
  `transaction_bank` varchar(64) DEFAULT NULL,
  `transaction_branch` varchar(64) DEFAULT NULL,
  `transaction_comments` varchar(255) DEFAULT NULL,
  `transaction_entrytime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `transaction_cheque_date` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=560 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction_details`
--

INSERT INTO `transaction_details` (`idtransaction`, `transaction_cheque`, `transaction_bank`, `transaction_branch`, `transaction_comments`, `transaction_entrytime`, `transaction_cheque_date`) VALUES
(1, 'IBU0001259', '36', 'NULL', 'Previous Enry of 6-12-14', '2014-12-10 10:08:13', '2014-12-09'),
(2, NULL, NULL, NULL, '6th LC, 20% margin', '2014-12-10 10:11:18', NULL),
(3, NULL, NULL, NULL, 'MR NO # 1492', '2014-12-11 05:19:25', NULL),
(5, 'IBU0001261', '36', 'NULL', 'For PPR 1/2&quot; Female Elbow Purchase', '2014-12-11 09:01:07', '2014-12-11'),
(6, NULL, NULL, NULL, 'MR NO # 1550', '2014-12-13 09:11:00', NULL),
(7, NULL, NULL, NULL, 'MR NO # NILL', '2014-12-13 10:52:58', NULL),
(8, NULL, NULL, NULL, 'MR NO # 1625', '2014-12-13 10:56:01', NULL),
(9, NULL, NULL, NULL, 'MR NO # 1678', '2014-12-13 11:20:12', NULL),
(10, NULL, NULL, NULL, 'For Filter Drinking Water Bill', '2014-12-13 12:21:25', NULL),
(11, NULL, NULL, NULL, 'Being the amount paid as conveyance bill, purpose of head office.', '2014-12-13 12:24:58', NULL),
(12, NULL, NULL, NULL, 'Being the amount paid as Bkash charge payment, purpose of Adept Int (Rest  of the amount).', '2014-12-13 12:27:17', NULL),
(14, NULL, NULL, NULL, 'Being the amount paid for Entertainment/Lunch Bill (14/8/14 to 24/11/14)', '2014-12-14 05:43:56', NULL),
(15, NULL, NULL, NULL, 'Being the amount paid as unloading bill.', '2014-12-14 06:14:57', NULL),
(16, NULL, NULL, NULL, 'Being the amount paid as conveyance bill.', '2014-12-14 06:17:01', NULL),
(17, NULL, NULL, NULL, 'Being the amount paid as entertainment purpose.', '2014-12-14 06:18:40', NULL),
(18, NULL, NULL, NULL, 'Being the amount paid as entertainment bill. (tea)', '2014-12-14 06:20:00', NULL),
(19, NULL, NULL, NULL, 'ACI, Room Spray &amp; Tissue purchase purpose', '2014-12-14 06:24:31', NULL),
(20, NULL, NULL, NULL, 'Bank deposit.', '2014-12-14 06:30:52', NULL),
(21, NULL, NULL, NULL, 'Bank deposit.', '2014-12-14 06:30:52', NULL),
(22, NULL, NULL, NULL, 'Bank Deposit', '2014-12-14 06:43:41', NULL),
(23, NULL, NULL, NULL, 'Bank Deposit', '2014-12-14 06:43:41', NULL),
(24, NULL, NULL, NULL, 'MR NO # 1626', '2014-12-14 09:10:05', NULL),
(25, NULL, NULL, NULL, 'MR NO # 1680', '2014-12-14 11:52:41', NULL),
(26, NULL, NULL, NULL, 'MR NO # 1627', '2014-12-14 11:55:36', NULL),
(27, '7416700', '32', 'NULL', 'MR NO # 1547', '2014-12-15 04:06:43', '2014-12-29'),
(28, '2744616', '6', 'NULL', 'MR NO # 1549', '2014-12-15 04:07:48', '2014-12-10'),
(29, NULL, NULL, NULL, 'Loan closing on 08-12-2014', '2014-12-15 04:30:05', NULL),
(30, NULL, NULL, NULL, 'Loan', '2014-12-15 04:31:08', NULL),
(31, NULL, NULL, NULL, 'Md Sir, IOU transfer.', '2014-12-15 04:32:08', NULL),
(32, NULL, NULL, NULL, 'OD Sir IOU transfer', '2014-12-15 04:34:05', NULL),
(33, NULL, NULL, NULL, 'ATIL salary purpose.', '2014-12-15 04:34:56', NULL),
(34, '6606940', '23', 'NULL', 'MR NO # 1493', '2014-12-15 04:46:27', '2014-12-14'),
(36, '2478248', '10', 'NULL', 'MR NO # 1494', '2014-12-15 04:50:37', '2014-12-25'),
(38, '5392958', '12', 'NULL', 'MR NO # 1497', '2014-12-15 04:54:34', '2014-12-14'),
(39, '5693648', '1', 'NULL', 'MR NO # 1679', '2014-12-15 04:57:41', '2014-12-22'),
(40, NULL, NULL, NULL, 'A/C: 1008921401057200', '2014-12-15 05:13:38', NULL),
(41, '7330589', '26', 'NULL', 'MR NO # 1628', '2014-12-15 10:44:35', '2014-12-17'),
(42, 'IBU0001262', '36', 'NULL', 'Loan Pay Back', '2014-12-15 11:09:44', '2014-12-15'),
(43, NULL, NULL, NULL, 'For the month of November, 2014', '2014-12-15 12:22:41', NULL),
(44, NULL, NULL, NULL, 'For the month of November, 2014', '2014-12-15 12:25:02', NULL),
(45, NULL, NULL, NULL, 'For the month of November, 2014', '2014-12-15 12:25:24', NULL),
(46, NULL, NULL, NULL, 'For the month of November, 2014', '2014-12-15 12:26:04', NULL),
(47, NULL, NULL, NULL, 'For the month of November, 2014', '2014-12-15 12:26:34', NULL),
(48, NULL, NULL, NULL, 'Being the amount paid as unloading bill purpose of Navana PPR Pipe.', '2014-12-15 12:29:26', NULL),
(49, 'IBU0001263', '36', 'NULL', 'For Short Tern Loan Pay Back', '2014-12-18 06:43:47', '2014-12-18'),
(50, 'IBU0001264', '36', 'NULL', 'Short Term Loan Payback ', '2014-12-18 08:32:15', '2014-12-18'),
(51, '9021536', '36', 'NULL', 'MR NO # 1629', '2014-12-18 12:25:01', '2014-12-20'),
(52, NULL, NULL, NULL, 'NULL', '2014-12-18 12:32:44', NULL),
(53, NULL, NULL, NULL, 'NULL', '2014-12-18 12:33:10', NULL),
(54, NULL, NULL, NULL, 'For Office Purpose', '2014-12-18 13:10:05', NULL),
(55, NULL, NULL, NULL, 'For the month of Nov-2014', '2014-12-18 13:30:06', NULL),
(56, NULL, NULL, NULL, 'For the month of Nov-2014', '2014-12-20 04:14:09', NULL),
(57, NULL, NULL, NULL, 'For the month of Nov-2014', '2014-12-20 04:15:55', NULL),
(58, NULL, NULL, NULL, 'For the month of Nov-2014', '2014-12-20 04:16:22', NULL),
(59, NULL, NULL, NULL, 'For the month of Nov-2014', '2014-12-20 04:16:45', NULL),
(60, NULL, NULL, NULL, 'Nov-2014', '2014-12-20 04:18:44', NULL),
(61, NULL, NULL, NULL, 'For Nazim Salary Purpose Paid', '2014-12-20 04:19:45', NULL),
(62, NULL, NULL, NULL, 'MR NO # 1498', '2014-12-20 04:22:56', NULL),
(63, NULL, NULL, NULL, 'MR NO # 1499', '2014-12-20 04:24:24', NULL),
(64, NULL, NULL, NULL, 'Grameen Builders = 14391 + Cash Book = 5609', '2014-12-20 04:30:29', NULL),
(65, NULL, NULL, NULL, 'Grameen Builders = 14391 + Cash Book = 5609', '2014-12-20 04:30:29', NULL),
(66, NULL, NULL, NULL, 'For the Month of Sep-2014', '2014-12-20 04:31:22', NULL),
(67, NULL, NULL, NULL, 'NULL', '2014-12-20 11:01:21', NULL),
(68, NULL, NULL, NULL, 'For Delivery Purpose.', '2014-12-20 11:08:10', NULL),
(69, NULL, NULL, NULL, 'For Head Office Purpose.', '2014-12-20 11:09:03', NULL),
(70, NULL, NULL, NULL, 'For Conveyance Voucher.', '2014-12-20 11:11:13', NULL),
(71, NULL, NULL, NULL, 'For Octane Bill', '2014-12-20 11:11:53', NULL),
(72, NULL, NULL, NULL, 'For Octane Bill', '2014-12-20 11:12:23', NULL),
(73, 'IBU0001265', '36', 'NULL', 'Loan PayBack to ADHL, For Naki Enterprise, Food Ministry Payment  Purpose.', '2014-12-21 07:28:28', '2014-12-21'),
(74, NULL, NULL, NULL, 'PPR Delivery Purpose.', '2014-12-21 11:35:24', NULL),
(75, NULL, NULL, NULL, 'MR NO # 1630', '2014-12-21 11:36:45', NULL),
(76, NULL, NULL, NULL, 'Cash Received by Ali Haider', '2014-12-21 11:38:01', NULL),
(77, NULL, NULL, NULL, 'Bank Deposit', '2014-12-21 11:39:09', NULL),
(78, NULL, NULL, NULL, 'Bank Deposit', '2014-12-21 11:39:09', NULL),
(79, NULL, NULL, NULL, 'For Cont. Mofazzal ', '2014-12-21 11:40:10', NULL),
(80, NULL, NULL, NULL, 'MR NO # 1681', '2014-12-22 10:09:18', NULL),
(81, NULL, NULL, NULL, 'Cash Received by Ali Haider', '2014-12-22 10:10:35', NULL),
(83, NULL, NULL, NULL, 'Birthday Cake Purchase', '2014-12-22 10:26:37', NULL),
(84, NULL, NULL, NULL, 'For MD Sir Medical Checkup Purpose.', '2014-12-22 10:29:19', NULL),
(85, NULL, NULL, NULL, 'For Pay Order Charge (Food Bhaban)', '2014-12-22 10:31:05', NULL),
(86, NULL, NULL, NULL, 'For Delivery Plastic Bag, Tap &amp; Others.', '2014-12-22 10:33:00', NULL),
(87, '0296647', '42', 'NULL', 'MR NO # 1681', '2014-12-23 03:42:21', '2014-12-22'),
(88, NULL, NULL, NULL, 'For Cont Mofazzal ', '2014-12-23 09:23:22', NULL),
(89, NULL, NULL, NULL, 'MR NO # 1630', '2014-12-23 09:26:40', NULL),
(90, NULL, NULL, NULL, 'For Delivery Purpose', '2014-12-23 09:31:33', NULL),
(91, NULL, NULL, NULL, 'Sales Commission ', '2014-12-23 09:35:57', NULL),
(92, NULL, NULL, NULL, 'Delivery Porpose (1/12/14 to 7/12/14)', '2014-12-23 09:37:32', NULL),
(93, NULL, NULL, NULL, 'MR NO # 1682', '2014-12-24 04:15:46', NULL),
(94, NULL, NULL, NULL, 'Bank Deposit', '2014-12-24 04:21:07', NULL),
(95, NULL, NULL, NULL, 'Bank Deposit', '2014-12-24 04:21:07', NULL),
(96, NULL, NULL, NULL, 'MR NO # 1634', '2014-12-24 04:40:08', NULL),
(97, NULL, NULL, NULL, 'Premio Car CNG Bill', '2014-12-24 04:46:23', NULL),
(98, NULL, NULL, NULL, 'For Head Office Purpose.', '2014-12-24 10:31:06', NULL),
(99, NULL, NULL, NULL, 'MR NO # 1701', '2014-12-27 05:22:10', NULL),
(100, NULL, NULL, NULL, 'MR NO # 1751', '2014-12-28 04:25:22', NULL),
(101, 'IBU0001266', '36', 'NULL', 'Short tern loan pay back', '2014-12-28 06:03:38', '2014-12-28'),
(102, 'IBU0001267', '36', 'NULL', 'Mr. Roman (Tiles)', '2014-12-28 07:33:23', '2014-12-28'),
(103, 'IBU0001268', '36', 'NULL', 'For Navana PPR Pipe Purchase', '2014-12-28 07:40:08', '2014-12-28'),
(104, NULL, NULL, NULL, 'For Cont. Mofazzal (Hamdard)', '2014-12-28 10:14:45', NULL),
(105, NULL, NULL, NULL, 'MR NO # 1635', '2014-12-28 11:46:05', NULL),
(106, '7330631', '26', 'NULL', 'MR NO # 1752', '2014-12-29 04:43:00', '2014-12-24'),
(107, '7330631', '26', 'NULL', 'MR NO # 1752', '2014-12-29 10:30:25', '2014-12-29'),
(108, '2908684', '28', 'NULL', 'Receive against Previous due balance.', '2014-12-29 10:34:46', '2014-12-29'),
(109, NULL, NULL, NULL, 'Cash pay back for Unique purpose.', '2014-12-29 11:56:44', NULL),
(110, NULL, NULL, NULL, 'Order sheet &amp; others photocopy.', '2014-12-29 11:58:13', NULL),
(111, NULL, NULL, NULL, 'For Head Office purpose.', '2014-12-29 11:59:08', NULL),
(112, NULL, NULL, NULL, 'For Heat Machine collect purpose.', '2014-12-29 12:00:05', NULL),
(113, NULL, NULL, NULL, 'Head Office Entertainment purpose.', '2014-12-29 12:01:08', NULL),
(114, 'IBU0001269', '36', 'NULL', 'For PPR Pipe Purchase', '2014-12-30 07:48:37', '2015-01-04'),
(115, NULL, NULL, NULL, 'Bank Deposit', '2014-12-30 09:35:16', NULL),
(116, NULL, NULL, NULL, 'Bank Deposit', '2014-12-30 09:35:16', NULL),
(117, NULL, NULL, NULL, 'MR NO # 1636', '2014-12-30 11:13:39', NULL),
(118, NULL, NULL, NULL, 'MR NO # 1637', '2014-12-30 11:14:52', NULL),
(119, NULL, NULL, NULL, 'MR NO # 1753', '2014-12-31 03:42:59', NULL),
(121, NULL, NULL, NULL, 'Cash Payment for Octane Bill, Date: 21/12/14 ', '2014-12-31 11:27:31', NULL),
(122, NULL, NULL, NULL, 'Cash loan pay back', '2014-12-31 11:32:00', NULL),
(123, '5448821', '1', 'NULL', 'MR # 1683', '2015-01-01 04:50:44', '2014-12-30'),
(124, NULL, NULL, NULL, 'Yearly Service charge Deduction', '2015-01-01 05:11:32', NULL),
(125, NULL, NULL, NULL, 'For the Maintenance Charge Including Vat &amp; Excise Duty', '2015-01-01 06:32:20', NULL),
(126, '5693687', '1', 'NULL', 'MR NO # 1703', '2015-01-01 06:45:41', '2015-01-05'),
(127, NULL, NULL, NULL, 'Cash Deposited to the IBBL A/c for the Navana Chq clearance ', '2015-01-01 09:26:31', NULL),
(128, NULL, NULL, NULL, 'For Office Porpose', '2015-01-01 09:41:55', NULL),
(129, NULL, NULL, NULL, 'For PABX connection at kakrail office.', '2015-01-01 10:12:03', NULL),
(130, NULL, NULL, NULL, 'Heat machine collection and other conveyance bills', '2015-01-01 10:15:59', NULL),
(131, NULL, NULL, NULL, 'For delivery packaging', '2015-01-01 10:17:04', NULL),
(132, NULL, NULL, NULL, 'Heat Machine Collection Purpose Project Visit', '2015-01-01 10:18:51', NULL),
(133, NULL, NULL, NULL, 'MR # 1638', '2015-01-03 06:44:30', NULL),
(134, NULL, NULL, NULL, 'MR # 1639', '2015-01-03 07:22:02', NULL),
(135, NULL, NULL, NULL, 'Cash payment for delivery transportation.', '2015-01-03 09:40:12', NULL),
(136, NULL, NULL, NULL, 'For Md. Jamaluddin (Bike) ', '2015-01-05 08:20:42', NULL),
(137, NULL, NULL, NULL, 'MR # 1684', '2015-01-06 07:01:17', NULL),
(138, NULL, NULL, NULL, 'Wind &amp; Light Payment( MR # 1703)', '2015-01-06 07:06:04', NULL),
(139, NULL, NULL, NULL, 'Wind &amp; Light Payment (MR # 1703)', '2015-01-06 07:06:04', NULL),
(140, NULL, NULL, NULL, 'Sales Incentive For the Month of  November&#039; 2014.', '2015-01-06 07:16:34', NULL),
(141, NULL, NULL, NULL, 'MR # 1640', '2015-01-06 08:53:55', NULL),
(142, NULL, NULL, NULL, 'MR # 1641', '2015-01-07 12:31:57', NULL),
(143, NULL, NULL, NULL, 'MR # 1643', '2015-01-08 11:02:38', NULL),
(144, NULL, NULL, NULL, 'MR # 1642', '2015-01-08 11:05:24', NULL),
(145, NULL, NULL, NULL, 'Mr. Rajib&#039;s Loan Transferred from ATIL to ADHL', '2015-01-08 11:55:50', NULL),
(146, NULL, NULL, NULL, 'For UNIQUE Purpose. Received in Unique Loan Book', '2015-01-08 12:02:52', NULL),
(147, NULL, NULL, NULL, 'Corporate Mobile Bills For All, For The Month of December 2014.', '2015-01-08 12:11:46', NULL),
(148, NULL, NULL, NULL, 'For The Week Bills Expenses', '2015-01-08 12:14:32', NULL),
(149, NULL, NULL, NULL, 'Navana PPR Pipe Delivery(received) Purpose Unloading Bill to the Labor.', '2015-01-10 05:48:22', NULL),
(150, NULL, NULL, NULL, 'Delivery Transportation Cost ', '2015-01-10 10:45:44', NULL),
(151, NULL, NULL, NULL, 'Entertainment Cost On Delivery', '2015-01-10 10:48:49', NULL),
(152, NULL, NULL, NULL, 'For the Month of December 2014', '2015-01-10 10:50:20', NULL),
(153, NULL, NULL, NULL, 'MR # 1644', '2015-01-11 12:01:56', NULL),
(154, NULL, NULL, NULL, 'For Salary Purpose, for the Month December 2014 payment', '2015-01-11 12:06:23', NULL),
(155, NULL, NULL, NULL, 'CNG bill to bashundhara for Md Sir&#039;s Laptop repairing purpose.( Mr. Tariqul Islam Imran)', '2015-01-12 07:15:48', NULL),
(156, NULL, NULL, NULL, 'Bill paid for the month of December 2014', '2015-01-12 07:18:35', NULL),
(157, NULL, NULL, NULL, 'Mobil bill paid for Md. Jamal Uddin.(08.01.2015)', '2015-01-12 07:21:00', NULL),
(158, NULL, NULL, NULL, 'Partly Paid.', '2015-01-12 07:23:08', NULL),
(159, NULL, NULL, NULL, 'Recovery by Mizan( old employee)  ', '2015-01-12 13:26:26', NULL),
(160, NULL, NULL, NULL, 'MR # 1705', '2015-01-12 13:27:27', NULL),
(161, NULL, NULL, NULL, 'Orbit Bhaban and cash in hand', '2015-01-12 13:30:22', NULL),
(162, NULL, NULL, NULL, 'Orbit Bhaban and cash in hand', '2015-01-12 13:30:22', NULL),
(163, NULL, NULL, NULL, 'To Mr. Poel (Full &amp; Final Payment)', '2015-01-12 13:34:46', NULL),
(164, NULL, NULL, NULL, 'For the Month of December 2014', '2015-01-12 13:36:12', NULL),
(165, NULL, NULL, NULL, 'For the Month of December 2014', '2015-01-12 13:37:00', NULL),
(166, NULL, NULL, NULL, 'For the Month of December 2014', '2015-01-12 13:37:34', NULL),
(167, NULL, NULL, NULL, 'For Mobil &amp; CNG Bills', '2015-01-12 13:41:27', NULL),
(168, NULL, NULL, NULL, 'T/A Bill, For the Month of December 2014.(1% of Total Sale )', '2015-01-12 13:43:19', NULL),
(169, 'IBU0001270', '36', 'NULL', 'Office Requirements and For Unique Purpose Salary ( transfer to ADHL Loan Book)', '2015-01-13 06:31:49', '2015-01-13'),
(170, NULL, NULL, NULL, 'Office Requirements and For Unique Purpose Salary ( transfer to ADHL Loan Book)', '2015-01-13 06:31:49', NULL),
(171, NULL, NULL, NULL, 'For the Month of December 2014 ( A/C paid) ', '2015-01-13 08:32:09', NULL),
(172, NULL, NULL, NULL, 'For the Month OF December 2014', '2015-01-13 08:36:00', NULL),
(173, NULL, NULL, NULL, 'For the Month of December 2014', '2015-01-13 08:36:45', NULL),
(174, NULL, NULL, NULL, 'For the Month of December 2014 (A/C paid)', '2015-01-13 08:38:07', NULL),
(175, NULL, NULL, NULL, 'For the Month of December 2014 (A/C Paid)', '2015-01-13 08:41:34', NULL),
(176, NULL, NULL, NULL, 'For the Month of December 2014', '2015-01-13 08:42:20', NULL),
(177, NULL, NULL, NULL, 'Driver ( Premio), For the Month of December 2014', '2015-01-13 08:43:10', NULL),
(178, NULL, NULL, NULL, 'Transferred to Unique for Mr Ashraf and others.', '2015-01-13 09:03:34', NULL),
(179, NULL, NULL, NULL, 'Deduct from ADHL loan book(Transferred to Unique for internet bill)', '2015-01-13 09:06:11', NULL),
(180, NULL, NULL, NULL, 'For ADHL net bill, for the month of December 2014, January 2015.', '2015-01-13 09:08:07', NULL),
(181, NULL, NULL, NULL, 'For the Month  of Decmber 2014, January 2015', '2015-01-13 09:21:03', NULL),
(182, NULL, NULL, NULL, 'For Pragoti Design &amp; Development Ltd.', '2015-01-13 09:59:09', NULL),
(183, NULL, NULL, NULL, 'MR # 1707', '2015-01-14 03:49:01', NULL),
(185, NULL, NULL, NULL, 'Online Group Payment Deposited', '2015-01-14 03:55:52', NULL),
(186, NULL, NULL, NULL, 'Online Group Payment Deposited', '2015-01-14 03:55:52', NULL),
(187, NULL, NULL, NULL, 'Deduct From ADHL Loan book( Transferred to Unique, for salary).', '2015-01-14 04:04:30', NULL),
(188, 'IBU0001271', '36', 'NULL', 'Paid to Mr. Ekramul Haque', '2015-01-14 10:26:03', '2015-01-14'),
(189, '5603601', '29', 'NULL', 'MR # 1754', '2015-01-14 10:31:24', '2015-01-11'),
(191, NULL, NULL, NULL, 'For Delivery Purpose(Protik Dev.)', '2015-01-15 12:48:09', NULL),
(192, NULL, NULL, NULL, 'For Delivery Purpose', '2015-01-15 12:49:16', NULL),
(193, NULL, NULL, NULL, 'For Mobile Purchase (Jamal Uddin)', '2015-01-15 12:51:11', NULL),
(194, NULL, NULL, NULL, 'Mobile Purchase for AGM (Jamal Uddin)', '2015-01-15 12:54:23', NULL),
(195, NULL, NULL, NULL, 'For The Week Bills', '2015-01-15 12:55:49', NULL),
(196, NULL, NULL, NULL, 'For Adept &amp; Hridoy Corporation, PPR fittings Purchase.', '2015-01-15 13:03:31', NULL),
(197, 'IBU0001273', '36', 'NULL', 'For Cash Loan to ADHL &amp; for Office', '2015-01-18 12:46:35', '2015-01-17'),
(198, NULL, NULL, NULL, 'For Cash Loan to ADHL &amp; for Office', '2015-01-18 12:46:35', NULL),
(199, NULL, NULL, NULL, 'Deducted From Manual Loan Book', '2015-01-18 12:53:54', NULL),
(200, NULL, NULL, NULL, 'Delivery Transport Cost Bill Paid By Office Executive(ALi Haider)', '2015-01-18 12:57:16', NULL),
(201, NULL, NULL, NULL, 'Delivery Transport Cost Bill Paid By Office Executive(ALi Haider)', '2015-01-18 12:58:12', NULL),
(202, NULL, NULL, NULL, 'For IBBL Investment A/C Renewal ', '2015-01-18 12:59:36', NULL),
(203, NULL, NULL, NULL, 'for Mr. Hasan, LC Purpose', '2015-01-18 13:00:51', NULL),
(204, '189694', '34', 'NULL', 'MR # 1708', '2015-01-19 08:06:19', '2015-02-04'),
(205, '2908694', '28', 'NULL', 'MR # 1709', '2015-01-19 08:14:55', '2015-01-25'),
(206, NULL, NULL, NULL, 'MR # 1646', '2015-01-19 08:32:52', NULL),
(207, NULL, NULL, NULL, 'Navana Payment Deposited(MR # 1646)', '2015-01-19 08:33:59', NULL),
(208, NULL, NULL, NULL, 'Navana Payment Deposited(MR # 1646)', '2015-01-19 08:33:59', NULL),
(209, '8378739', '22', 'NULL', 'MR # 1500', '2015-01-19 09:28:01', '2015-01-15'),
(210, NULL, NULL, NULL, 'MR # 1710', '2015-01-19 11:55:44', NULL),
(211, NULL, NULL, NULL, 'MR # 1647', '2015-01-20 07:29:26', NULL),
(212, NULL, NULL, NULL, 'For LC purpose, Deposited to IBBL', '2015-01-20 12:17:03', NULL),
(213, NULL, NULL, NULL, 'Deposited to IBBL For LC purpose', '2015-01-20 12:18:36', NULL),
(214, NULL, NULL, NULL, 'Deposited to IBBL For LC purpose', '2015-01-20 12:18:36', NULL),
(215, NULL, NULL, NULL, 'Deposited to NCC Bank', '2015-01-20 12:19:33', NULL),
(216, NULL, NULL, NULL, 'Deposited to NCC Bank', '2015-01-20 12:19:33', NULL),
(217, NULL, NULL, NULL, 'MR # 1711', '2015-01-21 13:21:47', NULL),
(218, NULL, NULL, NULL, 'MR # 1648', '2015-01-21 13:22:46', NULL),
(219, NULL, NULL, NULL, '1712', '2015-01-21 13:23:27', NULL),
(220, NULL, NULL, NULL, 'Excel Real Estate Payment Deposited to IBBL.', '2015-01-21 13:26:13', NULL),
(221, NULL, NULL, NULL, 'Excel Real Estate Payment Deposited to IBBL', '2015-01-21 13:26:13', NULL),
(222, NULL, NULL, NULL, 'M/s. Talha &amp; Hero Sanitasy Payment Deposited to NCC.', '2015-01-21 13:27:56', NULL),
(223, NULL, NULL, NULL, 'Talha &amp; Hero Sanitasy Payment Deposited to NCC.', '2015-01-21 13:27:56', NULL),
(225, NULL, NULL, NULL, 'PPR Fittings purchase for Hero Sanitary', '2015-01-24 06:01:26', NULL),
(226, NULL, NULL, NULL, 'Clam Purchase for Protik', '2015-01-24 06:03:04', NULL),
(227, NULL, NULL, NULL, 'MR 1649', '2015-01-24 06:22:37', NULL),
(228, NULL, NULL, NULL, 'To ADHL, transfer to Unique Salary(for CEO n PRO)', '2015-01-24 06:25:12', NULL),
(229, NULL, NULL, NULL, 'PPR pipe received from Navana Engineering.', '2015-01-24 06:27:43', NULL),
(230, NULL, NULL, NULL, 'For the week(17/01/2015 to 22/01/2015)', '2015-01-24 06:29:07', NULL),
(231, NULL, NULL, NULL, 'Gone for northern insurance, submit LC paper to Mr. Hasan.', '2015-01-24 06:34:16', NULL),
(232, NULL, NULL, NULL, 'for LC papers', '2015-01-24 06:36:12', NULL),
(233, NULL, NULL, NULL, 'Archive Voucher(debit)', '2015-01-24 06:42:37', NULL),
(234, NULL, NULL, NULL, 'PPR Fittings purchase, for MD. Razib( new client)', '2015-01-24 07:28:10', NULL),
(235, NULL, NULL, NULL, 'MR # 1702', '2015-01-26 03:46:21', NULL),
(236, NULL, NULL, NULL, 'MR # 1650', '2015-01-26 03:48:50', NULL),
(237, NULL, NULL, NULL, 'Social Marketing payment deposited.', '2015-01-26 03:52:37', NULL),
(238, NULL, NULL, NULL, 'Social Marketing payment deposited.', '2015-01-26 03:52:37', NULL),
(239, NULL, NULL, NULL, 'Paid Back', '2015-01-26 03:56:22', NULL),
(240, NULL, NULL, NULL, 'MR # 1716', '2015-01-26 04:08:49', NULL),
(241, NULL, NULL, NULL, 'MR # 1686', '2015-01-26 04:10:36', NULL),
(242, NULL, NULL, NULL, 'For Client&#039;s Delivery Purpose.', '2015-01-26 04:14:56', NULL),
(243, NULL, NULL, NULL, 'For Client&#039;s Delivery Purpose.', '2015-01-26 04:15:31', NULL),
(244, NULL, NULL, NULL, 'Loan Pay', '2015-01-26 04:16:31', NULL),
(245, NULL, NULL, NULL, 'Cash Paid to Md Riaz Uddin, For Maati Properties Sales Commission.', '2015-01-26 04:23:20', NULL),
(246, NULL, NULL, NULL, 'For Deposit to Investment A/C', '2015-01-26 04:26:18', NULL),
(247, '2101898', '17', 'NULL', 'MR # 1706', '2015-01-26 05:06:05', '2015-01-25'),
(249, '4438894', '29', 'NULL', 'MR # 1714', '2015-01-26 06:04:01', '2015-01-25'),
(250, '8412944', '22', 'NULL', 'MR # 1715', '2015-01-26 06:07:27', '2015-03-18'),
(251, NULL, NULL, NULL, 'Deposited to IBBL for investment a/c', '2015-01-26 06:23:29', NULL),
(252, NULL, NULL, NULL, 'For Investment a/c.', '2015-01-26 06:27:55', NULL),
(253, NULL, NULL, NULL, 'For Investment a/c.', '2015-01-26 06:27:55', NULL),
(254, NULL, NULL, NULL, 'For Investment a/c.', '2015-01-26 06:28:49', NULL),
(255, NULL, NULL, NULL, 'For Investment a/c.', '2015-01-26 06:28:49', NULL),
(256, '3811529', '36', 'NULL', 'MR # 1713', '2015-01-26 08:21:37', '2015-01-21'),
(257, NULL, NULL, NULL, 'Loan from phoenix', '2015-01-26 10:07:23', NULL),
(258, 'NCC0986258', '17', 'NULL', 'dr. from ncc bank to phoenix', '2015-01-26 10:21:46', '2015-01-05'),
(259, 'C0986295', '17', 'NULL', 'For IBBL Investment Account.', '2015-01-27 07:20:39', '2015-01-25'),
(260, NULL, NULL, NULL, 'For IBBL Investment Account.', '2015-01-27 07:20:39', NULL),
(261, NULL, NULL, NULL, 'From Tanvir, For IBBL Investment Account.Andissued a next day (cash cheque IBBL) for Him.', '2015-01-27 07:24:04', NULL),
(262, NULL, NULL, NULL, 'Deposit For IBBL Investment Account.', '2015-01-27 07:26:01', NULL),
(263, NULL, NULL, NULL, 'Deposit For IBBL Investment Account.', '2015-01-27 07:26:01', NULL),
(264, NULL, NULL, NULL, 'MR # 1718', '2015-01-27 07:30:31', NULL),
(265, NULL, NULL, NULL, 'MR # 1717', '2015-01-27 07:31:49', NULL),
(266, NULL, NULL, NULL, 'Short Term Loan Paid Back', '2015-01-27 07:33:59', NULL),
(267, NULL, NULL, NULL, 'transferred to UWL, for Domain Renewal. ', '2015-01-27 07:35:34', NULL),
(268, NULL, NULL, NULL, 'Talha, Hero, The Orbital(BD), Social Marketing, MR. Rajib, payment deposited.', '2015-01-27 07:41:22', NULL),
(269, NULL, NULL, NULL, 'Talha, Hero, The Orbital(BD), Social Marketing, MR. Rajib, payment deposited.', '2015-01-27 07:41:22', NULL),
(270, NULL, NULL, NULL, 'MR # 1687', '2015-01-27 13:47:39', NULL),
(271, NULL, NULL, NULL, 'Loan From IBBL Investment Account', '2015-01-28 10:59:32', NULL),
(272, NULL, NULL, NULL, 'Directly deducted from bank', '2015-01-28 11:01:20', NULL),
(273, NULL, NULL, NULL, 'Payorder # 9376276 for navana.', '2015-01-28 11:03:37', NULL),
(274, NULL, NULL, NULL, 'Payorder #9376246  to navana ', '2015-01-28 11:06:40', NULL),
(275, NULL, NULL, NULL, 'Loan paid back to investment account', '2015-01-28 11:23:23', NULL),
(276, NULL, NULL, NULL, 'Investment Loan Payback', '2015-01-28 11:25:47', NULL),
(277, NULL, NULL, NULL, 'For 6th Shipment Custom Duty , C &amp; F Expense purpose', '2015-01-29 11:05:51', NULL),
(278, NULL, NULL, NULL, 'For 6th Shipment Remaining  balance amount T T purpose for Huijia Company', '2015-01-29 11:08:18', NULL),
(279, NULL, NULL, NULL, 'For ADHL Loan Purpose, Received from IBBL Investment Loan by Pay Order Against Modina Electric, Rampura', '2015-01-29 11:10:40', NULL),
(280, NULL, NULL, NULL, 'For Loan Pay back to ADHL by pay order against Modina Electric, Rampura', '2015-01-29 11:14:10', NULL),
(281, NULL, NULL, NULL, 'Being the amount paid to be Huijia Company, China, For 6th shipment TT purpose', '2015-01-29 11:17:40', NULL),
(282, NULL, NULL, NULL, 'Being the amount paid to be Huijia Company, China, for purpose of PI LC @ 80%  6th  shipment', '2015-01-29 11:27:57', NULL),
(283, NULL, NULL, NULL, 'MR # 1688', '2015-01-31 06:46:50', NULL),
(284, NULL, NULL, NULL, 'MR # 1801', '2015-01-31 06:53:18', NULL),
(285, NULL, NULL, NULL, 'Being the Amount Deposited to IBBL, Adjust Development Payment .', '2015-01-31 06:56:55', NULL),
(286, NULL, NULL, NULL, 'Being the Amount Deposited to IBBL, Adjust Development Payment .', '2015-01-31 06:56:55', NULL),
(287, NULL, NULL, NULL, 'Being the Amount Paid as thread tape Purchase for Pratik Development.', '2015-01-31 07:01:18', NULL),
(288, NULL, NULL, NULL, 'Being the amount paid as transport cost for 6th LC container Fitting delivey, from Chittagong port to  Kakrail &quot;Reza Tower&quot;.', '2015-01-31 07:23:11', NULL),
(289, NULL, NULL, NULL, 'Being the amount paid as transport cost for 6th LC container', '2015-01-31 07:38:39', NULL),
(290, NULL, NULL, NULL, 'Being the amount paid as labour bill , for carrying goods to go-down.', '2015-01-31 07:42:01', NULL),
(291, NULL, NULL, NULL, 'MR # 1802', '2015-01-31 08:10:08', NULL),
(292, NULL, NULL, NULL, 'For Md Jamal Uddin', '2015-01-31 08:13:18', NULL),
(293, NULL, NULL, NULL, 'Being the amunt paid as cng/octen bill, purpose of Premio car.', '2015-01-31 08:15:57', NULL),
(294, NULL, NULL, NULL, 'Being the amunt paid as photocopy expense, for office purpsoe work order copies.', '2015-01-31 08:21:19', NULL),
(295, NULL, NULL, NULL, 'Being the amount paid as conveyance bills, for office purpose.', '2015-01-31 08:22:51', NULL),
(296, NULL, NULL, NULL, 'Being the amount paid as entertainment expense, purpose of office use for a week.', '2015-01-31 08:25:50', NULL),
(297, '0000292', '3', 'NULL', 'MR # 1719', '2015-01-31 08:47:43', '2015-01-25'),
(298, '0000739', '3', 'NULL', 'MR # 1392', '2015-01-31 08:54:55', '2015-02-02'),
(299, '2744671', '6', 'NULL', 'MR # 1689', '2015-01-31 09:03:36', '2015-01-28'),
(300, '1762648', '17', 'NULL', 'MR # 1720', '2015-01-31 09:07:06', '2015-01-29'),
(302, 'IBU0001275', '36', 'NULL', 'Short term loan Paid Back', '2015-01-31 12:09:04', '2015-01-26'),
(303, 'IBU0001274', '36', 'NULL', 'A/C payee cheque payment to Navana Enineering Ltd..', '2015-01-31 12:13:21', '2015-01-28'),
(304, 'IBU0001272', '36', 'NULL', 'A pay Order Paid(P.O # 9376276) to Navana Engineering, This cheque Leaf paid to the IBBL  for security purpose. And the amount piaid from Investment A/C.', '2015-01-31 12:37:18', '2015-01-15'),
(305, NULL, NULL, NULL, 'MR # 1690', '2015-01-31 13:07:06', NULL),
(306, NULL, NULL, NULL, 'MR # 1755', '2015-01-31 13:08:11', NULL),
(307, NULL, NULL, NULL, 'Adjust development Payment deposited ', '2015-01-31 13:09:26', NULL),
(308, NULL, NULL, NULL, 'Adjust development Payment deposited ', '2015-01-31 13:09:26', NULL),
(309, NULL, NULL, NULL, 'Loan Paid Back', '2015-01-31 13:10:37', NULL),
(310, NULL, NULL, NULL, 'Being the amount Paid as clamp purchase for Protik Development Ltd.', '2015-01-31 13:13:48', NULL),
(311, NULL, NULL, NULL, 'Being the amount paid as octen bill, purpsoe of Jamal Uddin. For office  work', '2015-02-01 06:55:58', NULL),
(312, NULL, NULL, NULL, 'Being the amount paid as D/A bills, purpose of delivery , for  Rubel, Alamin, Arman.', '2015-02-01 06:57:57', NULL),
(313, NULL, NULL, NULL, 'Being the amount paid as D/A bills, purpose of delivery , for Rubel,.', '2015-02-01 07:00:03', NULL),
(314, NULL, NULL, NULL, 'Being the amount paid as transportation bills, purpose of delivery . Bill submitted by ALi Haider Mitul.', '2015-02-01 07:02:53', NULL),
(315, NULL, NULL, NULL, 'CIB report and Bank others charge deducted directly from  bank account. ', '2015-02-01 12:47:11', NULL),
(316, NULL, NULL, NULL, 'Being the amount directly deduct from Bank Amount for others monthly charges.', '2015-02-01 12:50:57', NULL),
(317, NULL, NULL, NULL, 'Being the amount paid as online charge for Protik Development&#039;s  cheque deposited purpose.', '2015-02-01 12:57:26', NULL),
(318, NULL, NULL, NULL, 'MR # 1691', '2015-02-01 13:03:40', NULL),
(319, NULL, NULL, NULL, 'Being the amount paid loan paid back to ADHL.', '2015-02-01 13:04:47', NULL),
(320, '603740', '29', 'NULL', 'MR # 1721', '2015-02-01 13:16:54', '2015-02-01'),
(321, 'IBU0001277', '36', 'NULL', 'being the Amount Paid as Cash Cheque Payment to ADHL purpose of loan Paybak', '2015-02-02 08:20:14', '2015-02-02'),
(322, NULL, NULL, NULL, 'MR # 1692', '2015-02-03 11:03:32', NULL),
(323, NULL, NULL, NULL, 'Being the amount Paid to IBBL Investment account  for loan payback, direct transferred by bank transaction.', '2015-02-03 11:20:02', NULL),
(324, NULL, NULL, NULL, 'Being the amount received from investment account and paid to Navana Engineering ltd.Mode of payment by Pay Order # 9477192', '2015-02-03 11:26:49', NULL),
(325, NULL, NULL, NULL, 'Being the amount paid as Supplier Bill payment. Mode of payment by Pay Order, P.O # 9477192', '2015-02-03 11:43:05', NULL),
(326, NULL, NULL, NULL, 'Cash Transfer From Bank to ATIL Bank A/C, For interest purpose.', '2015-02-03 11:48:10', NULL),
(327, NULL, NULL, NULL, 'Being the amount paid as Bank Charge deducted.', '2015-02-03 11:49:36', NULL),
(328, NULL, NULL, NULL, 'Vision Living Payment Deposit', '2015-02-03 11:55:21', NULL),
(329, NULL, NULL, NULL, 'Vision Living Payment Deposit', '2015-02-03 11:55:21', NULL),
(330, 'IBU0001280', '36', 'NULL', 'Cash Cheque payment to ADHL', '2015-02-04 07:57:19', '2015-02-04'),
(331, NULL, NULL, NULL, 'MR # 1723', '2015-02-04 13:15:00', NULL),
(332, NULL, NULL, NULL, 'MR # 1722', '2015-02-04 13:18:40', NULL),
(333, NULL, NULL, NULL, 'MR # 1724', '2015-02-04 13:19:57', NULL),
(334, NULL, NULL, NULL, 'amount taken from investment account for Navana Payment', '2015-02-04 13:34:53', NULL),
(335, NULL, NULL, NULL, 'This payment paid by Pay Order,P.O #  9477231 against the cheque # 01279', '2015-02-04 13:47:30', NULL),
(336, NULL, NULL, NULL, 'Echo Apparel Payment Deposited. ', '2015-02-05 12:42:25', NULL),
(337, NULL, NULL, NULL, 'Echo Apparel Payment Deposited. ', '2015-02-05 12:42:25', NULL),
(338, NULL, NULL, NULL, 'Being the amount paid as cash return to the client, purpose of over payment.', '2015-02-07 11:15:31', NULL),
(339, NULL, NULL, NULL, 'Being the amount paid as cash return to Protik Developers ltd, purpose of over payment', '2015-02-07 11:17:58', NULL),
(340, NULL, NULL, NULL, 'Being the amount paid as Sale Commission , purpose of Protik Developers Ltd.', '2015-02-07 11:22:42', NULL),
(341, NULL, NULL, NULL, 'Being the amount paid as Sale Commission , purpose of Major Azad.', '2015-02-07 11:23:29', NULL),
(342, NULL, NULL, NULL, 'Being the amount paid as Sale Commission , purpose of Progati Design &amp; Development ltd.', '2015-02-07 11:25:25', NULL),
(343, NULL, NULL, NULL, 'Being the amount paid as Sale Commission , purpose of Nur Hossain Khan', '2015-02-07 11:26:18', NULL),
(344, NULL, NULL, NULL, 'Being the amount paid as Sale Commission , purpose of Heritage Real Estate Ltd.', '2015-02-07 11:27:31', NULL),
(345, NULL, NULL, NULL, 'Being the amount paid as Sale Commission , purpose of Homes 71 Ltd.', '2015-02-07 11:28:28', NULL),
(346, NULL, NULL, NULL, 'MR # 1757', '2015-02-07 11:40:35', NULL),
(347, 'IBU0001281', '36', 'NULL', 'For ADHL Purpose', '2015-02-07 11:44:06', '2015-02-05'),
(348, NULL, NULL, NULL, 'For ADHL Purpose', '2015-02-07 11:44:06', NULL),
(349, NULL, NULL, NULL, 'Loan Paid Back To ADHL', '2015-02-07 11:46:34', NULL),
(350, NULL, NULL, NULL, 'Being the amount Paid as printing bill for MR. Shamim , for debit &amp; credit  voucher bill.', '2015-02-07 11:49:57', NULL),
(351, NULL, NULL, NULL, 'Being the amount Paid as entertainment bills, purpose of office &amp; for the week.', '2015-02-07 11:52:57', NULL),
(352, NULL, NULL, NULL, 'Being the amount Paid as conveyance bills, for office work purpose.', '2015-02-07 11:54:36', NULL),
(353, NULL, NULL, NULL, 'Being the amount Paid as photocopy bills, purpose of office.', '2015-02-07 11:55:41', NULL),
(354, NULL, NULL, NULL, 'MR # 1726', '2015-02-07 11:57:44', NULL),
(355, NULL, NULL, NULL, 'Being the amount Paid as octen bill for Md. Jamal Uddin.', '2015-02-07 12:01:12', NULL),
(356, NULL, NULL, NULL, 'Being the amount Paid as GP mobile Bills for all employees, For the month of January-2015', '2015-02-07 12:03:30', NULL),
(357, NULL, NULL, NULL, 'being the amount paid as documentation charge for 6th shipment , to M.hasan Logistic.', '2015-02-07 12:07:41', NULL),
(358, NULL, NULL, NULL, 'being the amount paid as association fees for 6th shipment , to M. Hasan Logistic.', '2015-02-07 12:09:10', NULL),
(359, NULL, NULL, NULL, 'being the amount paid as Pay Order charge for 6th shipment , to M. Hasan Logistic.', '2015-02-07 12:10:27', NULL),
(360, NULL, NULL, NULL, 'being the amount paid as Bank Online charge for 6th shipment , to M. Hasan Logistic.', '2015-02-07 12:11:43', NULL),
(361, NULL, NULL, NULL, 'being the amount paid as Bill Loading Verify charge for 6th shipment , to M. Hasan Logistic.', '2015-02-07 12:13:01', NULL),
(362, NULL, NULL, NULL, 'being the amount paid as Custom Duty charge for 6th shipment , to M. Hasan Logistic.', '2015-02-07 12:14:31', NULL),
(363, NULL, NULL, NULL, 'being the amount paid as Port charge for 6th shipment , to M. Hasan Logistic.', '2015-02-07 12:15:31', NULL),
(364, NULL, NULL, NULL, 'being the amount paid as shipping agent  charge for 6th shipment , to M. Hasan Logistic.', '2015-02-07 12:16:44', NULL),
(365, NULL, NULL, NULL, 'being the amount paid as NOC charge for 6th shipment , to M. Hasan Logistic.', '2015-02-07 12:17:57', NULL),
(366, NULL, NULL, NULL, 'being the amount paid Labor charge for 6th shipment , to M. Hasan Logistic.', '2015-02-07 12:19:01', NULL),
(367, NULL, NULL, NULL, 'being the amount paid as Custom Miscellaneous  for 6th shipment , to M. Hasan Logistic.', '2015-02-07 12:20:15', NULL),
(368, NULL, NULL, NULL, 'being the amount paid as Assessment Expenses for 6th shipment , to M. Hasan Logistic.', '2015-02-07 12:21:30', NULL),
(369, 'C1762673', '17', 'NULL', 'MR # 1725', '2015-02-07 12:27:01', '2015-02-06'),
(370, '8117561', '32', 'NULL', 'MR # 1756', '2015-02-09 05:38:04', '2015-02-08'),
(371, NULL, NULL, NULL, 'Being the amount paid as newspaper bill, for the month of January-2015', '2015-02-09 06:11:52', NULL),
(372, NULL, NULL, NULL, 'Being the amount paid as drinking water bill, purpose of office ', '2015-02-11 04:08:43', NULL),
(373, NULL, NULL, NULL, 'Being the amount paid as ppr thread tape purchase, for client (Protik Developers ltd.) purpose.', '2015-02-11 04:29:38', NULL),
(374, NULL, NULL, NULL, 'MR # 1693', '2015-02-11 04:33:11', NULL),
(375, NULL, NULL, NULL, 'Being the amount paid as transport cost for Navana PPR 10&#039; pipe purchase delivery.', '2015-02-11 04:37:23', NULL),
(376, NULL, NULL, NULL, 'Being the amount paid as unloading bill, purpose of  navana 10&#039; pipe delivery . unloading to reza tower godawon.', '2015-02-11 05:35:32', NULL),
(377, NULL, NULL, NULL, 'Being the amount paid as internet bill, for the month of January -2015', '2015-02-11 06:23:20', NULL),
(378, NULL, NULL, NULL, 'Being the amount paid as internet bill, purpose of ADHL. for the  month of January -2015', '2015-02-11 06:25:29', NULL),
(379, NULL, NULL, NULL, 'MR # 1803', '2015-02-11 06:47:05', NULL),
(380, NULL, NULL, NULL, 'Primex Builder &amp; maerials Ltd. Payment deposited.', '2015-02-11 06:49:45', NULL),
(381, NULL, NULL, NULL, 'Primex Builder &amp; maerials Ltd. Payment deposited.', '2015-02-11 06:49:45', NULL),
(382, NULL, NULL, NULL, 'Pay Oder Deposited to bank which is issued by ATIL  on 21/12/14,for Neki Enterprise.', '2015-02-11 08:21:29', NULL),
(383, NULL, NULL, NULL, 'Pay Oder Deposited to bank which is issued by ATIL  on 21/12/14,for Neki Enterprise.', '2015-02-11 08:22:10', NULL),
(384, 'IBU0001283', '36', 'NULL', 'Loan Pay Back ADHL', '2015-02-11 08:55:54', '2015-02-08'),
(385, 'IBU0001284', '36', 'NULL', 'Being the amount paid as Advance Payment cheque to HR corporation, for fittings purchase.', '2015-02-11 09:03:17', '2015-02-10'),
(386, 'IBU0001286', '36', 'NULL', 'Loan Paid Back to ADHL.', '2015-02-11 09:18:12', '2015-02-10'),
(387, 'IBU0001288', '36', 'NULL', 'Being the amount paid as loan pay back to ADHL.', '2015-02-11 09:20:58', '2015-02-10'),
(388, 'IBU0001289', '36', 'NULL', 'Being the amount paid as loan payback to ADHL(tanvir).', '2015-02-11 09:24:56', '2015-02-10'),
(389, '0000759', '3', 'NULL', 'MR # 1727', '2015-02-11 10:19:35', '2015-02-10'),
(390, NULL, NULL, NULL, 'MR # 1694', '2015-02-11 11:00:11', NULL),
(391, NULL, NULL, NULL, 'MR # 1804', '2015-02-11 13:39:04', NULL),
(392, 'IBU0001285', '36', 'NULL', 'Being the amount paid as Advance Payment cheque to HR corporation, for fittings purchase.The cheque is issued name Rashida Chemical Corporation.', '2015-02-12 06:53:43', '2015-02-12'),
(393, NULL, NULL, NULL, 'Being the amount paid as delivery transportation cost,.', '2015-02-12 13:44:55', NULL),
(394, NULL, NULL, NULL, 'Being the amount paid as carton purchase for office  stationary.', '2015-02-12 13:48:12', NULL),
(395, NULL, NULL, NULL, 'MR # 1758', '2015-02-12 13:53:12', NULL),
(396, NULL, NULL, NULL, 'MR # 1728', '2015-02-12 13:57:51', NULL),
(397, NULL, NULL, NULL, 'MR # 1695', '2015-02-12 13:58:42', NULL),
(398, NULL, NULL, NULL, 'MR # 1805', '2015-02-12 13:59:35', NULL),
(399, NULL, NULL, NULL, 'Being the amount paid as office photocopy expenses.For the week purpose.', '2015-02-12 14:06:27', NULL),
(400, NULL, NULL, NULL, 'Being the amount paid as office stationary expenses.For the week purpose.', '2015-02-12 14:07:57', NULL),
(401, NULL, NULL, NULL, 'Being the amount paid as office Entertainment expenses.For the week purpose.', '2015-02-12 14:09:02', NULL),
(402, NULL, NULL, NULL, 'Being the amount paid as office conveyance expenses.For the week purpose.', '2015-02-12 14:09:51', NULL),
(403, 'IBU0001290', '36', 'NULL', 'Being the amount paid as Loan payback.', '2015-02-12 14:31:54', '2015-02-12'),
(404, 'IBU0001291', '36', 'NULL', 'Being the amount paid as Navana Payment for Pipe purchase.', '2015-02-12 14:36:02', '2015-02-12'),
(405, 'IBU0001292', '36', 'NULL', 'Being the amount paid as ADHL Loan payback', '2015-02-12 14:39:02', '2015-02-12'),
(406, '2478247', '10', 'NULL', 'MR # 1495', '2015-02-14 06:19:12', '2014-12-20'),
(407, '2478249', '10', 'NULL', 'MR # 1496', '2015-02-14 06:20:49', '2014-12-30'),
(408, NULL, NULL, NULL, 'MR # 1806', '2015-02-14 08:14:03', NULL),
(409, NULL, NULL, NULL, 'MR # ', '2015-02-16 06:56:45', NULL),
(410, NULL, NULL, NULL, 'MR # 1729', '2015-02-16 07:00:24', NULL),
(411, NULL, NULL, NULL, 'MR # 1730', '2015-02-16 07:02:43', NULL),
(412, NULL, NULL, NULL, 'MR # 1696', '2015-02-16 07:03:30', NULL),
(413, NULL, NULL, NULL, 'MR # 1697', '2015-02-16 07:04:23', NULL),
(415, NULL, NULL, NULL, 'Being the amount paid as loan payback to ADHL, for La-verna Late night work.', '2015-02-16 07:11:06', NULL),
(416, NULL, NULL, NULL, 'Being the amount paid as loan payback to ADHL, for office purpose.', '2015-02-16 07:11:52', NULL),
(417, NULL, NULL, NULL, 'Being the amount Deposited to IBBL  A/C', '2015-02-16 07:17:46', NULL),
(418, NULL, NULL, NULL, 'being the amount deposited to IBBL A/C', '2015-02-16 07:17:46', NULL),
(419, NULL, NULL, NULL, 'Being the amount paid to ADHL, loan paid back.(raihan for forashgong)', '2015-02-16 11:22:00', NULL),
(420, NULL, NULL, NULL, 'MR # 1807', '2015-02-17 12:50:44', NULL),
(421, NULL, NULL, NULL, 'Being the amount paid as sales commission, for Khan  Brothers  sales purpose.', '2015-02-17 13:00:31', NULL),
(422, NULL, NULL, NULL, 'Being the amount Paid as sales commission, for unique living  ltd.', '2015-02-17 13:28:07', NULL),
(423, NULL, NULL, NULL, 'Being the amount paid as sale commission ,for Kingdom Builders.', '2015-02-17 13:29:41', NULL),
(424, NULL, NULL, NULL, 'Being the amount paid T/A bill,  for the month of januray-2015.', '2015-02-17 13:31:50', NULL),
(425, NULL, NULL, NULL, 'Being the amount paid T/A bill,  for the month of December-2014 &amp; January-2015.', '2015-02-17 13:33:27', NULL),
(426, NULL, NULL, NULL, 'Being the amount paid loan payback, partly paid, =(5000+11000+4000)', '2015-02-17 13:36:15', NULL),
(427, NULL, NULL, NULL, 'Mr # 1698', '2015-02-17 13:38:11', NULL),
(428, NULL, NULL, NULL, 'Mr # 1808', '2015-02-17 13:40:46', NULL),
(429, 'IBU0001282', '36', 'NULL', 'Being the amount paid as ,For pipe purchase from Navana Engineering ltd.', '2015-02-17 13:45:14', '2015-02-08'),
(430, NULL, NULL, NULL, 'MR # 1731', '2015-02-18 06:30:23', NULL),
(431, NULL, NULL, NULL, 'Being the amount paid as loan payback to ADHL. for salary purpose.', '2015-02-18 06:31:31', NULL),
(432, NULL, NULL, NULL, 'Being the amount received as Loan from ADHL for ATIL salary purpose.', '2015-02-19 04:17:24', NULL),
(433, NULL, NULL, NULL, 'Being the amount paid as, delivery transportation bills,  for clients purpose.', '2015-02-19 12:24:00', NULL),
(434, NULL, NULL, NULL, 'Being the amount paid as, delivery transportation bills,  for clients purpose.', '2015-02-19 12:25:15', NULL),
(435, NULL, NULL, NULL, 'Being the amount paid as, delivery unloading bills for  Navana pipe.', '2015-02-19 12:28:32', NULL),
(436, NULL, NULL, NULL, 'Being the amount paid as telephone bills payment, for the month of November-2014, December-2014.', '2015-02-19 12:30:33', NULL),
(437, NULL, NULL, NULL, 'MR # 1699', '2015-02-19 12:34:07', NULL),
(438, 'IBU0001287', '36', 'NULL', 'Being the amount paid as cash return for Over payment of ICL Real Estate Ltd.', '2015-02-19 13:34:38', '2015-02-18'),
(439, '5073373', '29', 'NULL', 'MR # 1759', '2015-02-19 13:43:55', '2015-02-19'),
(440, '8513361', '23', 'NULL', 'MR # 1732', '2015-02-19 13:51:25', '2015-02-23'),
(441, NULL, NULL, NULL, 'MR # 1700', '2015-02-19 14:00:36', NULL),
(442, NULL, NULL, NULL, 'Index payment deposited.', '2015-02-19 14:01:24', NULL),
(443, NULL, NULL, NULL, 'Index payment deposited.', '2015-02-19 14:01:24', NULL),
(444, NULL, NULL, NULL, 'Being the amount paid as office stationary purchase, for the week bills.', '2015-02-22 12:08:26', NULL),
(445, NULL, NULL, NULL, 'Being the amount paid as office photocopy bills, for the week purpose.', '2015-02-22 12:10:20', NULL),
(446, NULL, NULL, NULL, 'Being the amount paid as office entertainment bills, for the week purpose.', '2015-02-22 12:11:41', NULL),
(447, NULL, NULL, NULL, 'MR # 1760', '2015-02-22 12:14:58', NULL),
(448, NULL, NULL, NULL, 'MR # 1809', '2015-02-22 12:18:47', NULL),
(449, NULL, NULL, NULL, 'Being the amount paid as Salary for the month of January -2015', '2015-02-22 12:21:23', NULL),
(450, NULL, NULL, NULL, 'Being the amount paid as salary, For the month of January-2015', '2015-02-22 12:32:07', NULL),
(451, NULL, NULL, NULL, 'Being the amount paid as salary, For the month of January-2015', '2015-02-22 12:32:46', NULL),
(452, NULL, NULL, NULL, 'Being the amount paid as salary, For the month of January-2015', '2015-02-22 12:33:18', NULL),
(453, NULL, NULL, NULL, 'Being the amount paid as salary, For the month of January-2015', '2015-02-22 12:33:47', NULL),
(454, NULL, NULL, NULL, 'Being the amount paid as salary, For the month of January-2015', '2015-02-22 12:34:47', NULL),
(455, NULL, NULL, NULL, 'Being the amount paid as salary, For the month of January-2015', '2015-02-22 12:35:36', NULL),
(456, NULL, NULL, NULL, 'Being the amount paid as Overtime, For the month of January-2015', '2015-02-22 12:36:10', NULL),
(457, NULL, NULL, NULL, 'Being the amount paid as remunaration, For the month of January-2015', '2015-02-22 12:37:29', NULL),
(458, NULL, NULL, NULL, 'Being the amount paid as remuneration, For the month of January-2015', '2015-02-22 12:38:17', NULL),
(459, NULL, NULL, NULL, 'Being the amount paid as remuneration, For the month of January-2015', '2015-02-22 12:38:49', NULL),
(460, NULL, NULL, NULL, 'MR # 1810', '2015-02-22 12:41:52', NULL),
(461, NULL, NULL, NULL, 'MR # 1811', '2015-02-22 12:42:39', NULL),
(462, 'NCC0986259', '17', 'NULL', 'for the month of February-2015, it is 9th installment.', '2015-02-22 12:50:43', '2015-02-05'),
(463, 'C0986296', '17', 'NULL', 'loan payback to adhl', '2015-02-23 05:42:08', '2015-02-23'),
(464, '5693787', '1', 'NULL', 'MR # 1734', '2015-02-23 08:21:26', '2015-03-01'),
(466, NULL, NULL, NULL, 'MR # 1812', '2015-02-23 12:26:39', NULL),
(467, NULL, NULL, NULL, 'This amount paid by ADHL to VAT chalan Expenses, for ATIL', '2015-02-23 12:30:59', NULL),
(468, NULL, NULL, NULL, 'Being the amount paid as Vat chalan payment by ADHL,, for ATIL.', '2015-02-23 12:33:21', NULL),
(469, NULL, NULL, NULL, 'Being the amount paid as Laon Payback to ADHL.', '2015-02-23 12:36:29', NULL),
(470, NULL, NULL, NULL, 'Being the amount paid as delivery bills, purpose of client delivery, bill submitted by Ali Haider Mitul', '2015-02-23 12:38:32', NULL),
(471, NULL, NULL, NULL, 'Being the amount paid as navana 1/2&quot; pipe delivery to Reza Tower  go-down, purpose of labor bill. ', '2015-02-24 07:42:03', NULL),
(472, '0000375', '3', 'NULL', 'MR # 1735', '2015-02-24 08:07:46', '2015-02-24'),
(473, '9293534', '22', 'NULL', 'MR # 1736', '2015-02-24 08:09:37', '2015-04-15'),
(474, NULL, NULL, NULL, 'MR # 1735', '2015-02-24 08:10:56', NULL),
(475, NULL, NULL, NULL, 'MR # 1813', '2015-02-24 08:18:21', NULL),
(476, NULL, NULL, NULL, 'MR # 1851', '2015-02-24 11:11:04', NULL),
(477, NULL, NULL, NULL, 'Being the amount paid as 1 1/2&quot; Pipe Clip Purchase, for Protik Development Ltd.', '2015-02-24 11:17:50', NULL),
(478, NULL, NULL, NULL, 'M/S. Talha Enterprise Payment &amp; Shuruchi&#039;s Part amount deposited to ATIL NCC A/C', '2015-02-24 11:56:22', NULL),
(479, NULL, NULL, NULL, 'M/S. Talha Enterprise Payment &amp; Shuruchi&#039;s Part amount deposited to ATIL NCC A/C', '2015-02-24 11:56:22', NULL),
(480, NULL, NULL, NULL, 'Being the Amount paid as PPR fittings purchase, for client delivery.', '2015-02-24 12:04:18', NULL),
(481, '1983880', '17', 'NULL', 'MR # 1737', '2015-02-25 06:09:20', '2015-02-26'),
(482, '1697548', '27', 'NULL', 'MR # 1738', '2015-02-25 06:11:02', '2015-03-02'),
(483, 'C0986297', '17', 'NULL', 'Being the amount paid as Navana Payment, to Mr.Mamun', '2015-02-25 09:15:37', '2015-03-01'),
(484, NULL, NULL, NULL, 'MR # 1854', '2015-02-26 04:20:34', NULL),
(485, NULL, NULL, NULL, 'MR # 1853', '2015-02-26 04:21:46', NULL),
(486, NULL, NULL, NULL, 'MR # 1852', '2015-02-26 04:22:30', NULL),
(487, 'IBU0001293', '36', 'NULL', 'Being the amount paid to Mr. Hasan, for C&amp; F expense, purpose of  6th LC.', '2015-02-26 07:42:40', '2015-02-26'),
(488, NULL, NULL, NULL, 'Being the amount paid as Octen/mobil bills for Md. Jamal Uddin, for total (3)three bills payment.', '2015-02-26 09:37:44', NULL),
(489, NULL, NULL, NULL, 'Being the amount paid as C &amp; F Misc Expense , for 6th shipment.', '2015-02-26 09:40:20', NULL),
(490, NULL, NULL, NULL, 'Being the amount paid as  conveyance bill for Pipe clamp (Protik Purpose)purchase  from  alloo bazar.', '2015-02-26 09:42:47', NULL),
(491, NULL, NULL, NULL, 'Being the amount paid as  photocpy bill, purpose of ABS documents for bank A/C open.', '2015-02-26 09:44:16', NULL),
(492, NULL, NULL, NULL, 'Being the amount paid as stationary purchase for office purpose.', '2015-02-26 09:45:17', NULL),
(493, NULL, NULL, NULL, 'Being the amount paid as entertainment bills, for the week bills purpose.', '2015-02-26 09:46:17', NULL),
(494, NULL, NULL, NULL, 'MR # 1814', '2015-02-26 12:19:09', NULL),
(495, NULL, NULL, NULL, 'Excel Real Estate Ltd. payment deposited.', '2015-02-26 12:20:26', NULL),
(496, NULL, NULL, NULL, 'Excel Real Estate Ltd. payment deposited.', '2015-02-26 12:20:26', NULL),
(497, NULL, NULL, NULL, 'MR # 1855', '2015-02-28 12:40:47', NULL),
(498, NULL, NULL, NULL, 'Techvan payment deposited to IBBL.(Riaz)', '2015-02-28 12:43:18', NULL),
(499, NULL, NULL, NULL, 'Techvan payment deposited to IBBL.(by Riaz)', '2015-02-28 12:43:18', NULL),
(500, NULL, NULL, NULL, 'MR # 1739', '2015-02-28 12:44:56', NULL),
(501, NULL, NULL, NULL, 'MR # 1815', '2015-02-28 12:47:03', NULL),
(502, NULL, NULL, NULL, 'Being the amount paid as cash return to Living stone for over payment.( by Mr. Riaz)', '2015-02-28 12:50:11', NULL),
(503, NULL, NULL, NULL, 'being the amount paid as fuel/CNG bills, purpose of Premio car.', '2015-03-01 03:48:04', NULL),
(504, NULL, NULL, NULL, 'being the amount paid as printing bill, for ATIL brochure purpose. ', '2015-03-01 03:49:33', NULL),
(505, NULL, NULL, NULL, 'being the amount paid as D/A bill payment for delivery purpose.', '2015-03-01 03:51:07', NULL),
(506, NULL, NULL, NULL, 'being the amount paid as D/A bill payment for delivery purpose.bill submitted by Mr. Ali Haider ', '2015-03-01 03:52:08', NULL),
(507, '2908724', '28', 'NULL', 'MR # 1733', '2015-03-01 06:20:55', '2015-02-25'),
(508, NULL, NULL, NULL, 'Being the amount paid as PPR fittings purchase(thread tape), purpose of Protik Development delivery.', '2015-03-01 06:27:36', NULL),
(509, NULL, NULL, NULL, 'Being the amount paid unloading bill, purpose of Navana pipe delivery to Reza Tower .', '2015-03-01 06:29:32', NULL),
(510, NULL, NULL, NULL, 'Being the amount paid as incentive expense to AGM Md. Jamal Uddin. Purpose of  total recovery amount.  (.5%)for the month of January-2015', '2015-03-01 06:36:27', NULL),
(511, NULL, NULL, NULL, 'MR # 1740', '2015-03-01 11:03:57', NULL),
(512, NULL, NULL, NULL, 'Being the amount paid as Brochure printing bill, to Mr. Shamim.', '2015-03-01 11:05:42', NULL),
(513, 'Pay Order # 1019897', '30', 'NULL', 'MR # 1685', '2015-03-02 04:43:39', '2015-02-25'),
(514, NULL, NULL, NULL, 'MR # 1857', '2015-03-02 11:57:36', NULL),
(515, 'IBU0001297', '36', 'NULL', 'ADHL LOan Purpose', '2015-03-02 11:59:18', '2015-03-02'),
(516, NULL, NULL, NULL, 'ADHL LOan Purpose', '2015-03-02 11:59:18', NULL),
(517, NULL, NULL, NULL, 'Being the amount paid as ADHL Loan payment to ADHL.', '2015-03-02 12:01:02', NULL),
(518, NULL, NULL, NULL, 'Being the amount received as loan.', '2015-03-03 05:05:40', NULL),
(519, NULL, NULL, NULL, 'Cash Deposited to Bank.', '2015-03-03 05:06:42', NULL),
(520, NULL, NULL, NULL, 'Cash Deposited to Bank.', '2015-03-03 05:06:42', NULL),
(521, '4177971', '36', 'NULL', 'MR # 1741', '2015-03-03 05:12:42', '2015-03-02'),
(522, 'IBU0001294', '36', 'NULL', 'Being the amount paid Hridoy Corporation, A/C Payee cheque Name  RASHIDA CHEMICAL CORPORATION. Purpose of  PPR Pipe purchase.', '2015-03-03 06:44:29', '2015-03-03');
INSERT INTO `transaction_details` (`idtransaction`, `transaction_cheque`, `transaction_bank`, `transaction_branch`, `transaction_comments`, `transaction_entrytime`, `transaction_cheque_date`) VALUES
(523, 'IBU0001295', '36', 'NULL', 'Being the amount paid Hridoy Corporation, A/C Payee cheque Name  RASHIDA CHEMICAL CORPORATION. Purpose of  PPR Pipe purchase.', '2015-03-03 06:47:06', '2015-03-20'),
(524, 'IBU0001296', '36', 'NULL', 'Being the amount paid Hridoy Corporation, A/C Payee cheque Name  RASHIDA CHEMICAL CORPORATION. Purpose of  PPR Pipe purchase.', '2015-03-03 06:53:10', '2015-03-30'),
(525, 'IBU0001298', '36', 'NULL', 'Being the amount paid Shuchana-5P, A/C Payee cheque Name  SHUCHANA ASSOCIATE . Purpose of  PPR Fittings purchase.', '2015-03-03 06:56:21', '2015-03-03'),
(526, NULL, NULL, NULL, 'Being the amount paid as unloading bill, purpose of  Navana PPR pipe receive at evening.', '2015-03-05 12:54:07', NULL),
(527, NULL, NULL, NULL, 'Being the amount paid as unloading/unstocking bill, purpose of  Navana PPR pipe return at evening.', '2015-03-05 12:58:23', NULL),
(528, NULL, NULL, NULL, 'Being the amount paid as labor bill for Reza Tower 1st floor godown room shifting and cleaning.', '2015-03-05 13:01:14', NULL),
(529, NULL, NULL, NULL, 'MR # 1817', '2015-03-05 13:04:45', NULL),
(530, NULL, NULL, NULL, 'MR # 1818', '2015-03-05 13:06:01', NULL),
(531, NULL, NULL, NULL, 'Navana &amp; Talha payment deposited', '2015-03-05 13:08:14', NULL),
(532, NULL, NULL, NULL, 'Navana &amp; Talha payment deposited', '2015-03-05 13:08:14', NULL),
(533, NULL, NULL, NULL, 'Being the amount paid as telephone bills, old &amp; new phone, for the month of November-14, December-14, January-15.', '2015-03-05 13:11:10', NULL),
(534, NULL, NULL, NULL, 'Being the amount paid as unloading bills, for Hridoy Corporation Pipe received at evening .', '2015-03-05 13:12:43', NULL),
(535, NULL, NULL, NULL, 'MR # 1858', '2015-03-05 13:17:48', NULL),
(536, NULL, NULL, NULL, 'MR # 1742', '2015-03-05 13:19:52', NULL),
(537, NULL, NULL, NULL, 'A.K.H Echo Apperal Payment Deposited to NCC Bank(by Md.  Jamal Uddin)', '2015-03-05 13:22:28', NULL),
(538, NULL, NULL, NULL, 'A.K.H Echo Apperal Payment Deposited to NCC Bank(by Md.  Jamal Uddin)', '2015-03-05 13:22:28', NULL),
(539, NULL, NULL, NULL, 'MR # 1819', '2015-03-05 13:24:01', NULL),
(540, NULL, NULL, NULL, 'MR # 1859', '2015-03-05 13:24:39', NULL),
(541, NULL, NULL, NULL, 'Being the amount paid as office drinking water bill, for the month of  February-2015', '2015-03-05 13:27:51', NULL),
(542, NULL, NULL, NULL, 'Being the amount paid as office photocopy bills, for the week purpose payment.', '2015-03-05 13:29:12', NULL),
(543, NULL, NULL, NULL, 'Being the amount paid as office stationary bills, for the week purpose payment.', '2015-03-05 13:30:00', NULL),
(544, NULL, NULL, NULL, 'Being the amount paid as office conveyance bills, for the week purpose payment.', '2015-03-05 13:30:36', NULL),
(545, NULL, NULL, NULL, 'Being the amount paid as office entertainment bills, for the week purpose payment.', '2015-03-05 13:31:30', NULL),
(546, NULL, NULL, NULL, 'Being the amount paid as sale commission expenses, purpose of Protik Development Ltd.', '2015-03-05 13:34:50', NULL),
(547, '0058508', '3', 'NULL', 'MR # 1856', '2015-03-05 13:44:54', '2015-03-02'),
(548, NULL, NULL, NULL, 'Ok', '2015-03-09 08:36:37', NULL),
(549, NULL, NULL, NULL, 'Giving', '2015-03-09 08:36:37', NULL),
(550, NULL, NULL, NULL, 'Ok', '2015-03-09 08:36:55', NULL),
(551, NULL, NULL, NULL, 'Giving', '2015-03-09 08:36:55', NULL),
(552, NULL, NULL, NULL, 'Ok', '2015-03-09 08:37:26', NULL),
(553, NULL, NULL, NULL, 'Ok', '2015-03-09 08:37:29', NULL),
(554, NULL, NULL, NULL, 'Ok', '2015-03-09 08:37:36', NULL),
(555, NULL, NULL, NULL, 'Ok', '2015-03-09 08:37:41', NULL),
(556, NULL, NULL, NULL, 'Ok', '2015-03-09 08:40:15', NULL),
(557, NULL, NULL, NULL, 'Ok', '2015-03-09 08:40:15', NULL),
(558, NULL, NULL, NULL, 'Ok', '2015-03-09 08:40:42', NULL),
(559, NULL, NULL, NULL, 'MR# 90', '2015-03-09 08:43:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_head`
--

DROP TABLE IF EXISTS `transaction_head`;
CREATE TABLE IF NOT EXISTS `transaction_head` (
`idtransaction_head` int(10) unsigned NOT NULL,
  `transaction_head_name` varchar(64) NOT NULL,
  `idtransaction_head_type` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction_head`
--

INSERT INTO `transaction_head` (`idtransaction_head`, `transaction_head_name`, `idtransaction_head_type`) VALUES
(1, 'Sallary', 1),
(2, 'Bonus', 1),
(3, 'Sales Incentive', 1),
(4, 'Conveyance', 1),
(5, 'Advance Loan', 1),
(6, 'Daily Allowance', 1),
(7, 'Overtime', 1),
(8, 'Miscellaneous', 1),
(9, 'Investment', 2),
(10, 'Personal Loan', 2),
(11, 'Remuneration', 2),
(12, 'Bonus', 2),
(13, 'Purchase', 3),
(14, 'Sales', 3),
(15, 'Sales Return', 3),
(16, 'Purchase Return', 3),
(17, 'Discount', 3),
(18, 'Receive Loan', 4),
(19, 'Payback Loan', 4),
(20, 'Interest', 4),
(21, 'Custom Duty', 5),
(22, 'C &amp; F Expense', 5),
(23, 'Fund Transfer (Withdraw)', 5),
(24, 'Income Tax', 5),
(25, 'VAT', 5),
(26, 'Bank Charge', 5),
(27, 'Conveyance', 5),
(28, 'Daily Allowance', 5),
(29, 'Labour Cost', 5),
(30, 'Travel Allowance', 5),
(31, 'Mobile Bill', 5),
(32, 'Telephone Bill', 5),
(33, 'Water Bill', 5),
(34, 'Internet Bill', 5),
(35, 'Software Bill', 5),
(36, 'Printing', 5),
(37, 'Stationary Purchase', 5),
(38, 'Decoration', 5),
(39, 'Entertainment ', 5),
(40, 'Miscellaneous ', 5),
(41, 'Sales Commission ', 5),
(42, 'Electricity Bill', 5),
(43, 'Office Rent', 5),
(44, 'Store Rent', 5),
(45, 'Newspaper Bill', 5),
(46, 'Cable Operator Bill', 5),
(47, 'Audit Report', 5),
(48, 'Advertisement Expense', 5),
(49, 'Courier Service', 5),
(50, 'License Documentation', 5),
(51, 'Service Charge', 5),
(52, 'Transport Cost', 5),
(53, 'Fund Transfer (Deposit)', 5),
(54, 'Car Purchase', 5),
(55, 'CIB Report Expense', 5),
(56, 'Company Return', 5),
(57, 'Credit Report Expense', 5),
(58, 'IRC Renew', 5),
(59, 'Insurance Charge', 5),
(60, 'Car Insurance Charge', 5),
(61, 'Car  Maintenance Charge', 5),
(62, 'Fuel / CNG Expense', 5),
(63, 'Joint Stock License Return', 5),
(64, 'Photocopy Expense', 5),
(65, 'Shipment Charge', 5),
(66, 'L.C. Charge', 5),
(67, 'Store Decoration Expense', 5),
(68, 'Office Decoration Expense', 5),
(69, 'Trade License Renew', 5),
(70, 'Unloading Expense', 5),
(71, 'Sales Return', 5),
(72, 'Documentation Online Charge', 5),
(73, 'Association Fees', 5),
(74, 'Pay Order  Charge', 5),
(75, 'Bank Online Charge', 5),
(76, 'Bank Online Charge', 5),
(77, 'Bill Loading Verify Charge', 5),
(78, 'Port Charges', 5),
(79, 'Shipping Agents Charges', 5),
(80, 'NOC Charges', 5),
(81, 'Labour Charges', 5),
(82, 'Radiation Charges', 5),
(83, 'Custom Miscellaneous', 5),
(84, 'Examination Expense', 5),
(85, 'Assessment Expenses', 5),
(86, 'Cash Return', 3);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_head_type`
--

DROP TABLE IF EXISTS `transaction_head_type`;
CREATE TABLE IF NOT EXISTS `transaction_head_type` (
`idtransaction_head_type` int(10) unsigned NOT NULL,
  `transaction_head_type_en` varchar(64) DEFAULT NULL,
  `transaction_head_type_bn` varchar(64) DEFAULT NULL,
  `priority` smallint(5) unsigned DEFAULT '50'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='1 - > insentive comission is hard wired into database';

--
-- Dumping data for table `transaction_head_type`
--

INSERT INTO `transaction_head_type` (`idtransaction_head_type`, `transaction_head_type_en`, `transaction_head_type_bn`, `priority`) VALUES
(1, 'With Employee', 'কর্মকর্তা / কর্মচারীর সাথে', 50),
(2, 'With Director / Propiter', 'পরিচালক / স্বত্ত্বাধিকারীদের সাথে', 50),
(3, 'With Clients / Supplier', 'ক্রেতা / বিক্রেতার সাথে', 50),
(4, 'Loan', NULL, 50),
(5, 'Others', 'অন্যান্য', 50);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_incentive_reciver`
--

DROP TABLE IF EXISTS `transaction_incentive_reciver`;
CREATE TABLE IF NOT EXISTS `transaction_incentive_reciver` (
  `idtransaction` int(10) unsigned NOT NULL,
  `idincentive_reciver` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_loan`
--

DROP TABLE IF EXISTS `transaction_loan`;
CREATE TABLE IF NOT EXISTS `transaction_loan` (
  `idtransaction` int(10) unsigned NOT NULL,
  `idloan` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `transaction_loan`
--

INSERT INTO `transaction_loan` (`idtransaction`, `idloan`) VALUES
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(42, 1),
(49, 1),
(50, 1),
(61, 1),
(73, 1),
(79, 1),
(88, 1),
(101, 1),
(102, 1),
(104, 1),
(109, 1),
(122, 1),
(127, 1),
(145, 1),
(146, 1),
(154, 1),
(178, 1),
(179, 1),
(180, 1),
(187, 1),
(191, 1),
(193, 1),
(199, 1),
(212, 1),
(228, 1),
(239, 1),
(244, 1),
(246, 1),
(251, 1),
(257, 2),
(258, 2),
(266, 1),
(267, 1),
(271, 3),
(272, 3),
(273, 3),
(275, 3),
(276, 3),
(277, 1),
(278, 1),
(279, 3),
(280, 1),
(309, 1),
(319, 1),
(321, 1),
(323, 3),
(324, 3),
(330, 1),
(334, 3),
(349, 1),
(378, 1),
(382, 1),
(383, 1),
(384, 1),
(386, 1),
(387, 1),
(388, 1),
(403, 1),
(405, 1),
(415, 1),
(416, 1),
(419, 1),
(426, 1),
(431, 1),
(432, 1),
(462, 2),
(463, 1),
(467, 1),
(469, 1),
(517, 1),
(518, 1);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_other`
--

DROP TABLE IF EXISTS `transaction_other`;
CREATE TABLE IF NOT EXISTS `transaction_other` (
`idtransaction` int(10) unsigned NOT NULL,
  `for` varchar(64) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=560 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction_other`
--

INSERT INTO `transaction_other` (`idtransaction`, `for`) VALUES
(10, 'Filter Water '),
(11, 'Rubel &amp; Alamin'),
(12, 'Bkash payment to Adept Int.'),
(14, 'Md. Rubel'),
(15, 'Navana PPR Pipe Unloading'),
(16, 'Md. Rubel'),
(17, 'Head Office'),
(18, 'Head Office'),
(19, 'Head Office '),
(40, 'L.C AMENDMENT CHARGE'),
(48, 'Navana PPR Pipe'),
(54, 'Entertainment'),
(60, 'Head Office'),
(67, 'Head Office'),
(68, 'Transport Bill'),
(69, 'Head Office'),
(70, 'Head Office'),
(71, 'Rajib'),
(72, 'Jamal Uddin'),
(74, 'Transport Bill'),
(83, 'Director Sir'),
(84, 'MD Sir'),
(85, 'IBBL Pay Order Charge'),
(86, 'Store Stationary Purpose'),
(90, 'Transportation Bill '),
(91, 'Estate Management Partners Ltd'),
(92, 'Transportation Bill'),
(97, 'Premio Car CNG Bill'),
(98, 'Head Office'),
(110, 'Head Office'),
(111, 'Head Office'),
(112, 'Rubel '),
(113, 'Head Office'),
(121, 'Md. Jamal Uddin'),
(124, 'IBBL'),
(125, 'NCC Bank Service Charge'),
(128, 'Office'),
(129, 'Poel( PABX)'),
(130, 'Office Work'),
(131, 'Delivery Tape'),
(132, 'Rubel Launch'),
(135, 'Delivery Bills'),
(136, 'Octen Bill'),
(147, 'Employee&#039;s'),
(148, 'Office'),
(149, 'Navana Delivery'),
(150, 'Delivery Purpose'),
(151, 'Delivery Purpose'),
(152, 'Drinking'),
(155, 'Laptop Repair'),
(156, 'Cash'),
(157, 'Mobil for bike'),
(163, 'PABX Connection'),
(167, 'Premio Car'),
(181, 'Triangle'),
(188, 'Orbit Bhaban'),
(194, 'Mobile Purchase'),
(195, 'For Office'),
(196, 'Office Work'),
(200, 'Deliver Purpose'),
(201, 'Delivery Purpose'),
(202, 'Office Purpose'),
(203, 'By Tanvir'),
(229, 'Reza Tower'),
(230, 'Office'),
(231, 'Office'),
(232, 'Office'),
(233, 'Office'),
(242, 'Delivery '),
(243, 'Delivery'),
(245, 'Mati Propertise'),
(288, 'Container Van'),
(289, 'Lacal van'),
(290, 'Labor'),
(292, 'Octen Bill'),
(293, 'Premio Car'),
(294, 'Work order'),
(295, 'Rubel'),
(296, 'Office'),
(311, 'Octen Bill'),
(312, 'Delivery Purpose'),
(313, 'Delivery Purpose'),
(314, 'Delivery Purpose'),
(315, 'Bank'),
(316, 'Others Monthly'),
(317, 'Online Charge(Protik Dev.)'),
(326, 'Cash Return'),
(327, 'IBBL'),
(340, 'Protik Developers'),
(341, 'Major Azad'),
(342, 'Progati Design &amp; Dev.'),
(343, 'Nur Hossain Khan'),
(344, 'Heritage Real Estate ltd.'),
(345, 'Homes 71 Ltd'),
(350, 'Debit/Credit Voucher'),
(351, 'Office '),
(352, 'Office Work'),
(353, 'Office'),
(355, 'AGM'),
(356, 'GP (for Staff)'),
(357, '6th Shipment '),
(358, ' 6th shipment '),
(359, '6th shipment '),
(360, '6th shipment '),
(361, '6th shipment '),
(362, '6th shipment '),
(363, '6th shipment '),
(364, '6th shipment'),
(365, '6th shipment '),
(366, '6th shipment'),
(367, '6th shipment '),
(368, '6th shipment '),
(371, 'Office'),
(372, 'Office'),
(375, 'Navana Pipe'),
(376, 'Navana Pipe'),
(377, 'R.Tower Office'),
(393, 'Delivery'),
(394, 'Delivery Cartun '),
(399, 'office'),
(400, 'Office '),
(401, 'Office'),
(402, 'Office '),
(421, 'Khan Brothers'),
(422, 'Unique Living ltd.'),
(423, 'Kingdom Builders'),
(424, 'Md. Riaz Uddin'),
(425, 'Aminur Rahman'),
(433, 'Delivery'),
(434, 'Delivery'),
(435, 'Navana Delivery'),
(436, 'Office'),
(444, 'Office'),
(445, 'office '),
(446, 'office'),
(468, 'ATIL'),
(470, 'Client Delivery'),
(471, 'Navana Delivery'),
(487, 'Mr. Hasan'),
(488, 'Md Jamal Uddin'),
(489, 'Misc.'),
(490, 'Office'),
(491, 'ABS'),
(492, 'For Office'),
(493, 'For Office '),
(503, 'Premio Car'),
(504, 'Mr. Shamim'),
(505, 'Delivery D/A'),
(506, 'Delivery '),
(509, 'Navana Pipe'),
(512, 'Mr. Shamim'),
(526, 'Pipe Receive(Navana)'),
(527, 'Unstocking'),
(528, 'Godwon Cleaning'),
(533, 'Office'),
(534, 'Pipe Received(HR)'),
(541, 'Office'),
(542, 'office'),
(543, 'Office'),
(544, 'Office '),
(545, 'office'),
(546, 'Protik Developmnet Ltd'),
(559, 'Phone Bill');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_propiter`
--

DROP TABLE IF EXISTS `transaction_propiter`;
CREATE TABLE IF NOT EXISTS `transaction_propiter` (
  `idtransaction` int(10) unsigned NOT NULL,
  `idpropiter` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_purchase`
--

DROP TABLE IF EXISTS `transaction_purchase`;
CREATE TABLE IF NOT EXISTS `transaction_purchase` (
  `idtransaction` int(10) unsigned NOT NULL,
  `idpurchase` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction_purchase`
--

INSERT INTO `transaction_purchase` (`idtransaction`, `idpurchase`) VALUES
(5, 2),
(281, 39),
(282, 39),
(357, 39),
(358, 39),
(359, 39),
(360, 39),
(361, 39),
(362, 39),
(363, 39),
(364, 39),
(365, 39),
(366, 39),
(367, 39),
(368, 39),
(487, 39),
(489, 39);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_staff`
--

DROP TABLE IF EXISTS `transaction_staff`;
CREATE TABLE IF NOT EXISTS `transaction_staff` (
  `idtransaction` int(10) unsigned NOT NULL,
  `idstaff` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction_staff`
--

INSERT INTO `transaction_staff` (`idtransaction`, `idstaff`) VALUES
(43, 1),
(171, 1),
(449, 1),
(510, 1),
(44, 3),
(174, 3),
(45, 4),
(175, 4),
(451, 4),
(46, 5),
(66, 5),
(140, 5),
(168, 5),
(172, 5),
(452, 5),
(47, 6),
(173, 6),
(453, 6),
(261, 7),
(302, 7),
(55, 8),
(177, 8),
(455, 8),
(456, 8),
(56, 9),
(176, 9),
(454, 9),
(57, 10),
(164, 10),
(457, 10),
(58, 11),
(165, 11),
(458, 11),
(59, 12),
(166, 12),
(459, 12),
(450, 13);

--
-- Triggers `transaction_staff`
--
DROP TRIGGER IF EXISTS `trigger___add_transaction_staff`;
DELIMITER $$
CREATE TRIGGER `trigger___add_transaction_staff` AFTER INSERT ON `transaction_staff`
 FOR EACH ROW BEGIN
	SET @ST := (SELECT transaction_status FROM `transaction` WHERE idtransaction = NEW.idtransaction LIMIT 1);
	

	IF @ST = 1  THEN
		UPDATE staff 
		SET staff_balance = staff_balance + (SELECT transaction_ammount FROM transaction WHERE idtransaction = NEW.idtransaction ) 
		WHERE idstaff = NEW.idstaff;

  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `unite`
--

DROP TABLE IF EXISTS `unite`;
CREATE TABLE IF NOT EXISTS `unite` (
`idunite` int(10) unsigned NOT NULL,
  `unite_name` varchar(64) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unite`
--

INSERT INTO `unite` (`idunite`, `unite_name`) VALUES
(30, 'Pcs'),
(31, 'Hp'),
(32, 'Rft'),
(33, 'Thread Tap'),
(34, '20mx12mmx0.075mm');

-- --------------------------------------------------------

--
-- Table structure for table `users_with_pestablishment`
--

DROP TABLE IF EXISTS `users_with_pestablishment`;
CREATE TABLE IF NOT EXISTS `users_with_pestablishment` (
  `iduser` int(10) unsigned NOT NULL,
  `idpestablishment` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `___css`
--

DROP TABLE IF EXISTS `___css`;
CREATE TABLE IF NOT EXISTS `___css` (
  `css` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `___css`
--

INSERT INTO `___css` (`css`, `name`) VALUES
(2, 'Black Steal'),
(1, 'Blue Sky'),
(5, 'Bold Blue'),
(11, 'Brown Earth'),
(8, 'Dark Shadow'),
(7, 'Green Moss'),
(3, 'Grey Steal'),
(9, 'Navy Blue'),
(6, 'Orange Harves'),
(10, 'Royal Red'),
(4, 'White Marbel');

-- --------------------------------------------------------

--
-- Table structure for table `___logfile`
--

DROP TABLE IF EXISTS `___logfile`;
CREATE TABLE IF NOT EXISTS `___logfile` (
`idlog` int(10) unsigned NOT NULL,
  `iduser` int(10) unsigned NOT NULL,
  `description` varchar(255) NOT NULL,
  `duration` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `___logfile`
--

INSERT INTO `___logfile` (`idlog`, `iduser`, `description`, `duration`) VALUES
(2, 2, 'Suspended Ashraful Alam (ashraful) account for trying to access on B4 page.', '2013-12-23 20:07:54'),
(3, 2, 'Suspended Ashraful Alam (ashraful) account for trying to access on B4 page.', '2013-12-23 20:07:56'),
(4, 2, 'Suspended Ashraful Alam (ashraful) account for trying to access on B4 page.', '2013-12-23 20:09:41'),
(5, 2, 'Suspended Ashraful Alam (ashraful) account for trying to access on B4 page.', '2013-12-23 20:10:12'),
(6, 2, 'Suspended Ashraful Alam (ashraful) account for trying to access on B4 page.', '2013-12-23 20:11:24'),
(7, 2, 'Suspended Ashraful Alam (ashraful) account for trying to access on B4 page.', '2013-12-23 20:12:52'),
(8, 2, 'Suspended Ashraful Alam (ashraful) account for trying to access on  page.', '2013-12-23 20:13:13'),
(9, 1, 'Suspended  account for trying to access on সাব ম্যেনু ১ page.', '2013-12-31 23:55:43'),
(10, 1, 'Suspended  account for trying to access on সাব ম্যেনু ২ page.', '2013-12-31 23:55:47'),
(11, 1, 'Suspended  account for trying to access on সাব ম্যেনু ৩ page.', '2013-12-31 23:55:49'),
(12, 1, 'Suspended Md. Shahidul Islam (shahid) account for trying to access on  page.', '2014-05-18 18:45:53'),
(13, 1, 'Suspended Md. Shahidul Islam (shahid) account for trying to access on  page.', '2014-05-18 18:48:00'),
(14, 2, 'Suspended Ashraful Alam (ashraful) account for trying to access on  page.', '2014-05-18 18:48:54');

-- --------------------------------------------------------

--
-- Table structure for table `___menu`
--

DROP TABLE IF EXISTS `___menu`;
CREATE TABLE IF NOT EXISTS `___menu` (
`idmenu` smallint(5) unsigned NOT NULL,
  `name_1` varchar(64) NOT NULL,
  `name_2` varchar(64) NOT NULL,
  `priority` smallint(5) unsigned NOT NULL DEFAULT '0',
  `page` varchar(10) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `___menu`
--

INSERT INTO `___menu` (`idmenu`, `name_1`, `name_2`, `priority`, `page`) VALUES
(1, 'Menu 1', 'ম্যেনু ১', 0, '0000');

-- --------------------------------------------------------

--
-- Table structure for table `___mysql_server_replay`
--

DROP TABLE IF EXISTS `___mysql_server_replay`;
CREATE TABLE IF NOT EXISTS `___mysql_server_replay` (
`mysql_code` int(10) unsigned NOT NULL,
  `mysql_text_english` varchar(255) NOT NULL,
  `mysql_text_bangla` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `___mysql_server_replay`
--

INSERT INTO `___mysql_server_replay` (`mysql_code`, `mysql_text_english`, `mysql_text_bangla`) VALUES
(1, 'Not Enogh Balance', ''),
(2, 'Not Enough Stock', ''),
(3, 'Credit Limit Exceed', '');

-- --------------------------------------------------------

--
-- Table structure for table `___report`
--

DROP TABLE IF EXISTS `___report`;
CREATE TABLE IF NOT EXISTS `___report` (
`idreport` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `code` varchar(32) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `___report`
--

INSERT INTO `___report` (`idreport`, `name`, `code`) VALUES
(1, 'Embrossed', 'embossed'),
(2, 'Round Button', 'rb'),
(3, 'Plain', ''),
(4, 'Horizental Minimum - 1', 'hor-minimalist-a'),
(5, 'Horizental Minimum - 2', 'hor-minimalist-b'),
(6, 'Vertical Minimum', 'ver-minimalist'),
(7, 'Box Type - 1', 'box-table-a'),
(8, 'Box Type - 2', 'box-table-b'),
(9, 'Horizental Zebra', 'hor-zebra'),
(10, 'Vertical  Zebra', 'ver-zebra'),
(11, 'Emphasis On One Column', 'one-column-emphasise'),
(12, 'News Paper - 1', 'newspaper-a'),
(13, 'News Paper - 2', 'newspaper-b'),
(14, 'News Paper - 3', 'newspaper-c'),
(15, 'Rounded Corner', 'rounded-corner'),
(16, 'Gradient Style', 'gradient-style'),
(17, 'Pattern Style - 1', 'pattern-style-a'),
(18, 'Pattern Style - 1', 'pattern-style-b');

-- --------------------------------------------------------

--
-- Table structure for table `___start_database`
--

DROP TABLE IF EXISTS `___start_database`;
CREATE TABLE IF NOT EXISTS `___start_database` (
  `___start_database` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `___sub_menu`
--

DROP TABLE IF EXISTS `___sub_menu`;
CREATE TABLE IF NOT EXISTS `___sub_menu` (
`idsubmenu` smallint(5) unsigned NOT NULL,
  `idmenu` smallint(5) unsigned NOT NULL,
  `page` varchar(10) NOT NULL,
  `name_1` varchar(64) CHARACTER SET utf8 NOT NULL,
  `name_2` varchar(64) CHARACTER SET utf8 NOT NULL,
  `spriority` smallint(5) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'if 1 print on menu else not print on menu'
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `___sub_menu`
--

INSERT INTO `___sub_menu` (`idsubmenu`, `idmenu`, `page`, `name_1`, `name_2`, `spriority`, `type`) VALUES
(1, 1, '0001', 'Sub Menu 1', 'সাব ম্যেনু ১', 0, 1),
(2, 1, '0002', 'Sub Menu 2', 'সাব ম্যেনু ২', 0, 1),
(16, 1, '0003', 'Sub Menu 3', 'সাব ম্যেনু ৩', 0, 1),
(17, 1, '0004', 'Sub Menu 4', 'সাব ম্যেনু ৪', 0, 1),
(18, 1, '0005', 'Sub Menu 5', 'সাব ম্যেনু ৫', 0, 1),
(19, 1, '0006', 'Sub Menu 6', 'সাব ম্যেনু ৬', 0, 1),
(24, 1, '0007', 'Sub Menu 7', 'সাব ম্যেনু ৭', 0, 1),
(25, 1, '0008', 'Sub Menu 8', 'সাব ম্যেনু ৮', 0, 1),
(26, 1, '0009', 'Sub Menu 9', 'সাব ম্যেনু ৯', 0, 1),
(27, 1, '0010', 'Sub Menu 10', 'সাব ম্যেনু ১০', 0, 1),
(38, 1, '0011', 'Sub Menu 11', 'সাব ম্যেনু ১১', 0, 1),
(39, 1, '0012', 'Sub Menu 12', 'সাব ম্যেনু ১২', 0, 1),
(40, 1, '0013', 'Sub Menu 13', 'সাব ম্যেনু ১৩', 0, 1),
(41, 1, '0014', 'Sub Menu 14', 'সাব ম্যেনু ১৪', 0, 1),
(42, 1, '0015', 'Sub Menu 15', 'সাব ম্যেনু ১৫', 0, 1),
(43, 1, '0016', 'Sub Menu 16', 'সাব ম্যেনু ১৬', 0, 1),
(44, 1, '0017', 'Sub Menu 17', 'সাব ম্যেনু ১৭', 0, 1),
(45, 1, '0018', 'Sub Menu 18', 'সাব ম্যেনু ১৮', 0, 1),
(46, 1, '0019', 'Sub Menu 19', 'সাব ম্যেনু ১৯', 0, 1),
(47, 1, '0020', 'Sub Menu 20', 'সাব ম্যেনু ২০', 0, 1),
(48, 1, '0021', 'Sub Menu 21', 'সাব ম্যেনু ২১', 0, 1),
(49, 1, '0022', 'Sub Menu 22', 'সাব ম্যেনু ২২', 0, 1),
(50, 1, '0023', 'Sub Menu 23', 'সাব ম্যেনু ২৩', 0, 1),
(51, 1, '0024', 'Sub Menu 24', 'সাব ম্যেনু ২৪', 0, 1),
(52, 1, '0025', 'Sub Menu 25', 'সাব ম্যেনু ২৫', 0, 1),
(53, 1, '0026', 'Sub Menu 26', 'সাব ম্যেনু ২৬', 0, 1),
(54, 1, '0027', 'Sub Menu 27', 'সাব ম্যেনু ২৭', 0, 1),
(55, 1, '0028', 'Sub Menu 28', 'সাব ম্যেনু ২৮', 0, 1),
(56, 1, '0029', 'Sub Menu 29', 'সাব ম্যেনু ২৯', 0, 1),
(57, 1, '0030', 'Sub Menu 30', 'সাব ম্যেনু ৩০', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `___users`
--

DROP TABLE IF EXISTS `___users`;
CREATE TABLE IF NOT EXISTS `___users` (
`iduser` int(10) unsigned NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `login` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `level` tinyint(3) unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `css` tinyint(3) unsigned NOT NULL DEFAULT '8',
  `activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idreport` smallint(5) unsigned NOT NULL DEFAULT '2'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `___users`
--

INSERT INTO `___users` (`iduser`, `name`, `login`, `password`, `level`, `status`, `css`, `activity`, `idreport`) VALUES
(0, 'Ashraful Alam', 'ashraful', '3b712de48137572f3849aabd5666a4e3', 1, 1, 5, '2013-12-22 23:22:09', 2),
(1, 'Md. Shahidul Islam', 'shahid', 'd93591bdf7860e1e4ee2fca799911215', 1, 0, 5, '0000-00-00 00:00:00', 2),
(2, 'sa', 'sa', '81dc9bdb52d04dc20036dbd8313ed055', 1, 1, 3, '2014-09-15 19:40:42', 2),
(3, 'hatem ti', 'hatem', '202cb962ac59075b964b07152d234b70', 3, 1, 3, '2014-09-18 02:33:19', 2),
(4, 'a', 'a', 'c81e728d9d4c2f636f067f89cc14862c', 2, 1, 3, '2014-12-04 21:16:00', 2),
(5, 'Md. Jamal Uddin', 'jamal', 'd93591bdf7860e1e4ee2fca799911215', 5, 1, 3, '2014-12-22 08:38:31', 2),
(6, 'Md. Ali Haider Mitul ', 'haider', '88b6d742653b14c24986ba37d1d446aa', 6, 1, 3, '2014-12-22 08:38:48', 2),
(7, 'Ashraf Mohammad Hossain', 'rajib', '1d17a8cfce6d290425e37563ecffef5c', 2, 1, 3, '2014-12-22 08:39:37', 2),
(8, 'Md. Tanvir Ahmed Khan', 'tanvir', '91a4bbbd862583f98dca1a351a2cd3c7', 3, 1, 3, '2014-12-22 08:39:52', 2),
(9, 'Md. Tanvir Ahmed Khan', 'tanvir', '169582a799e5b6c46fdfd432379f60d8', 4, 1, 3, '2014-12-22 08:40:18', 2),
(10, 'Md. Kamrul Islam', 'kamrul', 'd4a973e303ec37692cc8923e3148eef7', 0, 1, 3, '2015-02-24 06:59:36', 2),
(11, 'Syed Murad Ahamed', 'murad', '9a1756fd0c741126d7bbd4b692ccbd91', 0, 1, 3, '2015-02-24 07:00:19', 2);

-- --------------------------------------------------------

--
-- Table structure for table `___user_menu`
--

DROP TABLE IF EXISTS `___user_menu`;
CREATE TABLE IF NOT EXISTS `___user_menu` (
  `iduser` int(2) unsigned NOT NULL,
  `idsubmenu` smallint(5) unsigned NOT NULL,
  `status` smallint(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `___user_menu`
--

INSERT INTO `___user_menu` (`iduser`, `idsubmenu`, `status`) VALUES
(0, 1, 0),
(0, 2, 0),
(0, 16, 0),
(0, 17, 0),
(0, 18, 0),
(0, 19, 0),
(0, 24, 0),
(0, 25, 0),
(0, 26, 0),
(0, 27, 0),
(0, 38, 0),
(0, 39, 0),
(0, 40, 0),
(0, 41, 0),
(0, 42, 0),
(0, 43, 0),
(0, 44, 0),
(0, 45, 0),
(0, 46, 0),
(0, 47, 0),
(0, 48, 0),
(0, 49, 0),
(0, 50, 0),
(0, 51, 0),
(0, 52, 0),
(0, 53, 0),
(0, 54, 0),
(0, 55, 0),
(0, 56, 0),
(0, 57, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
 ADD PRIMARY KEY (`idbank`);

--
-- Indexes for table `bitstring`
--
ALTER TABLE `bitstring`
 ADD PRIMARY KEY (`letter`);

--
-- Indexes for table `cheque_leaf`
--
ALTER TABLE `cheque_leaf`
 ADD PRIMARY KEY (`idcheque_leaf`), ADD UNIQUE KEY `Index_3` (`idbank`,`cheque_leaf_pre`,`cheque_leaf_sl`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
 ADD PRIMARY KEY (`idcompany`), ADD KEY `Index_2` (`company_type`,`company_name`);

--
-- Indexes for table `company_details`
--
ALTER TABLE `company_details`
 ADD PRIMARY KEY (`idcompany`);

--
-- Indexes for table `division`
--
ALTER TABLE `division`
 ADD PRIMARY KEY (`iddivision`), ADD KEY `Index_2` (`iddivision`);

--
-- Indexes for table `fund_transfer`
--
ALTER TABLE `fund_transfer`
 ADD PRIMARY KEY (`idfund_transfer`) USING BTREE, ADD KEY `FK_fund_transfer_transaction` (`idtransaction_deposite`), ADD KEY `FK_fund_transfer_transaction_2` (`idtransaction_withdraw`);

--
-- Indexes for table `incenvice_reciver`
--
ALTER TABLE `incenvice_reciver`
 ADD PRIMARY KEY (`idincentive_reciver`), ADD UNIQUE KEY `Index_2` (`idcompany`,`incentive_reciver_name`);

--
-- Indexes for table `lender`
--
ALTER TABLE `lender`
 ADD PRIMARY KEY (`idlender`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
 ADD PRIMARY KEY (`idloan`), ADD KEY `FK_loan_1` (`idlender`);

--
-- Indexes for table `mestablishment`
--
ALTER TABLE `mestablishment`
 ADD PRIMARY KEY (`idmestablishment`) USING BTREE, ADD UNIQUE KEY `Index_2` (`mestablishment_name`,`mestablishment_type`);

--
-- Indexes for table `mestablishment_bank`
--
ALTER TABLE `mestablishment_bank`
 ADD PRIMARY KEY (`idmestablishment`);

--
-- Indexes for table `mestablishment_details`
--
ALTER TABLE `mestablishment_details`
 ADD PRIMARY KEY (`idmestablishment`);

--
-- Indexes for table `pestablishment`
--
ALTER TABLE `pestablishment`
 ADD PRIMARY KEY (`idpestablishment`) USING BTREE, ADD UNIQUE KEY `Index_2` (`pestablishment_name`) USING BTREE;

--
-- Indexes for table `pestablishment_product`
--
ALTER TABLE `pestablishment_product`
 ADD UNIQUE KEY `Index_1` (`idpestablishment`,`idproduct`), ADD KEY `FK_pestablishment_product_2` (`idproduct`);

--
-- Indexes for table `pestablishment_product_demand`
--
ALTER TABLE `pestablishment_product_demand`
 ADD UNIQUE KEY `Index_1` (`idpestablishment`,`idproduct`);

--
-- Indexes for table `pestablishment_type`
--
ALTER TABLE `pestablishment_type`
 ADD UNIQUE KEY `Index_1` (`idpestablishment`,`pestablishment_type`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
 ADD PRIMARY KEY (`idpost`), ADD UNIQUE KEY `Index_2` (`idpost`) USING BTREE, ADD KEY `FK_post_1` (`iddivision`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
 ADD PRIMARY KEY (`idproduct`), ADD KEY `FK_product_1` (`idproduct_catagory`) USING BTREE, ADD KEY `Index_3` (`product_status`,`idproduct`), ADD KEY `FK_product_2` (`idunite`);

--
-- Indexes for table `product_catagory`
--
ALTER TABLE `product_catagory`
 ADD PRIMARY KEY (`idproduct_catagory`), ADD KEY `FK_product_catagory_1` (`idproduct_catagory_parent`);

--
-- Indexes for table `propiter`
--
ALTER TABLE `propiter`
 ADD PRIMARY KEY (`idpropiter`), ADD KEY `FK_propiter_1` (`idpropiter`,`propiter_name`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
 ADD PRIMARY KEY (`idpurchase`) USING BTREE, ADD KEY `Index_2` (`purchase_date`,`idcompany`) USING BTREE, ADD KEY `Index_3` (`purchase_date`) USING BTREE, ADD KEY `FK_purchase_1` (`idcompany`);

--
-- Indexes for table `purchase_code`
--
ALTER TABLE `purchase_code`
 ADD PRIMARY KEY (`idpurchase`);

--
-- Indexes for table `purchase_details`
--
ALTER TABLE `purchase_details`
 ADD PRIMARY KEY (`idpurchase`) USING BTREE, ADD KEY `Index_2` (`idstaff`), ADD KEY `FK_purchase_details_2` (`iduser`), ADD KEY `FK_purchase_details_4` (`idproduct_catagory`), ADD KEY `FK_purchase_details_5` (`idpestablishment`);

--
-- Indexes for table `purchase_stock_product_input`
--
ALTER TABLE `purchase_stock_product_input`
 ADD UNIQUE KEY `Index_1` (`idpurchase`,`idstock_product_input`), ADD KEY `FK_purchase_stock_product_input_2` (`idstock_product_input`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
 ADD PRIMARY KEY (`idsales`), ADD KEY `Index_3` (`sales_date`), ADD KEY `FK_sales_1` (`idcompany`), ADD KEY `FK_sales_2` (`idsales_type`), ADD KEY `Index_6` (`sales_status`,`sales_date`,`idsales_type`) USING BTREE, ADD KEY `Index_7` (`sales_status`,`idcompany`,`sales_date`,`idsales_type`), ADD KEY `Index_2` (`sales_status`,`idcompany`,`sales_date`) USING BTREE;

--
-- Indexes for table `sales_details`
--
ALTER TABLE `sales_details`
 ADD PRIMARY KEY (`idsales`), ADD KEY `Index_4` (`idstaff`), ADD KEY `FK_sales_details_2` (`iduser`), ADD KEY `FK_sales_details_4` (`idproduct_catagory`) USING BTREE, ADD KEY `Index_6` (`idpestablishment`), ADD KEY `Index_7` (`idsales`,`idpestablishment`);

--
-- Indexes for table `sales_stock_product_output`
--
ALTER TABLE `sales_stock_product_output`
 ADD UNIQUE KEY `Index_1` (`idsales`,`idstock_product_output`), ADD KEY `FK_sales_stock_product_output_2` (`idstock_product_output`);

--
-- Indexes for table `sales_type`
--
ALTER TABLE `sales_type`
 ADD PRIMARY KEY (`idsales_type`), ADD UNIQUE KEY `Index_2` (`sales_type_details_en`) USING BTREE;

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
 ADD PRIMARY KEY (`idstaff`), ADD UNIQUE KEY `Index_3` (`idstaff`,`staff_name`), ADD KEY `FK_staff_1` (`idpost`);

--
-- Indexes for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
 ADD PRIMARY KEY (`idstaff_attendance`) USING BTREE, ADD UNIQUE KEY `Index_3` (`idstaff`,`date_time`,`type`), ADD KEY `FK_staff_attendence_1` (`idstaff`);

--
-- Indexes for table `staff_details`
--
ALTER TABLE `staff_details`
 ADD PRIMARY KEY (`idstaff`);

--
-- Indexes for table `staff_grant`
--
ALTER TABLE `staff_grant`
 ADD PRIMARY KEY (`idstaff_grant`), ADD KEY `FK_staff_grant_1` (`idstaff`), ADD KEY `FK_staff_grant_2` (`idtransaction_head`);

--
-- Indexes for table `staff_grant_details`
--
ALTER TABLE `staff_grant_details`
 ADD PRIMARY KEY (`idstaff_grant`), ADD KEY `FK_staff_grant_details_1` (`iduser`), ADD KEY `FK_staff_grant_details_2` (`idstaff`);

--
-- Indexes for table `stock_adjustment`
--
ALTER TABLE `stock_adjustment`
 ADD PRIMARY KEY (`idstock_adjustment`), ADD KEY `FK_stock_adjustment_1` (`iduser`), ADD KEY `FK_stock_adjustment_2` (`idstaff`);

--
-- Indexes for table `stock_adjustment_stock_product_input`
--
ALTER TABLE `stock_adjustment_stock_product_input`
 ADD KEY `FK_stock_adjustment_stock_product_input_1` (`idstock_product_input`), ADD KEY `FK_stock_adjustment_stock_product_input_2` (`idstock_adjustment`);

--
-- Indexes for table `stock_adjustment_stock_product_output`
--
ALTER TABLE `stock_adjustment_stock_product_output`
 ADD KEY `FK_stock_adjustment_stock_product_output_1` (`idstock_adjustment`), ADD KEY `FK_stock_adjustment_stock_product_output_2` (`idstock_product_output`);

--
-- Indexes for table `stock_product_input`
--
ALTER TABLE `stock_product_input`
 ADD PRIMARY KEY (`idstock_product_input`), ADD KEY `Index_2` (`idpestablishment`,`idproduct`);

--
-- Indexes for table `stock_product_output`
--
ALTER TABLE `stock_product_output`
 ADD PRIMARY KEY (`idstock_product_output`) USING BTREE, ADD KEY `FK_stock_product_output_1` (`idpestablishment`,`idproduct`) USING BTREE;

--
-- Indexes for table `stock_transfer`
--
ALTER TABLE `stock_transfer`
 ADD PRIMARY KEY (`idstock_transfer`), ADD KEY `FK_stock_transfer_1` (`iduser`);

--
-- Indexes for table `stock_transfer_stock_product_input_stock_product_output`
--
ALTER TABLE `stock_transfer_stock_product_input_stock_product_output`
 ADD KEY `FK_stock_transfer_stock_product_input_stock_product_output_1` (`idstock_transfer`), ADD KEY `FK_stock_transfer_stock_product_input_stock_product_output_2` (`idstock_product_input`), ADD KEY `FK_stock_transfer_stock_product_input_stock_product_output_3` (`idstock_product_output`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
 ADD PRIMARY KEY (`idtransaction`), ADD KEY `FK_transaction_1` (`idtransaction_head`), ADD KEY `FK_transaction_2` (`idmestablishment`), ADD KEY `FK_transaction_3` (`iduser`), ADD KEY `FK_transaction_4` (`idstaff`), ADD KEY `Index_6` (`transaction_status`,`idmestablishment`,`transaction_date`);

--
-- Indexes for table `transaction_cheque_leaf`
--
ALTER TABLE `transaction_cheque_leaf`
 ADD KEY `FK_transaction_cheque_leaf_1` (`idtransaction`), ADD KEY `FK_transaction_cheque_leaf_2` (`idcheque_leaf`);

--
-- Indexes for table `transaction_company`
--
ALTER TABLE `transaction_company`
 ADD UNIQUE KEY `Index_3` (`idtransaction`,`idcompany`), ADD KEY `FK_transaction_company_1` (`idtransaction`), ADD KEY `FK_transaction_company_2` (`idcompany`);

--
-- Indexes for table `transaction_details`
--
ALTER TABLE `transaction_details`
 ADD PRIMARY KEY (`idtransaction`);

--
-- Indexes for table `transaction_head`
--
ALTER TABLE `transaction_head`
 ADD PRIMARY KEY (`idtransaction_head`), ADD KEY `FK_transaction_head_1` (`idtransaction_head_type`);

--
-- Indexes for table `transaction_head_type`
--
ALTER TABLE `transaction_head_type`
 ADD PRIMARY KEY (`idtransaction_head_type`) USING BTREE;

--
-- Indexes for table `transaction_incentive_reciver`
--
ALTER TABLE `transaction_incentive_reciver`
 ADD PRIMARY KEY (`idtransaction`,`idincentive_reciver`), ADD KEY `FK_transaction_incentice_reciver_2` (`idincentive_reciver`);

--
-- Indexes for table `transaction_loan`
--
ALTER TABLE `transaction_loan`
 ADD KEY `FK_transaction_loan_1` (`idtransaction`), ADD KEY `FK_transaction_loan_2` (`idloan`);

--
-- Indexes for table `transaction_other`
--
ALTER TABLE `transaction_other`
 ADD PRIMARY KEY (`idtransaction`);

--
-- Indexes for table `transaction_propiter`
--
ALTER TABLE `transaction_propiter`
 ADD UNIQUE KEY `Index_3` (`idtransaction`,`idpropiter`), ADD KEY `FK_transaction_propiter_2` (`idpropiter`);

--
-- Indexes for table `transaction_purchase`
--
ALTER TABLE `transaction_purchase`
 ADD UNIQUE KEY `Index_1` (`idtransaction`,`idpurchase`), ADD KEY `FK_transaction_purchase_2` (`idpurchase`);

--
-- Indexes for table `transaction_staff`
--
ALTER TABLE `transaction_staff`
 ADD UNIQUE KEY `Index_3` (`idtransaction`,`idstaff`), ADD KEY `FK_transaction_staff_2` (`idstaff`);

--
-- Indexes for table `unite`
--
ALTER TABLE `unite`
 ADD PRIMARY KEY (`idunite`);

--
-- Indexes for table `users_with_pestablishment`
--
ALTER TABLE `users_with_pestablishment`
 ADD PRIMARY KEY (`iduser`,`idpestablishment`), ADD KEY `FK_users_with_pestablishment_2` (`idpestablishment`);

--
-- Indexes for table `___css`
--
ALTER TABLE `___css`
 ADD PRIMARY KEY (`css`), ADD UNIQUE KEY `name` (`name`), ADD KEY `css` (`css`);

--
-- Indexes for table `___logfile`
--
ALTER TABLE `___logfile`
 ADD PRIMARY KEY (`idlog`);

--
-- Indexes for table `___menu`
--
ALTER TABLE `___menu`
 ADD PRIMARY KEY (`idmenu`);

--
-- Indexes for table `___mysql_server_replay`
--
ALTER TABLE `___mysql_server_replay`
 ADD PRIMARY KEY (`mysql_code`);

--
-- Indexes for table `___report`
--
ALTER TABLE `___report`
 ADD PRIMARY KEY (`idreport`);

--
-- Indexes for table `___start_database`
--
ALTER TABLE `___start_database`
 ADD PRIMARY KEY (`___start_database`);

--
-- Indexes for table `___sub_menu`
--
ALTER TABLE `___sub_menu`
 ADD PRIMARY KEY (`idsubmenu`), ADD UNIQUE KEY `Index_4` (`page`) USING BTREE, ADD KEY `FK_sb_menu_1` (`idmenu`), ADD KEY `Index_3` (`page`);

--
-- Indexes for table `___users`
--
ALTER TABLE `___users`
 ADD PRIMARY KEY (`iduser`), ADD UNIQUE KEY `Index_2` (`level`,`login`) USING BTREE;

--
-- Indexes for table `___user_menu`
--
ALTER TABLE `___user_menu`
 ADD UNIQUE KEY `Index_3` (`iduser`,`idsubmenu`), ADD KEY `FK_user_menu_2` (`idsubmenu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
MODIFY `idbank` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `cheque_leaf`
--
ALTER TABLE `cheque_leaf`
MODIFY `idcheque_leaf` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=118;
--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
MODIFY `idcompany` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=240;
--
-- AUTO_INCREMENT for table `division`
--
ALTER TABLE `division`
MODIFY `iddivision` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `fund_transfer`
--
ALTER TABLE `fund_transfer`
MODIFY `idfund_transfer` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `incenvice_reciver`
--
ALTER TABLE `incenvice_reciver`
MODIFY `idincentive_reciver` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lender`
--
ALTER TABLE `lender`
MODIFY `idlender` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
MODIFY `idloan` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mestablishment`
--
ALTER TABLE `mestablishment`
MODIFY `idmestablishment` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `mestablishment_bank`
--
ALTER TABLE `mestablishment_bank`
MODIFY `idmestablishment` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `mestablishment_details`
--
ALTER TABLE `mestablishment_details`
MODIFY `idmestablishment` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `pestablishment`
--
ALTER TABLE `pestablishment`
MODIFY `idpestablishment` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
MODIFY `idpost` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
MODIFY `idproduct` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=285;
--
-- AUTO_INCREMENT for table `product_catagory`
--
ALTER TABLE `product_catagory`
MODIFY `idproduct_catagory` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=113;
--
-- AUTO_INCREMENT for table `propiter`
--
ALTER TABLE `propiter`
MODIFY `idpropiter` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
MODIFY `idpurchase` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT for table `purchase_code`
--
ALTER TABLE `purchase_code`
MODIFY `idpurchase` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT for table `purchase_details`
--
ALTER TABLE `purchase_details`
MODIFY `idpurchase` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
MODIFY `idsales` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=245;
--
-- AUTO_INCREMENT for table `sales_details`
--
ALTER TABLE `sales_details`
MODIFY `idsales` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=245;
--
-- AUTO_INCREMENT for table `sales_type`
--
ALTER TABLE `sales_type`
MODIFY `idsales_type` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
MODIFY `idstaff` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
MODIFY `idstaff_attendance` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_details`
--
ALTER TABLE `staff_details`
MODIFY `idstaff` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `staff_grant`
--
ALTER TABLE `staff_grant`
MODIFY `idstaff_grant` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_grant_details`
--
ALTER TABLE `staff_grant_details`
MODIFY `idstaff_grant` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stock_adjustment`
--
ALTER TABLE `stock_adjustment`
MODIFY `idstock_adjustment` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `stock_product_input`
--
ALTER TABLE `stock_product_input`
MODIFY `idstock_product_input` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=793;
--
-- AUTO_INCREMENT for table `stock_product_output`
--
ALTER TABLE `stock_product_output`
MODIFY `idstock_product_output` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '1 sales, 2 purchase, 3 adjust, 4 transfer, 5 production, 6 gift, 7 sales return, 8 purchase return',AUTO_INCREMENT=1945;
--
-- AUTO_INCREMENT for table `stock_transfer`
--
ALTER TABLE `stock_transfer`
MODIFY `idstock_transfer` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transaction_details`
--
ALTER TABLE `transaction_details`
MODIFY `idtransaction` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=560;
--
-- AUTO_INCREMENT for table `transaction_head`
--
ALTER TABLE `transaction_head`
MODIFY `idtransaction_head` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `transaction_head_type`
--
ALTER TABLE `transaction_head_type`
MODIFY `idtransaction_head_type` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `transaction_other`
--
ALTER TABLE `transaction_other`
MODIFY `idtransaction` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=560;
--
-- AUTO_INCREMENT for table `unite`
--
ALTER TABLE `unite`
MODIFY `idunite` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `___logfile`
--
ALTER TABLE `___logfile`
MODIFY `idlog` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `___menu`
--
ALTER TABLE `___menu`
MODIFY `idmenu` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `___mysql_server_replay`
--
ALTER TABLE `___mysql_server_replay`
MODIFY `mysql_code` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `___report`
--
ALTER TABLE `___report`
MODIFY `idreport` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `___sub_menu`
--
ALTER TABLE `___sub_menu`
MODIFY `idsubmenu` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `___users`
--
ALTER TABLE `___users`
MODIFY `iduser` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cheque_leaf`
--
ALTER TABLE `cheque_leaf`
ADD CONSTRAINT `FK_cheque_leaf_1` FOREIGN KEY (`idbank`) REFERENCES `bank` (`idbank`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `company_details`
--
ALTER TABLE `company_details`
ADD CONSTRAINT `FK_company_details_1` FOREIGN KEY (`idcompany`) REFERENCES `company` (`idcompany`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fund_transfer`
--
ALTER TABLE `fund_transfer`
ADD CONSTRAINT `FK_fund_transfer_transaction` FOREIGN KEY (`idtransaction_deposite`) REFERENCES `transaction` (`idtransaction`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_fund_transfer_transaction_2` FOREIGN KEY (`idtransaction_withdraw`) REFERENCES `transaction` (`idtransaction`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `incenvice_reciver`
--
ALTER TABLE `incenvice_reciver`
ADD CONSTRAINT `FK_incenvice_reciver_1` FOREIGN KEY (`idcompany`) REFERENCES `company` (`idcompany`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `loan`
--
ALTER TABLE `loan`
ADD CONSTRAINT `FK_loan_1` FOREIGN KEY (`idlender`) REFERENCES `lender` (`idlender`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mestablishment_bank`
--
ALTER TABLE `mestablishment_bank`
ADD CONSTRAINT `FK_mestablishment_bank_1` FOREIGN KEY (`idmestablishment`) REFERENCES `mestablishment` (`idmestablishment`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mestablishment_details`
--
ALTER TABLE `mestablishment_details`
ADD CONSTRAINT `FK_mestablishment_details_1` FOREIGN KEY (`idmestablishment`) REFERENCES `mestablishment` (`idmestablishment`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pestablishment_product`
--
ALTER TABLE `pestablishment_product`
ADD CONSTRAINT `FK_pestablishment_product_1` FOREIGN KEY (`idpestablishment`) REFERENCES `pestablishment` (`idpestablishment`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_pestablishment_product_2` FOREIGN KEY (`idproduct`) REFERENCES `product` (`idproduct`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pestablishment_product_demand`
--
ALTER TABLE `pestablishment_product_demand`
ADD CONSTRAINT `FK_pestablishment_product_demand_1` FOREIGN KEY (`idpestablishment`, `idproduct`) REFERENCES `pestablishment_product` (`idpestablishment`, `idproduct`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pestablishment_type`
--
ALTER TABLE `pestablishment_type`
ADD CONSTRAINT `FK_pestablishment_type_1` FOREIGN KEY (`idpestablishment`) REFERENCES `pestablishment` (`idpestablishment`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
ADD CONSTRAINT `FK_post_1` FOREIGN KEY (`iddivision`) REFERENCES `division` (`iddivision`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
ADD CONSTRAINT `FK_product_1` FOREIGN KEY (`idproduct_catagory`) REFERENCES `product_catagory` (`idproduct_catagory`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_product_2` FOREIGN KEY (`idunite`) REFERENCES `unite` (`idunite`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `propiter`
--
ALTER TABLE `propiter`
ADD CONSTRAINT `FK_propiter_1` FOREIGN KEY (`idpropiter`, `propiter_name`) REFERENCES `staff` (`idstaff`, `staff_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
ADD CONSTRAINT `FK_purchase_1` FOREIGN KEY (`idcompany`) REFERENCES `company` (`idcompany`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase_code`
--
ALTER TABLE `purchase_code`
ADD CONSTRAINT `FK_purchase_code_1` FOREIGN KEY (`idpurchase`) REFERENCES `purchase` (`idpurchase`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase_details`
--
ALTER TABLE `purchase_details`
ADD CONSTRAINT `FK_purchase_details_1` FOREIGN KEY (`idpurchase`) REFERENCES `purchase` (`idpurchase`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_purchase_details_2` FOREIGN KEY (`iduser`) REFERENCES `___users` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_purchase_details_3` FOREIGN KEY (`idstaff`) REFERENCES `staff` (`idstaff`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_purchase_details_4` FOREIGN KEY (`idproduct_catagory`) REFERENCES `product_catagory` (`idproduct_catagory`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_purchase_details_5` FOREIGN KEY (`idpestablishment`) REFERENCES `pestablishment` (`idpestablishment`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase_stock_product_input`
--
ALTER TABLE `purchase_stock_product_input`
ADD CONSTRAINT `FK_purchase_stock_product_input_1` FOREIGN KEY (`idpurchase`) REFERENCES `purchase` (`idpurchase`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_purchase_stock_product_input_2` FOREIGN KEY (`idstock_product_input`) REFERENCES `stock_product_input` (`idstock_product_input`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
ADD CONSTRAINT `FK_sales_1` FOREIGN KEY (`idcompany`) REFERENCES `company` (`idcompany`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_sales_2` FOREIGN KEY (`idsales_type`) REFERENCES `sales_type` (`idsales_type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_details`
--
ALTER TABLE `sales_details`
ADD CONSTRAINT `FK_sales_details_2` FOREIGN KEY (`iduser`) REFERENCES `___users` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_sales_details_3` FOREIGN KEY (`idstaff`) REFERENCES `staff` (`idstaff`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_sales_details_4` FOREIGN KEY (`idproduct_catagory`) REFERENCES `product_catagory` (`idproduct_catagory`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_sales_details_5` FOREIGN KEY (`idpestablishment`) REFERENCES `pestablishment` (`idpestablishment`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_sales_details_6` FOREIGN KEY (`idsales`) REFERENCES `sales` (`idsales`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_stock_product_output`
--
ALTER TABLE `sales_stock_product_output`
ADD CONSTRAINT `FK_sales_stock_product_output_1` FOREIGN KEY (`idsales`) REFERENCES `sales` (`idsales`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_sales_stock_product_output_2` FOREIGN KEY (`idstock_product_output`) REFERENCES `stock_product_output` (`idstock_product_output`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
ADD CONSTRAINT `FK_staff_1` FOREIGN KEY (`idpost`) REFERENCES `post` (`idpost`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
ADD CONSTRAINT `FK_staff_attendance_1` FOREIGN KEY (`idstaff`) REFERENCES `staff` (`idstaff`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff_details`
--
ALTER TABLE `staff_details`
ADD CONSTRAINT `FK_staff_details_1` FOREIGN KEY (`idstaff`) REFERENCES `staff` (`idstaff`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff_grant`
--
ALTER TABLE `staff_grant`
ADD CONSTRAINT `FK_staff_grant_1` FOREIGN KEY (`idstaff`) REFERENCES `staff` (`idstaff`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_staff_grant_2` FOREIGN KEY (`idtransaction_head`) REFERENCES `transaction_head` (`idtransaction_head`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff_grant_details`
--
ALTER TABLE `staff_grant_details`
ADD CONSTRAINT `FK_staff_grant_details_1` FOREIGN KEY (`iduser`) REFERENCES `___users` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_staff_grant_details_2` FOREIGN KEY (`idstaff`) REFERENCES `staff` (`idstaff`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_staff_grant_details_3` FOREIGN KEY (`idstaff_grant`) REFERENCES `staff_grant` (`idstaff_grant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stock_adjustment`
--
ALTER TABLE `stock_adjustment`
ADD CONSTRAINT `FK_stock_adjustment_1` FOREIGN KEY (`iduser`) REFERENCES `___users` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_stock_adjustment_2` FOREIGN KEY (`idstaff`) REFERENCES `staff` (`idstaff`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stock_adjustment_stock_product_input`
--
ALTER TABLE `stock_adjustment_stock_product_input`
ADD CONSTRAINT `FK_stock_adjustment_stock_product_input_1` FOREIGN KEY (`idstock_product_input`) REFERENCES `stock_product_input` (`idstock_product_input`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_stock_adjustment_stock_product_input_2` FOREIGN KEY (`idstock_adjustment`) REFERENCES `stock_adjustment` (`idstock_adjustment`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stock_adjustment_stock_product_output`
--
ALTER TABLE `stock_adjustment_stock_product_output`
ADD CONSTRAINT `FK_stock_adjustment_stock_product_output_1` FOREIGN KEY (`idstock_adjustment`) REFERENCES `stock_adjustment` (`idstock_adjustment`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_stock_adjustment_stock_product_output_2` FOREIGN KEY (`idstock_product_output`) REFERENCES `stock_product_output` (`idstock_product_output`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stock_product_input`
--
ALTER TABLE `stock_product_input`
ADD CONSTRAINT `FK_stock_product_input_1` FOREIGN KEY (`idpestablishment`, `idproduct`) REFERENCES `pestablishment_product` (`idpestablishment`, `idproduct`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stock_product_output`
--
ALTER TABLE `stock_product_output`
ADD CONSTRAINT `FK_stock_product_output_1` FOREIGN KEY (`idpestablishment`, `idproduct`) REFERENCES `pestablishment_product` (`idpestablishment`, `idproduct`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stock_transfer`
--
ALTER TABLE `stock_transfer`
ADD CONSTRAINT `FK_stock_transfer_1` FOREIGN KEY (`iduser`) REFERENCES `___users` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stock_transfer_stock_product_input_stock_product_output`
--
ALTER TABLE `stock_transfer_stock_product_input_stock_product_output`
ADD CONSTRAINT `FK_stock_transfer_stock_product_input_stock_product_output_1` FOREIGN KEY (`idstock_transfer`) REFERENCES `stock_transfer` (`idstock_transfer`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_stock_transfer_stock_product_input_stock_product_output_2` FOREIGN KEY (`idstock_product_input`) REFERENCES `stock_product_input` (`idstock_product_input`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_stock_transfer_stock_product_input_stock_product_output_3` FOREIGN KEY (`idstock_product_output`) REFERENCES `stock_product_output` (`idstock_product_output`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
ADD CONSTRAINT `FK_transaction_1` FOREIGN KEY (`idtransaction_head`) REFERENCES `transaction_head` (`idtransaction_head`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_transaction_2` FOREIGN KEY (`idmestablishment`) REFERENCES `mestablishment` (`idmestablishment`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_transaction_3` FOREIGN KEY (`iduser`) REFERENCES `___users` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_transaction_4` FOREIGN KEY (`idstaff`) REFERENCES `staff` (`idstaff`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction_cheque_leaf`
--
ALTER TABLE `transaction_cheque_leaf`
ADD CONSTRAINT `FK_transaction_cheque_leaf_1` FOREIGN KEY (`idtransaction`) REFERENCES `transaction` (`idtransaction`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_transaction_cheque_leaf_2` FOREIGN KEY (`idcheque_leaf`) REFERENCES `cheque_leaf` (`idcheque_leaf`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction_company`
--
ALTER TABLE `transaction_company`
ADD CONSTRAINT `FK_transaction_company_1` FOREIGN KEY (`idtransaction`) REFERENCES `transaction` (`idtransaction`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_transaction_company_2` FOREIGN KEY (`idcompany`) REFERENCES `company` (`idcompany`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction_details`
--
ALTER TABLE `transaction_details`
ADD CONSTRAINT `FK_transaction_details_1` FOREIGN KEY (`idtransaction`) REFERENCES `transaction` (`idtransaction`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction_head`
--
ALTER TABLE `transaction_head`
ADD CONSTRAINT `FK_transaction_head_1` FOREIGN KEY (`idtransaction_head_type`) REFERENCES `transaction_head_type` (`idtransaction_head_type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction_incentive_reciver`
--
ALTER TABLE `transaction_incentive_reciver`
ADD CONSTRAINT `FK_transaction_incentice_reciver_1` FOREIGN KEY (`idtransaction`) REFERENCES `transaction` (`idtransaction`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_transaction_incentice_reciver_2` FOREIGN KEY (`idincentive_reciver`) REFERENCES `incenvice_reciver` (`idincentive_reciver`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction_loan`
--
ALTER TABLE `transaction_loan`
ADD CONSTRAINT `FK_transaction_loan_1` FOREIGN KEY (`idtransaction`) REFERENCES `transaction` (`idtransaction`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_transaction_loan_2` FOREIGN KEY (`idloan`) REFERENCES `loan` (`idloan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction_other`
--
ALTER TABLE `transaction_other`
ADD CONSTRAINT `FK_transaction_other_1` FOREIGN KEY (`idtransaction`) REFERENCES `transaction` (`idtransaction`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction_propiter`
--
ALTER TABLE `transaction_propiter`
ADD CONSTRAINT `FK_transaction_propiter_1` FOREIGN KEY (`idtransaction`) REFERENCES `transaction` (`idtransaction`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_transaction_propiter_2` FOREIGN KEY (`idpropiter`) REFERENCES `propiter` (`idpropiter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction_purchase`
--
ALTER TABLE `transaction_purchase`
ADD CONSTRAINT `FK_transaction_purchase_1` FOREIGN KEY (`idtransaction`) REFERENCES `transaction` (`idtransaction`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_transaction_purchase_2` FOREIGN KEY (`idpurchase`) REFERENCES `purchase` (`idpurchase`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction_staff`
--
ALTER TABLE `transaction_staff`
ADD CONSTRAINT `FK_transaction_staff_1` FOREIGN KEY (`idtransaction`) REFERENCES `transaction` (`idtransaction`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_transaction_staff_2` FOREIGN KEY (`idstaff`) REFERENCES `staff` (`idstaff`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_with_pestablishment`
--
ALTER TABLE `users_with_pestablishment`
ADD CONSTRAINT `FK_users_with_pestablishment_1` FOREIGN KEY (`iduser`) REFERENCES `___users` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_users_with_pestablishment_2` FOREIGN KEY (`idpestablishment`) REFERENCES `pestablishment` (`idpestablishment`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `___sub_menu`
--
ALTER TABLE `___sub_menu`
ADD CONSTRAINT `___sub_menu_ibfk_1` FOREIGN KEY (`idmenu`) REFERENCES `___menu` (`idmenu`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

<?php
  session_start();
  unset($_SESSION[id]);
  unset($_SESSION[pass]);
  unset($_SESSION[user]);
  unset($_SESSION[level]);
  unset($_SESSION[sc]);
  header("Location:index.php?logout=1");
?>
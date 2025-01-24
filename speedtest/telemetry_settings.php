<?php

$db_type="postgresql"; //Type of db: "mysql", "sqlite" or "postgresql"
$stats_password="Abc"; //password to login to stats.php. Change this!!!
$enable_id_obfuscation=true; //if set to true, test IDs will be obfuscated to prevent users from guessing URLs of other tests
$redact_ip_addresses=false; //if set to true, IP addresses will be redacted from IP and ISP info fields, as well as the log

// Sqlite3 settings
$Sqlite_db_file = "../../speedtest_telemetry.sql";

// Mysql settings
$MySql_username="USERNAME";
$MySql_password="PASSWORD";
$MySql_hostname="DB_HOSTNAME";
$MySql_databasename="DB_NAME";

// Postgresql settings
$PostgreSql_username="user";
$PostgreSql_password="1password";
$PostgreSql_hostname="postgresql";
$PostgreSql_databasename="database";


//IMPORTANT: DO NOT ADD ANYTHING BELOW THIS PHP CLOSING TAG, NOT EVEN EMPTY LINES!
?>

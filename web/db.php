<!DOCTYPE html>
<html lang="zh-Hant">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>測試 DB 連線</title>
  </head>
  <body>
    <?php
      $servername = "db"; // 這裡要寫的是容器名稱(在 compose.yaml 檔找得到)
      $port = 3306;
      $username = "root";
      $password = "abcd1234";
      $dbname = "mysql";

      try {
        $conn = new PDO("mysql:host=$servername;port=$port;dbname=$dbname", $username, $password);
        echo "連線成功。"; 
      } catch(PDOException $e) {
        echo "連線失敗：" . $e->getMessage();
      }
    ?>
  </body>
</html>
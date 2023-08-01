<?php 
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once("../database/connection.php");
// url: http://127.0.0.1:3456/api/get_all_posts
try {
    //code...
    $result = $dbConn->query("SELECT id, title, content, created_at FROM posts");
    $posts = $result->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode(array(
        "status" => true,
        "data" => $posts
      ));
} catch (Exception $e) {
    //throw $th;
    echo json_encode(array(
        "status" => false,
        "message" => $e->getMessage()
      ));
}
?>
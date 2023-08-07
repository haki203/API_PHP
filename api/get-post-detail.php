<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once("../database/connection.php");
// url: http://127.0.0.1:3456/api/get-post-detail.php?id=1

try {
    // đọc thông tin query từ request
    $id = isset($_GET['id']) ? $_GET['id'] : -1;
    if ($id == -1 || !is_numeric($id)) {
        throw new Exception("id không hợp lệ");
    }
    // lấy dữ liệu từ database
    $result = $dbConn->query("SELECT id,image, title, content, created_at
     FROM posts  where id = $id");
    $post = $result->fetch(PDO::FETCH_ASSOC);
    // trả về dạng json
    echo json_encode(array(
        "status" => true,
        "post" => $post
    ));
} catch (Exception $e) {
    echo json_encode(array(
        "status" => false,
        "post" => $e->getMessage()
    ));
}

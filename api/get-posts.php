<?php 
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
include_once("../database/connection.php");
// kết hợp phân trang và tìm kiếm theo từ khóa
// url: http://127.0.0.1:3456/api/get-posts.php?keyword=abc&page=1&limit=2
try {
    // đọc thông tin query từ request
    $keyword = isset($_GET['keyword']) ? $_GET['keyword'] : "";
    $page = isset($_GET['page']) ? $_GET['page'] : 1;
    $limit = isset($_GET['limit']) ? $_GET['limit'] : 10;

    // 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
    // page = 2, limit = 3
    // tính toán offset
    $offset = ($page - 1) * $limit; // 3
    // lấy dữ liệu từ database
    $result = $dbConn->query("SELECT id, title, created_at
     FROM posts 
    where title like '%$keyword%' or content like '%$keyword%'
    order by created_at desc
    limit $limit offset $offset");
    $posts = $result->fetchAll(PDO::FETCH_ASSOC);
    // trả về dạng json
    echo json_encode(array(
        "status" => true,
        "data" => $posts
    ));
} catch (Exception $e) {
    echo json_encode(array(
        "status" => false,
        "message" => $e->getMessage()
    ));
}

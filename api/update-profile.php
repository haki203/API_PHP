<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once("../database/connection.php");

try {
    // lấy thông tin từ request
    $body = json_decode(file_get_contents("php://input"));

    $user_id = $body->user_id;
    $avatar = $body->avatar;
    $name = $body->name;
    $birthday = $body->birthday; // đủ 18 tuổi

    // tên, avatar, birthday ko được để trống
    // tên không chứa ký tự đặc biệt
    // birthday đủ 18 tuổi
    if (empty($name) || empty($avatar) || empty($birthday)) {
        echo json_encode(array(
            "status" => false,
            "message" => "Name, avatar or birthday is empty"
        ));
        return;
    }
    // bắt lỗi tên bằng biểu thức chính quy
    // biểu thức bắt dc cả tiếng việt
    if (!preg_match('/^[a-zA-Z\s]+$/', $name)) {
        echo "Tên chỉ được chứa các chữ cái và khoảng trắng.";
    }
    // bắt lỗi birthday
    $now = date("Y-m-d"); // ngày hiện tại
    $diff = date_diff(date_create($birthday), date_create($now));
    if ($diff->format('%y') < 18) {
        echo "Bạn chưa đủ 18 tuổi.";
    }

    // update thông tin user
    $dbConn->query("update users set name='$name', 
            avatar='$avatar', birthday='$birthday' where id=$user_id");
            
    echo json_encode(array(
        "status" => true
    ));

} catch (Exception $e) {
    echo json_encode(array(
        "status" => false,
        "message" => $e->getMessage()
    ));
}

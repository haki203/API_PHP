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
    $email = $body->email;
    // nếu ko nhập email || name thì trả về false
    if (empty($email)) {
        echo json_encode(array(
            "status" => false,
            "message" => "Email or name is empty"
        ));
        return;
    }
    // fake info
    // namntps12345@fpt.edu.vn
    $name="ABC";
    $avatar = "https://robohash.org/estquotempora.png?size=50x50&set=set1";
    // cắt chuỗi từ @ trở về trước 7 kí tự
    $substring = strstr($email, "@", true);
    $student_code = substr($substring, -7);
    $gender = true;
    $birthday = "1999-01-01";
    $address = "Hà Nội";
    $course = "Mobile";

    $user = $dbConn->query("SELECT id, email, avatar,
                    student_code, gender, birthday, address, course 
                    FROM users where email='$email'");
    // nếu email chưa tồn tại thì thêm vào database
    if ($user->rowCount() <= 0) {
        // nếu email chưa tồn tại thì thêm vào database
        $dbConn->query("insert into users (name, email, 
        avatar, student_code, gender, birthday, address, course) 
        values ('$name', '$email', '$avatar', '$student_code', 
        $gender, '$birthday', '$address', '$course')");
        $user = $dbConn->query("SELECT id, email, avatar,
                    student_code, gender, birthday, address, course 
                    FROM users where email='$email'");
    }

    // lấy thông tin user
    $row = $user->fetch(PDO::FETCH_ASSOC);
    $id = $row['id'];
    $email = $row['email'];
    $avatar = $row['avatar'];
    $student_code = $row['student_code'];
    $gender = $row['gender'];
    $birthday = $row['birthday'];
    $address = $row['address'];
    $course = $row['course'];
    $now = time();
    $tokenData = $email . $now;
    $token = md5($tokenData);
    // trả về thông tin user dưới dạng json
    echo json_encode(array(
        "status" => true,
        "user" => array(
            "email" => $email,
            "id" => $id,
            "avatar" => $avatar,
            "name" => $name,
            "student_code" => $student_code,
            "gender" => $gender,
            "birthday" => $birthday,
            "address" => $address,
            "course" => $course
        ),
        
        "token" => $token
    ));
} catch (Exception $e) {
    echo json_encode(array(
        "status" => false,
        "message" => $e->getMessage()
    ));
}
?>
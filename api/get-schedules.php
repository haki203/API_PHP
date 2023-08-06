<?php

use function PHPSTORM_META\type;

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once("../database/connection.php");

// url: http://127.0.0.1:3456/api/get-schedules.php?user_id=1&type=1&date=7&asc=1
// type = 0: học, 1: thi
// date = số ngày
// asc = 1: ngày tới, 0: ngày lùi

try {
    // đọc thông tin query từ request
    $user_id = isset($_GET['user_id']) ? $_GET['user_id'] : -1;
    $type = isset($_GET['type']) ? $_GET['type'] : 0;
    $date = isset($_GET['date']) ? $_GET['date'] : -1;
    $asc = isset($_GET['asc']) ? $_GET['asc'] : -1;
    // lấy dữ liệu từ database
    // ngày tới
    if ($asc == 1) {
        $result = $dbConn->query("SELECT id, room, day, time, course_name,
        class_name, teacher_name, type, user_id, address
         FROM schedules where user_id=" . $user_id . " and type=" . $type . " and day >='2023-08-01' AND day <= DATE_ADD('2023-08-01', INTERVAL " . $date . " DAY) ORDER BY `day` asc LIMIT 0,100  ");
    } else {
        // ngay trước
        $result = $dbConn->query("SELECT id, room, day, time, course_name,
    class_name, teacher_name, type, user_id, address
     FROM schedules where user_id=" . $user_id . " and type=" . $type . " and day <='2023-08-01' AND day >= DATE_SUB('2023-08-01', INTERVAL " . $date . " DAY) ORDER BY `day` DESC LIMIT 0,100");
    }
    $schedules = $result->fetchAll(PDO::FETCH_ASSOC);
    // trả về dạng json
    echo json_encode(array(
        "status" => true,
        "data" => $schedules
    ));
} catch (Exception $e) {
    echo json_encode(array(
        "status" => false,
        "message" => $th->getMessage()
    ));
}

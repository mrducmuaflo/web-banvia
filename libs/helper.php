<?php
if (!defined("IN_SITE")) {
    exit("The Request Not Found");
}
$CMSNT = new DB();
date_default_timezone_set($CMSNT->site("timezone"));
if ($CMSNT->get_row(" SELECT * FROM `block_ip` WHERE `ip` = '" . myip() . "' AND `banned` = 1 ")) {
    require_once __DIR__ . "/../views/common/block-ip.php";
    exit;
}
if (!function_exists("cal_days_in_month")) {
    function cal_days_in_month($calendar, $month, $year)
    {
        return date("t", mktime(0, 0, 0, $month, 1, $year));
    }
}
function remove_html_tags($string)
{
    $string = preg_replace("/<ul[^>]*>/", "", $string);
    $string = preg_replace("/<\\/ul>/", "", $string);
    $string = preg_replace("/<li[^>]*>/", "", $string);
    $string = preg_replace("/<\\/li>/", "", $string);
    $string = preg_replace("/<b[^>]*>/", "", $string);
    $string = preg_replace("/<\\/b>/", "", $string);
    $string = preg_replace("/<i[^>]*>/", "", $string);
    $string = preg_replace("/<\\/i>/", "", $string);
    return $string;
}
function getDiscount($amount, $product_id)
{
    $CMSNT = new DB();
    foreach ($CMSNT->get_list("SELECT * FROM `product_discount` WHERE `min` <= '" . $amount . "' AND `product_id` = '" . $product_id . "' ORDER BY `min` DESC ") as $discount) {
        return $discount["discount"];
    }
    return 0;
}
function checkPromotion($amount)
{
    global $CMSNT;
    foreach ($CMSNT->get_list("SELECT * FROM `promotions` WHERE `min` <= '" . $amount . "' ORDER by `min` DESC ") as $promotion) {
        $received = $amount + $amount * $promotion["discount"] / 100;
        return $received;
    }
    return $amount;
}
function admin_msg_success($text, $url, $time)
{
    exit("<script type=\"text/javascript\">Swal.fire({\n        title: \"Thành công!\",\n        text: \"" . $text . "\",\n        icon: \"success\"\n    });\n    setTimeout(function(){ location.href = \"" . $url . "\" }," . $time . ");</script>");
}
function admin_msg_error($text, $url, $time)
{
    exit("<script type=\"text/javascript\">Swal.fire(\"Thất Bại\", \"" . $text . "\",\"error\");\n    setTimeout(function(){ location.href = \"" . $url . "\" }," . $time . ");</script>");
}
function admin_msg_warning($text, $url, $time)
{
    exit("<script type=\"text/javascript\">Swal.fire(\"Thông Báo\", \"" . $text . "\",\"warning\");\n    setTimeout(function(){ location.href = \"" . $url . "\" }," . $time . ");</script>");
}
function curl_get2($url)
{
    $arrContextOptions = ["ssl" => ["verify_peer" => false, "verify_peer_name" => false]];
    return file_get_contents($url, false, stream_context_create($arrContextOptions));
}
function debit_processing($user_id)
{
    $CMSNT = new DB();
    $User = new users();
    $getUser = $CMSNT->get_row(" SELECT * FROM `users` WHERE `id` = '" . $user_id . "' ");
    if (0 < $getUser["debit"]) {
        if ($getUser["debit"] < $getUser["money"]) {
            $isTru = $CMSNT->tru("users", "debit", $getUser["debit"], " `id` = '" . $user_id . "' ");
            if ($isTru) {
                $User->RemoveCredits($getUser["id"], $getUser["debit"], __("Thanh toán số tiền ghi nợ"));
                return true;
            }
        } else {
            $isTru = $CMSNT->tru("users", "debit", $getUser["money"], " `id` = '" . $user_id . "' ");
            if ($isTru) {
                $User->RemoveCredits($getUser["id"], $getUser["money"], __("Thanh toán số tiền ghi nợ"));
                return true;
            }
        }
    }
    return false;
}
function checkCoupon($product_id, $coupon, $user_id, $money, $pay)
{
    global $CMSNT;
    if ($coupon = $CMSNT->get_row("SELECT * FROM `coupons` WHERE `code` = '" . check_string($coupon) . "' AND `min` <= " . $money . " AND `max` >= " . $money . " AND `used` < `amount` ")) {
        if ($coupon["used"] < $coupon["amount"]) {
            if (!$CMSNT->get_row("SELECT * FROM `coupon_used` WHERE `coupon_id` = '" . $coupon["id"] . "' AND `user_id` = '" . $user_id . "' ")) {
                if ($coupon["product_id"] == "") {
                    return $money * $coupon["discount"] / 100;
                }
                if (in_array($product_id, json_decode($coupon["product_id"]))) {
                    return $money * $coupon["discount"] / 100;
                }
                return false;
            }
            return false;
        }
        return false;
    }
    return false;
}
function checkPermission($admin_id, $role)
{
    global $CMSNT;
    if ($admin_id == 99999) {
        return true;
    }
    if (($row = $CMSNT->get_row(" SELECT * FROM `admin_role` WHERE `id` = '" . $admin_id . "' ")) && in_array($role, json_decode($row["role"]))) {
        return true;
    }
    return false;
}
function getStock($code)
{
    $CMSNT = new DB();
    return $CMSNT->get_row(" SELECT COUNT(id) FROM `product_stock` WHERE  `product_code` = '" . $code . "' ")["COUNT(id)"];
}
function currencyDefault()
{
    $CMSNT = new DB();
    return $CMSNT->get_row(" SELECT `code` FROM `currencies` WHERE `display` = 1 AND `default_currency` = 1")["code"];
}
function dirImageProduct($image)
{
    $path = "assets/storage/images/products/" . $image;
    return $path;
}
function generate_csrf_token()
{
    if (!isset($_SESSION["csrf_token"])) {
        $_SESSION["csrf_token"] = base64_encode(openssl_random_pseudo_bytes(32));
    }
    return $_SESSION["csrf_token"];
}
function display_camp($status)
{
    if ($status == 0) {
        return "<span class=\"badge bg-info\">Processing</span>";
    }
    if ($status == 1) {
        return "<span class=\"badge bg-success\">Completed</span>";
    }
    if ($status == 2) {
        return "<span class=\"badge bg-danger\">Cancel</span>";
    }
    return "<span class=\"badge bg-warning\">Khác</span>";
}
function display_withdraw($data)
{
    if ($data == "pending") {
        $show = "<span class=\"badge bg-warning\">Pending</span>";
    } else {
        if ($data == "cancel") {
            $show = "<span class=\"badge bg-danger\">Cancel</span>";
        } else {
            if ($data == "completed") {
                $show = "<span class=\"badge bg-success\">Completed</span>";
            }
        }
    }
    return $show;
}
function setCurrency($id)
{
    global $CMSNT;
    if ($row = $CMSNT->get_row("SELECT * FROM `currencies` WHERE `id` = '" . $id . "' AND `display` = 1 ")) {
        $isSet = setcookie("currency", $row["id"], time() + 946080000, "/");
        if ($isSet) {
            return true;
        }
        return false;
    }
    return false;
}
function getCurrency()
{
    global $CMSNT;
    if (isset($_COOKIE["currency"])) {
        $currency = check_string($_COOKIE["currency"]);
        $rowcurrency = $CMSNT->get_row("SELECT * FROM `currencies` WHERE `id` = '" . $currency . "' AND `display` = 1 ");
        if ($rowcurrency) {
            return $rowcurrency["id"];
        }
    }
    $rowcurrency = $CMSNT->get_row("SELECT * FROM `currencies` WHERE `default_currency` = 1 ");
    if ($rowcurrency) {
        return $rowcurrency["id"];
    }
    return false;
}
function display_invoice($data)
{
    if ($data == "waiting") {
        $show = "<span class=\"badge bg-warning\">Waiting</span>";
    } else {
        if ($data == "expired") {
            $show = "<span class=\"badge bg-danger\">Expired</span>";
        } else {
            if ($data == "completed") {
                $show = "<span class=\"badge bg-success\">Completed</span>";
            }
        }
    }
    return $show;
}
function isValidTRC20Address($address)
{
    $curl = curl_init();
    curl_setopt_array($curl, [CURLOPT_URL => "https://walletvalidator.com/usdt-trc20-wallet-validator/", CURLOPT_RETURNTRANSFER => true, CURLOPT_ENCODING => "", CURLOPT_MAXREDIRS => 10, CURLOPT_TIMEOUT => 0, CURLOPT_FOLLOWLOCATION => true, CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1, CURLOPT_CUSTOMREQUEST => "POST", CURLOPT_POSTFIELDS => ["validate" => $address]]);
    $response = curl_exec($curl);
    curl_close($curl);
    $response = json_decode($response, true);
    if ($response["ok"]) {
        return true;
    }
    return false;
}
function url()
{
    isset($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] != "off" ? "https" : "http";
    $_SERVER["SERVER_NAME"];
    $_SERVER["REQUEST_URI"];
    return sprintf();
}
function is_valid_domain_name($domain_name)
{
    return preg_match("/^([a-z\\d](-*[a-z\\d])*)(\\.([a-z\\d](-*[a-z\\d])*))*\$/i", $domain_name) && preg_match("/^.{1,253}\$/", $domain_name) && preg_match("/^[^\\.]{1,63}(\\.[^\\.]{1,63})*\$/", $domain_name);
}
function display_domains($data)
{
    if ($data == 1) {
        $show = "<span class=\"badge bg-success\">" . __("Hoạt Động") . "</span>";
    } else {
        if ($data == 0) {
            $show = "<span class=\"badge bg-warning\">" . __("Đang Xây Dựng") . "</span>";
        } else {
            if ($data == 2) {
                $show = "<span class=\"badge bg-danger\">" . __("Huỷ") . "</span>";
            }
        }
    }
    return $show;
}
function addRef($user_id, $price, $note = "")
{
    $CMSNT = new DB();
    if ($CMSNT->site("status_ref") != 1) {
        return false;
    }
    $getUser = $CMSNT->get_row(" SELECT * FROM `users` WHERE `id` = '" . $user_id . "' ");
    if ($getUser["ref_id"] != 0) {
        $price = $price * $CMSNT->site("ck_ref") / 100;
        $CMSNT->cong("users", "ref_money", $price, " `id` = '" . $getUser["ref_id"] . "' ");
        $CMSNT->cong("users", "ref_total_money", $price, " `id` = '" . $getUser["ref_id"] . "' ");
        $CMSNT->cong("users", "ref_amount", $price, " `id` = '" . $getUser["id"] . "' ");
        $CMSNT->insert("log_ref", ["user_id" => $getUser["ref_id"], "reason" => $note, "sotientruoc" => getRowRealtime("users", $getUser["ref_id"], "ref_money") - $price, "sotienthaydoi" => $price, "sotienhientai" => getRowRealtime("users", $getUser["ref_id"], "ref_money"), "create_gettime" => gettime()]);
        return true;
    }
    return false;
}
function sendMessAdmin($my_text)
{
    if ($my_text != "") {
        return sendMessTelegram($my_text);
    }
    return false;
}
function sendMessTelegram($my_text, $token = "", $chat_id = "")
{
    $CMSNT = new DB();
    if ($chat_id == "") {
        $chat_id = $CMSNT->site("telegram_chat_id");
    }
    if ($token == "") {
        $token = $CMSNT->site("telegram_token");
    }
    if ($my_text == "") {
        return false;
    }
    if ($CMSNT->site("telegram_status") == 1 && $token != "" && $chat_id != "") {
        $telegram_url = "https://api.telegram.org/bot" . $token . "/sendMessage";
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $telegram_url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query(["chat_id" => $chat_id, "text" => $my_text, "parse_mode" => "HTML"]));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $response = curl_exec($ch);
        curl_close($ch);
        return $response;
    }
    return false;
}
function getFlag($flag)
{
    if (empty($flag)) {
        return "";
    }
    return "<img width=\"30px;\" src=\"https://flagicons.lipis.dev/flags/4x3/" . $flag . ".svg\">";
}
function claimSpin($user_id, $trans_id, $total_money)
{
    $CMSNT = new DB();
    $USER = new users();
    if ($CMSNT->site("status_spin") == 1 && $CMSNT->site("condition_spin") < $total_money) {
        $USER->AddSpin($user_id, 1, "Nhập 1 SPIN từ đơn hàng #" . $trans_id);
    }
}
function getRandomWeightedElement($weightedValues)
{
    $Rand = mt_Rand(1, (int) array_sum($weightedValues));
    foreach ($weightedValues as $key => $value) {
        $Rand .= $value;
        if ($Rand < 0) {
            return $key;
        }
    }
}
function checkFormatCard($type, $seri, $pin)
{
    $seri = strlen($seri);
    $pin = strlen($pin);
    $data = [];
    if ($type == "Viettel" || $type == "viettel" || $type == "VT" || $type == "VIETTEL") {
        if ($seri != 11 && $seri != 14) {
            $data = ["status" => false, "msg" => "Độ dài seri không phù hợp"];
            return $data;
        }
        if ($pin != 13 && $pin != 15) {
            $data = ["status" => false, "msg" => "Độ dài mã thẻ không phù hợp"];
            return $data;
        }
    }
    if ($type == "Mobifone" || $type == "mobifone" || $type == "Mobi" || $type == "MOBIFONE") {
        if ($seri != 15) {
            $data = ["status" => false, "msg" => "Độ dài seri không phù hợp"];
            return $data;
        }
        if ($pin != 12) {
            $data = ["status" => false, "msg" => "Độ dài mã thẻ không phù hợp"];
            return $data;
        }
    }
    if ($type == "VNMB" || $type == "Vnmb" || $type == "VNM" || $type == "VNMOBI") {
        if ($seri != 16) {
            $data = ["status" => false, "msg" => "Độ dài seri không phù hợp"];
            return $data;
        }
        if ($pin != 12) {
            $data = ["status" => false, "msg" => "Độ dài mã thẻ không phù hợp"];
            return $data;
        }
    }
    if ($type == "Vinaphone" || $type == "vinaphone" || $type == "Vina" || $type == "VINAPHONE") {
        if ($seri != 14) {
            $data = ["status" => false, "msg" => "Độ dài seri không phù hợp"];
            return $data;
        }
        if ($pin != 14) {
            $data = ["status" => false, "msg" => "Độ dài mã thẻ không phù hợp"];
            return $data;
        }
    }
    if ($type == "Garena" || $type == "garena") {
        if ($seri != 9) {
            $data = ["status" => false, "msg" => "Độ dài seri không phù hợp"];
            return $data;
        }
        if ($pin != 16) {
            $data = ["status" => false, "msg" => "Độ dài mã thẻ không phù hợp"];
            return $data;
        }
    }
    if ($type == "Zing" || $type == "zing" || $type == "ZING") {
        if ($seri != 12) {
            $data = ["status" => false, "msg" => "Độ dài seri không phù hợp"];
            return $data;
        }
        if ($pin != 9) {
            $data = ["status" => false, "msg" => "Độ dài mã thẻ không phù hợp"];
            return $data;
        }
    }
    if ($type == "Vcoin" || $type == "VTC") {
        if ($seri != 12) {
            $data = ["status" => false, "msg" => "Độ dài seri không phù hợp"];
            return $data;
        }
        if ($pin != 12) {
            $data = ["status" => false, "msg" => "Độ dài mã thẻ không phù hợp"];
            return $data;
        }
    }
    $data = ["status" => true, "msg" => "Success"];
    return $data;
}
function active_sidebar_client($action)
{
    foreach ($action as $row) {
        if (isset($_GET["action"]) && $_GET["action"] == $row) {
            return "mobile-menu-active";
        }
    }
    return "";
}
function show_sidebar_client($action)
{
    foreach ($action as $row) {
        if (isset($_GET["action"]) && $_GET["action"] == $row) {
            return "active open";
        }
    }
    return "";
}
function show_sidebar($action)
{
    foreach ($action as $row) {
        if (isset($_GET["action"]) && $_GET["action"] == $row) {
            return "active open";
        }
    }
    return "";
}
function parse_order_id($des, $MEMO_PREFIX)
{
    $re = "/" . $MEMO_PREFIX . "\\d+/im";
    preg_match_all($re, $des, $matches, PREG_SET_ORDER, 0);
    if (count($matches) == 0) {
        return NULL;
    }
    $orderCode = $matches[0][0];
    $prefixLength = strlen($MEMO_PREFIX);
    $orderId = (int) substr($orderCode, $prefixLength);
    return $orderId;
}
function display_status_toyyibpay($status)
{
    if ($status == 0) {
        return "<b style=\"color:#db7e06;\">" . __("Waiting") . "</b>";
    }
    if ($status == "confirming") {
        return "<b style=\"color:blue;\">" . __("Confirming") . "</b>";
    }
    if ($status == "confirmed") {
        return "<b style=\"color:green;\">" . __("Confirmed") . "</b>";
    }
    if ($status == "refunded") {
        return "<b style=\"color:pink;\">" . __("Refunded") . "</b>";
    }
    if ($status == "expired") {
        return "<b style=\"color:red;\">" . __("Expired") . "</b>";
    }
    if ($status == 2) {
        return "<b style=\"color:red;\">" . __("Failed") . "</b>";
    }
    if ($status == "partially_paid") {
        return "<b style=\"color:green;\">" . __("Partially Paid") . "</b>";
    }
    if ($status == 1) {
        return "<b style=\"color:green;\">" . __("Finished") . "</b>";
    }
}
function display_service($status)
{
    if ($status == 0) {
        return "<b style=\"color:blue;\">Đang chờ xử lý</b>";
    }
    if ($status == 1) {
        return "<b style=\"color:green;\">Hoàn tất</b>";
    }
    if ($status == 2) {
        return "<b style=\"color:red;\">Huỷ</b>";
    }
    return "<b style=\"color:yellow;\">Khác</b>";
}
function display_card($status)
{
    if ($status == "pending") {
        return "<span class=\"badge bg-info\">" . __("Đang chờ xử lý") . "</span>";
    }
    if ($status == "completed") {
        return "<span class=\"badge bg-success\">" . __("Thành công") . "</span>";
    }
    if ($status == "error") {
        return "<span class=\"badge bg-danger\">" . __("Thất bại") . "</span>";
    }
    return "<span class=\"badge bg-warning\">Khác</span>";
}
function display_invoice_text($status)
{
    if ($status == 0) {
        return __("Đang chờ thanh toán");
    }
    if ($status == 1) {
        return __("Đã thanh toán");
    }
    if ($status == 2) {
        return __("Huỷ bỏ");
    }
    return __("Khác");
}
function getRowRealtime($table, $id, $row)
{
    global $CMSNT;
    return $CMSNT->get_row("SELECT `" . $row . "` FROM `" . $table . "` WHERE `id` = '" . $id . "' ")[$row];
}
function get_url()
{
    if (isset($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] === "on") {
        $url = "https://";
    } else {
        $url = "http://";
    }
    $url .= $_SERVER["HTTP_HOST"];
    $url .= $_SERVER["REQUEST_URI"];
    return $url;
}
function base_url($url = "")
{
    global $domain_block;
    $a = (isset($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] === "on" ? "https" : "http") . "://" . $_SERVER["HTTP_HOST"];
    if ($a == "http://localhost") {
        $a = "http://localhost/CMSNT.CO/SHOPCLONE7";
    }
    return $a . "/" . $url;
}
function base_url_admin($url = "")
{
    $a = (isset($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] === "on" ? "https" : "http") . "://" . $_SERVER["HTTP_HOST"];
    if ($a == "http://localhost") {
        $a = "http://localhost/CMSNT.CO/SHOPCLONE7";
    }
    return $a . "/?module=admin&action=" . $url;
}
function TypePassword($password)
{
    $CMSNT = new DB();
    if ($CMSNT->site("type_password") == "md5") {
        return md5($password);
    }
    if ($CMSNT->site("type_password") == "bcrypt") {
        return password_hash($password, PASSWORD_BCRYPT);
    }
    if ($CMSNT->site("type_password") == "sha1") {
        return sha1($password);
    }
    return $password;
}
function getUser($id, $row)
{
    $CMSNT = new DB();
    return $CMSNT->get_row("SELECT * FROM `users` WHERE `id` = '" . $id . "' ")[$row];
}
function check_email($data)
{
    if (preg_match("/^.+@.+\$/", $data, $matches)) {
        return true;
    }
    return false;
}
function check_phone($data)
{
    if (preg_match("/^\\+?(\\d.*){3,}\$/", $data, $matches)) {
        return true;
    }
    return false;
}
function gettime()
{
    return date("Y/m/d H:i:s", time());
}
function format_currency2($amount)
{
    $CMSNT = new DB();
    $currency = $CMSNT->site("currency");
    if ($currency == "USD") {
        return "\$" . number_format($amount / $CMSNT->site("usd_rate"), 2, ".", "");
    }
    if ($currency == "VND") {
        return format_cash($amount) . "đ";
    }
    if ($currency == "THB") {
        return format_cash($amount / 0) . " THB";
    }
}
function format_currency($amount)
{
    $CMSNT = new DB();
    if (isset($_COOKIE["currency"])) {
        $currency = check_string($_COOKIE["currency"]);
        $rowCurrency = $CMSNT->get_row("SELECT * FROM `currencies` WHERE `id` = '" . $currency . "' AND `display` = 1 ");
        if ($rowCurrency) {
            if ($rowCurrency["seperator"] == "comma") {
                $seperator = ",";
            }
            if ($rowCurrency["seperator"] == "space") {
                $seperator = "";
            }
            if ($rowCurrency["seperator"] == "dot") {
                $seperator = ".";
            }
            return $rowCurrency["symbol_left"] . number_format($amount / $rowCurrency["rate"], $rowCurrency["decimal_currency"], ".", $seperator) . $rowCurrency["symbol_right"];
        }
    }
    $rowCurrency = $CMSNT->get_row("SELECT * FROM `currencies` WHERE `default_currency` = 1 ");
    if ($rowCurrency) {
        if ($rowCurrency["seperator"] == "comma") {
            $seperator = ",";
        }
        if ($rowCurrency["seperator"] == "space") {
            $seperator = "";
        }
        if ($rowCurrency["seperator"] == "dot") {
            $seperator = ".";
        }
        return $rowCurrency["symbol_left"] . number_format($amount / $rowCurrency["rate"], $rowCurrency["decimal_currency"], ".", $seperator) . $rowCurrency["symbol_right"];
    }
    return format_cash($amount) . "đ";
}
function myip()
{
    if (!empty($_SERVER["HTTP_CLIENT_IP"])) {
        $ip_address = $_SERVER["HTTP_CLIENT_IP"];
    } else {
        if (!empty($_SERVER["HTTP_X_FORWARDED_FOR"])) {
            $ip_address = $_SERVER["HTTP_X_FORWARDED_FOR"];
        } else {
            $ip_address = $_SERVER["REMOTE_ADDR"];
        }
    }
    if (isset(explode(",", $ip_address)[1])) {
        return explode(",", $ip_address)[0];
    }
    return check_string($ip_address);
}
function check_string($data)
{
    return trim(htmlspecialchars(addslashes($data)));
}
function format_cash($number, $suffix = "")
{
    return number_format($number, 0, ",", ".") . (int) $suffix;
}
function create_slug($string)
{
    $search = ["#(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)#", "#(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)#", "#(ì|í|ị|ỉ|ĩ)#", "#(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)#", "#(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)#", "#(ỳ|ý|ỵ|ỷ|ỹ)#", "#(đ)#", "#(À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ)#", "#(È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ)#", "#(Ì|Í|Ị|Ỉ|Ĩ)#", "#(Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ)#", "#(Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ)#", "#(Ỳ|Ý|Ỵ|Ỷ|Ỹ)#", "#(Đ)#", "/[^a-zA-Z0-9\\-\\_]/"];
    $replace = ["a", "e", "i", "o", "u", "y", "d", "A", "E", "I", "O", "U", "Y", "D", "-"];
    $string = preg_replace($search, $replace, $string);
    $string = preg_replace("/(-)+/", "-", $string);
    $string = strtolower($string);
    return $string;
}
function checkAddon($id_addon)
{
    $CMSNT = new DB();
    $domain = str_replace("www.", "", $_SERVER["HTTP_HOST"]);
    if ($CMSNT->get_row("SELECT * FROM `addons` WHERE `id` = '" . $id_addon . "' ")["purchase_key"] == md5($domain . "|" . $id_addon)) {
        return true;
    }
    return false;
}
function curl_get($url)
{
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 10);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
    curl_setopt($ch, CURLOPT_VERBOSE, true);
    $data = curl_exec($ch);
    curl_close($ch);
    return $data;
}
function curl_dataPost($url, $dataPost)
{
    $curl = curl_init();
    curl_setopt_array($curl, [CURLOPT_URL => $url, CURLOPT_RETURNTRANSFER => true, CURLOPT_ENCODING => "", CURLOPT_MAXREDIRS => 10, CURLOPT_TIMEOUT => 0, CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1, CURLOPT_CUSTOMREQUEST => "POST", CURLOPT_POSTFIELDS => $dataPost]);
    $response = curl_exec($curl);
    curl_close($curl);
    return $response;
}
function curl_post($url, $method, $postinfo, $cookie_file_path)
{
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_HEADER, true);
    curl_setopt($ch, CURLOPT_NOBODY, false);
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
    curl_setopt($ch, CURLOPT_COOKIE, $cookie_file_path);
    curl_setopt($ch, CURLOPT_COOKIEJAR, $cookie_file_path);
    curl_setopt($ch, CURLOPT_COOKIEFILE, $cookie_file_path);
    curl_setopt($ch, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.7.12) Gecko/20050915 Firefox/1.0.7");
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_REFERER, $_SERVER["REQUEST_URI"]);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $method);
    if ($method == "POST") {
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $postinfo);
    }
    $html = curl_exec($ch);
    curl_close($ch);
    return $html;
}
function convertTokenToCookie($token)
{
    $html = json_decode(file_get_contents("https://api.facebook.com/method/auth.getSessionforApp?access_token=" . $token . "&format=json&new_app_id=350685531728&generate_session_cookies=1"), true);
    $cookie = $html["session_cookies"][0]["name"] . "=" . $html["session_cookies"][0]["value"] . ";" . $html["session_cookies"][1]["name"] . "=" . $html["session_cookies"][1]["value"] . ";" . $html["session_cookies"][2]["name"] . "=" . $html["session_cookies"][2]["value"] . ";" . $html["session_cookies"][3]["name"] . "=" . $html["session_cookies"][3]["value"];
    return $cookie;
}
function senInboxCSM($cookie, $noiDungTinNhan, $idAnh, $idNguoiNhan)
{
    preg_match("/c_user=([0-9]+);/", $cookie, $idNguoiGui);
    $idNguoiGui = $idNguoiGui[1];
    $html = curl_post("https://m.facebook.com", "GET", "", $cookie);
    $re = "/<input type=\"hidden\" name=\"fb_dtsg\" value=\"(.*?)\" autocomplete=\"off\" \\/>/";
    preg_match($re, $html, $dtsg);
    $dtsg = $dtsg[1];
    $ex = explode("|", $idNguoiNhan);
    foreach ($ex as $idNguoiNhan) {
        $html1 = curl_post("https://m.facebook.com/messages/read/?fbid=" . $idNguoiNhan . "&_rdr", "GET", "", $cookie);
        $re = "/tids=(.*?)\\&/";
        preg_match($re, $html1, $tid);
        if (isset($tid[1])) {
            $tid = urldecode($tid[1]);
            $data = ["fb_dtsg" => (int) $dtsg, "body" => (int) $noiDungTinNhan, "send" => "Gá»­i", "photo_ids[" . $idanh . "]" => (int) $idAnh, "tids" => (int) $tid, "referrer" => "", "ctype" => "", "cver" => "legacy"];
        } else {
            $data = ["fb_dtsg" => (int) $dtsg, "body" => (int) $noiDungTinNhan, "Send" => "Gá»­i", "ids[0]" => (int) $idNguoiNhan, "photo" => "", "waterfall_source" => "message"];
        }
        $html = curl_post("https://m.facebook.com/messages/send/?icm=1&refid=12", "POST", http_build_query($data), $cookie);
        $re = preg_match("/send_success/", $html, $rep);
        if (isset($rep[0])) {
            return true;
        }
        return false;
    }
}
function random($string, $int)
{
    return substr(str_shuffle($string), 0, $int);
}
function redirect($url)
{
    header("Location: " . $url);
    exit;
}
function active_sidebar($action)
{
    foreach ($action as $row) {
        if (isset($_GET["action"]) && $_GET["action"] == $row) {
            return "active";
        }
    }
    return "";
}
function menuopen_sidebar($action)
{
    foreach ($action as $row) {
        if (isset($_GET["action"]) && $_GET["action"] == $row) {
            return "menu-open";
        }
    }
    return "";
}
function input_post($key)
{
    return isset($_POST[$key]) ? trim($_POST[$key]) : false;
}
function input_get($key)
{
    return isset($_GET[$key]) ? trim($_GET[$key]) : false;
}
function is_submit($key)
{
    return isset($_POST["request_name"]) && $_POST["request_name"] == $key;
}
function display_mark($data)
{
    if (1 < $data) {
        $show = "<span class=\"badge bg-success\">Có</span>";
    } else {
        if ($data == 0) {
            $show = "<span class=\"badge bg-danger\">Không</span>";
        }
    }
    return $show;
}
function display_banned($banned)
{
    if ($banned != 1) {
        return "<span class=\"badge bg-success\">Active</span>";
    }
    return "<span class=\"badge bg-danger\">Banned</span>";
}
function display_online($time)
{
    if (time() - $time < 300) {
        return "<span class=\"badge bg-success\">Online</span>";
    }
    return "<span class=\"badge bg-danger\">Offline</span>";
}
function display_flag($data)
{
    return "<img src=\"https://flagcdn.com/40x30/" . $data . ".png\" >";
}
function display_live($data)
{
    if ($data == "LIVE") {
        $show = "<span class=\"badge bg-success\">LIVE</span>";
    } else {
        if ($data == "DIE") {
            $show = "<span class=\"badge bg-danger\">DIE</span>";
        }
    }
    return $show;
}
function display_checklive($data)
{
    if ($data == 1) {
        $show = "<span class=\"badge bg-success\">Có</span>";
    } else {
        if ($data == 0) {
            $show = "<span class=\"badge bg-danger\">Không</span>";
        }
    }
    return $show;
}
function card24h($telco, $amount, $serial, $pin, $trans_id)
{
    global $CMSNT;
    $partner_id = $CMSNT->site("card_partner_id");
    $partner_key = $CMSNT->site("card_partner_key");
    $url = base64_decode("aHR0cHM6Ly9kb2l0aGVjYW81cy52bi9jaGFyZ2luZ3dzL3YyP3NpZ249") . md5($partner_key . $pin . $serial) . "&telco=" . $telco . "&code=" . $pin . "&serial=" . $serial . "&amount=" . $amount . "&request_id=" . $trans_id . "&partner_id=" . $partner_id . "&command=charging";
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $data = curl_exec($ch);
    curl_close($ch);
    return json_decode($data, true);
}
function display_status_product($data)
{
    if ($data == 1) {
        $show = "<span class=\"badge bg-success\">Hiển thị</span>";
    } else {
        if ($data == 0) {
            $show = "<span class=\"badge bg-danger\">Ẩn</span>";
        }
    }
    return $show;
}
function display_role($data)
{
    if ($data == 1) {
        $show = "<span class=\"badge badge-danger\">Admin</span>";
    } else {
        if ($data == 0) {
            $show = "<span class=\"badge badge-info\">Member</span>";
        }
    }
    return $show;
}
function msg_success($text, $url, $time)
{
    exit("<script type=\"text/javascript\">swal(\"Thành Công\", \"" . $text . "\",\"success\");\n    setTimeout(function(){ location.href = \"" . $url . "\" }," . $time . ");</script>");
}
function msg_error($text, $url, $time)
{
    exit("<script type=\"text/javascript\">swal(\"Thất Bại\", \"" . $text . "\",\"error\");\n    setTimeout(function(){ location.href = \"" . $url . "\" }," . $time . ");</script>");
}
function msg_warning($text, $url, $time)
{
    exit("<script type=\"text/javascript\">swal(\"Thông Báo\", \"" . $text . "\",\"warning\");\n    setTimeout(function(){ location.href = \"" . $url . "\" }," . $time . ");</script>");
}
function paginationBoostrap($url, $start, $total, $kmess)
{
    $out[] = "<ul class=\"pagination\">";
    $neighbors = 2;
    if ($total < $start) {
        $start = max(0, $total - ($total % $kmess == 0 ? $kmess : $total % $kmess));
    } else {
        $start = max(0, (int) $start - (int) $start % (int) $kmess);
    }
    $base_link = "<li class=\"page-item\"><a class=\"page-link\" href=\"" . strtr($url, ["%" => "%%"]) . "page=%d" . "\">%s</a></li>";
    $out[] = $start == 0 ? "" : sprintf($base_link, $start / $kmess, "<i class=\"far fa-hand-point-left\"></i>");
    if ($kmess * $neighbors < $start) {
        $out[] = sprintf($base_link, 1, "1");
    }
    if ($kmess * ($neighbors + 1) < $start) {
        $out[] = "<li class=\"page-item\"><a class=\"page-link\">...</a></li>";
    }
    for ($nCont = $neighbors; 1 < $nCont; $nCont--) {
        if ($kmess * $nCont < $start) {
            $tmpStart = $start - $kmess * $nCont;
            $out[] = sprintf($base_link, $tmpStart / $kmess + 1, $tmpStart / $kmess + 1);
        }
    }
    $out[] = "<li class=\"page-item active\"><a class=\"page-link\">" . ($start / $kmess + 1) . "</a></li>";
    $tmpMaxPages = (int) (($total - 1) / $kmess) * $kmess;
    for ($nCont = 1; $nCont < $neighbors; $nCont++) {
        if ($start + $kmess * $nCont < $tmpMaxPages) {
            $tmpStart = $start + $kmess * $nCont;
            $out[] = sprintf($base_link, $tmpStart / $kmess + 1, $tmpStart / $kmess + 1);
        }
    }
    if ($start + $kmess * ($neighbors + 1) < $tmpMaxPages) {
        $out[] = "<li class=\"page-item\"><a class=\"page-link\">...</a></li>";
    }
    if ($start + $kmess * $neighbors < $tmpMaxPages) {
        $out[] = sprintf($base_link, $tmpMaxPages / $kmess + 1, $tmpMaxPages / $kmess + 1);
    }
    if ($start + $kmess < $total) {
        $display_page = $total < $start + $kmess ? $total : $start / $kmess + 2;
        $out[] = sprintf($base_link, $display_page, "<i class=\"far fa-hand-point-right\"></i>\n        ");
    }
    $out[] = "</ul>";
    return implode("", $out);
}
function check_img($img)
{
    $filename = $_FILES[$img]["name"];
    $ext = explode(".", $filename);
    $ext = end($ext);
    $valid_ext = ["png", "jpeg", "jpg", "PNG", "JPEG", "JPG", "gif", "GIF"];
    if (in_array($ext, $valid_ext)) {
        return true;
    }
}
function timeAgo($time_ago)
{
    $time_ago = empty($time_ago) ? 0 : $time_ago;
    if ($time_ago == 0) {
        return "--";
    }
    $time_ago = date("Y-m-d H:i:s", $time_ago);
    $time_ago = strtotime($time_ago);
    $cur_time = time();
    $time_elapsed = $cur_time - $time_ago;
    $seconds = $time_elapsed;
    $minutes = round($time_elapsed / 60);
    $hours = round($time_elapsed / 3600);
    $days = round($time_elapsed / 86400);
    $weeks = round($time_elapsed / 604800);
    $months = round($time_elapsed / 2600640);
    $years = round($time_elapsed / 31207680);
    if ($seconds < 60) {
        return $seconds . " " . __("giây trước");
    }
    if ($minutes < 60) {
        return $minutes . " " . __("phút trước");
    }
    if ($hours < 24) {
        return $hours . " " . __("tiếng trước");
    }
    if ($days < 7) {
        if ($days == 1) {
            return __("Hôm qua");
        }
        return $days . " " . __("ngày trước");
    }
    if ($weeks < 0) {
        return $weeks . " " . __("tuần trước");
    }
    if ($months < 12) {
        return $months . " " . __("tháng trước");
    }
    return $years . " " . __("năm trước");
}
function timeAgo2($time_ago)
{
    $time_ago = date("Y-m-d H:i:s", $time_ago);
    $time_ago = strtotime($time_ago);
    $time_elapsed = $time_ago;
    $seconds = $time_elapsed;
    $minutes = round($time_elapsed / 60);
    $hours = round($time_elapsed / 3600);
    $days = round($time_elapsed / 86400);
    $weeks = round($time_elapsed / 604800);
    $months = round($time_elapsed / 2600640);
    $years = round($time_elapsed / 31207680);
    if ($seconds < 60) {
        return $seconds . " giây";
    }
    if ($minutes < 60) {
        return $minutes . " phút";
    }
    if ($hours < 24) {
        return $hours . " tiếng";
    }
    if ($days < 7) {
        if ($days == 1) {
            return $days . " ngày";
        }
        return $days . " ngày";
    }
    if ($weeks < 0) {
        return $weeks . " tuần";
    }
    if ($months < 12) {
        return $months . " tháng";
    }
    return $years . " năm";
}
function CheckLiveClone($uid)
{
    $json = json_decode(curl_get("https://graph2.facebook.com/v3.3/" . $uid . "/picture?redirect=0"), true);
    if ($json["data"]) {
        if (empty($json["data"]["height"]) && empty($json["data"]["width"])) {
            return "DIE";
        }
        return "LIVE";
    }
    return "LIVE";
}
function dirToArray($dir)
{
    $result = [];
    $cdir = scandir($dir);
    foreach ($cdir as $key => $value) {
        if (!$value[["." => true, ".." => true]]) {
            if (is_dir($dir . DIRECTORY_SEPARATOR . $value)) {
                $result[$value] = dirToArray($dir . DIRECTORY_SEPARATOR . $value);
            } else {
                $result[] = $value;
            }
        }
    }
    return $result;
}
function realFileSize($path)
{
    if (!file_exists($path)) {
        return false;
    }
    $size = filesize($path);
    if (!($file = fopen($path, "rb"))) {
        return false;
    }
    if (0 < $size && fseek($file, 0, SEEK_END) === 0) {
        fclose($file);
        return $size;
    }
    $size = PHP_INT_MAX - 1;
    if (fseek($file, PHP_INT_MAX - 1) != 0) {
        fclose($file);
        return false;
    }
    $length = 1048576;
    while (!feof($file)) {
        $read = fread($file, $length);
        $size = bcadd($size, $length);
    }
    $size = bcsub($size, $length);
    $size = bcadd($size, strlen($read));
    fclose($file);
    return $size;
}
function FileSizeConvert($bytes)
{
    $result = NULL;
    $bytes = (int) $bytes;
    $arBytes = [["UNIT" => "TB", "VALUE" => pow(1024, 4)], ["UNIT" => "GB", "VALUE" => pow(1024, 3)], ["UNIT" => "MB", "VALUE" => pow(1024, 2)], ["UNIT" => "KB", "VALUE" => 1024], ["UNIT" => "B", "VALUE" => 1]];
    foreach ($arBytes as $arItem) {
        if ($arItem["VALUE"] < $bytes) {
            $result = $bytes / $arItem["VALUE"];
            $result = str_replace(".", ",", strval(round($result, 2))) . " " . $arItem["UNIT"];
            return $result;
        }
    }
}
function GetCorrectMTime($filePath)
{
    $time = filemtime($filePath);
    $isDST = date("I", $time) == 1;
    $systemDST = date("I") == 1;
    $adjustment = 0;
    if (!$isDST && $systemDST) {
        $adjustment = 3600;
    } else {
        if ($isDST && !$systemDST) {
            $adjustment = -3600;
        } else {
            $adjustment = 0;
        }
    }
    return $time + $adjustment;
}
function DownloadFile($file)
{
    if (file_exists($file)) {
        header("Content-Description: File Transfer");
        header("Content-Type: application/octet-stream");
        header("Content-Disposition: attachment; filename=" . basename($file));
        header("Content-Transfer-Encoding: binary");
        header("Expires: 0");
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
        header("Pragma: public");
        header("Content-Length: " . filesize($file));
        ob_clean();
        flush();
        readfile($file);
        exit;
    }
}
function getFileType($url)
{
    $filename = explode(".", $url);
    $extension = end($filename);
    switch ($extension) {
        case "pdf":
            $type = $extension;
            break;
        case "docx":
        case "doc":
            $type = "word";
            break;
        case "xls":
        case "xlsx":
            $type = "excel";
            break;
        case "mp3":
        case "ogg":
        case "wav":
            $type = "audio";
            break;
        case "mp4":
        case "mov":
            $type = "video";
            break;
        case "zip":
        case "7z":
        case "rar":
            $type = "archive";
            break;
        case "jpg":
        case "jpeg":
        case "png":
            $type = "image";
            break;
        default:
            $type = "alt";
            return $type;
    }
}
function getLocation($ip)
{
    if ($ip = "::1") {
        $data = ["country" => "VN"];
        return $data;
    }
    $url = "http://ipinfo.io/" . $ip;
    $location = json_decode(file_get_contents($url), true);
    return $location;
}
function pagination($url, $start, $total, $kmess)
{
    $out[] = " <div class=\"pagination-style-1\"><ul class=\"pagination mb-0\">";
    $neighbors = 2;
    if ($total < $start) {
        $start = max(0, $total - ($total % $kmess == 0 ? $kmess : $total % $kmess));
    } else {
        $start = max(0, (int) $start - (int) $start % (int) $kmess);
    }
    $base_link = "<li class=\"page-item  \"><a class=\"page-link\" href=\"" . strtr($url, ["%" => "%%"]) . "page=%d" . "\">%s</a></li>";
    $out[] = $start == 0 ? "" : sprintf($base_link, $start / $kmess, "<i class=\"ri-arrow-left-s-line align-middle\"></i>");
    if ($kmess * $neighbors < $start) {
        $out[] = sprintf($base_link, 1, "1");
    }
    if ($kmess * ($neighbors + 1) < $start) {
        $out[] = "<li class=\"page-item disabled\"><a class=\"page-link\">...</a></li>";
    }
    for ($nCont = $neighbors; 1 < $nCont; $nCont--) {
        if ($kmess * $nCont < $start) {
            $tmpStart = $start - $kmess * $nCont;
            $out[] = sprintf($base_link, $tmpStart / $kmess + 1, $tmpStart / $kmess + 1);
        }
    }
    $out[] = "<li class=\"page-item active\"><a class=\"page-link\">" . ($start / $kmess + 1) . "</a></li>";
    $tmpMaxPages = (int) (($total - 1) / $kmess) * $kmess;
    for ($nCont = 1; $nCont < $neighbors; $nCont++) {
        if ($start + $kmess * $nCont < $tmpMaxPages) {
            $tmpStart = $start + $kmess * $nCont;
            $out[] = sprintf($base_link, $tmpStart / $kmess + 1, $tmpStart / $kmess + 1);
        }
    }
    if ($start + $kmess * ($neighbors + 1) < $tmpMaxPages) {
        $out[] = "<li class=\"page-item disabled\"><a class=\"page-link\">...</a></li>";
    }
    if ($start + $kmess * $neighbors < $tmpMaxPages) {
        $out[] = sprintf($base_link, $tmpMaxPages / $kmess + 1, $tmpMaxPages / $kmess + 1);
    }
    if ($start + $kmess < $total) {
        $display_page = $total < $start + $kmess ? $total : $start / $kmess + 2;
        $out[] = sprintf($base_link, $display_page, "<i class=\"ri-arrow-right-s-line align-middle\"></i>");
    }
    $out[] = "</ul></div>";
    return implode("", $out);
}
function pagination_client($url, $start, $total, $kmess)
{
    $out[] = " <div class=\"paging_simple_numbers\"><ul class=\"pagination\">";
    $neighbors = 2;
    if ($total < $start) {
        $start = max(0, $total - ($total % $kmess == 0 ? $kmess : $total % $kmess));
    } else {
        $start = max(0, (int) $start - (int) $start % (int) $kmess);
    }
    $base_link = "<li class=\"paginate_button page-item previous \"><a class=\"page-link\" href=\"" . strtr($url, ["%" => "%%"]) . "page=%d" . "\">%s</a></li>";
    $out[] = $start == 0 ? "" : sprintf($base_link, $start / $kmess, "<i class=\"fas fa-long-arrow-alt-left\"></i>");
    if ($kmess * $neighbors < $start) {
        $out[] = sprintf($base_link, 1, "1");
    }
    if ($kmess * ($neighbors + 1) < $start) {
        $out[] = "<li class=\"paginate_button page-item previous disabled\"><a class=\"page-link\">...</a></li>";
    }
    for ($nCont = $neighbors; 1 < $nCont; $nCont--) {
        if ($kmess * $nCont < $start) {
            $tmpStart = $start - $kmess * $nCont;
            $out[] = sprintf($base_link, $tmpStart / $kmess + 1, $tmpStart / $kmess + 1);
        }
    }
    $out[] = "<li class=\"paginate_button page-item previous\"><a class=\"page-link active\">" . ($start / $kmess + 1) . "</a></li>";
    $tmpMaxPages = (int) (($total - 1) / $kmess) * $kmess;
    for ($nCont = 1; $nCont < $neighbors; $nCont++) {
        if ($start + $kmess * $nCont < $tmpMaxPages) {
            $tmpStart = $start + $kmess * $nCont;
            $out[] = sprintf($base_link, $tmpStart / $kmess + 1, $tmpStart / $kmess + 1);
        }
    }
    if ($start + $kmess * ($neighbors + 1) < $tmpMaxPages) {
        $out[] = "<li class=\"paginate_button page-item previous disabled\"><a class=\"page-link\">...</a></li>";
    }
    if ($start + $kmess * $neighbors < $tmpMaxPages) {
        $out[] = sprintf($base_link, $tmpMaxPages / $kmess + 1, $tmpMaxPages / $kmess + 1);
    }
    if ($start + $kmess < $total) {
        $display_page = $total < $start + $kmess ? $total : $start / $kmess + 2;
        $out[] = sprintf($base_link, $display_page, "<i class=\"fas fa-long-arrow-alt-right\"></i>");
    }
    $out[] = "</ul></div>";
    return implode("", $out);
}
function roundMoney($amount)
{
    $roundedAmount = round($amount, -2);
    $remainder = $amount - $roundedAmount;
    if (50 < $remainder) {
        $roundedAmount .= 100;
    } else {
        if (25 < $remainder) {
            $roundedAmount .= 0;
        } else {
            if (5 < $remainder) {
                $roundedAmount .= 0;
            }
        }
    }
    return $roundedAmount;
}
function check_path($path)
{
    return preg_replace("/[^A-Za-z0-9_-]/", "", check_string($path));
}

?>
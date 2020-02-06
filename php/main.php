<?php
class pn {
public static function NthPrime(int $n) {
    $i = 3;
    $j = 1;
    while (true) {
        $j = $j + 2;
        if ($j > $i / $j) {
            $n--;
            if ($n == 1)
                break;
            $i=$i+2;
            $j = 1;
        }
        elseif ($i % $j == 0) {
            $i=$i+2;
            $j = 1;
        }
    }
    return $i;
}
public static function main() {
    $s = round(microtime(true) * 1000);
    $n = 300000;
    $result = self::NthPrime($n);
    $e = round(microtime(true) * 1000);
    $time = $e - $s;
    echo "第" . $n . "个素数的值是:" . $result . " 耗时" . $time . "毫秒";
}
}
pn::main();
?>
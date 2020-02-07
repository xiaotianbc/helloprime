function nthPrime(n) {
    let i = 3, j = 1;
    while (true) {
        j = j + 2;
        if (j * j > i) {
            n--;
            if (n === 1) {
                return i
            }
            i = i + 2;
            j = 1;

        } else if (i % j === 0) {
            i = i + 2;
            j = 1;
        }
    }
}

let t1 = Date.now();
n = 300000;
result = nthPrime(n);
let t2 = Date.now();
let time = t2 - t1;
console.log("第" + n + "个素数的值是:" + result + " 耗时" + time + "毫秒")

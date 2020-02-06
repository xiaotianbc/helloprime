int nthPrime(int n) {
  var i = 3, j = 1;
  while (true) {
    j = j + 2;
    if (j > i / j) {
      n--;
      if (n == 1) {
        return i;
      }
      i = i + 2;
      j = 1;
    } else if (i % j == 0) {
      i = i + 2;
      j = 1;
    }
  }
}

void main() {
  var n = 300000;
  var t1 = new DateTime.now().millisecondsSinceEpoch;
  var result = nthPrime(n);
  var t2 = new DateTime.now().millisecondsSinceEpoch;
  print('答案是：' + result.toString() + "，耗时：" + (t2 - t1).toString());
}

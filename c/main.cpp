#include <iostream>
#include <sys/time.h>

int NthPrime(int n) {
    int i = 3, j = 1;
    while (true) {
        j = j + 2;
        if (j > i / j) {
            n = n - 1;
            if (n == 1) {
                break;
            }
            i = i + 2;
            j = 1;
        } else if (i % j == 0) {
            i = i + 2;
            j = 1;
        }
    }
    return i;
}

int64_t getCurrentTime() {
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return tv.tv_sec * 1000 + tv.tv_usec / 1000;
}

int main() {
    int64_t s = getCurrentTime();
    int n = 300000;
    int result = NthPrime(n);
    int64_t e = getCurrentTime();
    int64_t time = e - s;
    std::cout << "第" << n << "个素数的值是:" << result << " 耗时" << time << "毫秒" << std::endl;
    return 0;
}


#include <ctime>
#include <iostream>
#include <sys/timeb.h>

using namespace std;


long long GetTimeCuoFromTimeb(timeb t)
{
	return t.time * 1000 + t.millitm;
}

unsigned int NthPrime(unsigned int n) {
	unsigned int i = 3, j = 1;
	while (1) {
		j = j + 2;
		if (j * j > i) {
			n = n - 1;
			if (n == 1) {
				break;
			}
			i = i + 2;
			j = 1;
		}
		else if (i % j == 0) {
			i = i + 2;
			j = 1;
		}
	}
	return i;
}

int main() {

	timeb t;
	ftime(&t);//获取毫秒

	unsigned int n = 300000;
	unsigned int result = NthPrime(n);

	timeb t1;
	ftime(&t1);//获取毫秒

	long long time = GetTimeCuoFromTimeb(t1) - GetTimeCuoFromTimeb(t);
	cout << "答案是" << result << "，耗时" << time;
	cin.get();
}


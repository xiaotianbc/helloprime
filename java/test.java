
public class test {
    public static int NthPrime(int n) {
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

    public static void main(String[] args) {
        long s=System.currentTimeMillis();
        int n=300000;
        int result=NthPrime(n);
        long e=System.currentTimeMillis();
        long time=e-s;
        System.out.println("第" + n + "个素数的值是:" + result + " 耗时" + time + "毫秒");
    }
}


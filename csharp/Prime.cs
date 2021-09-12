
    #region 玩具性能测试
    static int NthPrime(int n)
    {
        int i = 3, j = 1;
        while (true)
        {
            j += 2;
            if (j * j > i)
            {
                n--;
                if (n == 1)
                {
                    break;
                }
                i += 2;
                j = 1;
            }
            else if (i % j == 0)
            {
                i += 2;
                j = 1;
            }
        }
        return i;
    }
    private void TonyBench()
    {
        var s = System.Diagnostics.Stopwatch.StartNew();
        int n = 300000;
        int result = NthPrime(n);
        var t1 = s.ElapsedMilliseconds;
        Debug.Log("第" + n + "个素数的值是:" + result + " 耗时" + t1);
    }
    #endregion

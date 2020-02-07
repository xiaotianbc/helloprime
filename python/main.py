import time

def nthPrime(n):
  i=3
  j=1
  true=1
  while (true==1):
    j=j+2
    if (j*j>i):
      n=n-1
      if (n==1):
        break
      i=i+2
      j=1
    elif (i%j==0):
      i=i+2
      j=1
  return i

n=300000
st=time.time()
st=int(round(st*1000))
result=nthPrime(n)
et=time.time()
et=int(round(et*1000))
print("第" ,n, "个素数的值是:" , str(result) , " 耗时" , str(et - st) , "毫秒")

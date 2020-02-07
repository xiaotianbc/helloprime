def nth_prime(n)
  i=3;
  j=1;
  while :true
    j=j+2;
    if j*j>i
      n=n-1;
      if n==1
        break;
      end
      i=i+2;
      j=1;
    elsif i%j==0
      i=i+2;
      j=1;
    end
  end
  return i;
end
t1 = Time.local
res = nth_prime(300000)
t2 = Time.local
time = (t2 - t1)
puts "答案是#{res},耗时： #{time}s"

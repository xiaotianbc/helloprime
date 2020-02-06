def nth_prime(n)
  i=3;
  j=1;
  while :true
    j=j+2;
    if j>i/j
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
t1 = Time.now
res = nth_prime(300000)
t2 = Time.now
time = ((t2 - t1) * 1000)
puts "答案是#{res},耗时： #{time}ms"
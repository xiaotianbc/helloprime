function NthPrime(n)
    local i=3;
    local j=1;
    while true do
        j=j+2;
        if j>i/j then
            n=n-1;
            if n==1 then
              break;
             end
            i=i+2;
            j=1;
        elseif i%j==0 then
          i=i+2;
          j=1;
          end
    end
    return i;
end

local n=300000;
local t1=os.clock();
local result=NthPrime(n);
local t2=os.clock();
print("答案是"..result.."， 耗时："..(t2-t1).."s");
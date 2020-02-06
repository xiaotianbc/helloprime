import Foundation

func nthPrime(n:Int32) ->Int32{
    var n1:Int32=n
    var i:Int32=3
    var j:Int32=1
    while true {
        j=j+2
        if j>i/j {
            n1=n1-1
            if n1==1 {
                break
            }
            i=i+2
            j=1
        }else{
            if i%j==0 {
                i=i+2
                j=1
            }
        }
    }
return i
}

let n:Int32=300000
let t1 = Date().timeIntervalSince1970
let res=nthPrime(n: n)
let t2 = Date().timeIntervalSince1970
print("答案是\(res)，耗时：\(t2-t1)")


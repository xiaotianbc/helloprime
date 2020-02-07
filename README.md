# Hello, Prme

自从1978年的`The C Programming Language`开始，了解门程序语言都是从Hello world开始。  
可能涉及的语言： [Github Language Stats](https://madnight.github.io/githut/#/pull_requests/2019/4) 。  

## 约定

计算第 `300000`个素数的值：答案是 `4256233`。尽量使用语言自带的时间计算函数统计计算消耗的时间：  
测试计算机：  `Intel Core i7-8700 @  4.30 GHz` .  

由于最近比较熟悉Go，算法就使用Go来展示，下文所有程序都使用此算法：  

* 编译型语言使用`release`版本，由于数据类型对性能的影响还是比较大的，可以指定的都使用`uint32`。
* 在`Swift`和`go`等语言中，代码第五行的`j > i/j`性能比`j * j > i`好20%（而且这俩语言不约而同的20%??），大部分语言都是后者更好，C语言甚至后者比前者快一倍，我会分别测试，选择最好的结果。

```go
func nthPrime(n int) int {
	i, j := 3, 1
	for {
		j = j + 2
		if j > i/j {
			n--
			if n == 1 {
				return i
			}
			i, j = i+2, 1
		} else if i%j == 0 {
			i, j = i+2, 1
		}
	}
}

func main() {
	t1 := time.Now()
	n := 300000
	result := nthPrime(n)
	t2 := time.Since(t1)
	fmt.Printf("答案是:%d,耗时:%s\n", result, t2)
}
```

```shell
❯ go version
go version go1.13.7 darwin/amd64
❯ ./go
答案是:4256233,耗时:2.815581095s
```

## TL;DR

![image](prime.png)

## JavaScript

```js
function nthPrime(n) {
    let i = 3, j = 1;
    while (true) {
        j = j + 2;
        if (j * j > i) {
            n--;
            if (n === 1) {
                return i
            }
            i = i + 2;
            j = 1;

        } else if (i % j === 0) {
            i = i + 2;
            j = 1;
        }
    }
}

let t1 = Date.now();
n = 300000;
result = nthPrime(n);
let t2 = Date.now();
let time = t2 - t1;
console.log("第" + n + "个素数的值是:" + result + " 耗时" + time + "毫秒")
```

```shell
❯ node -v
v13.6.0
❯ node main.js
第300000个素数的值是:4256233 耗时850毫秒
```

## Python3

```python
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
```

```shell
❯ python3 -V
Python 3.7.6
❯ python3 main.py
第 300000 个素数的值是: 4256233  耗时 30349 毫秒
```

## Java

```java
public class test {
    public static int NthPrime(int n) {
        int i = 3, j = 1;
        while (true) {
            j = j + 2;
            if (j * j > i) {
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
```

```shell
❯ java -version
openjdk version "1.8.0_242"
OpenJDK Runtime Environment (AdoptOpenJDK)(build 1.8.0_242-b08)
OpenJDK 64-Bit Server VM (AdoptOpenJDK)(build 25.242-b08, mixed mode)
❯ java test
第300000个素数的值是:4256233 耗时681毫秒
```

## Go

```go
package main

import (
	"fmt"
	"time"
)

func NthPrime32(n uint32) uint32 {
	i, j := uint32(3), uint32(1)
	for {
		j = j + 2
		if j > i/j {
			n--
			if n == 1 {
				return i
			}
			i, j = i+2, 1
			continue
		} else if i%j == 0 {
			i, j = i+2, 1
			continue
		}
	}
}

func main() {
	t1 := time.Now()
	var n uint32 = 300000
	result := NthPrime32(n)
	t2 := time.Since(t1)
	fmt.Printf("答案是:%d,耗时:%s\n", result, t2)
}
```

```shell
❯ go version
go version go1.13.7 darwin/amd64
❯ ./gouint32
答案是:4256233,耗时:619.018742ms
```

## C/Cpp

不懂c，不加编译器优化结果更好。

```cpp
#include <sys/time.h>
#include <stdio.h>

unsigned int NthPrime(unsigned int n) {
    unsigned int i = 3, j = 1;
    while (1) {
        j = j + 2;
        if (j*j > i) {
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
    gettimeofday(&tv,NULL);
    return tv.tv_sec * 1000 + tv.tv_usec / 1000;
}

int main() {
    int64_t s = getCurrentTime();
    unsigned int n = 300000;
    unsigned int result = NthPrime(n);
    int64_t e = getCurrentTime();
    int64_t time = e - s;
    printf("答案是%d，耗时%lld",result,time);
    return 0;
}
```

```shell
❯ gcc -03 main.c
❯ ./a.out
答案是4256233，耗时1887
❯ gcc main.c
❯ ./a.out
答案是4256233，耗时609
```

## Rust

```rust
use chrono::prelude::*;

fn nth_prime(mut n: u32) -> u32 {
    let mut i = 3;
    let mut j = 1;
    loop {
        j = j + 2;
        if j * j > i {
            n = n - 1;
            if n == 1 {
                break;
            }
            i = i + 2;
            j = 1;
        } else if i % j == 0 {
            i = i + 2;
            j = 1;
        }
    }
    return i;
}

fn main() {
    let n = 300000;
    let st: DateTime<Local> = Local::now();
    let result = nth_prime(n);
    let et: DateTime<Local> = Local::now();
    let du = (et - st).num_milliseconds();
    println!("答案是:{},耗时:{}ms", result, du);
}
```

```shell
❯ rustc -V
rustc 1.41.0 (5e1a79984 2020-01-27)
❯ Cargo build --release
❯ /target/release/getprime
答案是:4256233,耗时:492ms
Cargo build --release
```

## php

```php
<?php
class pn {
public static function NthPrime(int $n) {
    $i = 3;
    $j = 1;
    while (true) {
        $j = $j + 2;
        if ($j > $i / $j) {
            $n--;
            if ($n == 1)
                break;
            $i=$i+2;
            $j = 1;
        }
        if ($i % $j == 0) {
            $i=$i+2;
            $j = 1;
        }
    }
    return $i;
}
public static function main() {
    $s = round(microtime(true) * 1000);
    $n = 300000;
    $result = self::NthPrime($n);
    $e = round(microtime(true) * 1000);
    $time = $e - $s;
    echo "第" . $n . "个素数的值是:" . $result . " 耗时" . $time . "毫秒";
}
}
pn::main();
?>
```

```shell
❯ php -v
PHP 7.3.11 (cli) (built: Dec 13 2019 19:21:21) ( NTS )
Copyright (c) 1997-2018 The PHP Group
Zend Engine v3.3.11, Copyright (c) 1998-2018 Zend Technologies
❯ php main.php
第300000个素数的值是:4256233 耗时8871毫秒
```

## Ruby

```ruby
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
t1 = Time.now
res = nth_prime(300000)
t2 = Time.now
time = ((t2 - t1) * 1000)
puts "答案是#{res},耗时： #{time}ms"
```

```shell
❯ ruby -v
ruby 2.6.5p114 (2019-10-01 revision 67812) [x86_64-darwin19]
❯ ruby hello.rb
答案是4256233,耗时： 7782.211ms
```

## Swift

```swift
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
```

```shell
❯ swiftc -v
Apple Swift version 5.1.3 (swiftlang-1100.0.282.1 clang-1100.0.33.15)
Target: x86_64-apple-darwin19.3.0
❯ swiftc -O main.swift
❯ ./main
答案是4256233，耗时：0.6213831901550293
```

## Dart

```dart
int nthPrime(int n) {
  var i = 3, j = 1;
  while (true) {
    j = j + 2;
    if (j * j > i) {
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
  print('答案是：' + result.toString() + "，耗时：" + (t2 - t1).toString()+" ms");
}
```

```shell
❯ dart --version
Dart VM version: 2.7.1 (Thu Jan 23 13:02:26 2020 +0100) on "macos_x64"
❯ dart2native main.dart
Generated: /Users/lei/workspace/helloprime/dart/main.exe
❯ ./main.exe
答案是：4256233，耗时：976 ms
```

## Lua

```lua
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
```

```shell
❯ lua -v
Lua 5.3.5  Copyright (C) 1994-2018 Lua.org, PUC-Rio
❯ lua a.lua
答案是4256233， 耗时：10.081609s
```

## crystal

```ruby
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
```

```shell
❯ crystal -v
Crystal 0.32.1 (2019-12-18)
LLVM: 9.0.0
Default target: x86_64-apple-macosx
❯ crystal build main.cr --release
❯ ./main
答案是4256233,耗时： 00:00:00.832870000s
```


## Perl

```perl
#!/usr/bin/perl

use Time::HiRes qw(time);

sub get_prime{
  $n = @_[0];
  $i=3;
  $j=1;
  while (true){
    $j=$j+2;
    if ($j * $j > $i){
      $n=$n-1;
      if ($n==1){
        last;
      }
      $i=$i+2;
      $j=1;
    }else {
      if ($i%$j==0){
        $i=$i+2;
        $j=1;
      }
    }
  }
  return $i;
}

my $num=300000;
my $t1 = time;
$res=get_prime($num);
my $t2 = time;
my $td=$t2-$t1;
print "答案是： $res ，耗时： $td ms\n";
```

```shell
❯ perl -v
This is perl 5, version 18, subversion 4 (v5.18.4) built for darwin-thread-multi-2level
(with 2 registered patches, see perl -V for more detail)
❯ perl main.pl
答案是： 4256233 ，耗时： 28.5426020622253 ms
```

## Todo

* HasKell
* elixir/erlang

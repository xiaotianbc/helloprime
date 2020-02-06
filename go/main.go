package main

import (
	"fmt"
	"time"
)

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
	n :=300000 
	result := nthPrime(n)
	t2 := time.Since(t1)
	fmt.Printf("答案是:%d,耗时:%s\n", result, t2)
}

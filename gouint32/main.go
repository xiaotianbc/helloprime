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

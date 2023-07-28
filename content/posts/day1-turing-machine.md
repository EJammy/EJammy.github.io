---
title: "Day1 WASM and Turing Machine"
date: 2023-07-25T10:26:17+08:00
draft: true
tags: []
categories: []
ShowToc: false
---


## Goal
Create a turing machine simulator in go and try to run it both the browser and natively.

## Research
https://bbchallenge.org/
https://turingmachine.io/

## Go
```go
package main

import (
	"fmt"
)

// Single linked list
type LL struct {
	val  int
	next *LL
}

func newLL(arr []int) *LL {
	if len(arr) == 0 {
		return nil
	}
	ll := &LL{
		val:  arr[0],
		next: newLL(arr[1:]),
	}
	return ll
}

func (ll *LL) print() {
	if ll == nil {
		fmt.Println()
		return
	}
	fmt.Print(ll.val, " ")
	ll.next.print()
}

// insert next
func (ll *LL) insert(x int) {
	ll.next = &LL{
		val:  x,
		next: ll.next,
	}
}

func main() {
	fmt.Println("Hello, World!")
	ll := newLL([]int{1, 2, 3})
	fmt.Println(ll)
	ll.print()
	ll.insert(10)
	ll.next.next.insert(20)
	ll.print()
}
```

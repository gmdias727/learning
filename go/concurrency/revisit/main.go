package main

import (
	"fmt"
	"time"
)

func main() {
	team1 := "Palmeiras"
	team2 := "Flamengo"

	now := time.Now()
	newRange := now.Unix()
	fmt.Printf("%v\n", newRange)
	fmt.Printf("%T\n", newRange)
	

	go func() {
		fmt.Println("Goroutine start")
		for range newRange {
			fmt.Printf("%s", team1)
		}
		fmt.Println("Goroutine end")
	}()

	go func() {
		fmt.Println("Goroutine start")
		for range newRange {
			fmt.Printf("%s", team2)
		}
		fmt.Println("Goroutine end")
	}()
	time.Sleep(3 * time.Second)
}

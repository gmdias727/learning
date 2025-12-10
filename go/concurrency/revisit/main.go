package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/mattn/go-sqlite3"
)

var db *sql.DB

func dbConnection() {
	var err error
	db, err = sql.Open("sqlite3", "./concurrency.db")
	if err != nil {
		log.Fatal(err)
	}
	
	err = db.Ping()
	if err != nil {
		log.Fatalf("Ping failed %v", err)
	}
	log.Println("Database connected successfully")
}

func main() {
	dbConnection()

	// query := `SELECT id, first_name, last_name, random_number FROM users WHERE id = ?`
	query := `SELECT id, first_name, last_name, random_number FROM Users;`
	// rows, err := db.Query(query)
	rows, err := db.Query(query)
	if err != nil {
		log.Fatalf("Query failed %v", err)
	}
	defer rows.Close()
	// fmt.Printf("Query result: %v\n", rows)

	// rows.Scan(map[string]any{
	// 	&id,
	// })

	for rows.Next() {
		var id int
		var firstName, lastName string
		var randomNumber int

		err := rows.Scan(&id, &firstName, &lastName, &randomNumber)
		if err != nil {
			log.Fatalf("Row scan failed %v", err)
		}
		fmt.Printf("ID: %d, First Name: %s, Last Name: %s, Random Number: %d\n", id, firstName, lastName, randomNumber)
	}

	if err = rows.Err(); err != nil {
		log.Fatalf("Rows iteration error %v", rows.Err())
	}
	// team1 := "Palmeiras"
	// team2 := "Flamengo"

	// now := time.Now()
	// newRange := now.Unix()
	// fmt.Printf("%v\n", newRange)
	// fmt.Printf("%T\n", newRange)

	// go func() {
	// 	fmt.Println("Goroutine start")
	// 	for range newRange {
	// 		fmt.Printf("%s", team1)
	// 	}
	// 	fmt.Println("Goroutine end")
	// }()

	// go func() {
	// 	fmt.Println("Goroutine start")
	// 	for range newRange {
	// 		fmt.Printf("%s", team2)
	// 	}
	// 	fmt.Println("Goroutine end")
	// }()
	// time.Sleep(3 * time.Second)
}

package main

import (
	"log"
	"net/http"
)

func main() {
	mux := http.NewServeMux()

	// Register routes with method patterns (Go 1.22+)
	mux.HandleFunc("GET /users", ListUsers)
	mux.HandleFunc("POST /users", CreateUser)
	mux.HandleFunc("GET /users/{id}", GetUser)
	mux.HandleFunc("DELETE /users/{id}", DeleteUser)

	// Wrap with middleware
	handler := LoggingMiddleware(mux)

	log.Println("Server starting on :8080")
	if err := http.ListenAndServe(":8080", handler); err != nil {
		log.Fatal(err)
	}
}

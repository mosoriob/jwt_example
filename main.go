/*
 * jwt_example
 *
 * No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)
 *
 * API version: 1.0.0
 * Contact: mosorio@isi.edu
 * Generated by: OpenAPI Generator (https://openapi-generator.tech)
 */

package main

import (
	"log"
	"net/http"

	openapi "github.com/mosoriob/jwt_example/go"
)

func main() {
	log.Printf("Server started")

	DefaultApiService := openapi.NewDefaultApiService()
	DefaultApiController := openapi.NewDefaultApiController(DefaultApiService)

	router := openapi.NewRouter(DefaultApiController)

	log.Fatal(http.ListenAndServe(":8080", router))
}
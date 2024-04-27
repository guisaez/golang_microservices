package main

import (
	"os"
	"testing"
)

func TestMain(m *testing.M){

	os.Exit(m.Run()) // will run all tests
}
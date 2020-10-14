package main

import (
	"fmt"
	"runtime"
)

var Version string

func main() {
	fmt.Printf("Version %s\n", Version)
	fmt.Printf("OS: %s\nArchitecture: %s\n", runtime.GOOS, runtime.GOARCH)
}

package main

import (
	"fmt"
	"net/http"
	"time"

	"github.com/alexandrevicenzi/go-sse"
)

var s = sse.NewServer(nil)

// Route
func main() {

	// Create SSE server
	s := sse.NewServer(nil)
	defer s.Shutdown()

	// Configure the route
	http.Handle("/events/", s)
	//e.GET("events/my-channel", send)

	// Send messages every 5 seconds
	go func() {
		i := 0
		for {
			i++
			if i > 4 {
				i = 0
			}
			num := fmt.Sprintf("%d", i)

			s.SendMessage("/events/"+num, sse.SimpleMessage(time.Now().Format("15:04:05")+"hello frends "+num))

			time.Sleep(time.Second)
		}
	}()

	http.ListenAndServe(":3000", nil)
}

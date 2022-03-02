package main

import (
	"log"
	"net/http"
	"time"

	"github.com/alexandrevicenzi/go-sse"
)

func main() {
	// Create SSE server
	s := sse.NewServer(nil)
	defer s.Shutdown()

	// Configure the route
	http.Handle("/events/", s)

	// Send messages every 5 seconds
	go func() {
		for {
			s.SendMessage("/events/my-channel", sse.SimpleMessage(time.Now().Format("2006/02/01/ 15:04:05")+"hello frends"))

			time.Sleep(5 * time.Second)
		}
	}()
	go func() {
		for {
			s.SendMessage("/events/channel1", sse.SimpleMessage(time.Now().Format("15:04:05")+" hello frends in channel 1"))

			time.Sleep(5 * time.Second)
		}
	}()

	log.Println("Listening at :3000")
	http.ListenAndServe(":3000", nil)
}

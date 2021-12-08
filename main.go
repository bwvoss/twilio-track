package main

import (
	"github.com/gin-gonic/gin"
	"github.com/twilio/twilio-go"
  "os"
  openapi "github.com/twilio/twilio-go/rest/api/v2010"
)

func main() {
  r := gin.Default()

	r.GET("/send-text", func(c *gin.Context) {
    client := twilio.NewRestClientWithParams(twilio.RestClientParams{
      Username: os.Getenv("TWILIO_ACCOUNT_SID"),
      Password: os.Getenv("TWILIO_AUTH_TOKEN"),
    })

    params := &openapi.CreateMessageParams{}
    params.SetTo(os.Getenv("FROM_PHONE_NUMBER"))
    params.SetFrom(os.Getenv("TWILIO_PHONE_NUMBER"))
    params.SetBody("Hello there")

    _, err := client.ApiV2010.CreateMessage(params)
    if err != nil {
      c.JSON(500, gin.H{
        "message": err.Error(),
      })
    } else {
      c.JSON(200, gin.H{
        "message": "message sent",
      })
    }
	})

	r.Run()
}

package main

	//"net/http"
import (
	"github.com/gin-gonic/gin"
)

func main() {
  r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})
	r.Run()
}

//func foo(c *gin.Context) {
	//c.Header("Content-Type","application/xml")
	//c.String(http.StatusOK, "<Response><Message>bar</Message></Response>")
//}

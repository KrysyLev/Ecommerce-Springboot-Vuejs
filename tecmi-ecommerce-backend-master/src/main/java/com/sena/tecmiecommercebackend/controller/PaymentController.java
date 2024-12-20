package com.sena.tecmiecommercebackend.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaymentController {

    @GetMapping("/payment/success")
    public ResponseEntity<String> paymentSuccess() {
        // HTML content with embedded CSS
        String htmlResponse = "<!DOCTYPE html>" +
                "<html lang=\"en\">" +
                "<head>" +
                "<meta charset=\"UTF-8\">" +
                "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">" +
                "<title>Payment Success</title>" +
                "<style>" +
                "body {" +
                "    font-family: 'Arial', sans-serif;" +
                "    background-color: #f4f7fa;" +
                "    color: #333;" +
                "    display: flex;" +
                "    justify-content: center;" +
                "    align-items: center;" +
                "    height: 100vh;" +
                "    margin: 0;" +
                "}" +
                ".container {" +
                "    text-align: center;" +
                "    padding: 30px;" +
                "    background-color: #fff;" +
                "    border-radius: 8px;" +
                "    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);" +
                "    max-width: 600px;" +
                "    width: 100%;" +
                "}" +
                ".icon {" +
                "    font-size: 50px;" +
                "    color: #28a745;" +
                "}" +
                "h1 {" +
                "    font-size: 36px;" +
                "    color: #333;" +
                "}" +
                "p {" +
                "    font-size: 18px;" +
                "    color: #666;" +
                "}" +
                ".btn {" +
                "    background-color: #28a745;" +
                "    color: white;" +
                "    padding: 10px 20px;" +
                "    font-size: 16px;" +
                "    border: none;" +
                "    border-radius: 5px;" +
                "    cursor: pointer;" +
                "    margin-top: 30px;" +
                "}" +
                ".btn:hover {" +
                "    background-color: #218838;" +
                "}" +
                "</style>" +
                "</head>" +
                "<body>" +
                "<div class=\"container\">" +
                "<div class=\"icon\">" +
                "&#10004;" + // Check mark icon
                "</div>" +
                "<h1>Payment Successful!</h1>" +
                "<p>Your order has been placed successfully. You will be redirected shortly.</p>" +
                "<button class=\"btn\" onclick=\"window.location.href='/order'\">Go to Orders</button>" +
                "</div>" +
                "<script>" +
                "setTimeout(function() {" +
                "    window.location.href = '/order';" +
                "}, 5000); // Redirect after 5 seconds" +
                "</script>" +
                "</body>" +
                "</html>";

        // Return HTML as the response
        return new ResponseEntity<>(htmlResponse, HttpStatus.OK);
    }

    @GetMapping("/payment/failed")
    public ResponseEntity<String> paymentFailed() {
        return new ResponseEntity<>("Payment Failed. Please try again.", HttpStatus.BAD_REQUEST);
    }
}

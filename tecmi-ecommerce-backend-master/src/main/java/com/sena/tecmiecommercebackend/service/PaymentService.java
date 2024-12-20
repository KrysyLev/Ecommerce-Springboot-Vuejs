package com.sena.tecmiecommercebackend.service;

import com.sena.tecmiecommercebackend.exceptions.AuthenticationFailException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PaymentService {

    // Method to process payment and announce success (no database update)
    public void processPaymentAndCreateOrder(String token, List<String> productDetails, Double totalPrice) throws AuthenticationFailException {
        // Check if the token is valid (dummy check here, implement actual logic)
        if (token == null || token.isEmpty()) {
            throw new AuthenticationFailException("Invalid token. Please check your payment.");
        }

        // Dummy logic for processing payment
        boolean paymentSuccess = processDummyPayment(totalPrice);

        if (paymentSuccess) {
            // Announce payment success
            System.out.println("Payment Successful!");
            System.out.println("Order Details: " + productDetails);
            System.out.println("Total Price: " + totalPrice);
        } else {
            throw new AuthenticationFailException("Payment failed. Please try again.");
        }
    }

    // Dummy method for simulating payment processing
    private boolean processDummyPayment(Double totalPrice) {
        // Simulating a simple payment process (always returns true for the sake of this example)
        return totalPrice > 0;
    }
}

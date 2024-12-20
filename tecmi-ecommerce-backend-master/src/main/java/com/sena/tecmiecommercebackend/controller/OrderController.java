package com.sena.tecmiecommercebackend.controller;

import com.sena.tecmiecommercebackend.common.ApiResponse;
import com.sena.tecmiecommercebackend.dto.stripe.CheckoutItemDto;
import com.sena.tecmiecommercebackend.dto.stripe.StripeResponse;
import com.sena.tecmiecommercebackend.exceptions.AuthenticationFailException;
import com.sena.tecmiecommercebackend.exceptions.OrderNotFoundException;
import com.sena.tecmiecommercebackend.repository.entity.Order;
import com.sena.tecmiecommercebackend.repository.entity.User;
import com.sena.tecmiecommercebackend.service.AuthenticationService;
import com.sena.tecmiecommercebackend.service.OrderService;
import com.stripe.exception.StripeException;
import com.stripe.model.checkout.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/order")
public class OrderController {

    private final OrderService orderService;
    private final AuthenticationService authenticationService;

    @Autowired
    public OrderController(OrderService orderService, AuthenticationService authenticationService) {
        this.orderService = orderService;
        this.authenticationService = authenticationService;
    }

    @GetMapping("/")
    public ResponseEntity<List<Order>> getAllOrders(@RequestParam("token") String token) {
        try {
            authenticationService.authenticate(token);
            User user = authenticationService.getUser(token);
            List<Order> orderList = orderService.listOrders(user);
            return ResponseEntity.ok(orderList);
        } catch (AuthenticationFailException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
    }

    @PostMapping("/checkout-session")
    public ResponseEntity<StripeResponse> createCheckoutSession(@RequestBody List<CheckoutItemDto> checkoutItemDtoList) {
        try {
            Session session = orderService.createSession(checkoutItemDtoList);
            StripeResponse stripeResponse = new StripeResponse(session.getId());
            return ResponseEntity.ok(stripeResponse);
        } catch (StripeException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(new StripeResponse("Stripe session creation failed: " + e.getMessage()));
        }
    }

    @PostMapping("/add")
    public ResponseEntity<ApiResponse> placeOrder(
            @RequestParam("token") String token,
            @RequestParam("sessionId") String sessionId) {
        if (sessionId == null || sessionId.isEmpty()) {
            return ResponseEntity.badRequest().body(new ApiResponse(false, "Session ID is missing."));
        }

        try {
            authenticationService.authenticate(token);
            User user = authenticationService.getUser(token);
            orderService.placeOrder(user, sessionId);
            return new ResponseEntity<>(new ApiResponse(true, "Order has been placed."), HttpStatus.CREATED);
        } catch (AuthenticationFailException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                .body(new ApiResponse(false, "Authentication failed: " + e.getMessage()));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(new ApiResponse(false, "Failed to place order: " + e.getMessage()));
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<Object> getOrderById(
            @PathVariable("id") Integer id,
            @RequestParam("token") String token) {
        try {
            authenticationService.authenticate(token);
            Order order = orderService.getOrder(id);
            return ResponseEntity.ok(order);
        } catch (AuthenticationFailException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Authentication failed: " + e.getMessage());
        } catch (OrderNotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }
}

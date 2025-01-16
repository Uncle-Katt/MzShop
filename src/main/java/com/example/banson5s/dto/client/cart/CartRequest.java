package com.example.banson5s.dto.client.cart;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class CartRequest {
    private String customerId;
    private String nameAddress;
    private String phoneAddress;
    private String address;
    private String shipMoney;
    private List<CartIItemRequest> lstProductDetail;
}

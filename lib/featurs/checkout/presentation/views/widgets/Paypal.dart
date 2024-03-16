  import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

void paypal(BuildContext context) {
      Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId:
        "AZm1OV9keMDkgB-INefMveytNPL6drA0SM79yZZArhiJdPqydfXsjze9mhY3BwCkosVTNDiG88LFmCL8",
          //  "AdDedsGfgYWq3ZIsF1d3tNyd-BDP4NGfitUnBt7uUX8aOr7LOMykSzSANuI2_-FtA6OlbKQ4MS3zvKiH",
            
        secretKey:
        "EFYxlvJo6BFgxABPDf1liM_F4Md0ACc7aLjp2TwWqDOwCLGmFBTB1IVcdUNcqTNLcTRFLULJR6GNtcSF",
           // "EOQ2tDTUdlCx5jy46ibTHl5bgBWpNyTB15oitzA0veeKK03EDNUjIiZ7-2Vtf2F4SeectDpTD-HwkCpp",
            
        transactions: const [
          {
            "amount": {
              "total": '100',
              "currency": "USD",
              "details": {
                "subtotal": '100',
                "shipping": '0',
                "shipping_discount": 0
              }
            },
            "description": "The payment transaction description.",
            "item_list": {
              "items": [
                {
                  "name": "Apple",
                  "quantity": 4,
                  "price": '10',
                  "currency": "USD"
                },
                {
                  "name": "Pineapple",
                  "quantity": 5,
                  "price": '12',
                  "currency": "USD"
                }
              ],
    
              // Optional
              //   "shipping_address": {
              //     "recipient_name": "Tharwat samy",
              //     "line1": "tharwat",
              //     "line2": "",
              //     "city": "tharwat",
              //     "country_code": "EG",
              //     "postal_code": "25025",
              //     "phone": "+00000000",
              //     "state": "ALex"
              //  },
            }
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
                
  }

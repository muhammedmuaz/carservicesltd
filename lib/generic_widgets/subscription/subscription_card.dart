import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

class CarServicesSubscriptionCard extends StatelessWidget {
  final String title;
  final String price;
  final List<String> features;

  const CarServicesSubscriptionCard({
    super.key,
    required this.title,
    required this.price,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              price,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: features
                  .map(
                    (feature) => Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          feature,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => PaypalCheckout(
                    sandboxMode: true,
                    clientId:
                        "AYUYrXOFlav_4to-tgzfoAMYa9CfarGuljCplq0AdBlCcuW8Ha2SHKb6BL9QoQL2RcHcj6poyOKBfgpH",
                    secretKey:
                        "EHgyGrrXaANn3wV4SbZzpjTHjCSTWAu37QW8hxWaLvQp125Pu8o1hVvCFbAkXyWqJ9GwGas6ysVKW1NI",
                    returnURL: "https://samplesite.com/return",
                    cancelURL: "https://samplesite.com/cancel",
                    transactions: const [
                      {
                        "amount": {
                          "total": '70',
                          "currency": "USD",
                          "details": {
                            "subtotal": '70',
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
                              "price": '5',
                              "currency": "USD"
                            },
                            {
                              "name": "Pineapple",
                              "quantity": 5,
                              "price": '10',
                              "currency": "USD"
                            }
                          ],
                          // shipping address is Optional
                          "shipping_address": {
                            "recipient_name": "Raman Singh",
                            "line1": "Delhi",
                            "line2": "",
                            "city": "Delhi",
                            "country_code": "IN",
                            "postal_code": "11001",
                            "phone": "+00000000",
                            "state": "Texas"
                          },
                        }
                      }
                    ],
                    note: "PAYMENT_NOTE",
                    onSuccess: (Map params) async {
                      print("onSuccess: $params");
                    },
                    onError: (error) {
                      print("onError: $error");
                      Navigator.pop(context);
                    },
                    onCancel: () {
                      print('cancelled:');
                    },
                  ),
                ));
              },
              child: const Text('Subscribe'),
            ),
          ],
        ),
      ),
    );
  }
}

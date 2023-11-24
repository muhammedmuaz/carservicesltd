import 'package:flutter/material.dart';

class SubscriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription'),
        backgroundColor: const Color(0xff264653),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SubscriptionCard(
                duration: '3 Months',
                price: '\$15.00',
                features: const [
                  'Service Due Date Reminder',
                  'Insurance Reminder',
                  'Fuel Cost Calculator',
                  'Road Tax Reminder',
                ],
                onPressed: () {
                  // Implement action when subscribe button is pressed
                },
              ),
              const SizedBox(height: 20),
              SubscriptionCard(
                duration: '6 Months',
                price: '\$25.00',
                features: const [
                  'Service Due Date Reminder',
                  'Insurance Reminder',
                  'Fuel Cost Calculator',
                  'Road Tax Reminder',
                ],
                onPressed: () {
                  // Implement action when subscribe button is pressed
                },
              ),
              const SizedBox(height: 20),
              SubscriptionCard(
                duration: '12 Months',
                price: '\$30.00',
                features: const [
                  'Service Due Date Reminder',
                  'Insurance Reminder',
                  'Fuel Cost Calculator',
                  'Road Tax Reminder',
                ],
                onPressed: () {
                  // Implement action when subscribe button is pressed
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubscriptionCard extends StatelessWidget {
  final String duration;
  final String price;
  final List<String> features;
  final VoidCallback onPressed;

  SubscriptionCard({
    required this.duration,
    required this.price,
    required this.features,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              duration,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              price,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: features
                  .map(
                    (feature) => Text(
                      '• $feature',
                      style: const TextStyle(fontSize: 14),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff264653),
              ),
              child: const Text('Subscribe'),
            ),
          ],
        ),
      ),
    );
  }
}

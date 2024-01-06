import 'package:flutter/material.dart';
import '../../generic_widgets/subscription/subscription_card.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription Plans'),
      ),
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarServicesSubscriptionCard(
                title: '3 Months',
                price: '\$15.00/month',
                features: [
                  'Service Due Date Reminder',
                  'Insurance Reminder',
                  'Fuel Cost Caliculator',
                  'Road Tax Reminder',
                  'Google Maps'
                ],
              ),
              SizedBox(height: 20),
              CarServicesSubscriptionCard(
                title: '6 Months',
                price: '\$25.00/month',
                features: [
                  'Service Due Date Reminder',
                  'Insurance Reminder',
                  'Fuel Cost Caliculator',
                  'Road Tax Reminder',
                  'Google Maps'
                ],
              ),
              SizedBox(height: 20),
              CarServicesSubscriptionCard(
                title: '12 Months',
                price: '\$30.00/month',
                features: [
                  'Service Due Date Reminder',
                  'Insurance Reminder',
                  'Fuel Cost Caliculator',
                  'Road Tax Reminder',
                  'Google Maps'
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

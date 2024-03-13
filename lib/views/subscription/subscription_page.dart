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
                title: 'Silver',
                price: '\$ 100',
                features: [
                  'Service Due Date Reminder',
                  'Insurance Reminder',
                  'Fuel Cost Caliculator',
                  'Road Tax Reminder',
                  'Basic Features Without Maps'
                ],
              ),
              SizedBox(height: 20),
              CarServicesSubscriptionCard(
                title: 'Gold',
                price: '\$200',
                features: [
                  'Service Due Date Reminder',
                  'Insurance Reminder',
                  'Fuel Cost Caliculator',
                  'Road Tax Reminder',
                  'Maps Chat Support 2 Sponsored Posts'
                ],
              ),
              SizedBox(height: 20),
              CarServicesSubscriptionCard(
                title: 'Platinum',
                price: '\$300',
                features: [
                  'Service Due Date Reminder',
                  'Insurance Reminder',
                  'Fuel Cost Caliculator',
                  'Road Tax Reminder',
                  'Maps Chat Support 4 Sponsored Posts'
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

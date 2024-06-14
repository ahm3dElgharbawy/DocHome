import 'package:dochome/utils/api/endpoints.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentTestScreen extends StatefulWidget {
  const PaymentTestScreen({super.key});

  @override
  _PaymentTestScreenState createState() => _PaymentTestScreenState();
}

class _PaymentTestScreenState extends State<PaymentTestScreen> {
  Map<String, dynamic>? paymentIntentData;

  Future<void> _createPaymentIntent(int amount) async {
    try {
      final response = await http.post(
        Uri.parse('${EndPoints.baseUrl}/create-payment-intent'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'amount': amount}),
      );
      print(response.body);
      paymentIntentData = jsonDecode(response.body);
    } catch (err) {
      print('Error creating payment intent: $err');
    }
  }

  Future<void> _pay() async {
    try {
      await _createPaymentIntent(70);

      if (paymentIntentData == null) {
        'Failed to create payment intent'.showAsToast(Colors.red);
        return;
      }

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          merchantDisplayName: 'Your Merchant Name',
        ),
      );

      await Stripe.instance.presentPaymentSheet();
      'Payment Successful!'.showAsToast(Colors.green);
    } catch (e) {
      if (e is StripeException) {
        'Payment Failed: ${e.error.localizedMessage}'.showAsToast(Colors.red);
      } else {
        'Payment Failed: ${e.toString()}'.showAsToast(Colors.red);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stripe Payment')),
      body: Center(
        child: ElevatedButton(
          onPressed: _pay,
          child: const Text('Pay 70 EGP'),
        ),
      ),
    );
  }
}

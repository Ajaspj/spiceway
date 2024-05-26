// import 'package:flutter/material.dart';
// import 'package:spiceway/constants/colorconstants.dart/colorconstants.dart';
// import 'package:stripe_payment/stripe_payment.dart';

// class Paymentscreen extends StatefulWidget {
//   const Paymentscreen({super.key});

//   @override
//   State<Paymentscreen> createState() => _PaymentscreenState();
// }

// class _PaymentscreenState extends State<Paymentscreen> {
//   final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
//   void initState() {
//     super.initState();

//     StripePayment.setOptions(
//       StripeOptions(
//         publishableKey: "your_publishable_key",
//         merchantId: "Test",
//         androidPayMode: 'test',
//       ),
//     );
//   }

//   void _startPayment() {
//     StripePayment.paymentRequestWithCardForm(
//       CardFormPaymentRequest(),
//     ).then((paymentMethod) {
//       _scaffoldKey.currentState?.showSnackBar(SnackBar(
//         content: Text('Received ${paymentMethod.id}'),
//       ));
//       // Send the paymentMethod.id to your server to process the payment
//     }).catchError((e) {
//       print('Error: $e');
//       _scaffoldKey.currentState?.showSnackBar(SnackBar(
//         content: Text('Payment failed: $e'),
//       ));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConstants.primaryGreen,
//       key: _scaffoldKey,
//       appBar: AppBar(
//         backgroundColor: ColorConstants.primaryGreen,
//         title: Text(
//           'Payment',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _startPayment,
//           child: Text(
//             'Pay with Card',
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

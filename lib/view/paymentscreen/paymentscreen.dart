// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:upi_india/upi_india.dart';

// class Paymentscreen extends StatefulWidget {
//   const Paymentscreen({super.key});

//   @override
//   State<Paymentscreen> createState() => _PaymentscreenState();
// }

// class _PaymentscreenState extends State<Paymentscreen> {
//   Future<UpiResponse>? transaction;
//   final UpiIndia _upiIndia = UpiIndia();
//   List<UpiApp>? apps;
//   TextStyle header = TextStyle(
//     fontSize: 18,
//   );
//   @override
//   void initstate() {
//     _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
//       setState(() {
//         apps = value;
//       });
//     }).catchError((e) {
//       print(e);
//       apps = [];
//     });
//     super.initState();
//   }
//  Future<UpiResponse> initiatetransaction(UpiApp app) async{...}
//  Widget displayupiapps(){
//   if(apps == null){
//     return Center(
//       child: CircularProgressIndicator()
//     );
//   }else if(apps!.isEmpty){
//     return Center(
//       child: Text("no apps found for transaction"),
//     );
//   }else{
//     return
//   }
//  }



//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

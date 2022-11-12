import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:tradom_io/screens/userside/tutorialscreen/tutorialscreen.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  var _razorpay = Razorpay();

  @override
  void initState() {
    // TODO: implement initState

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print('payment done');
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TutorialScrenn(),
    ));
    // log(response.signature.toString());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print('payment failed');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }
  var amount = '500';
  final amountcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    amountcontroller.text = amount;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'You need to pay for tutorial video access',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 31, 132, 122)),
          ),
          Divider(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              style: TextStyle(fontSize: 18),
              keyboardType: TextInputType.number,
              controller: amountcontroller,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                errorStyle: const TextStyle(
                    fontSize: 12.5,
                    height: .6,
                    color: Colors.white,
                    letterSpacing: 1),
                prefixIcon: const Icon(
                  Icons.currency_rupee,
                  color: Color.fromARGB(255, 31, 132, 122),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 13.0,
                  horizontal: 10.0,
                ),
                focusColor: Colors.black,
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                hintText: 'Enter Amount',
                hintStyle: TextStyle(fontSize: 17),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                var options = {
                  'key': 'rzp_test_GvnCt2Gd3dg3Tv',
                  'amount': amountcontroller.text,
                  'name': 'Tradom.io',
                  'description': 'Demo',
                  'timeout': 300,
                  'prefill': {
                    'contact': '8888888888',
                    'email': 'test@razorpay.com'
                  }
                };

                _razorpay.open(options);
              },
              child: Text(
                'Pay Amount',
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 31, 132, 122),
              ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}

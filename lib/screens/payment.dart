import 'package:flutter/material.dart';
import 'package:tweelve/screens/home.dart';

class MyAppState extends StatefulWidget {
  const MyAppState({Key? key}) : super(key: key);

  @override
  State<MyAppState> createState() => _MyAppStateState();
}

class _MyAppStateState extends State<MyAppState> {
  String _selectedMethod = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFFFA5463),
              centerTitle: true,
              title: Text(
                'Payment',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Builder(
                builder: (BuildContext context) {
                  return Stack(
                    children: <Widget>[
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          color: Color(0xFFFA5463),
                        ),
                      ),
                      Positioned(
                        top: 70,
                        left: 16,
                        right: 16,
                        child: Center(
                          child: Container(
                            height: 600.0,
                            child: Container(
                              height: 550.0,
                              child: SingleChildScrollView(
                                child: Card(
                                  color: Colors.white,
                                  elevation: 6.0,
                                  margin: EdgeInsets.only(right: 15.0, left: 15.0),
                                  child: Wrap(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 20,
                                            horizontal: 38.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 20.0),
                                              child: Icon(
                                                Icons.currency_rupee,
                                                color: Colors.blue.shade900,
                                                size: 20,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 20.0),
                                              child: Text(
                                                '1000',
                                                style: TextStyle(
                                                    fontSize: 35.0,
                                                    color: Colors.blue.shade900),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 28.0),
                                        child: Container(
                                          child: Text(
                                            'The amount you need to pay',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.grey.shade500),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 28.0),
                                        child: Container(
                                          child: Text(
                                            'Select an option to pay',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 60,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 28.0),
                                        child: Column(
                                          children: [
                                            PaymentMethodContainer(
                                              image: Image.asset('assets/image/paytm.png'),
                                              method: 'PayTm',
                                              isSelected:
                                              _selectedMethod == 'PayTm',
                                              onSelected: () {
                                                setState(() {
                                                  _selectedMethod = 'PayTm';
                                                });
                                              },
                                            ),
                                            PaymentMethodContainer(
                                              image: Image.asset('assets/image/phonepay.png'),
                                              method: 'Phonepe',
                                              isSelected:
                                              _selectedMethod == 'Phonepe',
                                              onSelected: () {
                                                setState(() {
                                                  _selectedMethod = 'Phonepe';
                                                });
                                              },
                                            ),
                                            PaymentMethodContainer(
                                              image: Image.asset('assets/image/gpay.png'),
                                              method: 'GooglePay',
                                              isSelected:
                                              _selectedMethod == 'GooglePay',
                                              onSelected: () {
                                                setState(() {
                                                  _selectedMethod = 'GooglePay';
                                                });
                                              },
                                            ),
                                            PaymentMethodContainer(
                                              image: Image.asset('assets/image/bhim.png'),
                                              method: 'Bhim',
                                              isSelected: _selectedMethod == 'Bhim',
                                              onSelected: () {
                                                setState(() {
                                                  _selectedMethod = 'Bhim';
                                                });
                                              },
                                            ),
                                            PaymentMethodContainer(
                                              image: Image.asset('assets/image/other.png'),
                                              method: 'Other',
                                              isSelected:
                                              _selectedMethod == 'Other',
                                              onSelected: () {
                                                setState(() {
                                                  _selectedMethod = 'Other';
                                                });
                                              },
                                            ),
                                            SizedBox(height: 20,),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            padding: EdgeInsets.only(bottom: 10),
                          ),
                        ),
                      ),
                      Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(padding: EdgeInsets.only(top: 628.0)),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomePage()),
                                  );
                                },
                                child: Container(
                                  height: 55,
                                  width: 300,
                                  margin: EdgeInsets.symmetric(vertical: 5.0),
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFA5463),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 85.0),
                                    child: Row(
                                      children: [
                                        Text('Pay',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            )),
                                        Icon(
                                          Icons.currency_rupee,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        Text('1000',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ],
                  );
                },
              ),
            )));
  }
}



class PaymentMethodContainer extends StatelessWidget {
  final String method;
  final bool isSelected;
  final VoidCallback onSelected;
  final Image image;

  const PaymentMethodContainer({
    Key? key,
    required this.method,
    required this.isSelected,
    required this.onSelected,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: [
            CircleAvatar(child: image,
              backgroundColor: Colors.white,),
            SizedBox(width: 10.0),
            Text(
              method,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10.0),
            Spacer(),
            Radio<String>(
              value: method,
              groupValue: isSelected ? method : null,
              onChanged: (_) {
                onSelected();
              },
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class User {
  final String name;
  int price;

  User(this.name, this.price);
}

class SignUpWidget extends StatefulWidget {
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  List<User> _users = [];
  int _signUpCount = 0;

  void _handleSignUp(String name) {
    setState(() {
      _signUpCount++;
      _users.insert(0, User(name, 1000));
      if (_signUpCount % 6 == 0) {
        _showApplyPopup();
      }
    });
  }

  void _showApplyPopup() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('Double the Balance ?'),
          actions: [
            Center(
              child: TextButton(
                child: Text('Apply'),
                onPressed: () {
                  _doubleBalance();
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void _doubleBalance() {
    int doubledPrice = _users[0].price * 2;
    setState(() {
      _users[0].price = doubledPrice;
      _users.add(_users.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade500,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.yellow.shade600,
              Colors.orange.shade400,
              Colors.orangeAccent,
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: CircleAvatar(
                            radius: 40.0,
                            backgroundImage:
                                AssetImage('assets/images/avatar2.png'),
                          ),
                        ),
                        SizedBox(width: 33.0),
                        Expanded(
                          child: Text('My ID',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('SI No.',style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),),),
                        DataColumn(label: Text('Name',style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ))),
                        DataColumn(label: Text('Price',style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ))),
                      ],
                      rows: _users.map((user) {
                        int index = _users.indexOf(user);
                        return DataRow(cells: [
                          DataCell(Text('${_users.length - index}')),
                          DataCell(Text(user.name)),
                          DataCell(Text('${user.price}')),
                        ]);
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
        onPressed: () {
          _handleSignUp('user${_signUpCount + 1}');
        },
      ),
    );
  }
}
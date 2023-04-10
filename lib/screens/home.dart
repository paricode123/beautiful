import 'package:flutter/material.dart';
import 'package:tweelve/screens/table_page.dart';
import 'package:tweelve/screens/my_gift.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

   List<String> textList = [   "My ID",    "My Gift",    "Privacy & Policy",    "Settings",    "Logout"  ];
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFFA5463),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16.0),
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
                            backgroundImage: AssetImage('assets/images/avatar2.png'),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Text('My Account'),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                      )),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                          ),
                      SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => SignUpWidget()),
                                    );
                                  },
                                  child: _buildContainer(textList[0])),
                              SizedBox(height: 20.0),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => MyRewards()),
                                    );
                                  },
                                  child: _buildContainer(textList[1])),
                              SizedBox(height: 20.0),
                              _buildContainer(textList[2]),
                              SizedBox(height: 20.0),
                              _buildContainer(textList[3]),
                              SizedBox(height: 20.0),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Logout'),
                                        content: Text('Are you sure you want to log out?'),
                                        actions: [
                                          TextButton(
                                            child: Text('Logout'),
                                            onPressed: () {
                                              // Perform logout logic here
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text('Cancel'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: _buildContainer(textList[4]),
                              )

                            ],
                          ),
                        ),
                      ),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
  Widget _buildContainer(String text) {
    return Container(
      height: 80.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(child: Text(text)),
    );
  }
}

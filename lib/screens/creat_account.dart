import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreatAccount extends StatefulWidget {
  final Function() onClickedSignIn;
  const CreatAccount({Key? key, required this.onClickedSignIn}) : super(key: key);

  @override
  State<CreatAccount> createState() => _CreatAccountState();
}

class _CreatAccountState extends State<CreatAccount> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _phoneNumber = '';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  TextEditingController _nameController = TextEditingController();
  late SharedPreferences prefs;

  @override
  void initState() {

    super.initState();
    getdata();

  }

  @override
  void dispose() {
    _nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  void _saveProfile(path) async{
    prefs= await SharedPreferences.getInstance();
    prefs.setString('name', _nameController.text)??'';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Text(
                      "Create Account",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                        decoration: InputDecoration(
                                          labelText: 'Name',
                                          hintText: 'Enter your name',
                                        ),
                                        controller: _nameController,
                                        onChanged: (value){
                                          prefs.setString('name', value);
                                        }
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Phone Number',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your phone number';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _phoneNumber = value!;
                                      },
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                      controller: emailController,
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                      ),
                                      autovalidateMode: AutovalidateMode
                                          .onUserInteraction,
                                      validator: (email) =>
                                      email != null &&
                                          !EmailValidator.validate(email)
                                          ? 'Enter a valid email'
                                          : null,
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                      ),
                                      obscureText: true,
                                      autovalidateMode: AutovalidateMode
                                          .onUserInteraction,
                                      validator: (value) =>
                                      value != null && value.length < 6
                                          ? 'Enter min. 6 characters'
                                          : null,
                                    ),
                                    SizedBox(height: 40),
                                    GestureDetector(
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          signUp();
                                        }
                                      },
                                      child: Container(
                                        height: 50,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 50),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.yellow.shade600,
                                              Colors.orange.shade400,
                                              Colors.orangeAccent,
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "SignUp",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                )),
          ],
        ),
      ),
    );
  }

  void signUp() async {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());
        widget.onClickedSignIn(); // Navigate back to the previous screen
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    }
  }
  void getdata() async {
    prefs= await SharedPreferences.getInstance();
    setState(() {
      _nameController.text=prefs.getString('name')??'';
    });

  }
}

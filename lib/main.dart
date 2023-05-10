import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tweelve/screens/splash.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'Menu Bar !',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            decoration: BoxDecoration(
                color: Color(0xFFFA5463),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.input,size: 35,),
            title: Text('Welcome',style: TextStyle(fontSize: 18),),
            onTap: () => {},
          ),
          SizedBox(height: 30,),
          ListTile(
            leading: Icon(Icons.verified_user,size: 35,),
            title: Text('My ID',style: TextStyle(fontSize: 18),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          SizedBox(height: 30,),
          ListTile(
            leading: Icon(Icons.card_giftcard,size: 35,),
            title: Text('My Gift',style: TextStyle(fontSize: 18),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          SizedBox(height: 30,),
          ListTile(
            leading: Icon(Icons.border_color,size: 35,),
            title: Text('Privacy & Policy',style: TextStyle(fontSize: 18),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          SizedBox(height: 30,),
          ListTile(
            leading: Icon(Icons.settings,size: 35,),
            title: Text('Settings',style: TextStyle(fontSize: 18),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          SizedBox(height: 30,),
          ListTile(
            leading: Icon(Icons.logout_rounded,size: 35,),
            title: Text('LogOut'),
            // trailing: ElevatedButton(
            //   onPressed: () => FirebaseAuth.instance.signOut(),
            //   child: Text('Button'),
            ),

          // GestureDetector(
          //   onTap: () => FirebaseAuth.instance.logOut(),
          //   child: ListTile(
          //     leading: Icon(Icons.exit_to_app,size: 35,),
          //     title: Text('Logout',style: TextStyle(fontSize: 18),),
          //   ),
          // ),
        ],
      ),
    );
  }
}
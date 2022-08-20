import 'package:bootickets/screens/bottom.dart';
import 'package:bootickets/screens/home_screen.dart';
import 'package:bootickets/utils/app_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primary,
      ),
      // home: const Bottom(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FutureBuilder(
      future: _initializeFirebase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done)
          {
            return LoginScreen();
          }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    )
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static Future<User?> loginUsingEmailPassword ({required String email, required String password, required BuildContext context})async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try{
  UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
  user = userCredential.user;
  } on FirebaseAuthException catch (e){
      if (e.code == "user not found"){
        print("No user found");
      }
    }
    return user;
  }


  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Padding(padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Text("Al Mutairi Travel", style: Styles.headlineStyle2),
        Text("Login to Your App", style: Styles.headlineStyle1),
        SizedBox(
          height: 44.0,
        ),
         TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: "User Email",
              prefixIcon: Icon(FluentSystemIcons.ic_fluent_mail_regular)
          ),
        ),
        SizedBox(
          height: 26.0,
        ),
         TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(
              hintText: "User Password",
              prefixIcon: Icon(FluentSystemIcons.ic_fluent_lock_regular)
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
       Text(
          "Forgot Password", style: TextStyle(color: Colors.blue),
        ),
        SizedBox(
          height: 58.0,
        ),
        Container(
          width: double.infinity,
          child: RawMaterialButton(
            fillColor: const Color(0xFF0069FE),
            elevation: 10.0,
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)
            ),
            onPressed: ()async{
              User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
              print(user);
              if(user != null){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomeScreen()));
              }

            },
          child: const Text("Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0
          )),),
        )
      ],
    ),);
  }
}


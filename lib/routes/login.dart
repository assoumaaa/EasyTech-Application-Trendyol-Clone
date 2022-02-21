import 'package:flutter/material.dart';
import 'package:week6_starter/routes/profile.dart';
import 'package:week6_starter/routes/signup.dart';
import 'package:week6_starter/routes/start.dart';
import 'package:week6_starter/utils/color.dart';
import 'package:week6_starter/utils/dimension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  String _errorMessage = '';

  void onChange() {
    setState(() {
      _errorMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    emailController.addListener(onChange);
    passwordController.addListener(onChange);

    final errorMessage = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        '$_errorMessage',
        style: TextStyle(fontSize: 14.0, color: Colors.red),
        textAlign: TextAlign.center,
      ),
    );

    final email = TextFormField(
      validator: (value) {
        if (value!.isEmpty || !value.contains('@')) {
          return 'Please enter a valid email.';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: emailController,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      textInputAction: TextInputAction.next,
      onEditingComplete: () => node.nextFocus(),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(node);
      },
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            signIn(emailController.text, passwordController.text)
                .then((uid) => {Navigator.push( context, MaterialPageRoute(builder: (context) => Profile()))})
                .catchError((error) => {processError(error)});
          }
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );




    return Scaffold(
      backgroundColor: AppColors.whiteBackground,

    body: SingleChildScrollView(
      child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),

      child: Column(

        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 50, 8, 30),
            child: Image(
                image: AssetImage('images/easytech.jpg')
            ),
          ),

          Center(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.textFieldGrey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                    color: AppColors.textFieldGreyBorder,
                    width: 2.0,
                    style: BorderStyle.solid
                ),
              ),
              padding: Dimen.regularPadding,

              child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: email,
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: password,
                      ),
                    ],
                  ),
                  
                  Row(

                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [TextButton( onPressed: () {  }, child: Text("Forgot Password?",
                    style: TextStyle(color: Colors.black54),)
                      ,)],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(flex: 1, child: Container()),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(

                            color: AppColors.whiteBackground,
                            shape: BoxShape.rectangle,
                            border: Border.all(
                                color: Colors.black,
                                width: 2,
                                style: BorderStyle.solid,

                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            boxShadow: [BoxShadow(
                              color: Colors.black,
                              offset: Offset(7.5, 4),
                              blurRadius: 3,
                            ),
                            ]

                          ),
                            child:loginButton
                        ),
                      ),
                      Expanded(flex: 1, child: Container()),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Padding(padding: Dimen.regularPadding,
                    child: Text("Other Options!", style: TextStyle(color: Colors.black),))],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      IconButton(
                      onPressed: () {  },
                      icon: Image(
                        image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Facebook_icon_2013.svg/768px-Facebook_icon_2013.svg.png'
                          ),
                      ),
                    ),
                      IconButton(onPressed: () {}, 
                          icon: Image(image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Gmail_icon_%282020%29.svg/512px-Gmail_icon_%282020%29.svg.png")) )
                    ],
      ),
                  Row(mainAxisAlignment: MainAxisAlignment.center ,
                  children: [
                    Text("Not a member?"),
                    TextButton( onPressed:()
                      { Navigator.push( context, MaterialPageRoute(builder: (context) => RegisterPage()),);
                      },
                      child: Text("Sign up.",
                        )
                        ,)
                  ])
        ]),
            ),
          )
          )

      ])
      ),
    )
    );
  }

  Future<String> signIn(final String email, final String password) async {
    User user = (await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password)) as User;
    return user.uid;
  }

  void processError(final PlatformException error) {
    if (error.code == "ERROR_USER_NOT_FOUND") {
      setState(() {
        _errorMessage = "Unable to find user. Please register.";
      });
    } else if (error.code == "ERROR_WRONG_PASSWORD") {
      setState(() {
        _errorMessage = "Incorrect password.";
      });
    } else {
      setState(() {
        _errorMessage =
        "There was an error logging in. Please try again later.";
      });
    }
  }


}



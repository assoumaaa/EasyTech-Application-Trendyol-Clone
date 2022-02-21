import 'package:week6_starter/payment/success.dart';
import 'package:week6_starter/utils/color.dart';
import 'package:week6_starter/utils/dimension.dart';
import 'package:week6_starter/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  String name = "";
  String address = "";
  late int count;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Payment', style: appBarTitle),
          backgroundColor: Colors.transparent,
          elevation: 0.0,

        centerTitle: true,
      ),
      body: Padding(
        padding: Dimen.regularPadding,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.all( 1),
                  elevation: 10,
                  shadowColor: Colors.grey,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              decoration: InputDecoration(
                                fillColor: AppColors.secondary,
                                filled: true,
                                hintText: 'Name..',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                ),
                              ),
                              keyboardType: TextInputType.name,

                              validator: (value) {
                                if(value == null) {
                                  return 'Name field cannot be empty';
                                } else {
                                  String trimmedValue = value.trim();
                                  if(trimmedValue.isEmpty) {
                                    return 'Name field cannot be empty';
                                  }
                                }
                                return null;
                              },

                              onSaved: (value) {
                                if(value != null) {
                                  name = value;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              decoration: InputDecoration(
                                fillColor: AppColors.secondary,
                                filled: true,
                                hintText: 'Address...',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(50)),

                                ),
                              ),
                              keyboardType: TextInputType.text,
                              enableSuggestions: false,
                              autocorrect: false,

                              validator: (value) {
                                if(value == null) {
                                  return 'Address field cannot be empty';
                                } else {
                                  String trimmedValue = value.trim();
                                  if(trimmedValue.isEmpty) {
                                    return 'Address field cannot be empty';
                                  }
                                }
                                return null;
                              },

                              onSaved: (value) {
                                if(value != null) {
                                  address = value;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16,),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Card(
                  margin: EdgeInsets.all( 1),
                  elevation: 10,
                  shadowColor: Colors.grey,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              decoration: InputDecoration(
                                fillColor: AppColors.secondary,
                                filled: true,
                                hintText: 'Credit-Card..',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                ),
                              ),
                              keyboardType: TextInputType.number,

                              validator: (value) {
                                if(value == null) {
                                  return 'Credit Card field cannot be empty';
                                } else {
                                  String trimmedValue = value.trim();
                                  if(trimmedValue.isEmpty) {
                                    return 'Name field cannot be empty';
                                  }
                                  if(trimmedValue.length < 8) {
                                    return 'Credit must be at least 8 characters long';
                                  }
                                }
                                return null;
                              },

                              onSaved: (value) {
                                if(value != null) {
                                  name = value;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16,),

                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            'Pay',
                            style: kButtonDarkTextStyle,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                        ), onPressed: () {
                          if(_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          setState(() {
                        { {Navigator.push( context, MaterialPageRoute(builder: (context) => success()),); } };  }
                          );
                          }
                          },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

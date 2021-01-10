import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart/Screens/resetpass.dart';
import 'package:smart/api/api_service.dart';
import 'package:smart/model/login_model.dart';

import '../ProgressHUD.dart';
import 'forgotpass.dart';

import 'newaccount.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  LoginRequestModel loginRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Positioned(
                  top: MediaQuery.of(context).size.height / 10,
                  left: MediaQuery.of(context).size.width / 10,
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 6.5,
                  left: MediaQuery.of(context).size.width / 10,
                  child: Text(
                    'Log in to your account',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
                Container(
                  padding:
                  EdgeInsets.only(left: MediaQuery.of(context).size.width / 5),
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Don't Have An Account?",
                            style: TextStyle(fontSize: 15),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 15,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CreateAccountScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.blue.shade900, fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width / 5),
                        height: MediaQuery.of(context).size.height / 15,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreateAccountScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Guest User',
                            style:
                            TextStyle(color: Colors.blue.shade900, fontSize: 25),
                          ),
                        ),
                      ),
                    ],
                  ),
                  margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 4,
                  left: MediaQuery.of(context).size.width / 15,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.15,
                    height: MediaQuery.of(context).size.height / 2.6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
//background color of box
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                          offset: Offset(
                            1.0,
                            4.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: globalFormKey,
                        child: Column(
                          children: [
                            TextFormField(
                              onSaved: (value) {
                                loginRequestModel.email = value;
                              },
                              validator: (value) {
                                if(!value.contains("@") || !value.contains(".com") || value.isEmpty){
                                  return "Enter valid Email ID";
                                } return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter Your Email ID',
                              ),
                            ),
                            TextFormField(
                              onSaved: (value) {
                                loginRequestModel.password = value;
                              },
                              validator: (value) {
                                if(value.length < 3){
                                  return "Password should be more than 3 characters";
                                }
                                return null;
                              },
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: _toggle,
                                  icon: Icon(Icons.remove_red_eye),
                                ),
                                hintText: 'Password',
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height / 15,
                                  child: FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ResetPassScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Reset Password',
                                      style: TextStyle(color: Colors.blue.shade900),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 11,
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height / 15,
                                  child: FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ForgotPassScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(color: Colors.blue.shade900),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: MaterialButton(
                                elevation: 4,
                                onPressed: () {
                                  if (validateAndSave()) {
                                    print(loginRequestModel.toJson());

                                    setState(() {
                                      isApiCallProcess = true;
                                    });

                                    APIService apiService = APIService();
                                    apiService.login(loginRequestModel).then((value) {
                                      if (value != null) {
                                        setState(() {
                                          isApiCallProcess = false;
                                        });

                                        if (value.token.isNotEmpty) {
                                          final snackBar = SnackBar(
                                              content: Text("Login Successful"));
                                          scaffoldKey.currentState
                                              .showSnackBar(snackBar);
                                        } else {
                                          final snackBar =
                                          SnackBar(content: Text(value.error));
                                          scaffoldKey.currentState
                                              .showSnackBar(snackBar);
                                        }
                                      }
                                    });
                                  }
                                },
                                color: Colors.deepOrange,
                                child: Text(
                                  'SIGN IN',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}

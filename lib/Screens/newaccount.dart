import 'package:flutter/material.dart';
import 'package:smart/Screens/welcomeback.dart';




class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height / 10,
            left: MediaQuery.of(context).size.width / 10,
            child: Text(
              'Create Your Account',
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 6.5,
            left: MediaQuery.of(context).size.width / 10,
            child: Text(
              'Sign in to your account',
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
          Container(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width / 5),
            height: MediaQuery.of(context).size.height,
            child: Row(
              children: [
                Text(
                  "Already Have An Account?",
                  style: TextStyle(fontSize: 15),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 15,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      'SIGN IN',
                      style:
                          TextStyle(color: Colors.blue.shade900, fontSize: 15),
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
              height: MediaQuery.of(context).size.height / 3.2,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  //background color of box
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0, //extend the shadow
                    offset: Offset(
                      1.0, // Move to right 10  horizontally
                      4.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Consumer Number/Phone Number',
                      ),
                    ),
                    TextField(
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: _toggle,
                          icon: Icon(Icons.remove_red_eye),
                        ),
                        hintText: 'Password/OTP',
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: MaterialButton(
                        elevation: 4,
                        onPressed: () {},
                        color: Colors.deepOrange,
                        child: Text(
                          'REGISTER',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

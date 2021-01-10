import 'package:flutter/material.dart';

class ForgotPassScreen extends StatefulWidget {
  @override
  _ForgotPassScreenState createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
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
              'Forgot Password?',
              style: TextStyle(color: Colors.white,fontSize: 32),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 6.5,
            left: MediaQuery.of(context).size.width / 10,
            child: Text(
              'Please Enter your Email to Reset Password',
              style: TextStyle(color: Colors.grey,fontSize: 18
              ),
            ),
          ),
          Container(
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
              height: MediaQuery.of(context).size.height / 4,
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
                        hintText: 'Enter Your Email ID',
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
                          'SUBMIT',
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

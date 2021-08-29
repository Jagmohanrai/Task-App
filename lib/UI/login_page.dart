import 'package:flutter/material.dart';
import 'package:task/Repository/data_repository.dart';
import 'package:task/UI/Homepage.dart';
import 'package:task/config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool checkboxvalue = false;
  bool loading = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Container(
                    height: 280 * responsiveCofficient(context),
                    width: double.infinity,
                    color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.ac_unit_outlined,
                          size: 120 * responsiveCofficient(context),
                          color: Colors.white,
                        ),
                        Text(
                          'FREEDOM',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25 * responsiveCofficient(context)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.all(20.0 * responsiveCofficient(context)),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 0),
                              blurRadius: 5,
                              spreadRadius: 10,
                            )
                          ],
                          color: Colors.white,
                        ),
                        height: 500 * responsiveCofficient(context),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'SIGN IN',
                              style: TextStyle(
                                  fontSize: 20 * responsiveCofficient(context),
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.all(
                                  10.0 * responsiveCofficient(context)),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      30 * responsiveCofficient(context)),
                                  color: Colors.white,
                                ),
                                child: TextFormField(
                                  controller: _emailController,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.0 *
                                              responsiveCofficient(context),
                                          right: 10 *
                                              responsiveCofficient(context)),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.red,
                                        child: Icon(
                                          Icons.account_box,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    hintText: 'User Name',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0 *
                                              responsiveCofficient(context))),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(
                                  10.0 * responsiveCofficient(context)),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      30 * responsiveCofficient(context)),
                                  color: Colors.white,
                                ),
                                child: TextFormField(
                                  obscureText: true,
                                  controller: _passwordController,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.0 *
                                              responsiveCofficient(context),
                                          right: 10 *
                                              responsiveCofficient(context)),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.red,
                                        child: Icon(
                                          Icons.lock,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    hintText: 'Password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0 *
                                              responsiveCofficient(context))),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 50 * responsiveCofficient(context),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                      value: checkboxvalue,
                                      onChanged: (value) {
                                        setState(() {
                                          checkboxvalue = !checkboxvalue;
                                        });
                                      }),
                                  Text(
                                    "Remember me",
                                    style: TextStyle(
                                      fontSize:
                                          16 * responsiveCofficient(context),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'Forget Password',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 16 *
                                              responsiveCofficient(context)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      30 * responsiveCofficient(context))),
                              onPressed: () {
                                setState(() {
                                  loading = true;
                                });
                                ApiRepository api = ApiRepository();
                                api
                                    .signIn(_emailController.text,
                                        _passwordController.text)
                                    .then((value) {
                                  if (value != "") {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  } else {
                                    setState(() {
                                      loading = false;
                                    });
                                  }
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        120 * responsiveCofficient(context),
                                    vertical:
                                        13 * responsiveCofficient(context)),
                                child: Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        18 * responsiveCofficient(context),
                                  ),
                                ),
                              ),
                              color: Colors.red,
                            ),
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Still not connected?",
                                    style: TextStyle(
                                      fontSize:
                                          15 * responsiveCofficient(context),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10 * responsiveCofficient(context),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 15 *
                                              responsiveCofficient(context)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 40 * responsiveCofficient(context),
                                    child: Divider(
                                      color: Colors.red,
                                      thickness: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(
                                        4.0 * responsiveCofficient(context)),
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              15 *
                                                  responsiveCofficient(
                                                      context)),
                                          border:
                                              Border.all(color: Colors.red)),
                                      child: Center(
                                        child: Text(
                                          "OR",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 40 * responsiveCofficient(context),
                                    child: Divider(
                                      color: Colors.red,
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: CircleAvatar(
                                      child: Icon(Icons.facebook),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15 * responsiveCofficient(context),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: CircleAvatar(
                                      child: Icon(Icons.brightness_medium),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

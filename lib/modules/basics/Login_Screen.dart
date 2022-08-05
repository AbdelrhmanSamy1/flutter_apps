import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Text(
                'login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: 40.0,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration (
                  labelText: 'Email Address',
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10.0,

              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration (
                  labelText: 'password',
                  prefixIcon: Icon(
                    Icons.lock,
                  ),
                  suffix: Icon(
                    Icons.remove_red_eye,
                  ),

                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20.0,

              ),
              Container(
                width: double.infinity,
                color: Colors.blue,
                child: MaterialButton(
                    onPressed: () {},
                  child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      
                    ),
                    TextButton(onPressed: (){} , child: Text(
                      'Register Now '
                    ),
                    ),
                  ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
      return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.menu,
          ),
          title: Text(
            'firstapp'
          ),
          actions:
          [
            IconButton(
              icon: Icon(
          Icons.notification_important
        ),

          ),
            Icon(
                Icons.search,
            ),
          ],
        ),
        body: Row(
            children:
            [
              Expanded(
                child: Container(
            color: Colors.red,
                  child: Text(
                    'first',
                    style: TextStyle(
                      fontSize: 20.0,
                          color: Colors.white,
                    ),
                        ),
                ),
              ),
              Expanded(
                child: Container(
                color: Colors.green,
                  child: Text(
                    'second',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: Text(
                    'third',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child : Container(
                  color: Colors.amber,
                  child: Text(
                    'forth',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
            )
      );
  }
}
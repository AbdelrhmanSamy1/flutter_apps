import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children:
          [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://static.wikia.nocookie.net/peaky-blinders/images/2/2f/EdenClub6.png/revision/latest/top-crop/width/360/height/360?cb=20160611180205'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Chats',
                style: TextStyle(
                color: Colors.black,
            )
            )
          ],
        ),

        actions:
        [
            IconButton(
              icon: CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.blue,
                child: Icon(
          Icons.camera_alt,
              size:16.0,
                  color: Colors.white,
      ),
              ),
            onPressed: (){},
          ),
            IconButton(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                size:16.0,
                color: Colors.white,
              ),
            ),
            onPressed: (){},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children:
           [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children:
                  [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Search'
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),



           ],
        ),
      ),
    );
  }
}

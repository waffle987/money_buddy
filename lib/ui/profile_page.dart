import 'package:flutter/material.dart';
import 'profile_input.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        toolbarHeight: 85.0,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 15.0,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                size: 35.0,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/pexels-andrea-piacquadio-774909.jpg',
              ),
              radius: 80.0,
            ),
          ),
          ProfileInputWidget(
            value: 'Aloysius',
            hint: 'First Name',
            lines: 1,
          ),
          ProfileInputWidget(
            value: '',
            hint: 'Last Name',
            lines: 1,
          ),
          ProfileInputWidget(
            value: '',
            hint: 'Job Title',
            lines: 1,
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(
                top: 20.0,
              ),
              child: Text(
                'Historical Financial Statements',
                style: TextStyle(
                  fontSize: 27.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ExpansionTile(
            title: Text(
              'Hello World',
            ),
          ),
        ],
      ),
    );
  }
}

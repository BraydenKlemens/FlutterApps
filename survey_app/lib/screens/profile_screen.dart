import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_app/providers/auth_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.name}): super(key: key);
  final String name;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final double backDropHeight = 150;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)),
        backgroundColor: const Color.fromARGB(255, 26, 25, 25),
        actions: [
          IconButton(
            onPressed: (){
              Provider.of<AuthProvider>(context, listen: false).signOut();
            },
            icon: const Icon(Icons.logout)
          )
        ],
      ),
      body: ListView(
        children: [
          buildTop(),
          buildBottom(),
        ],
      )
    );
  }

  //everything below the profile picture
  Widget buildBottom() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(widget.name, style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
        ),
        //EVERYTHING TO THE PROFILE GETS ADDED HERE
        const SizedBox(height: 30),
        const Text('- Alarms / Reminders\n\n- Delete Account\n\n- Logout', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))

      ],
    );
  }

  //Builds a backdrop with a profile picture ontop
  Widget buildTop() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            child: backDrop(),
            margin: EdgeInsets.only(bottom: profileHeight / 2)),
        Positioned(
            top: backDropHeight - profileHeight / 2, child: profilePicture()),
      ]
    );
  }

  Widget backDrop() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: backDropHeight,
    );
  }

  Widget profilePicture() {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: profileHeight / 1.8,
          backgroundColor: const Color.fromARGB(255, 48, 48, 48),
        ),
        CircleAvatar(
          radius: profileHeight / 2,
          backgroundImage: const NetworkImage('https://pbs.twimg.com/profile_images/1440296485468266496/N2_A0b0p_400x400.jpg'),
        ),
      ]
    );
  }
}
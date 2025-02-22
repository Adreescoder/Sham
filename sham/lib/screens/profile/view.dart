import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ProfileLogic logic = Get.put(ProfileLogic());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Two tabs: Videos and Images
      child: Scaffold(
        appBar: AppBar(title: Text("Profile")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      image: DecorationImage(
                        image: AssetImage("assets/img.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -50,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            "assets/malik.jpg",
                            fit: BoxFit.cover,
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Text(
                "Malik Adrees Nazir@",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(thickness: 2, color: Colors.grey.shade400),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  follower(name: "Following", value: 20),
                  SizedBox(width: 30),
                  follower(name: "Followers", value: 150),
                  SizedBox(width: 30),
                  follower(name: "Likes", value: 320),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "Flutter Developer | UI/UX Enthusiast",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Passionate about building cross-platform mobile apps. "
                      "Love working with Flutter & GetX to create beautiful UI/UX experiences.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.edit, size: 20),
                label: Text("Edit Profile"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.video_collection), text: "Videos"),
                  Tab(icon: Icon(Icons.image), text: "Images"),
                ],
              ),
              SizedBox(
                height: 200,
                child: TabBarView(
                  children: [
                    Center(child: Text("User's Videos here", style: TextStyle(fontSize: 18))),
                    Center(child: Text("User's Images here", style: TextStyle(fontSize: 18))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget follower({required String name, required int value}) {
  return Column(
    children: [
      Text(
        value.toString(),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      Text(
        name,
        style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
      ),
    ],
  );
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'account_info.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _darkMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.email)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          final output = snapshot.data;
          if (snapshot.data == null) {
            return const CircularProgressIndicator();
          } else if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          return Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              SizedBox(
                height: 200.h,
                child: Center(
                  child: CircleAvatar(
                    radius: 82.r,
                    backgroundColor: Colors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(70.r),
                      child: Image.asset(
                        "assets/images/manns.png",
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  output["name"].toString(),
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
                ),
              ),
              Center(
                child: Text(
                  output["email"].toString(),
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, left: 32.0.w, right: 32.0.w),
                child: const Divider(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0.w, right: 10.0.w),
                child: ListTile(
                  leading: const Icon(Icons.dark_mode_outlined),
                  title: const Text(
                    'Koyu Tema',
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: CupertinoSwitch(
                    value: _darkMode,
                    onChanged: (darkMode) {
                      setState(() {});
                      _darkMode = darkMode;
                    },
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  debugPrint("basıldı");
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 25.0.w, right: 10.0.w),
                  child: const ListTile(
                    leading: Icon(Icons.notification_important_outlined),
                    title: Text(
                      'Bildirimler',
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Account()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 25.0.w, right: 10.0.w),
                  child: ListTile(
                    leading: const Icon(Icons.account_circle_outlined),
                    title: Text(
                      'Kullanıcı Bilgileri',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
              SizedBox(height: 80.h),
              TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                },
                child: const Text("Çıkış Yap"),
              ),
            ],
          );
        },
      ),
    );
  }
}

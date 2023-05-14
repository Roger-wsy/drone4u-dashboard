import 'package:drone4u_dashboard/components/d4u_index.dart';
import 'package:drone4u_dashboard/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class D4uSetting extends StatefulWidget {
  const D4uSetting({super.key});

  @override
  State<D4uSetting> createState() => _D4uSettingState();
}

class _D4uSettingState extends State<D4uSetting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      padding: D4uPadding.a16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/images/drone4uLogo.png'),
            radius: 80,
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              D4uText(
                text: 'Angeline Joli',
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SettingTile(
            title: "Personal Information",
          ),
          SettingTile(
            title: "Change Password",
          ),
          SettingTile(
            title: "General",
          ),
          const SizedBox(
            height: 100,
          ),
          const Divider(
            color: Colors.black54,
            indent: 350,
            endIndent: 350,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.logout,
                  color: d4uPrimaryColor,
                ),
              ),
              D4uText(text: 'Logout')
            ],
          )
        ],
      ),
    ));
  }
}

class SettingTile extends StatelessWidget {
  SettingTile({
    super.key,
    this.title,
  });

  String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: D4uPadding.containerCenter5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  D4uText(
                    text: title,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

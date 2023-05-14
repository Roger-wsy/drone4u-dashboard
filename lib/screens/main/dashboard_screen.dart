import 'package:drone4u_dashboard/components/d4u_index.dart';
import 'package:drone4u_dashboard/constants.dart';
import 'package:drone4u_dashboard/responsive.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../service/auth.dart';
import '../../service/user_service.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final firebaseCollection = UserService();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void dispose() {
    if (nameController != null) nameController.dispose();
    if (emailController != null) emailController.dispose();
    if (roleController != null) roleController.dispose();
    if (passwordController != null) passwordController.dispose();
    super.dispose();
  }

  showError(String errormessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign Up Error'),
          content: Text(errormessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> createUserWithEmailAndPassword(
      {name, email, password, role}) async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // String userId = generateShortUuid();
      String userId = Auth().currentUser!.uid;
      firebaseCollection.set(userId, {
        'name': name,
        'email': email,
        'role': role,
        "userId": userId,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (e.code == 'weak-password') {
          showError('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          showError('The account already exists for that email.');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<PieChartSectionData> pieChartData = [
      PieChartSectionData(
        color: const Color.fromARGB(255, 214, 40, 84),
        value: 25,
        showTitle: false,
        radius: 25,
      ),
      PieChartSectionData(
        color: const Color.fromARGB(255, 30, 30, 218),
        value: 20,
        showTitle: false,
        radius: 22,
      ),
      PieChartSectionData(
        color: const Color.fromARGB(255, 28, 199, 28),
        value: 10,
        showTitle: false,
        radius: 19,
      ),
      PieChartSectionData(
        color: const Color.fromARGB(255, 255, 217, 0),
        value: 15,
        showTitle: false,
        radius: 16,
      ),
      PieChartSectionData(
        color: const Color.fromARGB(255, 58, 125, 192),
        value: 25,
        showTitle: false,
        radius: 13,
      ),
    ];
    return SafeArea(
      child: SingleChildScrollView(
        padding: D4uPadding.a16,
        child: Column(
          children: [
            const Header(),
            const SizedBox(
              height: defaultPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          D4uText(
                            text: "My Files",
                            textStyle: Theme.of(context).textTheme.titleMedium,
                          ),
                          ElevatedButton.icon(
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: defaultPadding * 1.5,
                                  vertical: defaultPadding,
                                ),
                                backgroundColor: d4uPrimaryColor),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: d4uWhite,
                                      scrollable: true,
                                      title: const Text('Add New User'),
                                      content: Builder(
                                        builder: (context) {
                                          var height = MediaQuery.of(context)
                                              .size
                                              .height;
                                          var width =
                                              MediaQuery.of(context).size.width;
                                          return Container(
                                            color: d4uWhite,
                                            height: height - 400,
                                            width: width - 700,
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              width: 400,
                                              child: Form(
                                                child: Column(
                                                  children: <Widget>[
                                                    AlertTextFormField(
                                                      labelName: 'Name',
                                                      controller:
                                                          nameController,
                                                      icon: const Icon(
                                                          Icons.account_box),
                                                    ),
                                                    AlertTextFormField(
                                                      labelName: 'E-mail',
                                                      controller:
                                                          emailController,
                                                      icon: const Icon(
                                                          Icons.email),
                                                    ),
                                                    AlertTextFormField(
                                                      labelName: 'Password',
                                                      controller:
                                                          passwordController,
                                                      icon:
                                                          const Icon(Icons.key),
                                                    ),
                                                    AlertTextFormField(
                                                      labelName: 'Role',
                                                      controller:
                                                          roleController,
                                                      icon: const Icon(
                                                          Icons.emoji_people),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      actions: [
                                        alertButton(
                                          title: "Dismiss",
                                          onPress: () =>
                                              Navigator.of(context).pop(),
                                          backgroundColor: Colors.red,
                                        ),
                                        alertButton(
                                          title: "Add",
                                          onPress: () {
                                            createUserWithEmailAndPassword(
                                              name: nameController.text,
                                              email: emailController.text,
                                              password: passwordController.text,
                                              role: roleController.text,
                                            );
                                            Navigator.of(context).pop();
                                          },
                                          backgroundColor: Colors.green,
                                        ),
                                      ],
                                    );
                                  });
                            },
                            icon: const Icon(Icons.add),
                            label: D4uText(
                              text: "Add New User",
                              color: d4uSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      if (Responsive.isDesktop(context))
                        const D4uFileInfoCardGridView(
                          childAspectRatio: 1.4,
                        ),
                      if (Responsive.isTablet(context) ||
                          Responsive.isMobile(context))
                        const D4uFileInfoCardGridView(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2,
                        ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      const D4uRecentList(),
                      if (Responsive.isMobile(context))
                        const SizedBox(
                          width: defaultPadding,
                        ),
                      if (Responsive.isMobile(context))
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: D4uStorageDetailsSection(
                            pieChartData: pieChartData,
                          ),
                        ),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(
                    height: defaultPadding,
                    width: defaultPadding,
                  ),
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: D4uStorageDetailsSection(
                      pieChartData: pieChartData,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class alertButton extends StatelessWidget {
  alertButton({
    super.key,
    this.title,
    this.onPress,
    this.backgroundColor = Colors.red,
  });

  String? title;
  VoidCallback? onPress;
  MaterialColor? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: backgroundColor,
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        disabledForegroundColor: Colors.blue.withOpacity(0.38),
        disabledBackgroundColor: Colors.blue.withOpacity(0.12),
        minimumSize: const Size(100, 50), // surface color
        shadowColor: Colors
            .grey, //shadow prop is a very nice prop for every button or card widgets.
        elevation: 5, // we can set elevation of this beautiful button
        side: const BorderSide(
            color: Colors.transparent,
            //change border color
            width: 1, //change border width
            style: BorderStyle
                .solid), // change border side of this beautiful button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ), //change border radius of this beautiful button thanks to BorderRadius.circular function
        ),
      ),
      onPressed: onPress,
      child: Text(
        title!,
      ),
    );
  }
}

class AlertTextFormField extends StatelessWidget {
  AlertTextFormField({
    super.key,
    this.labelName,
    this.controller,
    this.icon,
  });

  String? labelName;
  TextEditingController? controller;
  Icon? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: d4uPrimaryColor,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black54),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black54),
        ),
        labelText: labelName,
        labelStyle: const TextStyle(color: Colors.black54),
        icon: icon,
        iconColor: Colors.black54,
        hintText: labelName,
        prefixIconColor: Colors.black54,
      ),
    );
  }
}

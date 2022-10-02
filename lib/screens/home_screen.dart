import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../model/user_model.dart';
import '../plugins/size_config.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final passwordreset = new TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  GlobalKey globalKey = new GlobalKey();
  GlobalKey globalKey1 = new GlobalKey();
  bool _isVisible = true;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  TextEditingController passwordController1 = new TextEditingController();
  TextEditingController passwordController2 = new TextEditingController();

  int num = 0;
  int t = 1;
  int t1 = 1;
  List<dynamic> data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  showStamp(int i) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        width: 20 * SizeConfig.heightMultiplier!,
        height: 20 * SizeConfig.heightMultiplier!,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                i.toString(),
                style: TextStyle(
                  fontSize: 12.0,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(
            Radius.circular(200),
          ),
          color: Colors.yellow,
        ),
      ),
    );
  }

  showCup() {
    return Visibility(
      visible: _isVisible,
      child: CircleAvatar(
        backgroundImage:
        const AssetImage('assets/coffee.jpeg',),
        radius: 20 * SizeConfig.heightMultiplier!,
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      num = value.data()!['qr_code'];
      print(num);

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final passwordField = TextFormField(

        autofocus: false,
        controller: passwordController1,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          passwordController1.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                logout(context);
              },
              child: const Text('Logout'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 1.5 * SizeConfig.heightMultiplier!,
                  top: 0.5 * SizeConfig.heightMultiplier!),
              child: const Text(
                "Id:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 0.5 * SizeConfig.heightMultiplier!,
                  left: 1.5 * SizeConfig.heightMultiplier!),
              child: Text(
                "${loggedInUser.uid}",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'OpenSans_semibold',
                    color: Colors.grey,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 1.5 * SizeConfig.heightMultiplier!,
                  top: 0.5 * SizeConfig.heightMultiplier!),
              child: const Text(
                "Name:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 0.5 * SizeConfig.heightMultiplier!,
                  left: 1.5 * SizeConfig.heightMultiplier!),
              child: Text(
                "${loggedInUser.firstName}",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'OpenSans_semibold',
                    color: Colors.grey,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.left,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 1.5 * SizeConfig.heightMultiplier!,
                      top: 0.5 * SizeConfig.heightMultiplier!),
                  child: const Text(
                    "Email",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 0.5 * SizeConfig.heightMultiplier!,
                  left: 1.5 * SizeConfig.heightMultiplier!),
              child: Text(
                "${loggedInUser.email}",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'OpenSans_semibold',
                    color: Colors.grey,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 0.5 * SizeConfig.heightMultiplier!,
                  left: 1.5 * SizeConfig.heightMultiplier!),
              child: const Text(
                "Qr code",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 0.5 * SizeConfig.heightMultiplier!,
                  left: 1.5 * SizeConfig.heightMultiplier!),
              child: RepaintBoundary(
                key: globalKey,
                child: QrImage(
                  data: "${loggedInUser.uid}",
                  version: QrVersions.auto,
                  size: 40.0 * SizeConfig.imageSizeMultiplier!,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 0.5 * SizeConfig.heightMultiplier!,
                  left: 1.5 * SizeConfig.heightMultiplier!),
              child: const Text(
                "Free Meal:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 4.0 * SizeConfig.heightMultiplier!,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .where('uid', isEqualTo: user?.uid)
                  //.doc(user!.uid)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    return Column(
                      children: [
                        Expanded(
                            child: ListView.builder(
                                itemCount: snapshot.data?.docs.length,
                                itemBuilder: (listContext, index) {
                                  t1 = snapshot.data?.docs[index]['freeMeal'];
                                  return Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 0.5 *
                                              SizeConfig.heightMultiplier!,
                                          right: 38.0 *
                                              SizeConfig.heightMultiplier!,
                                        ),
                                        child: Text(
                                          t1.toString(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'OpenSans_semibold',
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  );
                                })),
                      ],
                    );
                  }),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 0.5 * SizeConfig.heightMultiplier!,
                  left: 1.5 * SizeConfig.heightMultiplier!),
              child: InkWell(
                onTap: (){
                  // set up the button
                  Widget okButton = FlatButton(
                    child: Text("Submit"),
                    onPressed: () {
                      resertPassword();
                    },
                  );

                  // set up the AlertDialog
                  AlertDialog alert = AlertDialog(
                    title: Text("Change Password"),
                    content: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            height: 10*SizeConfig.heightMultiplier!,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 2.0,
                                  spreadRadius: 0.0,
                                  offset:
                                  Offset(2.0, 2.0), // shadow direction: bottom right
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: Center(
                                child: TextFormField(
                                    autovalidateMode: AutovalidateMode.always,
                                    decoration: const InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: 'Email To send Reset password',
                                labelText: 'Email',
                              ),
                                  controller: passwordreset,
                            )
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    actions: [
                      okButton,
                    ],
                  );

                  // show the dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                },
                child: const Text(
                  "Change Password:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              )
            ),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        left: false,
        right: false,
        top: false,
        child: SingleChildScrollView(
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
              Widget>[
            SizedBox(
              height: 3.5 * SizeConfig.heightMultiplier!,
            ),
            Container(
              height: 50.0 * SizeConfig.heightMultiplier!,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .where('uid', isEqualTo: user?.uid)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    return Column(
                      children: [
                        Expanded(
                            child: ListView.builder(
                                itemCount: snapshot.data?.docs.length,
                                itemBuilder: (listContext, index) {
                                  t = snapshot.data?.docs[index]['qr_code'];
                                  return Column(
                                    children: [
                                      Container(
                                        height: 100.0 *
                                            SizeConfig.heightMultiplier!,
                                        child: t ==10 ? Expanded(
                                            child:Column(
                                              children: [
                                                Container(child: Text("Free Meal",style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 2.5 * SizeConfig.textMultiplier!,
                                                ),),),
                                                RepaintBoundary(
                                                  key: globalKey1,
                                                  child: QrImage(
                                                    data: "${loggedInUser.uid}",
                                                    version: QrVersions.auto,
                                                    size:30.0 * SizeConfig.imageSizeMultiplier!,
                                                  ),
                                                ),
                                              ],
                                            )
                                        ) : GridView(
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 5),
                                          children: [
                                            for(var i = 1; i <= 10; i++)
                                              t >= i
                                                ? showCup()
                                                : showStamp(i),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                })),
                      ],
                    );
                  }),
            ),
          ]),
        ),
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  Future resertPassword() async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: passwordreset.text);
    Fluttertoast.showToast(msg: "Password Reset Email Send");

  }

}




// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../plugins/size_config.dart';
class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Customer',
        style: TextStyle(
          fontSize: 2.8 * SizeConfig.textMultiplier!,
          fontFamily: 'OpenSans_semibold',
          color: Colors.white),
        ),),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child:Text('Customer Id Will be shown here',
                style: TextStyle(
                    fontSize: 20 ,
                    fontFamily: 'OpenSans_semibold',
                    color: Colors.white),
              ),
            ),

           Container(
             margin: EdgeInsets.only(left: 5.0 * SizeConfig.widthMultiplier!),
             child: const Text('Qr Code',
               style: TextStyle(
                   fontSize: 18,
                   color: Colors.black),
             ),
           ),
            const Icon(Icons.qr_code,size: 300,),
            Container(
              margin: EdgeInsets.only(left: 5.0 * SizeConfig.widthMultiplier!),
              child: const Text('Stamp Page',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black),
              ),
            ),
            InkWell(
              onTap: (){

              },
              child: TextButton(
                  onPressed: null,
                  child: Text("Stamp page ")),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        left: false,
        right: false,
        top: false,
        child:  SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 3.5* SizeConfig.heightMultiplier!,),
                Row(
                  children: [
                    Container(
                      height: 15 * SizeConfig.heightMultiplier!,
                      width: 50.0 * SizeConfig.widthMultiplier!,
                      color: Colors.orange,
                    ),
                    Container(
                      height: 15 * SizeConfig.heightMultiplier!,
                      width: 50.0 * SizeConfig.widthMultiplier!,
                      color: Colors.green,
                    )
                  ],
                ),
                SizedBox(height: 2.0* SizeConfig.heightMultiplier!,),

                Row(
                  children: [
                    Container(
                      height: 15 * SizeConfig.heightMultiplier!,
                      width: 50.0 * SizeConfig.widthMultiplier!,
                      color: Colors.grey,
                    ),
                    Container(
                      height: 15 * SizeConfig.heightMultiplier!,
                      width: 50.0 * SizeConfig.widthMultiplier!,
                      color: Colors.blueGrey,
                    )
                  ],
                ),
                SizedBox(height: 2.0* SizeConfig.heightMultiplier!,),

                Row(
                  children: [
                    Container(
                      height: 15 * SizeConfig.heightMultiplier!,
                      width: 50.0 * SizeConfig.widthMultiplier!,
                      color: Colors.teal,
                    ),
                    Container(
                      height: 15 * SizeConfig.heightMultiplier!,
                      width: 50.0 * SizeConfig.widthMultiplier!,
                      color: Colors.blue,
                    )
                  ],
                ),
                SizedBox(height: 2.0* SizeConfig.heightMultiplier!,),

                Row(
                  children: [
                    Container(
                      height: 15 * SizeConfig.heightMultiplier!,
                      width: 50.0 * SizeConfig.widthMultiplier!,
                      color: Colors.cyan,
                    ),
                    Container(
                      height: 15 * SizeConfig.heightMultiplier!,
                      width: 50.0 * SizeConfig.widthMultiplier!,
                      color: Colors.lightGreenAccent,
                    )
                  ],
                ),
                SizedBox(height: 2.0* SizeConfig.heightMultiplier!,),

                Row(
                  children: [
                    Container(
                      height: 15 * SizeConfig.heightMultiplier!,
                      width: 50.0 * SizeConfig.widthMultiplier!,
                      color: Colors.orange,
                    ),
                    Container(
                      height: 15 * SizeConfig.heightMultiplier!,
                      width: 50.0 * SizeConfig.widthMultiplier!,
                      color: Colors.green,
                    )
                  ],
                )

              ]
          ),
        ),
      ),

    );
  }
}

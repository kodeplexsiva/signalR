import 'package:flutter/material.dart';

import '../../../utill/images.dart';
import '../auth/login_screen.dart';
import '../picking/item_pick.dart';
import '../picking/item_picking.dart';

class MainHome extends StatelessWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Main Hub'),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("V: 22.07.12.0",
                  style: TextStyle(color: Colors.white, fontSize: 16.0,),),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.network_check),
            ),
            PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Text("Settings"),
                    ),

                    PopupMenuItem<int>(
                      value: 1,
                      child: Text("Exit"),
                    ),
                  ];
                },
                onSelected: (value) {
                  if (value == 0) {
                    print("Settings menu is selected.");
                  } else if (value == 1) {
                    print("Exit is selected.");
                  }
                }
            ),
          ],
          backgroundColor: Colors.green,
        ),

        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  },
                  child: Card(
                    elevation: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Images.main_inbound, height: 80,),
                        SizedBox(height: 10,),
                        Text("INBOUND",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),)
                      ],),
                  ),
                ),

                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  },
                  child: Card(
                    elevation: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Images.main_replenishment, height: 80,),
                        SizedBox(height: 10,),
                        Text("REPLENISHMENT",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),)
                      ],),
                  ),
                ),

                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemPick()));
                  },
                  child: Card(
                    elevation: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Images.main_item_picking, height: 80,),
                        SizedBox(height: 10,),
                        Text("ITEM PICKING",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),)
                      ],),
                  ),
                ),

                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  },
                  child: Card(
                    elevation: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Images.main_outbound, height: 80,),
                        SizedBox(height: 10,),
                        Text("OUTBOUND",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),)
                      ],),
                  ),
                ),
              ],
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
            ),
          )
        )
    );
  }
}



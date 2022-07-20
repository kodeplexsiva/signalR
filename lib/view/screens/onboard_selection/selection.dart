import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warehouse/data/Selection_data.dart';

import '../../../helper/notifications_healper.dart';
import '../home/home.dart';

class Selection extends StatelessWidget {
  const Selection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selection'),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("V: 22.07.12.0", style: TextStyle(color: Colors.white, fontSize: 16.0, ),),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.network_check),
          ),
          PopupMenuButton(
              itemBuilder: (context){
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
              onSelected:(value){
                if(value == 0){
                  print("Settings menu is selected.");
                }else if(value == 1){
                  print("Exit is selected.");
                }
              }
          ),
        ],
        backgroundColor: Colors.green,
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: ListTile.divideTiles(tiles: [
            ListTile(
              title: Text('Select Warehouse : ' + Provider.of<SingleNotifier>(context).currentWarehouse),
              onTap: () => _showWarehouses(context),
            ),
            ListTile(
              title: Text('Select Section : ' + Provider.of<SingleNotifier>(context).currentSection),
              onTap: () => _showSection(context),
            ),
            ListTile(
              title: Text('Select StoreType : ' + Provider.of<SingleNotifier>(context).currentStoreType),
              onTap: () => _showStoreType(context),
            ),
          ],context: context).toList(),
        ),
      ),
    );
  }


  _showWarehouses(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        var _singleNotifier = Provider.of<SingleNotifier>(context);
        return AlertDialog(
          title: Text("Select one WareHouse"),
          content: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: warehouses
                  .map((e) => RadioListTile(
                    title: Text(e),
                    value: e,
                    groupValue: _singleNotifier.currentWarehouse,
                    selected: _singleNotifier.currentWarehouse == e,
                    onChanged: (value) {
                      if (value != _singleNotifier.currentWarehouse) {
                        _singleNotifier.updateWarehouse(value as String);
                        Navigator.of(context).pop();
                      }
                    },
                ))
              .toList(),
            ),),
            ));
        });

  _showSection(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        var _singleNotifier = Provider.of<SingleNotifier>(context);
        return AlertDialog(
            title: Text("Select one Section"),
            content: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: Sections
                      .map((e) => RadioListTile(
                    title: Text(e),
                    value: e,
                    groupValue: _singleNotifier.currentSection,
                    selected: _singleNotifier.currentSection == e,
                    onChanged: (value) {
                      if (value != _singleNotifier.currentSection) {
                        _singleNotifier.updateSection(value as String);
                        Navigator.of(context).pop();
                      }
                    },
                  ))
                      .toList(),
                ),),
            ));
      });

  _showStoreType(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        var _singleNotifier = Provider.of<SingleNotifier>(context);
        return AlertDialog(
            title: Text("Select one Store Type"),
            content: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: StoreTypes
                      .map((e) => RadioListTile(
                    title: Text(e),
                    value: e,
                    groupValue: _singleNotifier.currentStoreType,
                    selected: _singleNotifier.currentStoreType == e,
                    onChanged: (value) {
                      if (value != _singleNotifier.currentStoreType) {
                        _singleNotifier.updateStoreType(value as String);
                        Navigator.of(context).pop();
                      }
                    },
                  ))
                      .toList(),
                ),),
            ));
      });
}


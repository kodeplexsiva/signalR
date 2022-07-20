import 'package:flutter/material.dart';

class ItemPick extends StatefulWidget {
  const ItemPick({Key? key}) : super(key: key);

  @override
  State<ItemPick> createState() => _ItemPickState();
}

class _ItemPickState extends State<ItemPick> {

  String? _Location;
  String? _ItemNumber;
  String? _ItemDescription;
  String? _QuantityRequired;
  String? _QuantityPicked;
  String? _QuantityRemaining;
  String? _LPN;


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildLocationField(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Location'),
      validator: (String? value){
        if(value == null || value.isEmpty){
          return "Location is empty";
        }
      },
      onSaved: (String? value){
        _Location = value;
      }
    );
  }

  Widget _buildItemNumberField(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Item Number'),
        validator: (String? value){
          if(value == null || value.isEmpty){
            return "Item Number is empty";
          }
        },
        onSaved: (String? value){
          _ItemNumber = value;
        }
    );
  }

  Widget _buildItemDescriptionField(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Item Description'),
        validator: (String? value){
          if(value == null || value.isEmpty){
            return "Item Description is empty";
          }
        },
        onSaved: (String? value){
          _ItemDescription = value;
        }
    );
  }

  Widget _buildQuantityRequiredField(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Quantity Required'),
        validator: (String? value){
          if(value == null || value.isEmpty){
            return "Quantity Required is empty";
          }
        },
        onSaved: (String? value){
          _QuantityRequired = value;
        }
    );
  }

  Widget _buildQuantityPickedField(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Quantity Picked'),
        validator: (String? value){
          if(value == null || value.isEmpty){
            return "Quantity Picked is empty";
          }
        },
        onSaved: (String? value){
          _QuantityPicked = value;
        }
    );
  }

  Widget _buildQuantityRemainingField(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Quantity Remaining'),
        validator: (String? value){
          if(value == null || value.isEmpty){
            return "Quantity Remaining is empty";
          }
        },
        onSaved: (String? value){
          _QuantityRemaining = value;
        }
    );
  }

  Widget _buildLPNField(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'LPN'),
        validator: (String? value){
          if(value == null || value.isEmpty){
            return "LPN is empty";
          }
        },
        onSaved: (String? value){
          _LPN = value;
        }
    );
  }

  Widget _buildButton(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: ElevatedButton(
                child: const Text('Load & Drop'),
                onPressed: () => { },
                style: ElevatedButton.styleFrom(
                  onPrimary: Theme.of(context).colorScheme.onPrimary,
                  primary: Colors.green,

                ),
              ),
          ),
          SizedBox(width: 20,),
          Expanded(
              child: ElevatedButton(
                child: const Text('Exception'),
                onPressed: () => { },
                style: ElevatedButton.styleFrom(
                  onPrimary: Theme.of(context).colorScheme.onPrimary,
                  primary: Colors.red,
                ),
              ),)
        ],
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Picking'),
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
                    child: Text("Download"),
                  ),

                  PopupMenuItem<int>(
                    value: 2,
                    child: Text("Exit"),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  print("Settings menu is selected.");
                } else if (value == 1) {
                  print("Download is selected.");
                } else if (value == 2) {
                  print("Exit is selected.");
                }
              }
          ),
        ],
        backgroundColor: Colors.green,
      ),

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formkey ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildLocationField(),
                _buildItemNumberField(),
                _buildItemDescriptionField(),
                _buildQuantityRequiredField(),
                _buildQuantityPickedField(),
                _buildQuantityRemainingField(),
                _buildLPNField(),
                SizedBox(height: 20,),
                _buildButton(),

                ElevatedButton(
                  child: const Text('Load & Drop'),
                  onPressed: () => {
                    if(_formkey.currentState!.validate()){
                    }
                    else {
                    _formkey.currentState?.save()
                  }

                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    onPrimary: Theme.of(context).colorScheme.onPrimary,
                    primary: Colors.green,
                  ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

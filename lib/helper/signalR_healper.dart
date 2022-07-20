import 'package:signalr_client/hub_connection.dart';
import 'package:signalr_client/hub_connection_builder.dart';
import 'package:flutter/material.dart';


final SIGNALR_SERVER_TIMEOUT = 30 * 1000;
final SIGNALR_KEEP_ALIVE_INTERVAL = 20 * 1000;


class SignalRCheck extends StatefulWidget {
  const SignalRCheck({Key? key}) : super(key: key);

  @override
  State<SignalRCheck> createState() => _SignalRCheckState();
}

class _SignalRCheckState extends State<SignalRCheck> {

  final serverUrl = "https://mywarehouse.myweb.net.au/hubs/dashboard";
  late HubConnection hubConnection;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSignalR();
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }


  void initSignalR() {
    hubConnection = HubConnectionBuilder().withUrl(serverUrl).build();
    hubConnection.serverTimeoutInMilliseconds(30 * 1000);
    await connection.start();

    connection.on('ReceiveMessage', (message) {
      print(message.toString());
    });

    await connection.invoke('SendMessage', args: ['Bob', 'Says hi!']);

  }
}










import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class hesgostergizle extends StatefulWidget {
  @override
  _hesgostergizleState createState() => _hesgostergizleState();
}

class _hesgostergizleState extends State<hesgostergizle> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).qrcode),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: isVisible,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                child: Image.asset("images/hes.jpg"),
                width: 550,
                height: 500,
                color: Colors.white,
              ),
            ),
            RaisedButton(
              child: Text(AppLocalizations.of(context).qrcode),
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

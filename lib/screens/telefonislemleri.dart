import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class telefonurlislemleri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: islemlerigetir(),
    );
  }
}

class islemlerigetir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(AppLocalizations.of(context).title)),
      ),
      body: islemler(),
    );
  }
}

class islemler extends StatefulWidget {
  _islemlerState createState() => _islemlerState();
}

class _islemlerState extends State<islemler> {
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    customLaunch('https://google.com');
                  },
                  child: Text('URL'),
                ),
                RaisedButton(
                  onPressed: () {
                    customLaunch(
                        'mailto:your@email.com?subject=test%20subject&body=test%20body');
                  },
                  child: Text('Email'),
                ),
                RaisedButton(
                  onPressed: () {
                    customLaunch('tel:+1 555 555 555');
                  },
                  child: Text('Phone'),
                ),
                RaisedButton(
                  onPressed: () {
                    customLaunch('sms:5550101234');
                  },
                  child: Text('SMS'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:istanbul_gezi/screens/fotogaleri.dart';
import 'package:istanbul_gezi/screens/hesapmakinesi.dart';
import 'package:istanbul_gezi/screens/heskodugostergizle.dart';
import 'package:istanbul_gezi/screens/todolist.dart';

import 'fotogaleri.dart';
import 'hesapmakinesi.dart';
import 'heskodugostergizle.dart';
import 'todolist.dart';

class AnaSayfa extends StatefulWidget {
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  void arkaplandegistir() {
    backgroundColor:
    Colors.black;
  }

  @override
  //final databaseReference = FirebaseFirestore.instance;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).homePage),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(35),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              child: Image.asset("images/ist.jpg"),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: 500,
              padding: const EdgeInsets.only(top: 10),
              color: Colors.lightBlue,
              child: RaisedButton(
                color: Colors.lightBlue,
                child: Text(AppLocalizations.of(context).calculator),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Basla()),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: 500,
              padding: const EdgeInsets.only(top: 10),
              color: Colors.lightBlue,
              child: RaisedButton(
                color: Colors.lightBlue,
                child: Text(AppLocalizations.of(context).title),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => todogetir()),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: 500,
              padding: const EdgeInsets.only(top: 10),
              color: Colors.lightBlue,
              child: RaisedButton(
                color: Colors.lightBlue,
                child: Text(AppLocalizations.of(context).qrcode),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => hesgostergizle()),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: 500,
              padding: const EdgeInsets.only(top: 10),
              color: Colors.lightBlue,
              child: RaisedButton(
                color: Colors.lightBlue,
                child: Text(AppLocalizations.of(context).gallery),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => galerigetir()),
                  );
                },
              ),
            ),
            /*Container(
              margin: const EdgeInsets.only(top: 20),
              width: 500,
              padding: const EdgeInsets.only(top: 10),
              color: Colors.lightBlue,
              child: RaisedButton(
                color: Colors.lightBlue,
                child: Text(AppLocalizations.of(context).gallery),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => islemlerigetir()),
                  );
                },
              ),
            ),*/
            Container(
              child: Image.asset("images/ist.jpg"),
            ),
          ],
        ),
      ),
    );
  }
}

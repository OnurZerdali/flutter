import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Ekle extends StatefulWidget {
  @override
  _EkleState createState() => _EkleState();
}

class _EkleState extends State<Ekle> {
  TextEditingController veri1 = TextEditingController();
  TextEditingController veri2 = TextEditingController();

  Ekle() {
    FirebaseFirestore.instance
        .collection("liste")
        .doc(veri1.text)
        .set({'yer': veri1.text, 'tarih': veri2.text});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(AppLocalizations.of(context).addPageTitle)),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15, left: 50.0, right: 50.0),
              child: TextField(
                controller: veri1,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, left: 50.0, right: 50.0),
              child: TextField(
                controller: veri2,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40.0, left: 50),
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text("+"),
                    onPressed: Ekle,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Guncelle extends StatefulWidget {
  String yer;
  String tarih;
  String documentId;

  Guncelle({Key key, this.yer, this.tarih, this.documentId}) : super(key: key);

  @override
  _GuncelleState createState() => _GuncelleState();
}

class _GuncelleState extends State<Guncelle> {
  TextEditingController veri1 = TextEditingController();
  TextEditingController veri2 = TextEditingController();

  Guncelle() {
    FirebaseFirestore.instance
        .collection("liste")
        .doc(widget.documentId)
        .update({'yer': veri1.text, 'tarih': veri2.text});
  }

  @override
  Widget build(BuildContext context) {
    veri1.text = widget.yer;
    veri2.text = widget.tarih;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Guncelleme Sayfası")),
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
                  margin: const EdgeInsets.only(top: 30.0, left: 50),
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text("Güncelle"),
                    onPressed: Guncelle,
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:istanbul_gezi/screens/guncelle.dart';

import 'ekle.dart';

class todo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: todogetir(),
    );
  }
}

class todogetir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(AppLocalizations.of(context).title)),
      ),
      body: gezilistesi(),
    );
  }
}

class gezilistesi extends StatefulWidget {
  _gezilistesiState createState() => _gezilistesiState();
}

class _gezilistesiState extends State<gezilistesi> {
  TextEditingController veri1 = TextEditingController();
  TextEditingController veri2 = TextEditingController();

  @override
  //final databaseReference = FirebaseFirestore.instance;
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      child: Center(
        child: Column(
          children: <Widget>[
            Image.asset("images/ist.jpg"),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('liste').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Text('Loading...');
                    default:
                      return ListView(
                        children: snapshot.data.docs.map((document) {
                          return ListTile(
                            title: Text(document['yer'].toString(),
                                style: const TextStyle(fontSize: 20)),
                            subtitle: Text(document['tarih'].toString()),
                            leading: const CircleAvatar(
                              child: Image(
                                image: AssetImage('images/ist2.jpg'),
                              ),
                            ),
                            trailing: Wrap(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Guncelle(
                                                yer: document['yer'].toString(),
                                                tarih: document['tarih']
                                                    .toString(),
                                                documentId: document.id,
                                              )),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () async {
                                    await FirebaseFirestore.instance
                                        .collection("liste")
                                        .doc(document.id)
                                        .delete();
                                  },
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      );
                  }
                },
              ),
            ),
            Row(
              children: [
                Container(
                  color: Colors.red,
                  margin: const EdgeInsets.only(right: 190.0),
                  child: RaisedButton(
                    color: Colors.red,
                    child: IconButton(
                      color: Colors.black,
                      icon: Icon(Icons.add),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Ekle()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

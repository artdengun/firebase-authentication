// import 'package:belajar_firebase/auth_services.dart';
import 'package:belajar_firebase/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// import 'package:belajar_firebase/wrapper.dart';
// import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return StreamProvider.value(
    //   value: AuthServices.firebaseuserStream,
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home:
    //         Wrapper(), // widget yang akan mengarahkan kita ke login atau mainpage
    //   ),
    // );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Firestore Demo"),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text("Tambah data"),
                    onPressed: () {
                      DatabaseServices.createOrUpdateProduct("1",
                          name: "masker", price: 5000);
                    }),
                RaisedButton(
                    child: Text("Edit Data"),
                    onPressed: () {
                      DatabaseServices.createOrUpdateProduct("1",
                          name: "deni", price: 200000);
                    }),
                RaisedButton(
                    child: Text("Ambil Data"),
                    onPressed: () async {
                      DocumentSnapshot snapshot =
                          await DatabaseServices.getProduct("1");
                      print(snapshot.data['nama']);
                      print(snapshot.data['harga']);
                    }),
                RaisedButton(
                  child: Text("Delete Data"),
                  onPressed: () async {
                    await DatabaseServices.deleteProduct("1");
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

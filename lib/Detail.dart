import 'package:flutter/material.dart';
import 'Model/Museum.dart';

class Detail extends StatefulWidget {
  Detail({Key key, this.dataDetail}) : super(key: key);
  final Datum dataDetail;
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    Datum _museum = widget.dataDetail;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/images/elephant-api-logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Transform.translate(
                offset: Offset(15, -15),
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.white),
                    shape: BoxShape.circle,
                    color: Colors.deepOrange[800],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(
                  image: NetworkImage("https://images.unsplash.com/photo-1532702229413-a9ec46471ca0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80 "),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  _museum.nama.toString().toUpperCase(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Lokasi: ${_museum.kecamatan.toString()} ${_museum.kabupatenKota.toString()} ${_museum.propinsi.toString()}",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Tanggal Berdiri:",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  _museum.tahunBerdiri,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

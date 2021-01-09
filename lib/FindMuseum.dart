import 'package:ujianptm/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Detail.dart';
import 'Model/Museum.dart';

class FindMuseum extends StatefulWidget {
  @override
  _FindMuseumState createState() => _FindMuseumState();
}

class _FindMuseumState extends State<FindMuseum> {
  List<Datum> _museumList = [];

  Future<List<Datum>> get getMuseum async {

    final resp =
        await http.get("http://jendela.data.kemdikbud.go.id/api/index.php/CcariMuseum/searchGET?nama=museum");

    String body = utf8.decode(resp.bodyBytes);
    print("response body "+body);

    if (resp.statusCode != 200) {
      throw ("gagal Terhubung dengan server (Code: ${resp.statusCode}");
    }

    final Museum res = jsonDecode(body);


    if (resp.statusCode == 200) {
      res.data.forEach((Datum data) {
        _museumList.add(data);
      });
      return _museumList;
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 248, 253, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // FadeAnimation(
              //     1,
              //     Container(
              //       padding: EdgeInsets.symmetric(vertical: 5),
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(50),
              //           color: Colors.white),
              //       child: TextField(
              //         decoration: InputDecoration(
              //             border: InputBorder.none,
              //             prefixIcon: Icon(
              //               Icons.search,
              //               color: Colors.grey,
              //             ),
              //             hintText: "Search Game",
              //             hintStyle: TextStyle(color: Colors.grey)),
              //       ),
              //     )),
              // SizedBox(
              //   height: 30,
              // ),
              Expanded(
                child: FutureBuilder<List<Datum>>(
                 // initialData: _museumList,
                  future: getMuseum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.hasData &&
                          snapshot.connectionState == ConnectionState.done &&
                          snapshot.data.length > 0) {
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            Datum _modelMuseum = snapshot.data[index];
                            return Container(
                              child: GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Detail(
                                        dataDetail: _modelMuseum,
                                      ),
                                    )),
                                child: Column(
                                  children: [
                                    FadeAnimation(
                                      1.5,
                                      makeItem(
                                        title: _modelMuseum.nama,
                                        genre: _modelMuseum.kecamatan +
                                            " - " + _modelMuseum.kabupatenKota + " - " + _modelMuseum.propinsi,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        print(snapshot.data.length);
                        return Container();
                      }
                    } else {
                      return Container(
                        width: 90,
                        height: 90,
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget makeItem({title, genre}) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage("https://images.unsplash.com/photo-1532702229413-a9ec46471ca0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"), fit: BoxFit.cover)),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(.4),
                    Colors.black.withOpacity(.1),
                  ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.airplay_rounded,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        genre,
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:COOVI69/Indonesia.dart';
import 'package:COOVI69/global.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: <String, WidgetBuilder>{
        '/ind': (BuildContext context) => IndPage(),
        '/glo': (BuildContext context) => GloPage(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Colors.cyan,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/homeco.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 1.7,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(30.0),
                    topRight: const Radius.circular(30.0),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Text(
                            'COOVI69',
                            style: TextStyle(
                              height: 2.5,
                              fontSize: 70,
                              fontFamily: 'Itim',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Text(
                            'Coronavirus Global & Indonesia Data',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Itim',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                        bottom: 30,
                        right: 20,
                        child: Row(
                          children: [
                            Text(
                              'Mulai!',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Itim',
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_right_alt),
                              iconSize: 50,
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, '/ind');
                              },
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

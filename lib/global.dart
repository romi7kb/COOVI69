import 'package:COOVI69/get_data.dart';
import 'package:flutter/material.dart';

class GloPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GetDataGlobal _getGlobal = new GetDataGlobal();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 40,
              width: 150,
              decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(20.0),
                topRight: const Radius.circular(20.0),
                bottomLeft: const Radius.circular(20.0),
                bottomRight: const Radius.circular(20.0),
              )),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/ind');
                  },
                  child: Text(
                    'Indonesia',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'Itim',
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              width: 150,
              decoration: new BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0),
                    bottomLeft: const Radius.circular(20.0),
                    bottomRight: const Radius.circular(20.0),
                  )),
              child: Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Global',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontFamily: 'Itim',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: FutureBuilder(
            future: _getGlobal.getKoronaDataGlobal(),
            builder: (BuildContext context,
                AsyncSnapshot<List<DataKoronaGlobal>> snapshot) {
              if (snapshot.hasData) {
                List<DataKoronaGlobal> dataGLobal = snapshot.data;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 0, 30),
                      child: Text(
                        'Data Kasus Negara',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontFamily: 'Itim',
                        ),
                      ),
                    ),
                    Container(
                      height: 400,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dataGLobal.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(20, 0, 0, 30),
                                child: Text(
                                  dataGLobal[index].countryRegion,
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontFamily: 'Itim',
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                height: 100,
                                width: MediaQuery.of(context).size.width - 20,
                                decoration: new BoxDecoration(
                                    color: Colors.cyan,
                                    borderRadius: new BorderRadius.only(
                                      topLeft: const Radius.circular(5.0),
                                      topRight: const Radius.circular(5.0),
                                      bottomLeft: const Radius.circular(5.0),
                                      bottomRight: const Radius.circular(5.0),
                                    )),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      right: 0,
                                      top: -12,
                                      child: Image.asset(
                                        'assets/images/vi.png',
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      left: 20,
                                      child: Text(
                                        'Total Positif',
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                          fontFamily: 'Itim',
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 20,
                                      child: Text(
                                        dataGLobal[index].confirmed.toString(),
                                        style: TextStyle(
                                          fontSize: 60,
                                          color: Colors.white,
                                          fontFamily: 'Itim',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 10, 5, 0),
                                    height: 100,
                                    width: (MediaQuery.of(context).size.width /
                                            2) -
                                        15,
                                    decoration: new BoxDecoration(
                                        color: Colors.cyan,
                                        borderRadius: new BorderRadius.only(
                                          topLeft: const Radius.circular(5.0),
                                          topRight: const Radius.circular(5.0),
                                          bottomLeft:
                                              const Radius.circular(5.0),
                                          bottomRight:
                                              const Radius.circular(5.0),
                                        )),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 10,
                                          left: 20,
                                          child: Text(
                                            'Total Sembuh',
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white,
                                              fontFamily: 'Itim',
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 20,
                                          left: 20,
                                          child: Text(
                                            dataGLobal[index]
                                                .recovered
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 40,
                                              color: Colors.white,
                                              fontFamily: 'Itim',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                                    height: 100,
                                    width: (MediaQuery.of(context).size.width /
                                            2) -
                                        15,
                                    decoration: new BoxDecoration(
                                        color: Colors.cyan,
                                        borderRadius: new BorderRadius.only(
                                          topLeft: const Radius.circular(5.0),
                                          topRight: const Radius.circular(5.0),
                                          bottomLeft:
                                              const Radius.circular(5.0),
                                          bottomRight:
                                              const Radius.circular(5.0),
                                        )),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 10,
                                          left: 20,
                                          child: Text(
                                            'Total Meninggal',
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white,
                                              fontFamily: 'Itim',
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 20,
                                          left: 20,
                                          child: Text(
                                            dataGLobal[index].deaths.toString(),
                                            style: TextStyle(
                                              fontSize: 40,
                                              color: Colors.white,
                                              fontFamily: 'Itim',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

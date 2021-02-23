import 'package:COOVI69/get_data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GetDataIndonesia _getDataIndonesia = new GetDataIndonesia();
    final GetDataGlobal _getGlobal = new GetDataGlobal();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              child: FutureBuilder(
                future: _getDataIndonesia.getKoronaData(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<DataKorona>> snapshot) {
                  if (snapshot.hasData) {
                    List<DataKorona> dataInd = snapshot.data;
                    return ListView.builder(
                      itemCount: dataInd.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                dataInd[index].name,
                              ),
                              Text(
                                dataInd[index].positif,
                              ),
                              Text(
                                dataInd[index].sembuh,
                              ),
                              Text(
                                dataInd[index].meninggal,
                              ),
                              Text(
                                dataInd[index].dirawat,
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            Container(
              height: 400,
              child: FutureBuilder(
                future: _getGlobal.getKoronaDataGlobal(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<DataKoronaGlobal>> snapshot) {
                  if (snapshot.hasData) {
                    List<DataKoronaGlobal> dataGLobal = snapshot.data;
                    return ListView.builder(
                      itemCount: dataGLobal.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                dataGLobal[index].countryRegion,
                              ),
                              Text(
                                dataGLobal[index].confirmed.toString(),
                              ),
                              Text(
                                dataGLobal[index].recovered.toString(),
                              ),
                              Text(
                                dataGLobal[index].deaths.toString(),
                              ),
                              Text(
                                dataGLobal[index].active.toString(),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

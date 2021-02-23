import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class GetDataIndonesia {
  final String url = "https://api.kawalcorona.com/indonesia";
  Future<List<DataKorona>> getKoronaData() async {
    Response res = await get(url);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<DataKorona> koronaData =
          body.map((dynamic item) => DataKorona.fromJson(item)).toList();
      return koronaData;
    } else {
      throw "tidak bisa mendapat data";
    }
  }
}

class GetDataGlobal {
  final String url = "https://api.kawalcorona.com/";
  Future<List<DataKoronaGlobal>> getKoronaDataGlobal() async {
    Response res = await get(url);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<DataKoronaGlobal> koronaDataGlobal =
          body.map((dynamic item) => DataKoronaGlobal.fromJson(item)).toList();
      return koronaDataGlobal;
    } else {
      throw "tidak bisa mendapat data";
    }
  }
}

// Model
class DataKorona {
  final String name;
  final String positif;
  final String sembuh;
  final String meninggal;
  final String dirawat;

  DataKorona({
    @required this.name,
    @required this.positif,
    @required this.sembuh,
    @required this.meninggal,
    @required this.dirawat,
  });

  factory DataKorona.fromJson(Map<String, dynamic> json) {
    return DataKorona(
      name: json['name'] as String,
      positif: json['positif'] as String,
      sembuh: json['sembuh'] as String,
      meninggal: json['meninggal'] as String,
      dirawat: json['dirawat'] as String,
    );
  }
}

class DataKoronaGlobal {
  final String countryRegion;
  final int confirmed;
  final int deaths;
  final int recovered;
  final int active;

  DataKoronaGlobal({
    @required this.countryRegion,
    @required this.confirmed,
    @required this.deaths,
    @required this.recovered,
    @required this.active,
  });

  factory DataKoronaGlobal.fromJson(Map<String, dynamic> json) {
    return DataKoronaGlobal(
      countryRegion: json['attributes']['Country_Region'] as String,
      confirmed: json['attributes']['Confirmed'] as int,
      deaths: json['attributes']['Deaths'] as int,
      recovered: json['attributes']['Recovered'] as int,
      active: json['attributes']['Active'] as int,
    );
  }
}

import 'dart:convert';
// import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class ResultPage2 extends StatelessWidget {
  final Map<String, dynamic> data;

  const ResultPage2({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    FilterOut filterOut = FilterOut.fromJson(data);
    // print("Hello Temperature");
    // print(filterOut.feeds![0].field7);
    String? h20Level = filterOut.feeds![0].field6;
    String? temperature = filterOut.feeds![0].field7;
    String? createddateString = filterOut.feeds![0].createdAt;
    createddateString =
        createddateString!.substring(0, createddateString.length - 1);

    DateTime createddateTime = DateTime.parse(createddateString);
    int year = createddateTime.year;
    int month = createddateTime.month;
    int day = createddateTime.day;
    int createdEpochTimeMillis = createddateTime.millisecondsSinceEpoch;

    final now = DateTime.now();
    int currEpochTimeMillis = now.millisecondsSinceEpoch;

    int epochTimeMin = (currEpochTimeMillis - createdEpochTimeMillis) ~/ 60000;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Result Page'),
      ),
      body: ListView.builder(
        itemCount: filterOut.feeds!.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Date  $year-$month-$day'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Temperature: ${filterOut.feeds![filterOut.feeds!.length - index - 1].field7}°C'),
                Text(
                    'Water level: ${filterOut.feeds![filterOut.feeds!.length - index - 1].field6}'),
                Text('Updated $epochTimeMin minutes ago'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class FilterOut {
  List<Feeds>? feeds;

  FilterOut({this.feeds});

  FilterOut.fromJson(Map<String, dynamic> json) {
    if (json['feeds'] != null) {
      feeds = <Feeds>[];
      json['feeds'].forEach((v) {
        feeds!.add(new Feeds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.feeds != null) {
      data['feeds'] = this.feeds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Feeds {
  String? createdAt;
  int? entryId;
  Null? field1;
  Null? field2;
  Null? field3;
  Null? field4;
  Null? field5;
  String? field6;
  String? field7;
  Null? field8;

  Feeds(
      {this.createdAt,
      this.entryId,
      this.field1,
      this.field2,
      this.field3,
      this.field4,
      this.field5,
      this.field6,
      this.field7,
      this.field8});

  Feeds.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    entryId = json['entry_id'];
    field1 = json['field1'];
    field2 = json['field2'];
    field3 = json['field3'];
    field4 = json['field4'];
    field5 = json['field5'];
    field6 = json['field6'];
    field7 = json['field7'];
    field8 = json['field8'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['entry_id'] = this.entryId;
    data['field1'] = this.field1;
    data['field2'] = this.field2;
    data['field3'] = this.field3;
    data['field4'] = this.field4;
    data['field5'] = this.field5;
    data['field6'] = this.field6;
    data['field7'] = this.field7;
    data['field8'] = this.field8;
    return data;
  }
}

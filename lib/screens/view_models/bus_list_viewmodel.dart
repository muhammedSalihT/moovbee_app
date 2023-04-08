import 'package:flutter/material.dart';
import 'package:moovbe_app/screens/models/buslist_model.dart';

class BusListViewModel extends ChangeNotifier {
  List<BusListModel> busList = [
    BusListModel(
        busName: "Volvo", subName: "Volo mini", seatCount: 24, seatType: "2*2"),
    BusListModel(
        busName: "Ksrtc", subName: "Swift", seatCount: 32, seatType: "1*3"),
    BusListModel(
        busName: "Ksrtc",
        subName: "Bypass rider",
        seatCount: 28,
        seatType: "1*3"),
    BusListModel(
        busName: "Volvo",
        subName: "Volo Super",
        seatCount: 28,
        seatType: "2*2"),
  ];
}

class BusListModel {
  final String busImage;
  final String busName;
  final String subName;
  final int seatCount;
  final String seatType;

  BusListModel(
      {this.busImage = "assets/image 3 (1).png",
      required this.busName,
      required this.subName,
      required this.seatCount,
      required this.seatType});
}

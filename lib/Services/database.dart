import 'package:cloud_firestore/cloud_firestore.dart';


        //FOR UPLODING DATA IN THE FIREBASE


class DatabaseMethod {
  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

            //FOR UPLODING BOOKING DATA IN THE FIRESTORE


  Future addUserBooking(Map<String, dynamic> userInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("Booking")
        .add(userInfoMap);
  }
  Future<Stream<QuerySnapshot>> getBookings() async {
    return await FirebaseFirestore.instance.collection("Booking").snapshots();
  }
     Future DeleteBookings(String id) async {
    return await FirebaseFirestore.instance
        .collection("Booking").doc(id).delete();
  }
}

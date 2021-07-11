// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import 'models.dart';
//
// class DatabaseManager {
//   Future<Main> getUsersList(String feild, String link) async {
//     final CollectionReference updates =
//         FirebaseFirestore.instance.collection(feild);
//     List<Map<String, dynamic>> itemsList;
//
//     try {
//       await updates
//           .doc(link)
//           .collection("/didYouKnow/iBaFdbTfC0PQITE8OO99")
//           .get()
//           .then((querySnapshot) {
//         querySnapshot.docs.forEach((element) {
//           itemsList.add(element.data());
//         });
//         print(itemsList);
//       });
//       return Main.fromList(itemsList);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
// }

//=========================================================================================================
//===========
// var collection = FirebaseFirestore.instance.collection('DriverList');
// var querySnapshot = await collection.get();
// for (var queryDocumentSnapshot in querySnapshot.docs) {
// Map<String, dynamic> data = queryDocumentSnapshot.data();
// var name = data['name'];
// var phone = data['phone'];
// }
//============
// StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
// stream: FirebaseFirestore.instance.collection('DriverList').snapshots(),
// builder: (_, snapshot) {
// if (snapshot.hasError) return Text('Error = ${snapshot.error}');
//
// if (snapshot.hasData) {
// final docs = snapshot.data!.docs;
// return ListView.builder(
// itemCount: docs.length,
// itemBuilder: (_, i) {
// final data = docs[i].data();
// return ListTile(
// title: Text(data['name']),
// subtitle: Text(data['phone']),
// );
// },
// );
// }
//
// return Center(child: CircularProgressIndicator());
// },
// )
//================

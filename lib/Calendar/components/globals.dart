// // int s = 5;
// //
// // List lista = [];
//
// import 'package:flutter/cupertino.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class GlobalProvider extends ChangeNotifier {
//   static const _APP_INFO_LIST123 = "appInfoList123";
//
//   GlobalProvider() {
//     future = syncDataWithProvider();
//   }
//
//   List<AppInfoModel> appInfoList123 = [];
//   Future future;
//
//   Fure updateSharedPreferencesAppInfo123(List<dynamic> value) async {
//     List<String> myAppInfoList123 = value.map((e) => json.encode(e)).toList();
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final result =
//         await prefs.setStringList(_APP_INFO_LIST123, myAppInfoList123);
//     print('result from updateSP $result');
//     print('Myappinfolist123 : $myAppInfoList123');
//   }
//
//   Future syncDataWithProvider() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var result = prefs.getStringList(_APP_INFO_LIST123);
//     print('The Result is $result');
//     if (result != null) {
//       appInfoList123 = result
//           .map<AppInfoModel>((e) => AppInfoModel.fromJson(json.decode(e)))
//           .toList();
//     }
//     print('Hore $appInfoList123');
//     notifyListeners();
//   }
// }
//
// return FutureBuilder(
// future: globalProvider.future,
// builder: (context, snapshot) {
// if (!snapshot.hasData) {
// return Text('Loading...');
// }
//
// return Scaffold(
// body: Center(
// child: Text(globalProvider.appInfoList123[0].fileInfo),
// ),
// )
// }
// );

//   [
//     2021,
//     7,
//     5,
//     2,
//     'Factech out !!;https://www.instagram.com/p/CPdH2uSlHfK/',
// // 'https://www.instagram.com/p/CPdH2uSlHfK/',
//     'Blog Out !!;https://technothlon.medium.com/judging-a-random-garbage-of-names-4ea8003861e6',
// // 'https://technothlon.medium.com/judging-a-random-garbage-of-names-4ea8003861e6'
//   ],
//   [
//     2021,
//     7,
//     7,
//     3,
//     'New Video in Youtube;https://youtu.be/fPTxLFld4ks',
// // 'https://youtu.be/fPTxLFld4ks',
//     'Another New Video;https://youtu.be/wflhTC9OVCE',
// // 'https://youtu.be/wflhTC9OVCE',
//     'See our Website;https://technothlon.techniche.org.in/',
// // 'https://technothlon.techniche.org.in/'
//   ],
// ];

//============
// [
//   [
//     2021,
//     7,
//     5,
//     2,
//     ["events-5-1", "events-5-2"],
//   ],
//   [
//     2021,
//     7,
//     7,
//     2,
//     ["events-5-1", "events-5-2"],
//   ],
// ],
// [
//   [
//     2021,
//     7,
//     5,
//     2,
//     'Factech out !!;https://www.instagram.com/p/CPdH2uSlHfK/',
//     // 'https://www.instagram.com/p/CPdH2uSlHfK/',
//     'Blog Out !!;https://technothlon.medium.com/judging-a-random-garbage-of-names-4ea8003861e6',
//     // 'https://technothlon.medium.com/judging-a-random-garbage-of-names-4ea8003861e6'
//   ],
//   [
//     2021,
//     7,
//     7,
//     3,
//     'New Video in Youtube;https://youtu.be/fPTxLFld4ks',
//     // 'https://youtu.be/fPTxLFld4ks',
//     'Another New Video;https://youtu.be/wflhTC9OVCE',
//     // 'https://youtu.be/wflhTC9OVCE',
//     'See our Website;https://technothlon.techniche.org.in/',
//     // 'https://technothlon.techniche.org.in/'
//   ],
// ],

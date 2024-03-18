// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseCrudService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  String currentLoggedInUser = "";

  _checkCurrentUser() {
    User? loggedInUser = auth.currentUser;
    if (loggedInUser != null) {
      currentLoggedInUser = loggedInUser.email!;
    } else {
      currentLoggedInUser = 'null: no User Signed In';
    }
  }

  Future<void> addDataToDB({required String typedMessage}) async {
    _checkCurrentUser();
    try {
      Map<String, dynamic> dataToSend = {
        'sender': currentLoggedInUser,
        'text': typedMessage,
        'date': DateTime.now()
      };

      await db.collection('messages').add(dataToSend);
    } catch (e) {
      print(e);
    }
  }

  // ? this is a type of method only for quering when required where as stream is for check stream if any do again
//   getMessage() async {
//     await db.collection("messages").get().then(
//       (querySnapshot) {
//         print("\u001b[4m\u001b[1m Successfully completed \n Message Section:");
//         for (var docSnapshot in querySnapshot.docs) {
//           // print('${docSnapshot.id} => DAta:${docSnapshot.data()}');
//           print(
//               ' \n sender:${docSnapshot.data()['sender']}\n message:${docSnapshot.data()['text']}');
//         }
//       },
//       onError: (e) => print("Error completing: $e"),
//     );
//   }
// // ! created message for streaming type for keep updating data from DB if any chages

  getStreamMessage() async {
    // ! get snap for stream for push from server
    await for (var docSnapshot in db.collection('messages').snapshots()) {
      // !after snap lopp to message data
      for (QueryDocumentSnapshot<Map> messageDetailsMap in docSnapshot.docs) {
        // * for printing bold  and underlined
        print(
            "\u001b[4m\u001b[1m\u001b[2m OverAll Queried Data:${messageDetailsMap.runtimeType}");
        print(
            'Sender:${messageDetailsMap.data()['sender']} \n Message: ${messageDetailsMap.data()['text']}');
      }
    }
  }
}

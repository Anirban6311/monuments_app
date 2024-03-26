import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Home Page")),
       backgroundColor: Colors.amberAccent,),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('monuments_data').snapshots(),
        builder: (BuildContext context ,AsyncSnapshot<QuerySnapshot> snapshot){
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No data available.'));
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              return ListTile(
                title: Text(data['name']),
                subtitle: Text(data['location']),
                leading: Image.network(data['image']), // Assuming imageURL is a URL to the image
                // You can customize the ListTile further based on your requirements
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Services/database.dart';
import 'Description.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Home Page",style: TextStyle(
        fontSize: 20,
      ),)),
       backgroundColor: Colors.amberAccent,),
      body: StreamBuilder(
        stream: DatabaseMethods.monumentStream,
        builder: (BuildContext context ,AsyncSnapshot snapshot){
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No data available.'));
          }

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Adjust the number of columns as needed
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
            ),
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context,index){
              DocumentSnapshot ds=snapshot.data.docs[index];
              return GridTile(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>DescriptionScreen(description: ds['desc'],image: ds['image'],name: ds['name'],)));
                      },
                      child: Expanded(
                        child: Image.network(
                          ds['image'], // Assuming imageURL is a URL to the image
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 4), // Adding a small space between the image and text
                    Text(ds['name']),
                    Text(ds['location']),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

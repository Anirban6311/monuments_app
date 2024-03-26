import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Home.dart';


//This helped in fetching the details from one screen to other
class DescriptionScreen extends StatelessWidget {
  //the desc variable of the clicked image is passed ..taken throug this variable
  final String description;
  final String image;
  final String name;

  DescriptionScreen({required this.description ,required this.image,required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amberAccent,),
      body:SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.5, // Adjust the opacity level here (0.0 - fully transparent, 1.0 - fully opaque)
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),

                        Text(
                          description,
                          style: TextStyle(fontSize: 18,
                          fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  // Expanded(
                  //   flex: 1,
                  //   child: Container(
                  //     alignment: Alignment.topRight,
                  //     child: CircleAvatar(
                  //       radius: 50,
                  //       // backgroundImage: AssetImage('Images/Profile.jpg'),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class Description extends StatelessWidget {
//   const Description({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//
//   }
// }

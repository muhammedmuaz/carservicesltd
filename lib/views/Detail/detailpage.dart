import 'package:flutter/material.dart';
import 'package:services_app/views/services/servicepage.dart';
import 'package:services_app/widgets/rating_bar.dart';

class DetailPage extends StatelessWidget {
  final String title,detail,photoReference;
  final double rating;

  const DetailPage({super.key,required this.title,required this.detail,required this.photoReference,required this.rating});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title:  Text(detail.toString()),
        //   backgroundColor: Colors.green,
        //   automaticallyImplyLeading: false,
        // ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
              child: Stack(
                                    children: [ ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                          //'https://images.pexels.com/photos/17115338/pexels-photo-17115338/free-photo-of-city-summer-building-construction.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                           buildPhotoUrl(photoReference.toString()),
                                          width: MediaQuery.of(context).size.width,
                                          height: 300,
                                          fit: BoxFit.cover,
                                        ),
                                    ),
                                     Positioned(
                                      top: 35,
                                      left: 10,
                                       child:    GestureDetector(
                                        onTap:(){
                                          Navigator.pop(context);
                                        }  ,
                                         child:const CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Colors.white,
                                          child:    Icon( Icons.arrow_back,color: Colors.blue,size: 15,),
                                         ),
                                       )
                                     ),
                                      Positioned(
                                      top: 35,
                                      right: 10,
                                       child:   Container(
                                        height: 25,
                                        width: 80,
                                        decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Button' ,style: TextStyle(color: Colors.white),
                                         
                                          ),
                                      ),
                                       )
                                     )
                                    ]
                                  ),
            ),
                                 Container(
                                  margin: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                                  
                                  child: 
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,                                    
                                    crossAxisAlignment: CrossAxisAlignment.start,                                    
                                  children: [
                                  Row(
                                    
                                  children:   [
                                    Expanded(child:  Text(title.toString(),style:  TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                                     Container(
                                      height: 35,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Button' ,style: TextStyle(color: Colors.white),
                                         
                                          ),
                                      ),
                                      )
                                  ],
                                    ),
                                const SizedBox(height: 5.0,)                            ,
                                RatingBar(rating: rating.toDouble())


                                  ],),
                                 ),
   
                                    
          ],
        ),
      ),
    );
  }


 



}



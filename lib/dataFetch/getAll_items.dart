import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:night_canteen_user/screens/SingleItemDetail.dart';
class GetAll_Items extends StatefulWidget {
  const GetAll_Items({Key? key,required this.docId}) : super(key: key);
  final String docId;

  @override
  State<GetAll_Items> createState() => _GetAll_ItemsState();
}

class _GetAll_ItemsState extends State<GetAll_Items> {
  Future<DocumentSnapshot>? data = null;

  Map<String,dynamic> details ={};

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<DocumentSnapshot>(future: data ,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
        {
          if(snapshot.connectionState==ConnectionState.done) {
            details = snapshot.data!.data() as Map<String,dynamic>;
           return GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightGreenAccent),
                      borderRadius: BorderRadius.all(Radius.circular(15)),color: Colors.lightGreenAccent[100]
                  ),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Image.network(details['img3'],height: 150,width: 150,),
                            Image.network(details['img2'],height: 150,width: 150,),
                            Image.network(details['img1'],height: 150,width: 150,),
                          ],
                        ),

                      ),
                      SizedBox(height: 10,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 5,
                            height: 5,
                            decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: 5,
                            height: 5,
                            decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: 5,
                            height: 5,
                            decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle),
                          ),


                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("${details['ItemName']}",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("₹${details['Price']}"),
                          
                        ],
                      )
                    ],
                  ),
                ),
              ),
              onTap: (){
                Get.to(SingleItemDetail(detail: details,));
              },
            );

          }
        return Text("Loading.......");
        });

  }
  Future<DocumentSnapshot> getItemDetail() async{
    await Firebase.initializeApp();
    CollectionReference user = await FirebaseFirestore.instance.collection("Items");

    return user.doc(widget.docId).get();

  }

  @override
  void initState() {
    data = getItemDetail();
    super.initState();
  }
}

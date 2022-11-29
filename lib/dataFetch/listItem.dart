
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:night_canteen_user/dataFetch/Controller.dart';

class ListItems extends StatefulWidget {
  const ListItems({Key? key,required this.order}) : super(key: key);
    final Map order;
  @override
  State<ListItems> createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  CartController size = Get.put(CartController());
  int quantity =0;
  @override
  Widget build(BuildContext context) {

    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(5),
        height: 110,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(45)), color: Colors.white,),

        child: Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(widget.order['img1']),
              ),radius: 65,backgroundColor: Colors.lightGreenAccent,),

              Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text (widget.order['ItemName'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                  SizedBox(height: 20,),
                  Text ("₹"+widget.order['Price'].toString(),style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                ],
              ),
              Expanded(child: Container()),
              Row(
                children: [
                  IconButton(onPressed: (){
                    if(quantity!=0){
                      quantity = quantity-1;
                      int price = widget.order['Price'];
                      size.cartTotal.value -= price;
                      //  c.shop.value = total;
                    }
                    setState(() {
                    });
                  }, icon: Icon(CupertinoIcons.minus)),
                  Text("$quantity",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                  IconButton(onPressed: (){
                    int price = widget.order['Price'];
                    int itemPrice = price*quantity;
                    size.cartTotal.value  -= itemPrice;
                    quantity += 1;setState((){});
                    itemPrice = price*quantity;
                    size.cartTotal.value  += itemPrice;
                    // c.shop.value = total;
                    setState(() {
                    });
                  }, icon: Icon(Icons.add)),
                ],
              )
            ]
        )
    );
    // return
    //   Container(height: 120,child: Text(order['ItemName']),);
  }
  }


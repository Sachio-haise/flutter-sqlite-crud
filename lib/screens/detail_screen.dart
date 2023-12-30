import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/model/product.dart';
class DetailPage extends StatelessWidget {
  final ProductModel product;
  const DetailPage({
    Key? key,
    required this.product
   }): super(key:key) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     body: Padding(
       padding: const EdgeInsets.only(left: 18.0, right: 18),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Padding(
             padding: const EdgeInsets.only(top: 60.0,),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 IconButton(onPressed: () => Get.toNamed('/'), icon: const Icon(Icons.arrow_back_ios),),
                 const Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Icon(Icons.favorite, color:Colors.red, size: 30,),
                     SizedBox(width: 15,),
                     Icon(Icons.share, size: 30,),
                     SizedBox(width: 15,),
                     Badge(
                       label: Text('1'),
                       child: Icon(Icons.shopping_bag_outlined),
                     )
                   ],
                 )
               ],
             ),
           ),
           const SizedBox(
             height: 15,
           ),
           const Image(
               height: 350,
               width: 350,
               image: AssetImage('assets/images/detail shirt.png')),
           const Row(
             children: [
               Icon(Icons.on_device_training_sharp, color: Colors.grey),
               Text('Tokobaju.id', style: TextStyle(
                 fontWeight: FontWeight.bold,
                 color: Colors.grey
               ),),

             ],
           ),
           const SizedBox(height:10),
           Text(product.name,
             style: const TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 20,
             ),),
           const SizedBox(
             height: 15,
           ),
           const Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Icon(Icons.star, color: Colors.orange,),
               Text('4.9 Ratings', style: TextStyle(
                   color: Colors.grey,fontWeight: FontWeight.bold,
                   fontSize:15
               ),),
               Text('-',style: TextStyle(
                   fontSize:30
               ),),
               Text('2.3k + Reviews ',style: TextStyle(
                   color: Colors.grey,fontWeight: FontWeight.bold,
                   fontSize:15
               ),),
               Text('-',style: TextStyle(
                   fontSize:30
               ),),
               Text('2.9+ Sold',style: TextStyle(
                   color: Colors.grey,fontWeight: FontWeight.bold,
                   fontSize:15
               ),)
             ],
           ),
           const Row(
             children: [
               Text('About Item',style: TextStyle(
                 fontSize: 20,fontWeight: FontWeight.bold,
                 color: Color(0xff2A977D),
               ),),
               SizedBox(width:20),
               Text('Reviews',style: TextStyle(
                   fontSize: 20,fontWeight: FontWeight.bold,
                 color: Colors.grey
               ),)
             ],
           ),
           const Divider(color: Colors.grey,),
           const SizedBox(height: 10,),
           Padding(
             padding: const EdgeInsets.only(left:20.0,right: 20.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Row(
                   children: [
                     const Text('Brand:', style: TextStyle(
                         fontWeight: FontWeight.bold,
                         color: Colors.grey
                     ),),
                     const  SizedBox(
                       width: 10,
                     ),
                     Text(product.brand,style:
                     const TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 16
                     ),)
                   ],
                 ),
                 const Row(
                   children: [
                     Text('Color:', style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.grey
                     ),),
                     SizedBox(
                       width: 10,
                     ),
                     Text('Aprikot',style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 16
                     ),)
                   ],
                 )
               ],
             ),
           ),
           const SizedBox(height: 15,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Row(
                children: [
                  Column(
                    children: [
                      const Text('Total Price'),
                      Text('\$${product.price}',style:
                      const TextStyle(
                        fontSize: 22,
                        color: Color(0xff2A977D),
                        fontWeight: FontWeight.bold
                      ),)
                    ],
                  )
                ],
              ),
               Row(
                 children: [
                   Container(
                     width: 70,
                     height: 50,
                     decoration: const BoxDecoration(
                       color: Color(0xff2A977D),
                       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),
                       topLeft: Radius.circular(7))
                     ),
                     child:const Center(
                       child: Padding(
                         padding: EdgeInsets.all(8.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Icon(Icons.shopping_bag_outlined,color: Colors.white,),
                             Text('1', style: TextStyle(
                               fontSize: 18,
                               color: Colors.white,
                               fontWeight: FontWeight.bold
                             ),)
                           ],
                         ),
                       ),
                     )
                   ),
                   Container(
                     width: 120,
                     height: 50,
                     decoration: const BoxDecoration(
                         color: Colors.black,
                         borderRadius: BorderRadius.only(bottomRight: Radius.circular(7),
                             topRight: Radius.circular(7))
                     ),
                     child: const Center(
                       child: Text('Buy Now', style: TextStyle(
                         color: Colors.white,
                         fontSize: 17
                       ),),
                     ),
                   ),
                 ],
               )
             ],
           )
         ],
       ),
     )
    );
  }
}

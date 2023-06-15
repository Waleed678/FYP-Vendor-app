import 'package:flutter/material.dart';
import 'package:fyp_app/Screens/Circle_Container.dart';
import 'package:fyp_app/Screens/Image_Container.dart';
import 'package:fyp_app/Screens/Product.dart';

class TabBarBody extends StatefulWidget {
  @override
  TabBarBodyState createState() => TabBarBodyState();
}

class TabBarBodyState extends State<TabBarBody> {
 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
        
            // the tab bar with two items
            const SizedBox(
              height: 50,
               child : TabBar(
                labelColor: Colors.black,
                  tabs: [
                    Tab(
                     text: 'Products',
                    ),
                    Tab(
                    child: Text('Review'),
                    ),
                  ],
                ),
              
            ),
        
            Expanded(
              child: TabBarView(
                children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     children: [
                       Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border : Border.all(color: Colors.black, )
                            ),
                         
                          height: 204, width: 187,
                          child:  Column(
                            children: [
                              InkWell(onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const Product(),));
                              },
                                child: Container(
                                  child: const Center(child: Text('Image',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
                                  height: 145,width:185,
                                 decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  topLeft: Radius.circular(8),
                                 ),
                                   color: Color.fromRGBO(217, 217, 217, 1),
                                 ),
                                ),
                              ),
                              Column( crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Item name',style: TextStyle(fontWeight: FontWeight.bold),),
                                  const Text('price')
                                ],
                              )
                            ],
                          ),   ) ,
                           Container(
                         decoration: BoxDecoration(
                               color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            border : Border.all(color: Colors.black)
                            ),
                          height: 204, width: 187,
                          child:  Column(
                            children: [
                                InkWell(onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const Product(),));
                              },
                                child: Container(
                                  child: const Center(child: Text('Image',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
                                  height: 145,width:185,
                                  decoration: const BoxDecoration(
                                     color: Color.fromRGBO(217, 217, 217, 1),
                                    borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  topLeft: Radius.circular(8),
                                 ),
                                  ),
                                               
                                ),
                              ),
                              Column( crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Item name',style: TextStyle(fontWeight: FontWeight.bold),),
                                  const Text('price')
                                ],
                              )
                            ],
                          ),   ) ,
                         
                           ], ),

                            const SizedBox(height: 20,),
                              Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         Container(
                             decoration: BoxDecoration(
                               color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            border : Border.all(color: Colors.black)
                            ),
                      height: 204, width: 187,
                      child:  Column(
                        children: [
                            InkWell(onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const Product(),));
                              },
                            child: Container(
                              child: const Center(child: Text('Image',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
                              height: 145,width:185,
                               decoration: const BoxDecoration(
                                     color: Color.fromRGBO(217, 217, 217, 1),
                                    borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  topLeft: Radius.circular(8),
                                 ),
                                  ),
                            ),
                          ),
                          Column( crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Item name',style: TextStyle(fontWeight: FontWeight.bold),),
                                  const Text('price')
                                ],
                              )
                        ],
                      ),   ) ,
                      
                       Container(
                           decoration: BoxDecoration(
                               color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            border : Border.all(color: Colors.black)
                            ),
                      height: 204, width: 187,
                      child:  Column(
                        children: [
                            InkWell(onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const Product(),));
                              },
                            child: Container(
                              child: const Center(child: Text('Image',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
                              height: 145,width:185,
                               decoration: const BoxDecoration(
                                     color: Color.fromRGBO(217, 217, 217, 1),
                                    borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  topLeft: Radius.circular(8),
                                 ),
                                  ),
                            ),
                          ),
                          Column( crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Item name',style: TextStyle(fontWeight: FontWeight.bold),),
                                  const Text('price')
                                ],
                              )
                        ],
                      ),   ) ,
                       ], ),
                           
                     ],
                   ),
                 ),
        
                Tab(
                  child: Container(
                    child: ListView.builder(itemBuilder: (context , index)  {
                      itemCount : 6 ;
                      return Container(
                        child: Column(
                          children: [
                            Row(
                      children: [
                     const Circle(),
                      const SizedBox(width: 10,),
                     const Text('User Name'),
                      ],  ),
                       const SizedBox(
                      height: 3,
                     ),
                    
    
                   SizedBox(
                    width: 330, height: 53,
                     child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: const Color.fromRGBO(217, 217, 217, 1),
                        filled: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                      ),
                     ),
                   ),
    
                   const SizedBox(
                    height: 20,
                   ),
                    const SizedBox(
                      width: 350,
                      child: Divider(
                        color: Colors.black,
                       ),
                    ),
                          ],
                        ),
                      );
                      
                    }, )
                  ),
                )
                
                
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}





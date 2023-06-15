import 'package:flutter/material.dart';
import 'package:fyp_app/model/product_model.dart';
import 'package:fyp_app/services/product_services.dart';
import 'package:provider/provider.dart';

import '../Widgets/Myproductlist.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({Key? key}) : super(key: key);

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "My Product",
        ),
        backgroundColor: Colors.green.shade300,
      ),
      body: SingleChildScrollView(
          child: StreamProvider.value(
        initialData: [ProductModel()],
        value: ProductServices().fetchAllProducts(),
        builder: (context, ctx) {
          List<ProductModel> productList = context.watch<List<ProductModel>>();
          return ListView.builder(
              itemCount: productList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Container(
                  height: 120,
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 2, color: Colors.grey.shade300)),
                  child: Row(
                    children: [
                      Container(
                          height: 120,
                          width: 120,
                          color: Colors.lightGreenAccent,
                          child: Image.network(
                              productList[i].imageURl.toString(),fit: BoxFit.cover,)),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Rs ${productList[i].price}",
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            productList[i].name.toString(),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            productList[i].address.toString(),
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              });
        },
      )),
    );
  }
}

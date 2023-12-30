import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/model/product.dart';


class CreateProductPage extends StatefulWidget {
  final ProductModel? product;
  const CreateProductPage({
    Key? key,
    this.product
  }) : super(key: key);

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final _productNameController = TextEditingController();
  final _productPriceController = TextEditingController();
  final _productBrandController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _productNameController.text = widget.product?.name ?? '';
    _productPriceController.text = widget.product?.price ?? '';
    _productBrandController.text = widget.product?.brand ?? '';
  }
  Widget build(BuildContext context) {
    final isEditing = widget.product?.name != null;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0,bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios),)
                ],
              ),
            ),

            Container(
              decoration: const BoxDecoration(
                boxShadow:[
                  BoxShadow(
                    color: Colors.greenAccent,
                    offset: Offset(
                      5.0,
                      10.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                  ),//BoxShadow
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  //BoxShadow
                ],
                borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              child:
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                        const Center(
                          child: Text('Create Product',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color:  Color(0xff2A977D),
                            ),),
                        ),
                        TextFormField(
                          controller: _productNameController,
                          decoration: const  InputDecoration(
                            labelText: "Enter product name"
                          ),
                        ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: _productPriceController,
                      decoration: const  InputDecoration(
                          labelText: "Enter product price"
                      ),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: _productBrandController,
                      decoration: const  InputDecoration(
                          labelText: "Enter product brand"
                      ),
                    ),
                    const SizedBox(height: 15,),
                    ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color(0xff2A977D),
                        ),
                        child: const Text('Create'))

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

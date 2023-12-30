import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/database/product.dart';
import 'package:shopping_cart/model/product.dart';

class ProductForm extends StatefulWidget {
  final ProductModel? product;
  final VoidCallback fetchProducts;

  const ProductForm({Key? key, this.product, required this.fetchProducts})
      : super(key: key);

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
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
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close,
                      color: Colors.greenAccent,
                      size: 25,
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.greenAccent,
                  offset: Offset(
                    2.0,
                    10.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
                //BoxShadow
              ], borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child:
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          isEditing ? "Update Product" : "Create Product",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2A977D),
                          ),
                        ),
                      ),
                      TextFormField(
                        autofocus: true,
                        controller: _productNameController,
                        decoration: const InputDecoration(
                            labelText: "Enter product name"),
                        validator: (value) => value != null && value.isEmpty
                            ? 'Fill the product name'
                            : null,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _productPriceController,
                        decoration: const InputDecoration(
                            labelText: "Enter product price"),
                        validator: (value) => value != null && value.isEmpty
                            ? 'Fill the product price'
                            : value != null && double.tryParse(value) == null ?
                                "Fill only number" : null,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _productBrandController,
                        decoration: const InputDecoration(
                            labelText: "Enter product brand"),
                        validator: (value) => value != null && value.isEmpty
                            ? 'Fill the product brand'
                            : null,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              isEditing
                                  ? await ProductDB().update(
                                      id: widget.product?.id,
                                      name: _productNameController.text,
                                      price: _productPriceController.text,
                                      brand: _productBrandController.text)
                                  : await ProductDB().create(
                                      name: _productNameController.text,
                                      price: _productPriceController.text,
                                      brand: _productBrandController.text);
                              if (!mounted) return;
                              widget.fetchProducts();
                              Navigator.pop(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: const Color(0xff2A977D),
                          ),
                          child: Text(isEditing ? "Update" : "Create"))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controllers/home_controller.dart';
import 'package:shopping_cart/model/product.dart';
import 'package:shopping_cart/database/product.dart';
import 'package:shopping_cart/screens/detail_screen.dart';
import 'package:shopping_cart/widgets/form.dart';
import 'package:shopping_cart/database/database_service.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final _homeController = Get.put(HomeController());
  Future<List<ProductModel>>? futureProducts;
  List<Map<String, dynamic>>? products = [];
  final productDB = ProductDB();
  final dbService = DatabaseService();

  void fetchProducts() async {
    final data = await productDB.fetchAll();
    setState(() {
      products = data;
    });
  }

  void migrate() {
    // dbService.deleteDB(); // for migrate fresh the whole db
    fetchProducts();
  }

  @override
  void initState() {
    super.initState();
    migrate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          height: 70,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    Icon(Icons.home_filled, color: Color(0xff2A977D)),
                    Text('Home')
                  ],
                ),
                const Column(
                  children: [Icon(Icons.add_card_rounded), Text('Voucer')],
                ),
                const Column(
                  children: [Icon(Icons.wallet), Text('Wallet')],
                ),
                GestureDetector(
                  onTap: () => Get.dialog(ProductForm(
                    fetchProducts: fetchProducts,
                  )),
                  child: const Column(
                    children: [Icon(Icons.add), Text('Add')],
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: const Color(0xfFE9EBEA),
        body: ListView(
          children: [
            Column(children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 60.0, left: 14.0, right: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 280,
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.search,
                                size: 40,
                                color: Colors.grey,
                              ),
                              hintText: 'Search...',
                              hintStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Badge(
                          label: Text('1'),
                          child: Image(
                            height: 30,
                            width: 30,
                            image: AssetImage('assets/icons/img.png'),
                          )),
                      // FilledButton(onPressed: () => _homeController.increment(), child: const Text('+')),
                      // FilledButton(onPressed: () => Get.snackbar("Title", "Message"), child: const Text('+')),
                      // FilledButton(onPressed: () => Get.defaultDialog(), child: const Text('+')),
                      // FilledButton(onPressed: () => Get.bottomSheet(
                      //   Container(
                      //     child: Wrap(
                      //       children: [
                      //         ListTile(
                      //           leading: Icon(Icons.light_mode_outlined),
                      //           title: const Text('Light'),
                      //           onTap: () => Get.changeTheme(ThemeData.light()),
                      //         ),
                      //         ListTile(
                      //           leading:Icon(Icons.dark_mode_outlined),
                      //           title: const Text('Dark'),
                      //           onTap: () => Get.changeTheme(ThemeData.dark()),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      //   barrierColor: Colors.grey
                      // ),
                      //     child: const Text('+')),
                      const SizedBox(
                        width: 10,
                      ),
                      Badge(
                        label: Obx(() => Text("${_homeController.count}")),
                        child: const Image(
                          height: 30,
                          width: 30,
                          image: AssetImage('assets/icons/chat.png'),
                        ),
                      ),
                    ]),
              ),
              Container(
                height: 195,
                width: 420,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/main.png'),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Row(
                  children: [
                    Container(
                      width: 410,
                      height: 130,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xffF6F6F6),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const SizedBox(
                                        height: 40,
                                        width: 45,
                                        child: Icon(
                                          Icons.grid_view_outlined,
                                          size: 32,
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  const Text(
                                    'Category',
                                    style: TextStyle(fontSize: 17),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xffF6F6F6),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const SizedBox(
                                        height: 40,
                                        width: 45,
                                        child: Icon(
                                          Icons.flight,
                                          size: 32,
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  const Text(
                                    'Flight',
                                    style: TextStyle(fontSize: 17),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xffF6F6F6),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const SizedBox(
                                        height: 40,
                                        width: 45,
                                        child: Icon(
                                          Icons.receipt_long,
                                          size: 32,
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  const Text(
                                    'Bill',
                                    style: TextStyle(fontSize: 17),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xffF6F6F6),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const SizedBox(
                                        height: 40,
                                        width: 45,
                                        child: Icon(
                                          Icons.data_exploration_outlined,
                                          size: 32,
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  const Text(
                                    'Data Plan',
                                    style: TextStyle(fontSize: 17),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xffF6F6F6),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const SizedBox(
                                        height: 40,
                                        width: 45,
                                        child: Icon(
                                          Icons.upcoming_outlined,
                                          size: 32,
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  const Text(
                                    'Top Up',
                                    style: TextStyle(fontSize: 17),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 18.0, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Best Sale Product',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Text(
                      'See More',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2A977D)),
                    )
                  ],
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 18, right: 18),
                  child: products!.isEmpty
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 30.0),
                              child: Center(
                                  child: Text(
                                "No Product, \n Click The ✨.Add ✨ Button To Create One!",
                                style: TextStyle(
                                    color: Color(0xff2A977D),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30.0),
                              child: Center(
                                  child: Text(
                                """Overview: The project is only targeting CRUD operations with SQLite. \n As a result, some design patterns may not be suitable for certain functional features.""",
                                style: TextStyle(
                                    color: Color(0xff2A977D),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              )),
                            )
                          ],
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 8,
                                  childAspectRatio: 3 / 5),
                          itemCount: products?.length,
                          itemBuilder: (context, index) {
                            final product = products?[index];
                            return product != null
                                ? Card(
                                    id: product['id'],
                                    name: product['name'],
                                    price: product['price'],
                                    brand: product['brand'],
                                    fetchProducts: fetchProducts,
                                  )
                                : const Center(
                                    child: Text('No Product, Create One! '));
                          }))
            ])
          ],
        ));
  }
}

class Card extends StatefulWidget {
  final String name;
  final int price;
  final String brand;
  final int id;
  final VoidCallback fetchProducts;

  const Card(
      {Key? key,
      required this.id,
      required this.name,
      required this.price,
      required this.brand,
      required this.fetchProducts})
      : super(key: key);

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
            DetailPage(
                product: ProductModel(
                    name: widget.name,
                    price: "${widget.price}",
                    brand: widget.brand)),
            fullscreenDialog: true,
            transition: Transition.zoom);
      },
      child: Container(
        color: Colors.white,
        height: 275,
        width: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(
              height: 120,
              width: 180,
              image: AssetImage('assets/images/shirt4.png'),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Shirt',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Essential Men's \n ${widget.name}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        '4.9 | 2336',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('\$${widget.price}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xff2A977D)))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FilledButton(
                          onPressed: () => {
                                Get.dialog(ProductForm(
                                  fetchProducts: widget.fetchProducts,
                                  product: ProductModel(
                                      id: widget.id,
                                      name: widget.name,
                                      price: "${widget.price}",
                                      brand: widget.brand),
                                ))
                              },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.yellow.shade400),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    2.0), // Adjust the radius as needed
                              ),
                            ),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                              const EdgeInsets.symmetric(
                                  horizontal: 2.0,
                                  vertical: 0), // Adjust the padding as needed
                            ),
                          ),
                          child: const Text("Edit")),
                      const SizedBox(
                        width: 8.0,
                      ),
                      FilledButton(
                          onPressed: () => {
                                Get.defaultDialog(
                                    title: "Confirm Delete",
                                    titleStyle: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    middleText:
                                        "Are you sure you want to delete \n this product (${widget.name}) ?",
                                    textCancel: "Cancel",
                                    confirm: FilledButton(
                                        onPressed: () {
                                          ProductDB().delete(widget.id);
                                          widget.fetchProducts();
                                          Navigator.pop(context);
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.red),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  6.0), // Adjust the radius as needed
                                            ),
                                          ),
                                          padding: MaterialStateProperty.all<
                                              EdgeInsetsGeometry>(
                                            const EdgeInsets.symmetric(
                                                horizontal: 2.0,
                                                vertical:
                                                    0), // Adjust the padding as needed
                                          ),
                                        ),
                                        child: const Text("Delete")),
                                    cancel: FilledButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  6.0), // Adjust the radius as needed
                                            ),
                                          ),
                                          padding: MaterialStateProperty.all<
                                              EdgeInsetsGeometry>(
                                            const EdgeInsets.symmetric(
                                                horizontal: 2.0,
                                                vertical:
                                                    0), // Adjust the padding as needed
                                          ),
                                        ),
                                        child: const Text("Cancel",style: TextStyle(color: Colors.black),))),
                              },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    2.0), // Adjust the radius as needed
                              ),
                            ),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                              const EdgeInsets.symmetric(
                                  horizontal: 2.0,
                                  vertical: 0), // Adjust the padding as needed
                            ),
                          ),
                          child: const Text("Delete"))
                    ],
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

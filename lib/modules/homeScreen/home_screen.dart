import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treely/config/color_pallet.dart';
import 'package:treely/controllers/home_controller.dart';
import 'package:treely/models/Product.dart';
import 'package:treely/modules/homeScreen/deatils/components/cart_counter.dart';
import 'package:treely/widgets/product_card.dart';

import 'components/cart_details_view.dart';
import 'components/cart_short_view.dart';
import 'deatils/details_screen.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  static String id = "home_screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController();
  int currentNavBarIndex = 0;
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  bool switchValue = false;

  List<Product> plantId = [];
  List<Product> ayurId = [];

  Future<String> downloadURL(String pathName, String imageName) async {
    return FirebaseStorage.instance
        .ref()
        .child('$pathName/$imageName.png')
        .getDownloadURL();
  }

  Future getPlantId() async {
    var collectionData =
        await FirebaseFirestore.instance.collection('plantCollection').get();

    plantId.clear();
    for (int i = 0; i < collectionData.docs.length; i++) {
      String imageUrl =
          await downloadURL("plants", collectionData.docs[i].data()['name']);
      plantId.add(Product(
        title: collectionData.docs[i].data()['name'],
        desc: collectionData.docs[i].data()['desc'],
        image: imageUrl,
        price: collectionData.docs[i].data()['price'],
      ));
    }
  }

  Future getAyurId() async {
    var collectionData =
        await FirebaseFirestore.instance.collection('ayur').get();

    ayurId.clear();
    print(collectionData.docs.length);
    for (int i = 0; i < collectionData.docs.length; i++) {
      String imageUrl =
          await downloadURL("ayur", collectionData.docs[i].data()['tag']);
      print("imageUrl: " + imageUrl);
      ayurId.add(Product(
        title: collectionData.docs[i].data()['name'],
        desc: (collectionData.docs[i].data()['desc'] +
            "\n" +
            collectionData.docs[i].data()['ingredients'] +
            "\n" +
            collectionData.docs[i].data()['recipe']),
        image: imageUrl,
      ));
      print("i: " + i.toString());
    }
    print("AyurLen: " + ayurId.length.toString());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kTertiaryColor,
        selectedLabelStyle: const TextStyle(color: kLightBrown),
        unselectedLabelStyle: const TextStyle(),
        selectedItemColor: kDarkBrown,
        unselectedItemColor: kPrimaryColor,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: const Icon(Icons.shopping_basket_outlined),
              onTap: () {},
            ),
            label: "Plants",
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: const Icon(Icons.auto_stories_outlined),
              onTap: () {},
            ),
            label: "Ayurveda",
          ),
        ],
        currentIndex: currentNavBarIndex,
        onTap: (index) {
          setState(() {
            currentNavBarIndex = index;
          });
        },
      ),
      key: _globalKey,
      body: SafeArea(
        child: Consumer(builder: (context, ref, child) {
          return AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              return LayoutBuilder(
                  builder: (context, BoxConstraints constraints) {
                return Stack(
                  children: [
                    Positioned(
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 8),
                            child:
                                Text("treely", style: TextStyle(fontSize: 60)),
                          ),
                          Expanded(
                            child: currentNavBarIndex != 0
                                ? Container(
                                    margin:
                                        const EdgeInsets.only(bottom: 100.0),
                                    padding: const EdgeInsets.all(8),
                                    child: FutureBuilder(
                                        future: getAyurId(),
                                        builder: (context, snapshot) {
                                          return GridView.builder(
                                            itemCount: ayurId.length,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 0.75,
                                              mainAxisSpacing: 20,
                                              crossAxisSpacing: 20,
                                            ),
                                            itemBuilder: (context, index) {
                                              return ProductCard(
                                                product: ayurId[index],
                                                press: () {
                                                  Navigator.push(
                                                    context,
                                                    PageRouteBuilder(
                                                      transitionDuration:
                                                          const Duration(
                                                              milliseconds:
                                                                  500),
                                                      reverseTransitionDuration:
                                                          const Duration(
                                                              milliseconds:
                                                                  500),
                                                      pageBuilder: (context,
                                                              animation,
                                                              secondaryAnimation) =>
                                                          FadeTransition(
                                                        opacity: animation,
                                                        child: DetailsScreen(
                                                          product:
                                                              ayurId[index],
                                                          onProductAdd: () {},
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        }),
                                  )
                                : Container(
                                    margin:
                                        const EdgeInsets.only(bottom: 100.0),
                                    padding: const EdgeInsets.all(8),
                                    child: FutureBuilder(
                                        future: getPlantId(),
                                        builder: (context, snapshot) {
                                          return GridView.builder(
                                            itemCount: plantId.length,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 0.75,
                                              mainAxisSpacing: 20,
                                              crossAxisSpacing: 20,
                                            ),
                                            itemBuilder: (context, index) {
                                              print(plantId.length);
                                              return ProductCard(
                                                product: plantId[index],
                                                press: () {
                                                  Navigator.push(
                                                    context,
                                                    PageRouteBuilder(
                                                      transitionDuration:
                                                          const Duration(
                                                              milliseconds:
                                                                  500),
                                                      reverseTransitionDuration:
                                                          const Duration(
                                                              milliseconds:
                                                                  500),
                                                      pageBuilder: (context,
                                                              animation,
                                                              secondaryAnimation) =>
                                                          FadeTransition(
                                                        opacity: animation,
                                                        child: DetailsScreen(
                                                          product:
                                                              plantId[index],
                                                          onProductAdd: () {
                                                            final cartNum =
                                                                ref.watch(
                                                                        cartNumProvider) ??
                                                                    1;
                                                            for (var i = 0;
                                                                i < cartNum;
                                                                i++) {
                                                              controller
                                                                  .addProductToCart(
                                                                      plantId[
                                                                          index]);
                                                            }
                                                            ref
                                                                .read(cartNumProvider
                                                                    .notifier)
                                                                .update(
                                                                    (state) =>
                                                                        1);
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        }),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    currentNavBarIndex == 0
                        ? AnimatedPositioned(
                            duration: const Duration(milliseconds: 500),
                            bottom: 0,
                            left: 0,
                            right: 0,
                            height: controller.homeState == HomeState.normal
                                ? 100
                                : (MediaQuery.of(context).size.height - 100),
                            child: GestureDetector(
                              onTap: () {
                                if (controller.homeState == HomeState.normal) {
                                  controller.changeHomeState(HomeState.cart);
                                } else {
                                  controller.changeHomeState(HomeState.normal);
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kTertiaryColor,
                                  border: Border.all(
                                      color: kPrimaryColor.withOpacity(0.5)),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                  ),
                                ),
                                padding: const EdgeInsets.all(20),
                                // color: kDarkBrown,
                                alignment: Alignment.topLeft,
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 500),
                                  child: controller.homeState ==
                                          HomeState.normal
                                      ? CardShortView(controller: controller)
                                      : CartDetailsView(controller: controller),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                );
              });
            },
          );
        }),
      ),
    )
        // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        ;
  }
}

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivering To",
              style: TextStyle(color: Colors.black54, fontSize: 15),
            ),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Current Location",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.greenAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      // padding: EdgeInsets.only(left: 15),
                      margin: EdgeInsets.only(top: 10),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade300,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: [
                                Icon(Icons.search, size: 30),
                                SizedBox(width: 8),
                                Text(
                                  "Search Food",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/filter.png",
                        height: 27,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              headingTitle(context, "Category"),
              Container(
                height: 150,
                // color: Colors.deepPurpleAccent,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: cardList.length,
                  itemBuilder: (context, index) {
                    return CardCategory(categoryModel: cardList[index]);
                  },
                ),
              ),
              headingTitle(context, "popular"),

              for (int i = 0; i < popularItemList.length; i++) ...{
                Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            image: DecorationImage(
                              image: AssetImage(popularItemList[i].imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 250,
                          width: double.infinity,
                        ),

                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            popularItemList[i].title,
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: Colors.green),
                              Text(
                                popularItemList[i].rating,
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 6),
                              Text(
                                "(${popularItemList[i].ratingCount} Ratings)",
                                style: TextStyle(fontSize: 18),
                              ),
                              Spacer(),
                              Text(
                                popularItemList[i].hotelName,
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 6),
                              Text(
                                popularItemList[i].price,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              },
            ],
          ),
        ),
      ),
    );
  }
}

// class headingTitle extends StatelessWidget {
//   const headingTitle({
//     super.key,
//   });

// @override
Widget headingTitle(BuildContext context, String title) {
  return Text(
    title,
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
  );
}

class CardCategory extends StatelessWidget {
  final CategoryModel categoryModel;
  CardCategory({required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          height: 100,
          width: 100,
          margin: EdgeInsets.all(10),
          child: Image.asset(categoryModel.imageUrl, fit: BoxFit.cover),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Text(categoryModel.title, style: TextStyle(fontSize: 17)),
      ],
    );
  }
}

class CategoryModel {
  String imageUrl;
  String title;

  CategoryModel(this.imageUrl, this.title) {}
}

List<CategoryModel> cardList = [
  CategoryModel("assets/Pizza.jpeg", "Pizza"),
  CategoryModel("assets/burger.jpeg", "Burger"),
  CategoryModel("assets/nuggets.jpeg", "Nuggets"),
  CategoryModel("assets/panipori.webp", "Pani Puri"),
  CategoryModel("assets/samosa.jpeg", "Samosa"),
  CategoryModel("assets/momos.jpeg", "Momos"),
  CategoryModel("assets/burrito.jpeg", "Burrito"),
  CategoryModel("assets/chicken.webp", "Fried Chicken"),
  CategoryModel("assets/fries.jpeg", "Fries"),
];

class PopularItemModel {
  String imageUrl;
  String title;
  String hotelName;
  String rating;
  String ratingCount;
  String price;

  PopularItemModel(
    this.imageUrl,
    this.title,
    this.hotelName,
    this.rating,
    this.ratingCount,
    this.price,
  );
}

List<PopularItemModel> popularItemList = [
  PopularItemModel(
    "assets/Pizza.jpeg",
    "Pizza",
    "Pizza Hut",
    "4.5",
    "120",
    "\$8",
  ),
  PopularItemModel(
    "assets/burger.jpeg",
    "Burger",
    "Burger King",
    "4.3",
    "98",
    "\$6",
  ),
  PopularItemModel(
    "assets/nuggets.jpeg",
    "Nuggets",
    "KFC",
    "4.4",
    "150",
    "\$5",
  ),
  PopularItemModel(
    "assets/panipori.webp",
    "Pani Puri",
    "Street Foods",
    "4.7",
    "210",
    "\$3",
  ),
  PopularItemModel(
    "assets/samosa.jpeg",
    "Samosa",
    "Indian Snacks",
    "4.6",
    "175",
    "\$2",
  ),
  PopularItemModel(
    "assets/momos.jpeg",
    "Momos",
    "Momo Corner",
    "4.5",
    "130",
    "\$4",
  ),
  PopularItemModel(
    "assets/burrito.jpeg",
    "Burrito",
    "Mexican Grill",
    "4.4",
    "90",
    "\$7",
  ),
  PopularItemModel(
    "assets/chicken.webp",
    "Fried Chicken",
    "Chicken Hub",
    "4.8",
    "300",
    "\$9",
  ),
  PopularItemModel(
    "assets/fries.jpeg",
    "Fries",
    "Snack Point",
    "4.2",
    "85",
    "\$3",
  ),
];

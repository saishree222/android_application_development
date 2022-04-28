import 'package:flutter/material.dart';
import 'package:food_ordering_app/constant.dart';
import 'package:food_ordering_app/model/food_model.dart';
import 'package:food_ordering_app/pages/home/components/bottom_bar.dart';
import 'package:food_ordering_app/pages/home/components/category_list.dart';
import 'package:food_ordering_app/pages/home/components/enum.dart';
import 'package:food_ordering_app/pages/home/components/food_product.dart';

import 'components/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      bottomNavigationBar: const CustomBottomBar(
        selectMenu: MenuState.home,
      ),
      body: SafeArea(
        child: ListView(
          children: const [
            CustomerAppBar(),
            SizedBox(
              height: 20,
            ),
            CategoryCard(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Popular Food",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
            FoodCard(),
          ],
        ),
      ),
    );
  }
}

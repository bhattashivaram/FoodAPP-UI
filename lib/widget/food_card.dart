import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/model/food_model.dart';
import 'package:foodapp/pages/food_detail_page.dart';
import 'package:foodapp/widget/custom_icon_button.dart';

class FoodCard extends StatelessWidget {
  final FoodModel food;

  const FoodCard({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FoodDetailPage(food: food)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        margin: EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildFoodImage(),
            SizedBox(height: 8),
            buildFoodInfo(),
          ],
        ),
      ),
    );
  }

  Widget buildFoodImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            food.image,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: CustomIconButton(
            icon: Icon(Icons.favorite, color: Colors.red),
            onPressed: () {},
            radious: 32,
            margin: EdgeInsets.all(0),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(4),
          ),
          padding: EdgeInsets.all(4),
          margin: EdgeInsets.all(4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 12,
              ),
              SizedBox(width: 2),
              Text(
                "${food.rating}",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Text(
                "(1k+)",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildFoodInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          food.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4),
        Text(
          "\$${food.price}",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

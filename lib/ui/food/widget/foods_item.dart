import 'package:flutter/material.dart';
import 'package:foods_app_api/data/models/food_model/helper_models/hint.dart';
import 'package:foods_app_api/utils/color.dart';

class FoodsItem extends StatelessWidget {
  final Hint hint;

  const FoodsItem({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: MyColors.white,
          boxShadow: const [
            BoxShadow(
              color: MyColors.C_18063336,
              blurRadius: 4,
              spreadRadius: 0.5,
            ),
          ],
        ),
        width: double.infinity,
        height: 100,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: Container(
                    width: 100,
                    height: 84,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: NetworkImage(hint.food.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hint.food.category,
                    ),
                    const SizedBox(height: 4),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: hint.food.label.substring(
                                0,
                                hint.food.label.length > 25
                                    ? 20
                                    : hint.food.label.length),
                          ),
                          TextSpan(
                            text: hint.food.label.length > 25 ? "... more" : "",
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Kal: ${hint.food.nutrients.enercKcal.toInt()}',
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foods_app_api/bloc/food/food_bloc.dart';
import 'package:foods_app_api/data/models/food_category.dart';
import 'package:foods_app_api/data/models/food_health.dart';
import 'package:foods_app_api/ui/food/food_page.dart';
import 'package:foods_app_api/ui/search/widget/custom_button.dart';
import 'package:foods_app_api/ui/search/widget/text_field.dart';
import 'package:foods_app_api/ui/search/widget/text_widget.dart';
import 'package:foods_app_api/utils/color.dart';
import 'package:foods_app_api/widgets/custom_appbar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController ingredientController = TextEditingController();
  TextEditingController caloriesController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int categoryIndex = -1;
  int healthIndex = -1;
  String category = '';
  String health = '';
  String nutritionType = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Filter'),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(word: 'Category'),
              SizedBox(
                height: 45,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: List.generate(
                    FoodCategory.foodCategory.length,
                    (index) => GestureDetector(
                      onTap: () {
                        category = FoodCategory.foodCategory[index];
                        setState(() {
                          categoryIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: categoryIndex == index
                              ? MyColors.C_70B9BE
                              : MyColors.C_E6EBF2,
                        ),
                        height: 41,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              FoodCategory.foodCategory[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const TextWidget(word: 'Health'),
              SizedBox(
                height: 45,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: List.generate(
                    FoodHealth.foodHealth.length,
                    (index) => GestureDetector(
                      onTap: () {
                        health = FoodHealth.foodHealth[index];
                        setState(() {
                          healthIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: healthIndex == index
                              ? MyColors.C_70B9BE
                              : MyColors.C_E6EBF2,
                        ),
                        height: 30,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              FoodHealth.foodHealth[index],
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const TextWidget(word: 'Ingredient'),
              TextfieldWidget(
                word: 'Enter ingredient',
                textController: ingredientController,
              ),
              const TextWidget(word: 'Calories Range'),
              TextfieldWidgetByCalories(
                word: 'Enter calories range',
                textController: caloriesController,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  bottom: 12,
                  top: 230,
                ),
                child: CustomButton(
                  onTap: () {
                    context.read<FoodsBloc>().add(FoodsEvent(
                          nutritionType: nutritionType,
                          category: category,
                          health: health,
                        ));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FoodPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    caloriesController.clear();
    ingredientController.clear();
    super.dispose();
  }
}

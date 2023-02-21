import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foods_app_api/bloc/food/food_bloc.dart';
import 'package:foods_app_api/ui/food/widget/foods_item.dart';
import 'package:foods_app_api/widgets/custom_appbar.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Foods'),
      body: BlocBuilder<FoodsBloc, FoodsState>(
        builder: (context, state) {
          if (state.status == Status.success) {
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(
                      state.foodData!.hints.length,
                      (index) => FoodsItem(
                        hint: state.foodData!.hints[index],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          if (state.status == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == Status.error) {
            return Center(
              child: Text(state.error.toString()),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

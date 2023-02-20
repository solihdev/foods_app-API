import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foods_app_api/bloc/food/food_bloc.dart';
import 'package:foods_app_api/data/models/food_model/food_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food API"),
      ),
      body: BlocBuilder<FoodsBloc, FoodsState>(
        builder: (context, state) {
          if (state.status == Status.success) {
            FoodData foodData = state.foodData!;
            return ListView.builder(
              itemCount: foodData.hints.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  height: 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          foodData.hints[index].food.label,
                          style: const TextStyle(
                              fontSize: 30, color: Colors.black),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 18, top: 15),
                        child: Text(
                          foodData.hints[index].food.knownAs,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                );
              },
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.download_for_offline_outlined),
        onPressed: () {
          context.read<FoodsBloc>().add(FoodsEvent(
                nutritionType: '',
                category: '100-300',
                health: '',
              ));
        },
      ),
    );
  }
}

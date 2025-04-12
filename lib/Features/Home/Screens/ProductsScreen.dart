import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/Features/Home/Cubit/AllProductsCubit/AllProductsViewModel.dart';
import 'package:shopping/Features/Home/Cubit/AllProductsCubit/AllProdutsStates.dart';
import 'package:shopping/Features/Home/parts/ProductItem.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductsViewModel, AllProductsStates>(
      bloc: AllProductsViewModel.get(context)..getAllProducts(),
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              state is AllProdutsSuccesStates
                  ? Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 191 / 240,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Productitem(
                              products: state.allProductesResponseEntity.data!,
                              index: index,
                            ),
                          );
                        },
                        itemCount:
                            AllProductsViewModel.get(context).products.length,
                      ),
                    )
                  : Center(child: CircularProgressIndicator())
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'CategoryItem.dart';

class CartegoryGrid extends StatelessWidget {
  const CartegoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Expanded(
            child: Container(
              height: 250.h,
              child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return CaregoryItem();
                },
              ),
            ),
          ),
        ],
    );
  }
}

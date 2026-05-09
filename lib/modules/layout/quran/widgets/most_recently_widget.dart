import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class MostRecentlyWidget extends StatelessWidget {
  const MostRecentlyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Most Recently",
          style: TextStyle(
            color: AppColors.titleTextColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),


        ),
        SizedBox(
          height: 150,
          child: ListView.separated(itemBuilder: (context, index) {
            return Container(
              height: 145,
              width: MediaQuery.of(context).size.width*0.6,
              decoration: BoxDecoration(color:AppColors.gold,borderRadius: BorderRadius.circular(20)),
            );
          },
            separatorBuilder: (context, index) { return SizedBox(width: 10,);},
          itemCount: 5,
          scrollDirection: Axis.horizontal,),
        )

      ],


    );
  }
}

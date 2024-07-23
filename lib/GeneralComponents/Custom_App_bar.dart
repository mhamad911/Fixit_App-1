import 'package:flutter/material.dart';

import 'custom_Search_Field.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  CustomAppBar({required this.title, });
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                blurRadius: 14,
                spreadRadius: 2,
                offset: Offset.fromDirection(90))
          ]
      ),
      child: AppBar(

        elevation: 8,
        shadowColor: Colors.black54,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
        ),
      title: Icon(Icons.handyman,
        color: Colors.white,
        size: 35,),
       bottom: PreferredSize(preferredSize: Size.fromHeight(30),
         child: Column (
             mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25, top:10, right: 35 , left: 35),
              child: CustomSearchfield(
                maxLength: 100,
                controller: searchController,
                name: "Search...",
                prefixIcon: Icons.search_rounded,
                inputType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
              ),
            ),
          ]
         ),
       ),
        centerTitle: true,
        backgroundColor:Color(0xff59308E),
      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(130);
}
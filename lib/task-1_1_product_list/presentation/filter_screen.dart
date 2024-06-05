import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../domain/entity/sorting_type.dart';

class FilterScreen extends StatefulWidget{

  final SortingType filter;
  const FilterScreen ({Key? key, required this.filter }) : super(key: key);

  @override
  State<FilterScreen> createState()=> _FilterScreenState() ;


}

class _FilterScreenState extends State<FilterScreen> {
  SortingType _selectedFilter = SortingType.none;

   @override
  void initState(){
     super.initState();
     _selectedFilter = widget.filter;
   }

@override
  Widget build(BuildContext context){
     return Scaffold(
       body: ListView.builder(
         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
         itemBuilder: (_,i){
           final type= FilterType.values[i];
           final sortingList = SortingType.values.where((e) => e.type == type).toList();
           final isLastType = i==FilterType.values.length-1;
         },
       ),

     );
}

}
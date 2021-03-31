
import 'package:TennisApp/HomePageStuff/FirstPageChartWindows/pie_chart.dart';
import 'package:flutter/material.dart';


class CategoriesRow extends StatelessWidget {
  
  const CategoriesRow({
    @required this.amount,
    Key key,
  }) : super(key: key);
final List<int> amount;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         /* for (var category in cate(amount).kCategories()) */
          
          ExpenseCategory(
                text: "You", index: 2, ),//cate(amount).kCategories().indexOf(category))
          ExpenseCategory(
                text: "Opponent", index: 1)
      
        ],
      ),
    );
  }
}

class ExpenseCategory extends StatelessWidget {
  const ExpenseCategory({
    this.amount,
    Key key,
    @required this.index,
    @required this.text,
  }) : super(key: key);

  final int index;
  final String text;
  final List<int> amount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  cate(amount).kNeumorphicColors().elementAt(index % cate(amount).kNeumorphicColors().length),
            ),
          ),
          SizedBox(width: 20),
          Text(text.capitalize()),
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
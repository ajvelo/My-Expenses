import 'package:flutter/material.dart';

class Chartbar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  Chartbar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Column(
        children: [
          Container(
              height: constraint.maxHeight * 0.1,
              child: FittedBox(
                  child: Text("\$${spendingAmount.toStringAsFixed(0)}"))),
          SizedBox(
            height: constraint.maxHeight * 0.05,
          ),
          Container(
            height: constraint.maxHeight * 0.7,
            width: 16,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(16.0)),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: constraint.maxHeight * 0.05,
          ),
          Container(height: constraint.maxHeight * 0.1, child: Text(label))
        ],
      );
    });
  }
}

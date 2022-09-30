import 'package:flutter/material.dart';
import 'package:loan_calculator_app/Components/colors.dart';

class EstimatedCard extends StatelessWidget {
  EstimatedCard(
      {Key? key, this.cardDescription, this.cardTitle, this.cardValue})
      : super(key: key);

  String? cardTitle;
  String? cardDescription;

  String? cardValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: commonColor,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: Text(
                      cardTitle!,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Text(
                cardValue!,
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              Text(
                cardDescription!,
                style: TextStyle(color: commonColor.withOpacity(0.7)),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

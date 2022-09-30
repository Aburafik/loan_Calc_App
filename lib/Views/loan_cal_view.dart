import 'dart:math';

import 'package:flutter/material.dart';
import 'package:loan_calculator_app/Components/colors.dart';
import 'package:loan_calculator_app/Components/estimated_card.dart';

class LoanCalculator extends StatefulWidget {
  const LoanCalculator({super.key});

  @override
  State<LoanCalculator> createState() => _LoanCalculatorState();
}

class _LoanCalculatorState extends State<LoanCalculator> {
  int selectedTermIndex = 0;
  int selectedAmounIndex = 0;

  double currentInterstRate = 1.8;
  double totalLoanPayment = 0.00;
  double monthlyPayment = 0.00;

  TextEditingController loanAmountController = TextEditingController();
  TextEditingController loanTermController = TextEditingController();

  List loanAmount = [5000, 1000, 15000];
  List loanTerm = [12, 24, 36];

  @override
  void initState() {
    super.initState();
    loanTermController.text = "0";
    loanAmountController.text = "0";
  }

  refereshPage() {
    setState(() {
      totalLoanPayment = 0.00;
      monthlyPayment = 0.00;
      loanTermController.text = "0";

      loanAmountController.text = "0";

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Calculator refereshed.......")));
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(color: Colors.white, fontSize: 20);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => refereshPage(), icon: Icon(Icons.refresh)),
        elevation: 0,
        backgroundColor: commonColor,
        title: Text("Loan Calculator", style: textStyle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.6,
              decoration: BoxDecoration(
                color: commonColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Est. Monthly Payment",
                      style: textStyle.copyWith(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Text(
                    "GHC ${monthlyPayment.toStringAsFixed(2)}",
                    style: textStyle.copyWith(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 40),
                      child: Row(
                        children: [
                          EstimatedCard(
                            cardValue: "$currentInterstRate %",
                            cardTitle: "Interest Rate",
                            cardDescription: "Based on today's est. loan rate",
                          ),
                          const SizedBox(width: 15),
                          EstimatedCard(
                            cardValue: totalLoanPayment.toStringAsFixed(2),
                            cardTitle: "Est. Loan Total",
                            cardDescription:
                                "Est. cost of loan based on selection",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        children: [
                          Text(
                            "Loan amount",
                            style: textStyle.copyWith(color: Colors.black),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text("Enter your\n own amount"),
                          ),
                          Expanded(
                            child: TextField(
                              controller: loanAmountController,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: commonColor.withOpacity(.8)),
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      child: Center(
                        child: ListView.separated(
                          itemCount: loanAmount.length,
                          separatorBuilder: ((context, index) => const SizedBox(
                                width: 15,
                              )),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                            child: Material(
                              color: selectedAmounIndex == index
                                  ? commonColor
                                  : commonColor.withOpacity(.1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Center(
                                    child: Text(
                                  loanAmount[index].toString(),
                                  style: TextStyle(
                                      color: selectedAmounIndex == index
                                          ? Colors.white
                                          : commonColor,
                                      fontSize: 20),
                                )),
                              ),
                            ),
                            onTap: () => setState(
                              () {
                                selectedAmounIndex = index;
                                loanAmountController.text =
                                    loanAmount[index].toString();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: [
                          Text(
                            "Loan term",
                            style: textStyle.copyWith(color: Colors.black),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text("Enter your\n own term"),
                          ),
                          Expanded(
                            child: TextField(
                              controller: loanTermController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: commonColor.withOpacity(.8)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      child: Center(
                        child: ListView.separated(
                          itemCount: loanTerm.length,
                          separatorBuilder: ((context, index) => const SizedBox(
                                width: 15,
                              )),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                            child: Material(
                              color: selectedTermIndex == index
                                  ? commonColor
                                  : commonColor.withOpacity(.1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 43),
                                child: Center(
                                    child: Text(
                                  loanTerm[index].toString(),
                                  style: TextStyle(
                                      color: selectedTermIndex == index
                                          ? Colors.white
                                          : commonColor,
                                      fontSize: 20),
                                )),
                              ),
                            ),
                            onTap: () => setState(
                              () {
                                selectedTermIndex = index;
                                loanTermController.text =
                                    loanTerm[index].toString();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    ///////////////////

                    TextButton(
                      style: TextButton.styleFrom(backgroundColor: commonColor),
                      onPressed: () {
                        double p = int.parse(loanAmountController.text) *
                            0.018 *
                            pow((1 + 0.018),
                                int.parse(loanTermController.text)) /
                            (pow((1 + 0.018),
                                    int.parse(loanTermController.text)) -
                                1);

                        setState(() {
                          monthlyPayment = p;

                          totalLoanPayment = p * 24;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Start Application",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

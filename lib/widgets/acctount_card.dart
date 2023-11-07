import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({
    super.key,
    required this.colors,
    required this.formattedNumber,
  });

  final ColorScheme colors;
  final String formattedNumber;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colors.primary,
      child: SizedBox(
        height: 200,
        width: 600,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account Name',
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    color: colors.background),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Total Balance',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: colors.background),
              ),
              Text(
                formattedNumber,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: colors.background),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Total',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: colors.background),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Colors.green,
                          ),
                          Text(
                            'Income',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: colors.background),
                          )
                        ],
                      ),
                      Text(
                        formattedNumber,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: colors.background),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.arrow_drop_up_sharp,
                            color: Colors.red,
                          ),
                          Text(
                            'Expense',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: colors.background),
                          )
                        ],
                      ),
                      Text(
                        formattedNumber,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: colors.background),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

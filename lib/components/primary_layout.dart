import 'package:flutter/material.dart';

import '../constants/assets.dart';

class PrimaryLayout extends StatelessWidget {
  final Widget body;
  const PrimaryLayout({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(Assets.primaryBackground)
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const SizedBox(height: kToolbarHeight),
                  Expanded(
                    child: Center(
                      child: Image.asset(Assets.logo, width: MediaQuery.of(context).size.width * 0.4),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      minHeight: 100,
                      maxHeight: MediaQuery.of(context).size.height - 10,
                    ),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                      child: body,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
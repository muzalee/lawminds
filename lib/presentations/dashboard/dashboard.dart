import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/app_bar.dart';
import '../../providers/user.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _welcome,
          ],
        ),
      ),
    );
  }

  //widget functions
  Widget get _welcome => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Hi ${context.watch<UserProvider>().name}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
      const Text('Welcome to Law Minds! Your legal guidance chatbot',
          style: TextStyle(fontSize: 18, color: Colors.indigo)),
    ],
  );
}
import 'package:flutter/material.dart';

class RewardsPage extends StatefulWidget {
  const RewardsPage({super.key});

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
        Text("no rewards 4 u >:)")
       ],
      ),
    );
  }
}
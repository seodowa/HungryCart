import 'package:flutter/material.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  @override
  Widget build(BuildContext context) {
     return const Center(
      child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
        Text("Accounts page")
       ],
      ),
    );
  }
}
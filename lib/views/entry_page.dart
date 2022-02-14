import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_architecture/controllers/entry_screen_controller.dart';

import '../models/bank_model.dart';

class EntryPageScreen extends StatefulWidget {
  const EntryPageScreen({Key? key}) : super(key: key);

  @override
  _EntryPageScreenState createState() => _EntryPageScreenState();
}

class _EntryPageScreenState extends State<EntryPageScreen> {
  final EntryScreenController _entryScreenController = EntryScreenController();
  List<Bank> banks = [];

  @override
  void initState() {
    super.initState();
    fetchJson();
  }

  fetchJson() async {
    List<Bank> data = await _entryScreenController.getJson();

    setState(() {
      banks = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text("Entry Page")),
            Container(
              height: 300,
              child: ListView(
                  children: banks.map((bank) => Text("${bank.name}")).toList()),
            ),
            CupertinoButton(
              onPressed: () => Navigator.pushNamed(context, "/second"),
              child: const Text("Navigate to Second Screen"),
            ),
          ],
        ),
      ),
    );
  }

  _displayBanks() {
    for (var i = 0; i < banks.length; i++) {
      Text("${banks[i].name}");
    }
  }
}

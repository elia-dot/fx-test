import 'package:flutter/material.dart';
import 'package:myfxbook/Widgets/custom_app_bar.dart';

import 'package:myfxbook/models/broker.dart';

class BrokerInfo extends StatefulWidget {
  static const routeName = "/broker-info";
  const BrokerInfo({super.key});

  @override
  State<BrokerInfo> createState() => _BrokerInfoState();
}

class _BrokerInfoState extends State<BrokerInfo> {
  Broker? broker;

  @override
  void didChangeDependencies() {
    broker ??= ModalRoute.of(context)!.settings.arguments as Broker;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: broker != null ? broker!.name : '',
      ),
      body: broker == null
          ? const SizedBox(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              padding: const EdgeInsets.only(top: 10),
              child: ListView(
                children: broker!.brokerInformation.entries.map((entry) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TableTitle(title: entry.key),
                      ...entry.value.entries.map((entry) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(entry.key),
                              ),
                              Expanded(
                                child: Text(entry.value.toString()),
                              )
                            ],
                          ),
                        );
                      }).toList()
                    ],
                  );
                }).toList(),
              ),
            ),
    );
  }
}

class TableTitle extends StatelessWidget {
  final String title;
  const TableTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      width: double.infinity,
      child: Text(
        title.toUpperCase(),
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

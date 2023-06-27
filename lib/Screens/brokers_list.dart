import 'package:flutter/material.dart';
import 'package:myfxbook/Providers/brokers_providers.dart';
import 'package:myfxbook/Screens/broker_info.dart';
import 'package:provider/provider.dart';

class BrokersList extends StatelessWidget {
  const BrokersList({super.key});

  @override
  Widget build(BuildContext context) {
    final brokers = Provider.of<BrokerProvider>(context).brokers;
    return ListView.separated(
      itemCount: brokers.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.network(
            "https://www.myfxbook.com/images/brokers/${brokers[index].logo}",
            width: 50,
            height: 50,
          ),
          title: Text(brokers[index].name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(brokers[index].brokerInformation['general information']
                  ?['broker type']),
              Text(
                  'Regulation By ${brokers[index].brokerInformation['general information']?['regulation']}'),
            ],
          ),
          trailing: ElevatedButton(
            onPressed: () => Navigator.of(context).pushNamed(
              BrokerInfo.routeName,
              arguments: brokers[index],
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
            ),
            child: Text(
              "Open".toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}

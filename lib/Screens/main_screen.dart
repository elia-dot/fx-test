import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:myfxbook/Screens/brokers_list.dart';
import 'package:myfxbook/Widgets/custom_app_bar.dart';
import 'package:myfxbook/Providers/brokers_providers.dart';

class MainScreen extends StatefulWidget {
  static const routeName = "/main-screen";

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    final brokerProvider = Provider.of<BrokerProvider>(context, listen: false);
    brokerProvider.getBrokers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final brokersProvider = Provider.of<BrokerProvider>(context);
    return Scaffold(
        appBar: const CustomAppBar(
          text: "Top Brokers",
          isExpandable: true,
        ),
        body: brokersProvider.loadingStatus == LoadingStatus.searching
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : brokersProvider.loadingStatus == LoadingStatus.empty
                ? const Center(
                    child: Text("No brokers found"),
                  )
                : brokersProvider.loadingStatus == LoadingStatus.error
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              size: 32,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Error while loading brokers",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () => brokersProvider.getBrokers(),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.refresh),
                                  Text("Try again"),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : const BrokersList());
  }
}

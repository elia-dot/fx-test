import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:myfxbook/theme/app_colors.dart';
import 'package:myfxbook/Providers/brokers_providers.dart';
import 'package:myfxbook/Screens/broker_info.dart';
import 'package:myfxbook/Screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BrokerProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: AppColors.primaryColor)
                  .copyWith(secondary: AppColors.seconderyColor),
        ),
        home: const MainScreen(),
        routes: {
          MainScreen.routeName: (context) => const MainScreen(),
          BrokerInfo.routeName: (context) => const BrokerInfo(),
        },
      ),
    );
  }
}

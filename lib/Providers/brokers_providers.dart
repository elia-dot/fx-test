import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:myfxbook/models/broker.dart';

enum LoadingStatus { searching, completed, empty, error }

class BrokerProvider with ChangeNotifier {
  List<Broker> _brokers = [];

  List<Broker> get brokers {
    return [..._brokers];
  }

  LoadingStatus loadingStatus = LoadingStatus.empty;

  Future<void> getBrokers() async {
    loadingStatus = LoadingStatus.searching;
    // notifyListeners();
    final url =
        Uri.parse("https://www.myfxbook.com/mobile/get-promoted-brokers.json");

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final brokersJsonList =
          extractedData['brokerManageArray'] as List<dynamic>;
      final List<Broker> loadedBrokers = [];
      for (var broker in brokersJsonList) {
        loadedBrokers.add(Broker.fromJson(broker));
      }
      _brokers = loadedBrokers;
      if (brokers.isEmpty) {
        // In case there are no error but no brokers data
        loadingStatus = LoadingStatus.empty;
      } else {
        loadingStatus = LoadingStatus.completed;
      }
      notifyListeners();
    } catch (error) {
      loadingStatus = LoadingStatus.error;
      rethrow;
    }
  }
}

class Broker {
  final String name;
  final String logo;
  final String url;
  final Map<String, Map<String, dynamic>> brokerInformation;

  Broker({
    required this.name,
    required this.logo,
    required this.url,
    required this.brokerInformation,
  });

  factory Broker.fromJson(Map<String, dynamic> json) {
    return Broker(
      name: json['bn'],
      logo: json['in'],
      url: json['lu'],
      brokerInformation: {
        'general information': {
          'broker type': json['bt'] ?? 'N/A',
          'country': json['c'] ?? 'N/A',
          'operating since': json['os'] ?? 'N/A',
          'number of employees': json['noe'] ?? 'N/A',
          'international offices': json['pct'] ?? 'N/A',
          'regulation': json['rt'] ?? 'N/A',
          'address': json['ad'] ?? 'N/A',
          'broker status': json['bs'] ?? 'N/A',
          'accepting us clients': json['auc'] == false ? 'No' : 'Yes'
        },
        'account options': {
          'account currencies': json['ac'] ?? 'N/A',
          'funding options': json['fwm'] ?? 'N/A',
          'swap free accounts': json['sfa'] == false ? 'No' : 'Yes',
          'segregated accounts': json['sega'] == false ? 'No' : 'Yes',
          'interest on margin': json['iom'] == false ? 'No' : 'Yes',
        },
      },
    );
  }
}

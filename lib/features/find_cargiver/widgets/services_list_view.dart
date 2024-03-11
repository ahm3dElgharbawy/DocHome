import 'package:dochome/features/find_cargiver/models/service_model.dart';
import 'package:dochome/features/find_cargiver/widgets/service_item.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class ServicesListView extends StatelessWidget {
  const ServicesListView({
    super.key,
  });
  static List nursingServices = const [
    ServiceModel(serviceName: 'Intramuscular Injection'),
    ServiceModel(serviceName: 'Lotion Installation'),
    ServiceModel(serviceName: 'Installation of a urinary catheter'),
    ServiceModel(serviceName: 'Sensitivity Test'),
    ServiceModel(serviceName: 'Intravenous Injection'),
    ServiceModel(serviceName: 'Elderly nursing'),
    ServiceModel(serviceName: 'Gastric tube installation'),
    ServiceModel(serviceName: 'Nursing for people with disabilities'),
    ServiceModel(serviceName: 'Enema'),
    ServiceModel(serviceName: 'Intensive care nursing'),
    ServiceModel(serviceName: 'Simple wound dressing'),
    ServiceModel(serviceName: 'Medium wound dressing'),
    ServiceModel(serviceName: 'Large wound dressing'),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children:
          nursingServices.map((e) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ServiceItem(serviceModel: e),
          )).toList(),
    );
  }
}

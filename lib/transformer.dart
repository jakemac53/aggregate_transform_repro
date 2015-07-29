library aggregate_transform_repro.transformer;

import 'package:barback/barback.dart';

class MyTransformer extends AggregateTransformer with DeclaringAggregateTransformer {
  MyTransformer.asPlugin(BarbackSettings settings) : super();

  String get allowedExtensions => ".dart";

  classifyPrimary(AssetId id) {
    print('classifying $id');
    return 'MyTransformerGroup';
  }

  apply(AggregateTransform transform) async {
    var inputs = await transform.primaryInputs.toList();
    var ids = inputs.map((Asset asset) => asset.id).toList();
    print('Applying transform to ids: \n$ids');
  }

  declareOutputs(DeclaringAggregateTransform transform) async {
    var ids = await transform.primaryIds.toList();
    print('Declaring outputs for ids: \n$ids');
  }
}

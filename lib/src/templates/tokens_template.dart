import 'package:atlas_cli/src/models/object_generate.dart';

String tokenGenerator(ObjectGenerate object) => '''

import './${object.packageName}_styles.dart';
import './component/${object.packageName}_component.dart';

class M${object.name} extends ${object.name}Component {
  const M${object.name}({
    super.key,
    required super.behaviour,
    required super.componentStyle,
  });

  M${object.name}.standard({
    super.key,
    required super.behaviour,
    super.child,
  }) : super(componentStyle: ${object.name}Styles.standard);
}
''';

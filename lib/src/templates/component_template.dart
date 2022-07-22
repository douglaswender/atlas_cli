import 'package:atlas_cli/src/models/object_generate.dart';

String componentGeneratorTemplate(ObjectGenerate object) => '''
import 'package:atomic_design_flutter/core/behaviour/behaviour.dart';
import 'package:atomic_design_flutter/core/component/component.dart';
import 'package:atomic_design_flutter/core/component/component_style.dart';

import 'package:flutter/material.dart';

import './${object.packageName}_style.dart';

class ${object.name}Component extends StatelessWidget
    with Component<${object.name}Style, ${object.name}SharedStyle> {
  final Behaviour behaviour;
  final Widget? child;
  final ComponentStyle<${object.name}Style, ${object.name}SharedStyle> componentStyle;
  const ${object.name}Component({
    Key? key,
    required this.behaviour,
    required this.componentStyle,
    this.child,
  }) : super(key: key);

  @override
  Widget whenRegular(${object.name}Style style, ${object.name}SharedStyle? sharedStyle,
      BuildContext context, Behaviour childBehaviour) {
    return Container();
  }

  @override
  Widget whenLoading(CardStyle style, CardSharedStyle sharedStyle,
      BuildContext context, Behaviour childBehaviour) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return render(
        behaviour: behaviour, context: context, componentStyle: componentStyle);
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => null;
}

''';

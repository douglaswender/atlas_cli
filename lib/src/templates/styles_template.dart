import 'package:atlas_cli/src/models/object_generate.dart';

String stylesGeneratorTemplate(ObjectGenerate object) =>
    '''import 'package:atomic_design_flutter/core/component/component_style.dart';
import 'package:atomic_design_flutter/exports/shared.dart';
import 'package:flutter/material.dart';

import './component/${object.packageName}_style.dart';

class ${object.name}Styles {
  static get standard => ComponentStyle<${object.name}Style, ${object.name}SharedStyle>(
        regular: ${object.name}Style(),
        shared: ${object.name}SharedStyle(),
        ),
      );
}
''';

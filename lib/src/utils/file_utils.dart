import 'dart:io';

import 'package:atlas_cli/src/models/object_generate.dart';
import 'package:atlas_cli/src/models/types.dart';
import 'package:atlas_cli/src/templates/component_style_template.dart';
import 'package:atlas_cli/src/templates/component_template.dart';
import 'package:atlas_cli/src/templates/styles_template.dart';
import 'package:atlas_cli/src/templates/tokens_template.dart';
import 'package:atlas_cli/src/utils/directory_utils.dart';
import 'package:atlas_cli/src/utils/log_utils.dart';

/// [FileUtils] contains utilties related to File IO
class FileUtils {
  /// Function that writes file to the disk
  ///
  /// [path] has to be a fully qualified path
  /// [name] is a name of component generated
  /// [type] is a type of component generated
  static void writeFile({
    required String name,
    required GenerationType type,
  }) {
    String path;
    if (type == GenerationType.atoms) {
      path = 'lib/src/atoms';
    } else if (type == GenerationType.molecules) {
      path = 'lib/src/molecules';
    } else if (type == GenerationType.organisms) {
      path = 'lib/src/organisms';
    } else {
      throw FileSystemException('$type is not defined');
    }
    final file = File(DirectoryUtils.replaceAsExpected(path: path));

    if (file.existsSync()) {
      LogUtil.error('Already exists a $name component');
      //throw FileSystemException('Already exists a $name component');
    }

    ObjectGenerate object = ObjectGenerate(
      name: DirectoryUtils.formatName(name),
      packageName: name,
      type: type.name,
    );

    generateComponent(path, type, object);

    generateStyleComponent(path, type, object);

    generateStyles(path, type, object);

    generateToken(path, type, object);

    LogUtil.success('Created new component on path: $path');
  }

  static Future<void> generateComponent(
    String path,
    GenerationType type,
    ObjectGenerate object,
  ) async {
    final file = File(DirectoryUtils.replaceAsExpected(
        path:
            '$path/${object.packageName}/component/${object.packageName}_component.dart'));

    if (file.existsSync()) {
      LogUtil.error('Already exists a ${object.packageName} component');
    }
    file.createSync(recursive: true);

    file.writeAsStringSync(componentGeneratorTemplate(object));
    LogUtil.success('Created component ${object.packageName}');

    DirectoryUtils.formatFile(file);
  }

  static Future<void> generateStyleComponent(
      String path, GenerationType type, ObjectGenerate object) async {
    final file = File(DirectoryUtils.replaceAsExpected(
        path:
            '$path/${object.packageName}/component/${object.packageName}_style.dart'));

    if (file.existsSync()) {
      LogUtil.error('Already exists a ${object.packageName} style');
    }

    file.createSync(recursive: true);

    file.writeAsStringSync(styleGeneratorTemplate(object));
    LogUtil.success('Created component style ${object.packageName}');

    DirectoryUtils.formatFile(file);
  }

  static Future<void> generateStyles(
      String path, GenerationType type, ObjectGenerate object) async {
    final file = File(DirectoryUtils.replaceAsExpected(
        path: '$path/${object.packageName}/${object.packageName}_styles.dart'));

    if (file.existsSync()) {
      LogUtil.error('Already exists a ${object.packageName} styles');
    }

    file.createSync(recursive: true);

    file.writeAsStringSync(stylesGeneratorTemplate(object));
    LogUtil.success('Created styles for ${object.packageName}');

    DirectoryUtils.formatFile(file);
  }

  static Future<void> generateToken(
      String path, GenerationType type, ObjectGenerate object) async {
    final file = File(DirectoryUtils.replaceAsExpected(
        path: '$path/${object.packageName}/${object.packageName}.dart'));

    if (file.existsSync()) {
      LogUtil.error('Already exists a ${object.packageName}.dart');
    }

    file.createSync(recursive: true);

    file.writeAsStringSync(tokenGenerator(object));
    LogUtil.success('Created ${object.packageName}.dart');

    DirectoryUtils.formatFile(file);
  }
}

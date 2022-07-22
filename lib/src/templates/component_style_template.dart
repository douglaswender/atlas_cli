import 'package:atlas_cli/src/models/object_generate.dart';

String styleGeneratorTemplate(ObjectGenerate object) => '''
/// Estilos compartilhados
class ${object.name}SharedStyle{
}


/// Estilos do ${object.name}
class ${object.name}Style{}
 ''';

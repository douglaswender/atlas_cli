import 'package:atlas_cli/src/commands/atlas_command.dart';
import 'package:atlas_cli/src/utils/log_utils.dart';

class AtlasCLI {
  static void main(List<String> args) {
    final runner = AtlasCommandRunner(args);

    if (runner.hasCommand(args)) {
      runner.executeCommand(args);
    } else {
      if (args.first == "-v" || args.first == "--version") {
        LogUtil.info("version: 0.0.2");
      } else {
        LogUtil.info('''
  Missing command for "atlas".

  Usage: atlas generate <subcommand> [component]

  Available commands:
    generate atom \t creates a atom
    generate molecule \t creates a molecule
    generate organism \t creates a organism

  Run "atlas help" to see global options.
''');
      }
    }
  }
}

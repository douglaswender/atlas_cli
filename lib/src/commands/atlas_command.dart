import 'package:args/command_runner.dart';
import 'package:atlas_cli/src/utils/log_utils.dart';

import 'generate_command.dart';

class AtlasCommandRunner {
  CommandRunner runner =
      CommandRunner('atlas', 'Generator for Atlas Design System');

  AtlasCommandRunner(List<String> args) {
    configureCommands(args);
  }
  void executeCommand(List<String> args) {
    runner.run(args).catchError((error) {
      if (error is! UsageException) throw error;
      LogUtil.info(error.toString());
    });
  }

  void configureCommands(List<String> args) {
    //runner.addCommand(HelpCommand());
    runner.addCommand(GenerateCommand());
  }

  bool hasCommand(List<String> args) {
    return runner.commands.keys.any((element) => args.contains(element));
  }
}

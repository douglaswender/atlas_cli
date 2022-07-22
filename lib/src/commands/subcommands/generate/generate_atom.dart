import 'package:args/command_runner.dart';

import 'package:atlas_cli/src/models/types.dart';
import 'package:atlas_cli/src/utils/file_utils.dart';
import 'package:atlas_cli/src/utils/log_utils.dart';

class GenerateAtomCommand extends Command {
  @override
  String get description => 'creates a atom';

  @override
  String get name => 'atom';

  @override
  void run() {
    if (argResults!.rest.isEmpty) {
      LogUtil.error(
        'value not passed for a module command \n\n$usage',
      );
    } else {
      LogUtil.info('GENERATING ATOM ${argResults!.rest.first.toUpperCase()}');

      FileUtils.writeFile(
        name: argResults!.rest.first,
        type: GenerationType.atoms,
      );
    }
  }
}

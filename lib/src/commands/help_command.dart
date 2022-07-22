import 'package:args/command_runner.dart';

class HelpCommand extends Command {
  @override
  String get description => "help command atlas cli";

  @override
  String get name => 'help';
}

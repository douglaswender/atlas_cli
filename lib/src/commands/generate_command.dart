import 'package:args/command_runner.dart';

import 'subcommands/generate/generate_atom.dart';
import 'subcommands/generate/generate_molecule.dart';
import 'subcommands/generate/generate_organism.dart';

class GenerateCommand extends Command {
  @override
  String get description => 'Creates a atom, molecule or organism';

  @override
  String get name => 'generate';

  GenerateCommand() {
    addSubcommand(GenerateAtomCommand());
    addSubcommand(GenerateMoleculeCommand());
    addSubcommand(GenerateOrganismCommand());
  }
}

# vscode-kernel-module

Basic setup for kernel module development using vscode.
When adjusting this template
make sure to keep the json generation intact (see below).

**Sometimes VSCode localizes the wrong headers.**
This most often happens when a new file is added
that was not built yet.
In this case
1. build the module: `make` (regenerates `compile_commands.json`)
2. then either restart VSCode or use `Developer: Reload Window`.

## Requirements

You need `python`.

## How this works

In the kernel sources
exists a script `$KDIR/scripts/gen_compile_commands.py`,
which gathers compilation artifacts.
It creates a `json` file that maps
from source files
to the command used to compile those files.
VSCode's C/C++ extension
can use this information
to localize the appropriate header files
when parsing a compilation unit.
This is configured in `c_cpp_properties.json`
with the key `"compileCommands"`.

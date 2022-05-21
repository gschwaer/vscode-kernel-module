KDIR ?= /lib/modules/`uname -r`/build

modules:
	$(MAKE) -C $(KDIR) M=$$PWD modules
	$(KDIR)/scripts/gen_compile_commands.py --directory $$PWD --output $$PWD/.vscode/compile_commands.json
# fix include paths (they are relative to the kernel dir)
	sed -i "s|-I\./|-I$(KDIR)/|g" $$PWD/.vscode/compile_commands.json
	sed -i "s| \./| $(KDIR)/|g" $$PWD/.vscode/compile_commands.json
	sed -i "s|-Iubuntu/|-I$(KDIR)/ubuntu/|g" $$PWD/.vscode/compile_commands.json

clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean
	rm $$PWD/.vscode/compile_commands.json

load:
	sudo insmod $$PWD/hello.ko

unload:
	sudo rmmod hello

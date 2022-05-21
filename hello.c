// If vscode uses wrong headers, restart it or use `Developer: Reload Window`.

#include <linux/module.h>

int init_module(void)
{
	pr_notice("Hello world!\n");

	return 0;
}

void cleanup_module(void)
{
	pr_notice("Goodbye world!\n");
}

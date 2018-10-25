#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* We can add qualifiers to function prototypes. Here, we declare that fgets
 * taints its output, thus preventing an unqualified char* or an untainted char*
 * from being assigned a value obtained from fgets. */
tainted char *fgets(tainted char *s, int size, FILE *stream);

void untainted_gets(untainted char *s);

int main(void)
{
	tainted char *tbuf = malloc(256 * sizeof(char));

	fgets(tbuf, 256, stdin);

	/* Attempting to pass a tainted char* to a function expecting an
	 * unqualified char* raises a compile-time error. In the case of printf,
	 * this prevents a format string vulnerability. */
//	printf(tbuf);

	/* Safe use of printf is allowed. */
	printf("%s", tbuf);

	/* An untainted char* can only be passed to functions that are
	 * explicitly qualified to accept it. */
	untainted char *ubuf = (untainted char *) malloc(256 * sizeof(char));
	untainted_gets(ubuf);

	return 0;
}

void untainted_gets(untainted char *s)
{
	untainted char *s2 = (untainted char *) "known string";
	int i;
	for (i=0; s2[i] != '\0'; i++) {
		s[i] = s2[i];
	}
	s[i] = s2[i];
}


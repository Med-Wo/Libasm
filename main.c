#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>

size_t	ft_strlen(const char *s);
char	*ft_strcpy(char *dest, const char *src);
int 	ft_strcmp(const char *s1, const char *s2);
ssize_t	ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char 	*ft_strdup(const char *s);

# define STRLEN(x)	printf("STR = [%s]\nstrlen      [%ld] \nft_strlen   [%ld]\n\n", x, strlen(x), ft_strlen(x));

int		main(void)
{
	STRLEN("Hello World");
	STRLEN("0123456789abcdef");
	STRLEN("-42424242");
	STRLEN("$#*&@");
	STRLEN("");
	printf("ft_strlen(NULL)   [%ld]\n",  ft_strlen(NULL));

	puts("Basic test");
	STRCMP("Hello World", "Hello");
	STRCMP("Hello", "Hello World");
	STRCMP("Hello World", "Hello World");
	puts("Unicode character");
	STRCMP("\xfe", "\xff");
	STRCMP("\xff", "\xfe");
	puts("Official strcmp with this args segfault not mine");
	printf("ft_strcmp(NULL, \"Hello World\")   [%d]\n",  ft_strcmp(NULL, "Hello World"));
	printf("ft_strcmp(\"Hello World\", NULL)   [%d]\n",  ft_strcmp("Hello World", NULL));
	printf("ft_strcmp(NULL, NULL)            [%d]\n",  ft_strcmp(NULL, NULL));
	return (0);
}

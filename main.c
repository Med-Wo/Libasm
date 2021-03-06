#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>

size_t	ft_strlen(const char *str);
int 	ft_strcmp(const char *s1, const char *s2);
char	*ft_strcpy(char *dest, const char *src);
ssize_t	ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char 	*ft_strdup(const char *s);

# define TEST_ERRNO(x) printf("%s\n\n", strerror(x));
# define STRLEN(x)	printf("STR = [%s]\nstrlen      [%ld] \nft_strlen   [%ld]\n\n", x, strlen(x), ft_strlen(x));
# define STRCMP(a, b)  printf("S1 = [%s]   S2 = [%s] \nstrcmp      [%d]\nft_strcmp   [%d]\n\n",a ,b ,strcmp(a, b), ft_strcmp(a, b));
# define STRCPY(a, b)	printf("strcpy      [%s] \nft_strcpy   [%s]\n\n", strcpy(a, b), ft_strcpy(a, b));
# define STRDUP(a)  printf("strdup      [%s] \nft_strdup   [%s]\n", strdup(a), ft_strdup(a));
int		main(void)
{
	int		errsv;
	char	buffer[29];
	char	buffer_short[5];
	int		i;

	i = 0;
	while (i < 29)
		buffer[i++] = 0;
	i = 0;
	while (i < 5)
		buffer_short[i++] = 0;
	/*
	puts("BASIC TEST");
	STRLEN("Hello World");
	STRLEN("0123456789abcdef");
	STRLEN("-42424242");
	STRLEN("$#*&@");
	STRLEN("");
	puts("SEGFAULT TEST");
	printf("ft_strlen(NULL)   [%ld]\n",  ft_strlen(NULL));

	puts("BASIC TEST");
	STRCMP("Hello World", "Hello");
	STRCMP("Hello", "Hello World");
	STRCMP("Hello World", "Hello World");
	puts("UNICODE CHARACTER");
	STRCMP("\xfe", "\xff");
	STRCMP("\xff", "\xfe");
	puts("SEGFAULT TEST");
	printf("ft_strcmp(NULL, \"Hello World\")   [%d]\n",  ft_strcmp(NULL, "Hello World"));
	printf("ft_strcmp(\"Hello World\", NULL)   [%d]\n",  ft_strcmp("Hello World", NULL));
	printf("ft_strcmp(NULL, NULL)            [%d]\n",  ft_strcmp(NULL, NULL));

	puts("BASIC TEST");
	STRCPY(buffer_short, "")
	STRCPY(buffer_short, "Hello");
	STRCPY(buffer, "yope\0la");
	STRCPY(buffer, "\x01\x02\x03\x04\x05");
	puts("TEST SEGFAULT");
	printf("ft_strcmp(NULL, \"Hello World\")  %s\n\n", ft_strcpy(NULL, "Hello World"));
	printf("ft_strcmp(buffer, NULL)         [%s]\n\n", ft_strcpy(buffer, NULL));
	printf("ft_strcmp(NULL, NULL)           %s\n\n", ft_strcpy(NULL, NULL));
	*/

	errsv = errno;
	
	puts("BASIC TEST");
	STRDUP("");
	printf("%s\n\n", strerror(errsv));
	STRDUP("Hello World");
	printf("%s\n\n", strerror(errsv));
	STRDUP("yope\0la");
	printf("%s\n\n", strerror(errsv));
	puts("TEST SEGFAULT");
	printf("ft_strdup(NULL)  %s\n", ft_strdup("NULL"));
	return (0);
}

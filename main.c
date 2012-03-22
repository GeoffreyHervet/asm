#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define STRNCMP 1
#define MEMMOV  0
#define STRCMP  0
#define STRCPY  0
#define STRCHR  0
#define STRLEN  0
#define MEMSET  0

size_t my_strlen(const char *s);
char *my_strchr(const char *s, int c);
char *my_strcpy(char *dest, const char *src);
int my_strcmp(const char *s1, const char *s2);
int my_strncmp(const char *s1, const char *s2, size_t n);
void *my_memmove(void *dest, const void *src, size_t n);
typedef struct {
  char s[43];
  int i;
  float tutu;
  void *p;
  size_t coudra_t;
} t_test;

#define PTR_DEL(p1, p2) ((unsigned long)(p1) - (unsigned long)(p2))

int		main(int ac, char **av)
{
#if STRNCMP
  printf("%i, %i\n", strncmp("qwertyuio", "qwertyAZER", 4), my_strncmp("qwertyuio", "qwertyAZER", 4));
  printf("%i, %i\n", strncmp("qwertyuio", "qwertyAZER", 9), my_strncmp("qwertyuio", "qwertyAZER", 9));
  printf("%i, %i\n", strncmp("qwertyAZER", "qwertyuio", 4), my_strncmp("qwertyAZER", "qwertyuio", 4));
  printf("%i, %i\n", strncmp("qwertyAZER", "qwertyuio", 9), my_strncmp("qwertyAZER", "qwertyuio", 9));
#endif
#if MEMMOV
  t_test memmove_test;
  t_test test;
  int i = -1;
  strcpy(&memmove_test.s[0], "QQWETRYTUIYUIOPLKGHdfsacxxac");
  printf("[%s]\n", memmove_test.s);
  memmove_test.i = 42;
  memmove_test.tutu = 1234.4321;
  memmove_test.p = NULL;
  memmove_test.coudra_t = 0xFACEB00C;
  bzero(&test, sizeof(test));
  printf("[%s]\n", memmove_test.s);
  printf("[       %s]\n", 7+ memmove_test.s);
  printf("ret = %p\n", my_memmove(&test, &memmove_test, sizeof(memmove_test)));
  printf("[%s]\n", memmove_test.s);
  printf("[ %s]\n", 1+ memmove_test.s);
  printf("[  %s]\n", 2+ memmove_test.s);
  printf("[   %s]\n", 3+ memmove_test.s);
  printf("[    %s]\n", 4+ memmove_test.s);
  printf("[     %s]\n", 5+ memmove_test.s);
  printf("[      %s]\n", 6+ memmove_test.s);
  printf("[       %s]\n", 7+ memmove_test.s);
  printf("memmove : %i %i %i %i %i\n", !strcmp(memmove_test.s, test.s),
      memmove_test.i == test.i,
      memmove_test.tutu == test.tutu,
      memmove_test.p == test.p,
      memmove_test.coudra_t == test.coudra_t);
  printf("[%s]\n", memmove_test.s);
  printf("      %s\nNEW-> %s\n", memmove_test.s, test.s); printf("------------------\n");
  printf("      %i\nNEW-> %i\n", memmove_test.i, test.i); printf("------------------\n");
  printf("      %f\nNEW-> %f\n", memmove_test.tutu, test.tutu); printf("------------------\n");
  printf("      %p\nNEW-> %p\n", memmove_test.p, test.p); printf("------------------\n");
  printf("      %li\nNEW-> %li\n", memmove_test.coudra_t, test.coudra_t); printf("------------------\n");
#endif

#if STRCMP
  printf("MINE %d - %d LIBC\n", my_strcmp("aaaaaaaaaa", "aaaaaaaaaa"), strcmp("aaaaaaaaaa", "aaaaaaaaaa"));
  printf("MINE %d - %d LIBC\n", my_strcmp("aaaaaaaZaaa", "aaaaaaaaaa"), strcmp("aaaaaaaZaaa", "aaaaaaaaaa"));
  printf("MINE %d - %d LIBC\n", my_strcmp("aaaaaaaaaa", "aaaaaaaZaaa"), strcmp("aaaaaaaaaa", "aaaaaaaZaaa"));
#endif
#if STRCPY
  printf("-----------[ STRCPY ]-----------\n");
  const char	*str1 = "qwertyuioopasdfghjklzxcvbnm";
  char receive1[1024];

  printf("my_strcpy(%s) = %s, receive1 = %s\n", str1, my_strcpy(receive1, str1), receive1);
  printf("   strcpy(%s) = %s, receive1 = %s\n", str1, my_strcpy(receive1, str1), receive1);
  receive1[4] = 0;
  receive1[5] = 0;
  receive1[6] = 0;
  receive1[7] = 0;
  receive1[8] = 0;
  printf("my_strcpy(%s) = %s, receive1 = %s\n", str1, my_strcpy(receive1, str1), receive1);
  printf("   strcpy(%s) = %s, receive1 = %s\n", str1, my_strcpy(receive1, str1), receive1);
#endif
#if STRCHR
  printf("-----------[ STRCHR ]-----------\n");
  const char	*str = "qwertyuioopasdfghjklzxcvbnm";
  printf("str           -> %p\n", str);
  printf("strchr(str)    = %p, offset = %li\n", strchr(str, 'o'), PTR_DEL(strchr(str, 'o'), str));
  printf("my_strchr(str) = %p, offset = %li\n", my_strchr(str, 'o'), PTR_DEL(my_strchr(str, 'o'), str));
  printf("my_strchr(str) = %p, offset = %li\n", my_strchr(str, '?'), PTR_DEL(my_strchr(str, '?'), str));
#endif
#if STRLEN
  printf("-----------[ STRLEN ]-----------\n");
  const char	*str2 = "qwrtyuiorjehgerdsfjcsagfhgfdghgfdghtp";
  printf("str2len(str)    = %d\n", strlen(str));
  void *p = (void *)my_str2len(str);
  printf("my_str2len(str) = %p - %d\n", p, (size_t)p);
#endif
#if MEMSET
  printf("-----------[ MEMSET ]-----------\n");
  int		*tab;
  int		idx;

  tab = malloc(sizeof(*tab) * 10);
  idx = 0;
  while (idx < 10)
    tab[idx++] = idx;
  printf("tab = %p\n", tab);
  idx = -1;
  while (++idx < 10)
    printf("tab[%i] = %#x\n", idx, tab[idx]);
  printf("memset(tab, 42, 10) = %p\n", memset(tab, 42, 10));
  idx = -1;
  while (++idx < 10)
    printf("tab[%i] = %#x\n", idx, tab[idx]);
#endif


  return 0;
}

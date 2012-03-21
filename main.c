#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define STRCHR 1
#define STRLEN 0
#define MEMSET 0

size_t my_strlen(const char *s);
char *my_strchr(const char *s, int c);

#define PTR_DEL(p1, p2) ((unsigned long)(p1) - (unsigned long)(p2))

int		main(int ac, char **av)
{
#if STRCHR
  printf("-----------[ STRCHR ]-----------\n");
  const char	*str = "qwertyuioopasdfghjklzxcvbnm";
  printf("str           -> %p\n", str);
  printf("strchr(str)    = %p, offset = %li\n", strchr(str, 'o'), PTR_DEL(strchr(str, 'o'), str));
  printf("my_strchr(str) = %p, offset = %li\n", my_strchr(str, 'o'), PTR_DEL(my_strchr(str, 'o'), str));
#endif
#if STRLEN
  printf("-----------[ STRLEN ]-----------\n");
  const char	*str = "qwrtyuiorjehgerdsfjcsagfhgfdghgfdghtp";
  printf("strlen(str)    = %d\n", strlen(str));
  void *p = (void *)my_strlen(str);
  printf("my_strlen(str) = %p - %d\n", p, (size_t)p);
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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MEMSET 0
#define STRLEN 0

size_t my_strlen(const char *s);

int		main(int ac, char **av)
{
#if STRLEN
  printf("-----------[ STRLEN ]-----------\n");
  const char	*str = "qwrtyuiorjehgerdsfjcsagfhgfdghgfdghtp";
  printf("strlen(str) = %d\n", strlen(str));
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

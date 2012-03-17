#include <stdio.h>
#include <stdlib.h>


void *my_memset(void *s, int c, size_t n);

int		main(int ac, char **av)
{
  int		*tab;
  int		idx;

  tab = malloc(sizeof(*tab) * 10);
  idx = 0;
  while (idx < 10)
    tab[idx++] = idx;
  printf("tab = %p\n", tab);
  idx = -1;
  while (++idx < 10)
    printf("tab[%i] = %i\n", idx, tab[idx]);
  printf("my_memset(tab, 42, 10) = %p\n", my_memset(tab, 42, 10));
  idx = -1;
  while (++idx < 10)
    printf("tab[%i] = %i\n", idx, tab[idx]);
  return 0;
}

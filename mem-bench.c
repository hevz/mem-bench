#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ARRAY_SIZE(x) (sizeof (x) / sizeof (x[0]))

int
main (int argc, char *argv[])
{
    static char msrc[8192] __attribute__ ((aligned (8)));
    static char mdst[8192] __attribute__ ((aligned (8)));
    const int offs[] = { 0, 1, 2, 4 };
    int i, j, si, di, size, loop;

    if (argc < 3) {
        fprintf (stderr, "%s SIZE LOOP\n", argv[0]);
        return -1;
    }

    size = atoi (argv[1]);
    loop = atoi (argv[2]);

    for (j = 0; j < loop; j++) {
        for (si = 0; si < ARRAY_SIZE (offs); si++) {
            for (di = 0; di < ARRAY_SIZE (offs); di++) {
#if defined(MEMSET)
                memset (&mdst[offs[di]], 0, size);
#elif defined(MEMCPY)
                memcpy (&mdst[offs[di]], &msrc[offs[si]], size);
#elif defined(MEMMOVE)
                memmove (&mdst[offs[di]], &msrc[offs[si]], size);
#endif
            }
        }
    }

    return 0;
}

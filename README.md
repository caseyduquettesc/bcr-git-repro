# bcr-git-repro

```
docker build -t git-repro . && docker run --rm git-repro
```

```
  external/git+/compat/zlib-compat.h:27:11: fatal error: zlib.h: No such file or directory
     27 | # include <zlib.h>
        |           ^~~~~~~~
```


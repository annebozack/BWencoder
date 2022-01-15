# BWencoder

R package that performs a Burrows-Wheeler transform and inverse transform on a string.

To install:
```
> devtools::install_github("annebozack/BWencoder")
> library(BWencoder)
```

### Burrows–Wheeler transform

```
> bwt('hello')
[1] "oh$ell"
```

### Inverse Burrows–Wheeler transform

```
> invbwt("oh$ell")
[1] "hello"
```

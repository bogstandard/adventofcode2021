# expecting 1757714216975
p=`<i`
p=${p//,/ }

for f in $p
{
  for n in {0..8}
  {
    eval "((f==$n&&x$n++))"
  }
}

for d in {1..256}
{
  # 0s take on 1s
  # 1s take on 2s
  # 2s take on 3s
  # 4s take on 5s
  # 5s take on 6s
  # 6s take on 7s and 0s
  # 7s take on 8s
  # 8s take on 0s
  for n in {0..8}
  {
    eval "t$n=\$x$[n+1]"
  }
  t6=$[x7+x0]
  t8=$x0

  T=0
  for n in {0..8}
  {
    eval "x$n=\$t$n;"
    eval "T=$[T+x$n]"
  }
}

echo $T

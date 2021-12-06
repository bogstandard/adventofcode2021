# expecting 1757714216975
p=`<i`
p=${p//,/ }
x0=0
x1=0
x2=0
x3=0
x4=0
x5=0
x6=0
x7=0
x8=0

for f in $p
{
  ((f==0))&&((x0++))
  ((f==1))&&((x1++))
  ((f==2))&&((x2++))
  ((f==3))&&((x3++))
  ((f==4))&&((x4++))
  ((f==5))&&((x5++))
  ((f==6))&&((x6++))
  ((f==7))&&((x7++))
  ((f==8))&&((x8++))
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

  t0=$x1
  t1=$x2
  t2=$x3
  t3=$x4
  t4=$x5
  t5=$x6
  t6=$[x7+x0]
  t7=$x8
  t8=$x0

  x0=$t0
  x1=$t1
  x2=$t2
  x3=$t3
  x4=$t4
  x5=$t5
  x6=$t6
  x7=$t7
  x8=$t8
}

echo $[x1+x2+x3+x4+x5+x6+x7+x8+x0]

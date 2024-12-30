#import "template.typ": conf
#import "functions.typ": *

#show: conf.with(
  headtitle: [quantum relations]
)

#show math.equation.where(block: true): set block(breakable: true)
#set math.mat(delim:"[")

#let otimes = math.times.circle
#let qbinom(n: $n$, m: $m$) = $([#n]!)/([#m]![#n - #m]!)$

#align(center)[
  #text(25pt)[
    quantum relations
  ]

]

量子群の文脈出でてくる関係式のまとめ

$k$:field, $K = k(q)$
/ Def.:
$
  [n] &= (q^n - q^(-n))/(q - q^(-1))\
  [n]! &= product_(i=1)^n [i]\
  mat(n;m) &= qbinom(n:n, m:m)
$
/ Prop.:
#enum[
  $q^m [n] + q^(-n) [m] = [m+n]$
][
  $ [m][m'] - [n][m'] = [m-n][(m m' - n n')/(m-n)] $ (for  $m-n = m'-n'$)
][
  $
    mat(n+1;m) =  q^(m) mat(n;m) + q^(-(n+1-m)) mat(n;m-1)
  $
]
/ Proof:
1.
$
  q^m [n] + q^(-n) [m] = (q^(m+n) - q^(m-n) + q^(m-n) - q^(-m-n))/(q-q^(-1)) = [m+n]
$
2.
$
  
$
3.
$
 q^(m) mat(n;m) + q^(-(n+1-m)) mat(n;m-1) 
 &= q^m qbinom() + q^(-(n+1-m)) qbinom(m:(m-1))\
 &= (q^m [n+1-m] + q^(-(n+1-m))[m]) ([n]!)/([m]![n+1-m]!)\
 &= ([n+1][n]!)/([m]![n+1-m]!)\
 &= mat(n+1;m)
$
#qed

/ Prop.:
1. if $x y = q^2 y x$,
$
  (x+y)^n = sum_(k=0)^n mat(n;k) q^(k(n-k)) x^k y^(n-k)= sum_(k=0)^n mat(n;k) q^(-k(n-k)) y^(n-k) x^(k)
$

2.
$
  product_(nu=0)^(n-1) (1 + q^(1-n+2nu)) &:= (1+q^(1-n)x)(1+q^(3-n)x)...(1+q^(n-1)x)\
  &= sum_(k=0)^n mat(n;k) x^k
$
#qed

In paticular,
$
  sum_(k=0)^n (-1)^l q^(m k) mat(n;k) = 0
$
for $abs(m) <= n - 1$and$m equiv n-1 mod 2$

/ Proof.:
1. By induction of $n$. $n=1$ is obvious.
$
  (x+y)^(n+1) &= (x+y)(sum_(k=0)^n mat(n;k) q^(k(n-k)) x^k y^(n-k))\
  &= sum_(k=0)^n mat(n;k) q^(k(n-k)) (x^(k+1)y^(n-k)+y x^k y^(n-k))\
  &= sum_(k=0)^(n+1) mat(n;k-1) q^((k-1)(n+1-k)) x^k y^(n+1 -k)\
  +& sum_(k=9)^(n+1) mat(n;k) q^(k(n-k)) q^(2k) x^k y^(n+1-k)\
  &= sum_(k=0)^(n+1) (q^(-(n+1-k)) mat(n;k-1) + q^k mat(n;k)) q^(k(n+1-k)) x^k y^(n+1-k)\
  &= sum_(k=0)^(n+1) mat(n+1;k) q^(k(n+1-k)) x^k y^(n+1-k)
$
Latter formula is obtained directly by $x^k y^(n-k) = q^(-2k(n-k))y^(n-k) x^k$.

Since
$
  (1 otimes e)(e otimes t^(-1)) &= q^2(e otimes t^(-1))(1 otimes e)\
  (f otimes 1)(t otimes f) &= q^2(t otimes f)(f otimes 1)\
$

so we get following results:
/ Col.:
$
  Delta (e^n) &= sum_(k=0)^n mat(n;m) q^(-k(n-k)) e^k otimes e^(n-k) t^(-k)\
  Delta (f^n) &= sum_(k=0)^n mat(n;m) q^(k(n-k)) f^(n-k)t^k otimes f^k\
$
Let $e^((n)),f^((n))$ be
- $e^((n)) = e^n slash [n]!$, $f^((n)) = f^n slash [n]!$
, we get another description of the above formulae:
$
  Delta (e^((n))) &= sum_(k=0)^n q^(-k(n-k)) e^((k)) otimes e^((n-k)) t^(-k)\
  Delta (f^((n))) &= sum_(k=0)^n q^(-k(n-k)) f^((n-k)) t^k otimes f^((k))\
$

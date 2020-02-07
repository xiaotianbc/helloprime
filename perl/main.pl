#!/usr/bin/perl 

use Time::HiRes qw(time);

sub get_prime{
  $n = @_[0];
  $i=3;
  $j=1;
  while (true){
    $j=$j+2;
    if ($j * $j >$i){
      $n=$n-1;
      if ($n==1){
        last;
      }
      $i=$i+2;
      $j=1;
    }else {
      if ($i%$j==0){
        $i=$i+2;
        $j=1;
      }
    }
  }
  return $i;
}
my $num=300000;
my $t1 = time;
$res=get_prime($num);
my $t2 = time;
my $td=$t2-$t1;
print "答案是： $res ，耗时： $td \n";

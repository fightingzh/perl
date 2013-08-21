  1 #!/usr/bin/perl -w
  2 
  3 $file = "/home/hong/Documents/Lab/zhh/Circadian_rhythms/muxingjielv_anno/M196-me-anno.txt";
  4 open FILE,"$file" or die "can't open file $!";
  5 my ($prom,$pstring,@prom);
  6 my ($exon,$estring,@exon);
  7 my ($intr,@istring,@intr);
  8 my ($term,@tstring,@term);
  9 
 10 while(<FILE>){
 11     @lines = split (' ', $_);
 12     if($lines[3] eq "intergenic"){
 13         next;
 14     }elsif($lines[3] eq "promotor"){
 15         if($lines[1] > $lines[7]){
 16             $prom = ($lines[7] - $lines[1])/5000;
 17         }else{
 18             $prom = ($lines[1] - $lines[6])/5000;
 19         }
 20         $pstring = join(" ",$prom,$lines[2]);
 21         push(@prom,$pstring)
 22     }elsif($lines[3] eq "exon"){
 23         $exon = ($lines[1] - $lines[6])/($lines[7] - $lines[6]);
 24         $estring = join(" ",$exon,$lines[2]);
 25         push(@exon,$estring);
 26     }elsif($lines[3] eq "intron"){
 27         $intr = ($lines[1] - $lines[6])/($lines[7] - $lines[6]);
 28         $istring = join(" ",$intr,$lines[2]);
 29         push(@intr,$istring);
 30     }else{
 31         if($lines[1] > $lines[7]){
 32             $term = ($lines[1] - $lines[7])/5000;
 33         }else{
 34             $term = ($lines[6] - $lines[1])/5000;
 35         }
 36         $tstring = join(" ",$term,$lines[2]);
 37         push(@term,$tstring);
 38     }
 39 }
 40 
 41 foreach (@prom){
 42     print "$_\n";
 43 }
 44 
 45 foreach (@exon){
 46     print "$_\n";
 47 }
 48 
 49 foreach (@intr){
 50     print "$_\n";
 51 }
 52 
 53 foreach (@term){
 54     print "$_\n";
 55 }
 56 
 57 close FILE;
                                                                                                                                                                                                 57,1          Bot

 

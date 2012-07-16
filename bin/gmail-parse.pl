$green = "\033[01;32m";
$yellow = "\033[01;33m";
$blue = "\033[01;34m";
$normal = "\033[01;37m";

while (defined($line = <STDIN>)) {
  chomp($line);

  if ($line =~ /<title>/ and $line =~ !/Gmail - Inbox/) {
    print "\n"
  }

  if ($line =~ /<(title)>(.*)<\/\1>/ and $line !~ /Gmail - Inbox/) {
    print "$green$2$normal\n"
  }


  if ($line =~ /<name>/) {
    print "    "
  }

  if ($line =~ /<(name)>(.*)<\/\1>/) {
    $name = $2;
    $name =~ s/^me$/Gavin Miller/g;
    print "$blue<$name>$normal\n";
  }


  if ($line =~ /<summary>/) {
    print "  "
  }

  if ($line =~ /<(summary)>(.*)<\/\1>/ and ($2 ne "")) {
    print "$yellow$2$normal\n"
  }
}

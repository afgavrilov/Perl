#!/usr/bin/perl
$log_file = @ARGV[0];
$index=0;
$notOK_count=0;
$ll=' ';
$flag=false;
my @notOK_array = ();
if ( !$log_file )
 {
 print "Enter name of log file\n";
 }
else
 {
  open ( DATA1,$log_file );

  while ( $line=<DATA1> )
   {
     $p = index($line,'NOK');
     if ( $p != '-1' )
      {
       $line = substr($line,1,16);
       $notOK_array[$index]=$line;
       $line = '';
       if ( $index != 0 )
        {
            if ( substr(@notOK_array[$index],1,16) eq substr(@notOK_array[$index-1],1,16) )
            {
                    $notOK_count++;

            }
            else
            {
                    print "TIME:".@notOK_array[$index-1]."  ";
                    print "notOK_count:".$notOK_count."\n";
                    $ll = @notOK_array[$index];
                    @notOK_array = ();
                    $index=0;
                    @notOK_array[$index] = $ll;
                    $notOK_count = 1;
            }
                $index++;
        }
        else
        {
                $notOK_count = 1;
                $index++;
        }
     }

   }
  close (DATA1);
 if ($index != 0)
            {
                    print "TIME:".@notOK_array[$index-1]."  ";
                    print "notOK_count:".$notOK_count."\n";
            }
            else
            {
                    print "There are no 'notOK' events on your log files\n";
            }
 }
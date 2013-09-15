#!/usr/bin/perl

use strict;
use File::Spec::Functions qw(rel2abs);
use File::Basename;

my $tools_directory = dirname(rel2abs($0));

my %cpu;
open CPU, "/proc/cpuinfo" or die "Error: $!";
while (<CPU>) {
    if ( /^(.*?)\s*: (.*)/ ) {
	$cpu{$1}=$2;
    }
}
close CPU or die "Error: $! $?";

my $cpu_file="$cpu{'vendor_id'}.$cpu{'cpu family'}.$cpu{'model'}.$cpu{'stepping'}." . int($cpu{'cpu MHz'} /10 + 0.5) * 10 . "MHz";
my $amd64=`uname -m`;
if ($amd64 =~ /x86_64/) {
    $cpu_file .= "_64bits";
}

my @cpulist;

my @bench_list;
if ($#ARGV + 1 and $ARGV[0] =~ /^-bench=(.*)/) {
    @bench_list = split(/ /,$1);
    shift @ARGV;
} else {
    @bench_list=split(/\n/,`cd $tools_directory/../official/c; for f in \$(ls); do if [ -d \$f ] ; then echo \$f ; fi ; done`);
}

if ($#ARGV + 1) {
    @cpulist = @ARGV
} else {
    @cpulist = ($cpu_file);
}

foreach my $bench_name (@bench_list){
    my %data; # $data{$compiler}->{$cpu}->{$dir} == time
    my %datasource;
    my ($min, $max) = (3600, 0);
    foreach my $cpu (@cpulist){
	foreach my $dir ("official", "dev") {
	    if ( -f "$tools_directory/../$dir/results/$cpu") {
		open FILE, "$tools_directory/../$dir/results/$cpu";
		while (<FILE>) {
		    if ( /^$bench_name \((.*)\): ([0-9.]*)/ ) {
			if (not defined $data{$1}->{$cpu}->{$dir} or $2 > $data{$1}->{$cpu}->{$dir}) {
			    $data{$1}->{$cpu}->{$dir} = $2;
			    if ($2 < $min) {
				$min = $2;
			    }
			    if ($2 > $max) {
				$max = $2;
			    }
			}
			$datasource{$cpu}->{$dir}=1;
		    }
		}
		close FILE;
	    } else {print "no $tools_directory/../$dir/results/$cpu\n";}
	}
    }
    
    if ($min == 3600) {
	print "No data found for $bench_name, no graph displayed.\n";
	next;
    }
    
    $min -= ($max - $min) * 0.1;
    my $numcol = 2;
    my $plot = "plot [*:*][$min:*]";
    foreach my $cpu (keys(%datasource)) {
	foreach my $dir (keys(%{$datasource{$cpu}})) {
	    if ($numcol == 2) {
		$plot .= " '/tmp/times' ";
	    } else {
		$plot .= " '' ";
	    }
	    $plot .= "using $numcol:xticlabels(1) ti '$cpu ($dir)' ,";
	    $numcol++;
	}
    }
    chop $plot;
    
    open DATAFILE, ">/tmp/times" or die "Error: $!";
    foreach my $compiler (sort(keys(%data))) {
	print DATAFILE "\"$compiler\" ";
	foreach my $cpu (keys(%datasource)) {
	    foreach my $dir (keys(%{$datasource{$cpu}})) {
		if (defined $data{$compiler}->{$cpu}->{$dir}) {
		    print DATAFILE $data{$compiler}->{$cpu}->{$dir} . "\t";
		} else {
		    print DATAFILE "0\t";
		}
	    }
	}
	print DATAFILE "\n";
    }
    close DATAFILE or die "Error: $! $?";
    
#open GNUPLOT, ">/tmp/shootout.gp" or die "Error: $!"; # Debug helper
    open GNUPLOT, "|gnuplot" or die "Error: $!";
    my $old_file_handle = select(GNUPLOT);
    $| = 1; # Force flush to gnuplot
    select($old_file_handle);
    print GNUPLOT "set title '$bench_name (time in seconds)'\n";
    print GNUPLOT "set xtics scale 3,2 rotate by -90\n";
    print GNUPLOT "set style data histogram\n";
    print GNUPLOT "set style histogram cluster gap 3\n";
    print GNUPLOT "set style fill  solid 1.00 border -1\n";
    print GNUPLOT "set boxwidth 0.9\n";
    print GNUPLOT "set autoscale\n";
    print GNUPLOT "$plot\n";
    print "Press enter to continue.";
    <STDIN>;
    close GNUPLOT or die "Error: $! $?";
}

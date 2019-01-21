#!/usr/bin/perl

$bDate = 0;
$sDate = 1;
$minDate = 0;
$profit = 0;

$argc = @ARGV;

if ($argc != 1)
{
    printf "Usage : maxProfit.pl <priceFile.csv>\n";
    exit -1;
}

open ($fh1, $ARGV[0]) or die "Failed to open the price file $ARGV[0]\n";

while (<$fh1>)
{
    @price = split ",";
}

$endDate = @price; # number of elements

$profit = $price[1] - $price[0] - 1; # Set in case the first value is a loss.

for ($i = 1; $i < $endDate; $i++)
{
#    if ($price[$i] - $price[$minDate] > $price[$sDate] - $price[$bDate])
    if ($price[$i] - $price[$minDate] > $profit)
    {
        $sDate = $i;
        $bDate = $minDate;
        $profit = $price[$sDate] - $price[$bDate];
    }

    if ($price[$i] < $price[$minDate])
    {
        $minDate = $i;
    }
        
}

printf "%d(%.2f), %d(%.2f)\n", $bDate + 1, $price[$bDate], $sDate + 1, $price[$sDate];


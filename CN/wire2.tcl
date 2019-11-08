set ns [ new Simulator ]
set tr [ open out.tr w ]
$ns trace-all $tr
set namtr [ open out.nam w ]
$ns namtrace-all $namtr
set n0 [ $ns node ]
set n1 [ $ns node ]
set n2 [ $ns node ]
set n3 [ $ns node ]
$ns duplex-link $n0 $n1 10Mb 5ms DropTail
$ns duplex-link $n1 $n2 10Mb 5ms DropTail
$ns duplex-link $n1 $n3 10Mb 5ms DropTail
$ns duplex-link-op $n0 $n1 orient right
$ns duplex-link-op $n1 $n2 orient right-up
$ns duplex-link-op $n1 $n3 orient right-down

set tcp0 [ new Agent/TCP ]
$ns attach-agent $n0 $tcp0
set null0 [ new Agent/TCPSink ]
$ns attach-agent $n3 $null0
$ns connect $tcp0 $null0
set ftp0 [ new Application/FTP ]
$ftp0 attach-agent $tcp0
$tcp0 set fid_ 1
$ns color 1 blue

set tcp1 [ new Agent/TCP ]
$ns attach-agent $n2 $tcp1
set null1 [ new Agent/TCPSink ]
$ns attach-agent $n3 $null1
$ns connect $tcp1 $null1
set ftp1 [ new Application/FTP ]
$ftp1 attach-agent $tcp1
$tcp1 set fid_ 2
$ns color 2 red

$ns at 1.0 "$ftp0 start"
$ns at 10.0 "$ftp0 end"
$ns at 10.0 "$ns halt"

$ns at 1.0 "$ftp1 start"
$ns at 10.0 "$ftp1 end"
$ns at 10.0 "$ns halt"

$ns run

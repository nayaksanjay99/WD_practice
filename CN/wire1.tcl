set ns [ new Simulator ]
set tr [ open out.tr w ]
#puts $tr "event time from to pkytype size flags SID:PORT DID:PORT SEQNO ACKNO" NotRequird ..phukat me ratta mat maarna sarthik
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
$ns duplex-link-op $n3 $n1 orient left-up

set udp0 [ new Agent/UDP ]
$ns attach-agent $n0 $udp0
set null0 [ new Agent/Null ]
$ns attach-agent $n3 $null0
$ns connect $udp0 $null0
set cbr0 [ new Application/Traffic/CBR ]
$cbr0 attach-agent $udp0
$udp0 set fid_ 1
$ns color 1 blue

set udp1 [ new Agent/UDP ]
$ns attach-agent $n2 $udp1
set null1 [ new Agent/Null ]
$ns attach-agent $n3 $null1
$ns connect $udp1 $null1
set cbr1 [ new Application/Traffic/CBR ]
$cbr1 attach-agent $udp1
$udp1 set fid_ 2
$ns color 2 red

$ns at 1.0 "$cbr0 start"
$ns at 10.0 "$cbr0 end"
$ns at 10.0 "$ns halt"

$ns at 1.0 "$cbr1 start"
$ns at 10.0 "$cbr1 end"
$ns at 10.0 "$ns halt"

$ns run

set ns [new Simulator]

set tr [open out.tr w]
$ns trace-all $tr

set namtr [open out.nam w]
$ns namtrace-all $namtr

for { set i 0 } { $i<12 } { incr i 1 } {
	set n($i) [$ns node]
}

for { set i 0 } { $i<8 } { incr i 1 } {
	$ns duplex-link $n($i) $n([expr $i+1]) 0.2Mb 200ms DropTail
}
$ns duplex-link $n(0) $n(8) 2Mb 200ms DropTail
$ns duplex-link $n(0) $n(9) 2Mb 200ms DropTail
$ns duplex-link $n(1) $n(10) 2Mb 200ms DropTail
$ns duplex-link $n(9) $n(11) 2Mb 200ms DropTail
$ns duplex-link $n(10) $n(11) 2Mb 200ms DropTail
$ns duplex-link $n(11) $n(5) 2Mb 200ms DropTail

$ns rtproto LS
$ns rtmodel-at 10.0 down $n(11) $n(5)
$ns rtmodel-at 15.0 down $n(7) $n(6)
$ns rtmodel-at 20.0 up $n(7) $n(6)
$ns rtmodel-at 30.0 up $n(11) $n(5)

set udp0 [new Agent/UDP]
$ns attach-agent $n(0) $udp0
set null0 [new Agent/Null]
$ns attach-agent $n(5) $null0
$ns connect $udp0 $null0
set cbr0 [new Application/Traffic/CBR]
$cbr0 attach-agent $udp0
$cbr0 set packetSize_ 500
$cbr0 set interval_ 0.005
$udp0 set fid_ 1
$ns color 1 red

set udp1 [new Agent/UDP]
$ns attach-agent $n(1) $udp1
set null1 [new Agent/Null]
$ns attach-agent $n(5) $null1
$ns connect $udp1 $null1
set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $udp1
$cbr1 set packetSize_ 500
$cbr1 set interval_ 0.005
$udp1 set fid_ 2
$ns color 2 blue

$ns at 1.0 "$cbr0 start"
$ns at 2.0 "$cbr1 start"
$ns at 40.0 "$cbr0 stop"
$ns at 40.0 "$cbr1 stop"
$ns at 40.0 "$ns halt"

$ns run

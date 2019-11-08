set ns [new Simulator]

set tr [open out.tr w]
$ns trace-all $tr

set namtr [open out.nam w]
$ns namtrace-all $namtr

set n0 [$ns node]
set n1 [$ns node]

$ns duplex-link $n0 $n1 0.2Mb 200ms DropTail
$ns duplex-link-op $n0 $n1 orient right
$ns queue-limit $n0 $n1 10

set tcp [new Agent/TCP]
$tcp set windowInit_ 1
$tcp set maxcwnd_ 1
$ns attach-agent $n0 $tcp

set sink [new Agent/TCPSink]
$ns attach-agent $n1 $sink

$ns connect $tcp $sink

set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns add-agent-trace $tcp tcp
$ns monitor-agent-trace $tcp
$tcp tracevar cwnd

$tcp set fid_ 1
$ns color 1 red

$ns at 0.0 "$n0 label Sender"
$ns at 0.0 "$n1 label Receiver"

$ns at 1.0 "$ftp start"
$ns at 10.0 "$ftp stop"
$ns at 10.0 "$ns halt"

$ns run

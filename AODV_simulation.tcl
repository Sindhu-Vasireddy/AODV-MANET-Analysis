## TCL FILE ##

Mac/802_11 set basicRate_ 2Mb              ;#Rate for Control Frames

#===================================
#     Simulation parameters setup
#===================================
set val(chan)   Channel/WirelessChannel    ;# channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy            ;# network interface type
set val(mac)    Mac/802_11                 ;# MAC type
set val(ifq)    Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)     LL                         ;# link layer type
set val(ant)    Antenna/OmniAntenna        ;# antenna model
set val(ifqlen) 20                         ;# max packet in ifq
set val(nn)     20                         ;# number of mobilenodes
set val(rp)     AODV                       ;# routing protocol
set val(x)      1000                       ;# X dimension of topography
set val(y)      1000                       ;# Y dimension of topography
set val(stop)   100.0                      ;# time of simulation end

set ns [new Simulator]

# define color index
$ns color 0 red
$ns color 1 blue
$ns color 2 chocolate
$ns color 3 red
$ns color 4 brown
$ns color 5 tan
$ns color 6 gold
$ns color 7 black


#Setup topography object
set topo       [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)

#Open the NS trace file
set tracefile [open 20.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open 20.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];#Create wireless channel

#===================================
#     Bluetooth node parameter setup
#===================================
$ns node-config -adhocRouting  $val(rp) \
                -llType        $val(ll) \
                -macType       $val(mac) \
                -ifqType       $val(ifq) \
                -ifqLen        $val(ifqlen) \
                -antType       $val(ant) \
                -propType      $val(prop) \
                -phyType       $val(netif) \
                -channel       $chan \
                -topoInstance  $topo \
                -agentTrace    ON \
                -routerTrace   ON \
                -macTrace      ON \
                -movementTrace ON


set n(0) [$ns node]
$n(0) set X_ 201
$n(0) set Y_ 202
$n(0) set Z_ 0.0
$ns initial_node_pos $n(0) 40
set n(1) [$ns node]
$n(1) set X_ 225
$n(1) set Y_ 372
$n(1) set Z_ 0.0
$ns initial_node_pos $n(1) 40
set n(2) [$ns node]
$n(2) set X_ 332
$n(2) set Y_ 199
$n(2) set Z_ 0.0
$ns initial_node_pos $n(2) 40
set n(3) [$ns node]
$n(3) set X_ 298
$n(3) set Y_ 71
$n(3) set Z_ 0.0
$ns initial_node_pos $n(3) 40
set n(4) [$ns node]
$n(4) set X_ 413
$n(4) set Y_ 479
$n(4) set Z_ 0.0
$ns initial_node_pos $n(4) 40
set n(5) [$ns node]
$n(5) set X_ 784
$n(5) set Y_ 434
$n(5) set Z_ 0.0
$ns initial_node_pos $n(5) 40
set n(6) [$ns node]
$n(6) set X_ 450
$n(6) set Y_ 288
$n(6) set Z_ 0.0
$ns initial_node_pos $n(6) 40
set n(7) [$ns node]
$n(7) set X_ 412
$n(7) set Y_ 53
$n(7) set Z_ 0.0
$ns initial_node_pos $n(7) 40
set n(8) [$ns node]
$n(8) set X_ 527
$n(8) set Y_ 299
$n(8) set Z_ 0.0
$ns initial_node_pos $n(8) 40
set n(9) [$ns node]
$n(9) set X_ 545
$n(9) set Y_ 100
$n(9) set Z_ 0.0
$ns initial_node_pos $n(9) 40
set n(10) [$ns node]
$n(10) set X_ 580
$n(10) set Y_ 483
$n(10) set Z_ 0.0
$ns initial_node_pos $n(10) 40
set n(11) [$ns node]
$n(11) set X_ 665
$n(11) set Y_ 250
$n(11) set Z_ 0.0
$ns initial_node_pos $n(11) 40
set n(12) [$ns node]
$n(12) set X_ 450
$n(12) set Y_ 288
$n(12) set Z_ 0.0
$ns initial_node_pos $n(12) 40
set n(13) [$ns node]
$n(13) set X_ 802
$n(13) set Y_ 57
$n(13) set Z_ 0.0
$ns initial_node_pos $n(13) 40
set n(14) [$ns node]
$n(14) set X_ 655
$n(14) set Y_ 46
$n(14) set Z_ 0.0
$ns initial_node_pos $n(14) 40
set n(15) [$ns node]
$n(15) set X_ 904
$n(15) set Y_ 308
$n(15) set Z_ 0.0
$ns initial_node_pos $n(15) 40
set n(16) [$ns node]
$n(16) set X_ 916
$n(16) set Y_ 110
$n(16) set Z_ 0.0
$ns initial_node_pos $n(16) 40
set n(17) [$ns node]
$n(17) set X_ 900
$n(17) set Y_ 503
$n(17) set Z_ 0.0
$ns initial_node_pos $n(17) 40
set n(18) [$ns node]
$n(18) set X_ 699
$n(18) set Y_ 595
$n(18) set Z_ 0.0
$ns initial_node_pos $n(18) 40
set n(19) [$ns node]
$n(19) set X_ 501
$n(19) set Y_ 607
$n(19) set Z_ 0.0
$ns initial_node_pos $n(19) 40

#### Setting The Labels For Nodes
$ns at 0.0 "$n(1) label source"
$ns at 0.1 "$n(5) label destination"      
$ns at 1 " $n(0) setdest 350 10 5 "
$ns at 1 " $n(4) setdest 450 200 5 "
$ns at 4 " $n(1) setdest 10 30 10 "
$ns at 20 " $n(2) setdest 150 50 7 "
$ns at 10 " $n(3) setdest 867 33 7 "
$ns at 10 " $n(7) setdest 45 40 15 "
$ns at 87 " $n(8) setdest 816 30 4 "
$ns at 107 " $n(8) setdest 100 30 4 "
$ns at 87 " $n(8) setdest 901 200 6 "
$ns at 300 " $n(5) setdest 826 30 9 "  
$ns at 40 " $n(9) setdest 150 150 7 "
$ns at 200 " $n(2) setdest 450 175 7 "
$ns at 260 " $n(3) setdest 950 60 7 "
$ns at 120 " $n(2) setdest 150 250 7 "
$ns at 20 " $n(1) setdest 999 250 7 "
$ns at 20 " $n(4) setdest 150  245 7 "
$ns at 87 " $n(2) setdest 924 112 6 "
$ns at 87 " $n(0) setdest 659 12 6 "
$ns at 87 " $n(1) setdest 109 020 6 "
$ns at 300 " $n(3) setdest 268 30 9 "  
$ns at 40 " $n(9) setdest 150 150 7 "
$ns at 200 " $n(4) setdest 450 75 7 "
$ns at 260 " $n(6) setdest 950 65 7 "
$ns at 120 " $n(1) setdest 120 250 7 "
$ns at 20 " $n(5) setdest 100 100 7 "
$ns at 20 " $n(6) setdest 150  135 7 "

   
#===================================
#        Agents Definition      
#===================================


set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n(1) $tcp
$ns attach-agent $n(5) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 0.1 "$ftp start"
$ns at 100.0 "$ftp stop"

# In ns TCP connection will be green
$tcp set fid_ 1

# To establish FTP application  tcp connection above
#set ftp [new Application/FTP]
#$ftp attach-agent $tcp
#$ftp set type_ FTP

# Establish a UDP connection
set udp [new Agent/UDP]
$ns attach-agent $n(1) $udp
set null [new Agent/Null]
$ns attach-agent $n(5) $null
$ns connect $udp $null

# Udp nam in connection red
$udp set fid_ 2

#===================================
#        Applications Definition      
#===================================
# CBR application created on top of UDP connections
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $udp
$cbr set type_ CBR
$cbr set packet_size_ 1000
$cbr set rate_ 1mb
$cbr set random_ false

set now 3.0
set time 3.0

$ns at [expr $now] "$ns trace-annotate \"Source broadcast route request packet to destination \""

$ns at [expr $now] "$ns trace-annotate \"Destination sends route reply to Source \""

#===================================
#        Termination     
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam 20.nam &
    exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "\$n($i) reset"
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run


## TCL FILE ##

set val(chan)   Channel/WirelessChannel    ;# channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy            ;# network interface type
set val(mac)    Mac/802_11                 ;# MAC type
set val(ifq)    Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)     LL                         ;# link layer type
set val(ant)    Antenna/OmniAntenna        ;# antenna model
set val(ifqlen) 50                         ;# max packet in ifq
set val(nn)     20                         ;# number of mobilenodes
set val(rp)     AODV                       ;# routing protocol
set val(rp)     AMRIS                      ;# Link repairing protocol
set val(x)      1500                       ;# X dimension of topography
set val(y)      1500                       ;# Y dimension of topography
set val(stop)   10.0                       ;# time of simulation end

set ns [new Simulator]

set topo       [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)

set tracefile [open out.tr w]
$ns trace-all $tracefile

set namfile [open out.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];#Create wireless channel

$ns node-config -llType        $val(ll) \
                -macType       $val(mac) \
                -ifqType       $val(ifq) \
                -ifqLen        $val(ifqlen) \
                -antType       $val(ant) \
                -propType      $val(prop) \
                -phyType       $val(netif) \
                -channel       $chan \
                -adhocRouting  AODV \
                -topoInstance  $topo \
                -agentTrace    ON \
                -routerTrace   ON \
                -macTrace      ON \
                -movementTrace ON

$ns color 0 darkgreen
$ns color 1 darkgreen
$ns color 2 red
$ns color 3 brown
$ns color 4 gray
$ns color 5 yellow
$ns color 6 blue
$ns color 7 skyblue

set node_(0) [$ns node]
$node_(0) set X_ 1155
$node_(0) set Y_ 794
$node_(0) set Z_ 0.0
$ns initial_node_pos $node_(0) 35
set node_(1) [$ns node]
$node_(1) set X_ 1022
$node_(1) set Y_ 674
$node_(1) set Z_ 0.0
$ns initial_node_pos $node_(1) 35
set node_(2) [$ns node]
$node_(2) set X_ 1275
$node_(2) set Y_ 794
$node_(2) set Z_ 0.0
$ns initial_node_pos $node_(2) 35
set node_(3) [$ns node]
$node_(3) set X_ 356
$node_(3) set Y_ 654
$node_(3) set Z_ 0.0
$ns initial_node_pos $node_(3) 35
set node_(4) [$ns node]
$node_(4) set X_ 428
$node_(4) set Y_ 617
$node_(4) set Z_ 0.0
$ns initial_node_pos $node_(4) 35
set node_(5) [$ns node]
$node_(5) set X_ 358
$node_(5) set Y_ 524
$node_(5) set Z_ 0.0
$ns initial_node_pos $node_(5) 35
set node_(6) [$ns node]
$node_(6) set X_ 192
$node_(6) set Y_ 524
$node_(6) set Z_ 0.0
$ns initial_node_pos $node_(6) 35
set node_(7) [$ns node]
$node_(7) set X_ 1023
$node_(7) set Y_ 557
$node_(7) set Z_ 0.0
$ns initial_node_pos $node_(7) 35
set node_(8) [$ns node]
$node_(8) set X_ 877
$node_(8) set Y_ 515
$node_(8) set Z_ 0.0
$ns initial_node_pos $node_(8) 35
set node_(9) [$ns node]
$node_(9) set X_ 511
$node_(9) set Y_ 524
$node_(9) set Z_ 0.0
$ns initial_node_pos $node_(9) 35
set node_(10) [$ns node]
$node_(10) set X_ 1126
$node_(10) set Y_ 723
$node_(10) set Z_ 0.0
$ns initial_node_pos $node_(10) 35
set node_(11) [$ns node]
$node_(11) set X_ 630
$node_(11) set Y_ 515
$node_(11) set Z_ 0.0
$ns initial_node_pos $node_(11) 35
set node_(12) [$ns node]
$node_(12) set X_ 294
$node_(12) set Y_ 689
$node_(12) set Z_ 0.0
$ns initial_node_pos $node_(12) 35
set node_(13) [$ns node]
$node_(13) set X_ 1023
$node_(13) set Y_ 794
$node_(13) set Z_ 0.0
$ns initial_node_pos $node_(13) 35
set node_(14) [$ns node]
$node_(14) set X_ 1100
$node_(14) set Y_ 649
$node_(14) set Z_ 0.0
$ns initial_node_pos $node_(14) 35
set node_(15) [$ns node]
$node_(15) set X_ 630
$node_(15) set Y_ 391
$node_(15) set Z_ 0.0
$ns initial_node_pos $node_(15) 35
set node_(16) [$ns node]
$node_(16) set X_ 756
$node_(16) set Y_ 402
$node_(16) set Z_ 0.0
$ns initial_node_pos $node_(16) 35
set node_(17) [$ns node]
$node_(17) set X_ 755
$node_(17) set Y_ 294
$node_(17) set Z_ 0.0
$ns initial_node_pos $node_(17) 35
set node_(18) [$ns node]
$node_(18) set X_ 877
$node_(18) set Y_ 294
$node_(18) set Z_ 0.0
$ns initial_node_pos $node_(18) 35
set node_(19) [$ns node]
$node_(19) set X_ 1155
$node_(19) set Y_ 557
$node_(19) set Z_ 0.0
$ns initial_node_pos $node_(19) 35

$ns at 0.0 "$ns trace-annotate \" NETWORK PROCESS STARTED.....\""

$ns at 1.0 "$ns trace-annotate \" DATA SEND FROM SOURCE TO DESTINATION .....\""
$ns at 3.4 "$ns trace-annotate \" DATA IS SENDING THROUGH LEGITIMATE NODES NO PROBLEM WILL BE OCCUR .....\""

$ns at 3.7 "$ns trace-annotate \" DATA SEND FROM SOURCE TO DESTINATION IN THAT PATH OCCUR .....\""
$ns at 4.1 "$ns trace-annotate \" IN THIS PATH ALL NODES ARE LEGITIMATE EXCEPT ONE THAT ACT AS MALICIOUS....\""
$ns at 4.5 "$ns trace-annotate \" MALICIOUS NODE OCCURING MEANS PATH LINK FAILURE AND DATA SEND THROUGH ANOTHER PATH \"" 
$ns at 4.6 "$ns trace-annotate \" HERE NODE ACT AS BLACKHOLE NODE MEANS PACKETS ARE DROPPING CONTINUOSLY THROUGH THAT NODE .....\""

$ns at 4.9 "$ns trace-annotate \" DATA IS CONTINUOSLY GOING FROM SOURCE TO DESTINATION.....\""

$ns at 5.0 "$ns trace-annotate \" EVERY NODE REPORT SEND TO CONTROLLER .....\""

$ns at 6.0 "$ns trace-annotate \" CONTROLLER IS SECURITY OF NETWORK.....\""
$ns at 6.2 "$ns trace-annotate \" THE BLACKHOLE NODES ARE MORE OCCUR IN NETWORK THEN DROPPING PACKETS RATIO INCREASES \""
$ns at 8.0 "$ns trace-annotate \" ATTACK ANALYZER IS AVAILABLE IN NETWORK AND CONNECT WITH CONTROLLER...\""
$ns at 9.5 "$ns trace-annotate \" BLACK HOLE NODES INCREASES IN NETWORK THEN THROUGHPUT PERFORMANCE DECREASES AS WELL AS DROPPING RATIO...\""


for {set i 12} {$i <= 12  } { incr i } {
for {set j 0} {$j < 16 } { incr j } {
set x1 244
set y1 403
set x2 367
set y2 520
set distance [expr "sqrt(($x2-$x1)*($x2-$x1)+($y2-$y1)*($y2-$y1))"]
}
}

for {set k 12} {$k <= 12  } { incr k } {
for {set l 12} {$l < 0 } { incr l } {
set x1 225
set y1 390
set x2 345
set y2 515
set distance1 [expr "sqrt(($x2-$x1)*($x2-$x1)+($y2-$y1)*($y2-$y1))"]
}
}

for {set m 12} {$m <= 12  } { incr m } {
for {set n 13} {$n < 15 } { incr n } {
set x1 220
set y1 380
set x2 350
set y2 500
set distance2 [expr "sqrt(($x2-$x1)*($x2-$x1)+($y2-$y1)*($y2-$y1))"]
}
}

set x 13
set z 33
set g 45
set h 26
$ns at 3.85 "$node_($x)  label hash_id=$z"


set x 15
set threshold1 80
set bw7 13
set trv1 [expr ($bw7*10)-$bw7]
 if { $trv1>$threshold1 } {
  $node_($x) color grey
  $ns at 2.5 "$node_($x)  color grey"
  $ns at 2.5 "$node_($x)  label LEGITIMATE_NODE"
}
 

set x 4
set threshold1 80
set bw4 13
set trv1 [expr ($bw4*10)-$bw4]
 if { $trv1>$threshold1 } {
  $node_($x) color grey
  $ns at 2.5 "$node_($x)  color grey"
  $ns at 2.5 "$node_($x)  label LEGITIMATE_NODE"
}

set x 3
set threshold1 80
set bw3 13
set trv1 [expr ($bw3*10)-$bw3]
 if { $trv1>$threshold1 } {
  $node_($x) color grey
  $ns at 2.5 "$node_($x)  color grey"
  $ns at 2.5 "$node_($x)  label LEGITIMATE_NODE"
}

set x 8
set threshold1 80
set bw8 13
set trv1 [expr ($bw8*5)-$bw8]
 if { $trv1<$threshold1 } {
  $node_($x) color grey
  $ns at 3.5 "$node_($x)  color grey"
  $ns at 3.5 "$node_($x)  label MALICIOUS_NODE"
}

set x 9
set threshold1 80
set bw9 13
set trv1 [expr ($bw9*4)-$bw9]
 if { $trv1<$threshold1 } {
  $node_($x) color grey
  $ns at 3.5 "$node_($x)  color grey"
  $ns at 3.5 "$node_($x)  label MALICIOUS_NODE"
}

set x 10
set threshold1 80
set bw10 9
set trv1 [expr ($bw10*9)-$bw10]
 if { $trv1<$threshold1 } {
  $node_($x) color grey
  $ns at 4.0 "$node_($x)  color grey"
  $ns at 4.0 "$node_($x)  label MALICIOUS_NODE"
}
 
set x 11
set threshold1 80
set bw11 10
set trv1 [expr ($bw11*8)-$bw11]
 if { $trv1<$threshold1 } {
  $node_($x) color grey
  $ns at 4.0 "$node_($x)  color grey"
  $ns at 4.0 "$node_($x)  label MALICIOUS_NODE"
}

#$ns at 3.5 "exec awk -f k.awk out.tr"

$node_(8) color blue
$ns at 0.2 "$node_(8) color blue"
$ns at 0.2 "$node_(8) add-mark . blue square"
$ns at 0.2 "$node_(8) label NW_CONTROLLER"

$ns at 1.0 "$node_(2)  label source"
$ns at 1.0 "$node_(17)  label destination"

$ns at 1.5 "$node_(6) label ATTACK_ANALYZER"
$ns at 1.5 "$node_(6) add-mark . grey square"

$ns at 0.5 "$node_(18) label NW_CONTROLLER"
$ns at 0.5 "$node_(18) add-mark . grey square"

$ns at 8.0 "$node_(8) label BLACKHOLE_NODE"
$ns at 8.0 "$node_(8) add-mark . grey square"

$ns at 8.0 "$node_(9) label BLACKHOLE_NODE"
$ns at 8.0 "$node_(9) add-mark . grey square"

$ns at 8.0 "$node_(10) label BLACKHOLE_NODE"
$ns at 8.0 "$node_(10) add-mark . grey square"

$ns at 8.0 "$node_(11) label BLACKHOLE_NODE"
$ns at 8.0 "$node_(11) add-mark . grey square"

proc node_verification {} {

        //** id selection******//
	if (addressalloc())
	{
	        msg*data=(msg*)pkt.data udp;
                sink = mobile_node_rep;
                proxy= node head;
                pub_key=i;
                pri_key=j;
                sign->offer iphexa(i,j);
                select proxy<-min_dis_tmsg*data;
                proxy_address alloc id ->sink;
                
                config_npv(rp)set $ns address alloc;

	}
	else
	{
		
                                              

                    if(config(rp))
                    {    
                        
			proxy->(msg*)pkt.data udp-> sink;
                        set $ns sign(i,msg*data)->proxy;
                        H=i*j/sign;
                        sink id= $ns H(sign);
                        proxy id=$ns H(sign);
                        
                    }
                    else
                    {
                         (msg*)pkt.data udp->sink;
                          config (addressalloc)     
                          
                     }
		
		
			//*** node authentication*********//

                        if(sink id=testpktgntr id)
                    {
                        set udp [$ns create-connection UDP $sink_() LossMonitor $sink_() 0].sink() "" "" "";
                    }
                        else
                       {
                            msg*data udp->testpktgntr_decrease_faults->network_controller($x)
                       }


			if(sink id=proxy id)
                    {    
                        
                        set udp [$ns create-connection UDP $sink_() LossMonitor $sink_() 0].sink() "" "" "";
                        
                         
                    }
                    
                        else
                        {
                               
                              msg*data udp->data*pkt udp->malicious_node($x)->network_controller($x)
                         }     
                          
                 
		
}
		
};

set udp6 [$ns create-connection UDP $node_(2) LossMonitor $node_(3) 0]
$udp6 set fid_ 1
$udp6 set class_ 1
set cbr5 [$udp6 attach-app Traffic/CBR]
$cbr5 set packetSize_ 512
$cbr5 set interval_ .05
$ns at 1.10 "$cbr5 start"
$ns at 1.35 "$cbr5 stop"

set udp7 [$ns create-connection UDP $node_(2) LossMonitor $node_(4) 0]
$udp7 set fid_ 1
$udp7 set class_ 1
set cbr6 [$udp7 attach-app Traffic/CBR]
$cbr6 set packetSize_ 512
$cbr6 set interval_ .05
$ns at 1.30 "$cbr6 start"
$ns at 1.60 "$cbr6 stop"


set udp8 [$ns create-connection UDP $node_(2) LossMonitor $node_(7) 0]
$udp8 set fid_ 1
$udp8 set class_ 1
set cbr7 [$udp8 attach-app Traffic/CBR]
$cbr7 set packetSize_ 512
$cbr7 set interval_ .05
$ns at 2.30 "$cbr7 start"
$ns at 2.65 "$cbr7 stop"


set udp9 [$ns create-connection UDP $node_(2) LossMonitor $node_(15) 0]
$udp9 set fid_ 1
$udp9 set class_ 1
set cbr8 [$udp9 attach-app Traffic/CBR]
$cbr8 set packetSize_ 512
$cbr8 set interval_ .05
$ns at 2.40 "$cbr8 start"
$ns at 2.90 "$cbr8 stop"

set udp10 [$ns create-connection UDP $node_(2) LossMonitor $node_(8) 0]
$udp10 set fid_ 1
$udp10 set class_ 1
set cbr9 [$udp10 attach-app Traffic/CBR]
$cbr9 set packetSize_ 512
$cbr9 set interval_ .05
$ns at 3.25 "$cbr9 start"
$ns at 3.60 "$cbr9 stop"

set udp11 [$ns create-connection UDP $node_(2) LossMonitor $node_(14) 0]
$udp11 set fid_ 1
$udp11 set class_ 1
set cbr10 [$udp11 attach-app Traffic/CBR]
$cbr10 set packetSize_ 512
$cbr10 set interval_ .05
$ns at 3.50 "$cbr10 start"
$ns at 3.95 "$cbr10 stop"

set udp11 [$ns create-connection UDP $node_(2) LossMonitor $node_(10) 0]
$udp11 set fid_ 1
$udp11 set class_ 1
set cbr10 [$udp11 attach-app Traffic/CBR]
$cbr10 set packetSize_ 512
$cbr10 set interval_ .05
$ns at 4.10 "$cbr10 start"
$ns at 4.45 "$cbr10 stop"

set udp11 [$ns create-connection UDP $node_(3) LossMonitor $node_(17) 0]
$udp11 set fid_ 1
$udp11 set class_ 1
set cbr10 [$udp11 attach-app Traffic/CBR]
$cbr10 set packetSize_ 512
$cbr10 set interval_ .05
$ns at 4.60 "$cbr10 start"
$ns at 4.95 "$cbr10 stop"


set udp11 [$ns create-connection UDP $node_(4) LossMonitor $node_(17) 0]
$udp11 set fid_ 1
$udp11 set class_ 1
set cbr10 [$udp11 attach-app Traffic/CBR]
$cbr10 set packetSize_ 512
$cbr10 set interval_ .05
$ns at 5.20 "$cbr10 start"
$ns at 5.55 "$cbr10 stop"


set udp11 [$ns create-connection UDP $node_(7) LossMonitor $node_(17) 0]
$udp11 set fid_ 1
$udp11 set class_ 1
set cbr10 [$udp11 attach-app Traffic/CBR]
$cbr10 set packetSize_ 512
$cbr10 set interval_ .05
$ns at 5.40 "$cbr10 start"
$ns at 5.85 "$cbr10 stop"

set udp11 [$ns create-connection UDP $node_(17) LossMonitor $node_(18) 0]
$udp11 set fid_ 1
$udp11 set class_ 1
set cbr10 [$udp11 attach-app Traffic/CBR]
$cbr10 set packetSize_ 512
$cbr10 set interval_ .05
$ns at 6.10 "$cbr10 start"
$ns at 6.45 "$cbr10 stop"

set udp11 [$ns create-connection UDP $node_(15) LossMonitor $node_(18) 0]
$udp11 set fid_ 1
$udp11 set class_ 1
set cbr10 [$udp11 attach-app Traffic/CBR]
$cbr10 set packetSize_ 512
$cbr10 set interval_ .05
$ns at 6.50 "$cbr10 start"
$ns at 6.85 "$cbr10 stop"


set udp11 [$ns create-connection UDP $node_(8) LossMonitor $node_(18) 0]
$udp11 set fid_ 1
$udp11 set class_ 1
set cbr10 [$udp11 attach-app Traffic/CBR]
$cbr10 set packetSize_ 512
$cbr10 set interval_ .05
$ns at 6.80 "$cbr10 start"
$ns at 7.25 "$cbr10 stop"


set udp11 [$ns create-connection UDP $node_(14) LossMonitor $node_(18) 0]
$udp11 set fid_ 1
$udp11 set class_ 1
set cbr10 [$udp11 attach-app Traffic/CBR]
$cbr10 set packetSize_ 512
$cbr10 set interval_ .05
$ns at 7.20 "$cbr10 start"
$ns at 7.45 "$cbr10 stop"

set udp11 [$ns create-connection UDP $node_(10) LossMonitor $node_(18) 0]
$udp11 set fid_ 1
$udp11 set class_ 1
set cbr10 [$udp11 attach-app Traffic/CBR]
$cbr10 set packetSize_ 512
$cbr10 set interval_ .05
$ns at 7.50 "$cbr10 start"
$ns at 7.80 "$cbr10 stop"

set udp11 [$ns create-connection UDP $node_(12) LossMonitor $node_(18) 0]
$udp11 set fid_ 1
$udp11 set class_ 1
set cbr10 [$udp11 attach-app Traffic/CBR]
$cbr10 set packetSize_ 512
$cbr10 set interval_ .05
$ns at 8.20 "$cbr10 start"
$ns at 8.60 "$cbr10 stop"

proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam out.nam &
    exec xgraph  PDR.tr -geometry 800x400 -t "PACKET DELIVERY RATIO" -x "Time" -y "%Of data packets delivered" -bg white &  
    exec xgraph  DROPPED.tr -geometry 800x400 -t "DROPPING RATIO" -x "Time" -y "dropping packets" -bg white &
    exec xgraph  THROUGHPUT.tr -geometry 800x400 -t "NETWORK PERFORMANCE" -x "Number of nodes" -y "throughput" -bg white &
    exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
     
    $ns at $val(stop) "\$node_($i) reset"
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run

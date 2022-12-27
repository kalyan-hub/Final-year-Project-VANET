# This script is created by NSG2 beta1
# <http://wushoupong.googlepages.com/nsg>

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
set val(ifqlen) 50                         ;# max packet in ifq
set val(nn)     17                         ;# number of mobilenodes
set val(rp)     AODV                       ;# routing protocol
set val(x)      904                      ;# X dimension of topography
set val(y)      878                      ;# Y dimension of topography
set val(stop)   25.0                         ;# time of simulation end

#===================================
#        Initialization        
#===================================
#Create a ns simulator
set ns [new Simulator]

#Setup topography object
set topo       [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)

#Open the NS trace file
set tracefile [open AODV.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open AODV.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
$ns use-newtrace
set chan [new $val(chan)];#Create wireless channel

#===================================
#     Mobile node parameter setup
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

#===================================
#        Nodes Definition        
#===================================
#Create 17 nodes
set n0 [$ns node]
$n0 set X_ 150
$n0 set Y_ 766
$n0 set Z_ 0.0
$ns initial_node_pos $n0 70
set n1 [$ns node]
$n1 set X_ 282
$n1 set Y_ 653
$n1 set Z_ 0.0
$ns initial_node_pos $n1 70
set n2 [$ns node]
$n2 set X_ 145
$n2 set Y_ 638
$n2 set Z_ 0.0
$ns initial_node_pos $n2 70
set n3 [$ns node]
$n3 set X_ 211
$n3 set Y_ 493
$n3 set Z_ 0.0
$ns initial_node_pos $n3 70
set n4 [$ns node]
$n4 set X_ 414
$n4 set Y_ 502
$n4 set Z_ 0.0
$ns initial_node_pos $n4 70
set n5 [$ns node]
$n5 set X_ 465
$n5 set Y_ 639
$n5 set Z_ 0.0
$ns initial_node_pos $n5 70
set n6 [$ns node]
$n6 set X_ 301
$n6 set Y_ 778
$n6 set Z_ 0.0
$ns initial_node_pos $n6 70
set n7 [$ns node]
$n7 set X_ 488
$n7 set Y_ 764
$n7 set Z_ 0.0
$ns initial_node_pos $n7 70
set n8 [$ns node]
$n8 set X_ 641
$n8 set Y_ 758
$n8 set Z_ 0.0
$ns initial_node_pos $n8 70
set n9 [$ns node]
$n9 set X_ 616
$n9 set Y_ 637
$n9 set Z_ 0.0
$ns initial_node_pos $n9 70
set n10 [$ns node]
$n10 set X_ 740
$n10 set Y_ 652
$n10 set Z_ 0.0
$ns initial_node_pos $n10 70
set n11 [$ns node]
$n11 set X_ 558
$n11 set Y_ 475
$n11 set Z_ 0.0
$ns initial_node_pos $n11 70
set n12 [$ns node]
$n12 set X_ 683
$n12 set Y_ 531
$n12 set Z_ 0.0
$ns initial_node_pos $n12 70
set n13 [$ns node]
$n13 set X_ 804
$n13 set Y_ 498
$n13 set Z_ 0.0
$ns initial_node_pos $n13 70
set n14 [$ns node]
$n14 set X_ 346
$n14 set Y_ 352
$n14 set Z_ 0.0
$ns initial_node_pos $n14 70
set n15 [$ns node]
$n15 set X_ 572
$n15 set Y_ 346
$n15 set Z_ 0.0
$ns initial_node_pos $n15 70
set n16 [$ns node]
$n16 set X_ 720
$n16 set Y_ 355
$n16 set Z_ 0.0
$ns initial_node_pos $n16 70

#===================================
#        Generate movement          
#===================================
$ns at 1.0` " $n1 setdest 500 300 20 " 
$ns at 2.0` " $n2 setdest 600 500 30 " 
$ns at 4.0 " $n3 setdest 463 287 30 " 
$ns at 8.0 " $n4 setdest 695 620 25 " 
$ns at 2.0` "$n5 setdest 400 500 20 " 
$ns at 10.0` "$n6 setdest 600 700 30 " 
$ns at 3.0 " $n7 setdest 363 487 30 " 
$ns at 8.0 " $n8 setdest 695 220 25 "
$ns at 10.0 " $n0 setdest 395 420 25 " 
$ns at 11.0 " $n9 setdest 295 220 25 " 
$ns at 18.0 " $n10 setdest 895 120 25 " 
$ns at 20.0 " $n11 setdest 195 230 25 " 


$n0 color green
$ns at 0.0 "$n0 color green"

$n1 color green
$ns at 0.0 "$n1 color green"

$n2 color green
$ns at 0.0 "$n2 color green"

$n3 color green
$ns at 0.0 "$n3 color green"

$n4 color green
$ns at 0.0 "$n4 color green"

$n5 color green
$ns at 0.0 "$n5 color green"

$n6 color green
$ns at 0.0 "$n6 color green"

$n7 color green
$ns at 0.0 "$n7 color green"

$n8 color green
$ns at 0.0 "$n8 color green"

$n9 color green
$ns at 0.0 "$n9 color green"

$n10 color green
$ns at 0.0 "$n10 color green"

$n11 color green
$ns at 0.0 "$n11 color green"

$n12 color green
$ns at 0.0 "$n12 color green"

$n13 color green
$ns at 0.0 "$n13 color green"

$n14 color green
$ns at 0.0 "$n14 color green"

$n15 color green
$ns at 0.0 "$n15 color green"

$n16 color green
$ns at 0.0 "$n16 color green"

#===================================
#        Agents Definition        
#===================================
#Setup a TCP connection
set tcp0 [new Agent/TCP]
$ns attach-agent $n3 $tcp0
set sink2 [new Agent/TCPSink]
$ns attach-agent $n8 $sink2
$ns connect $tcp0 $sink2
$tcp0 set packetSize_ 1500

#Setup a TCP connection
set tcp1 [new Agent/TCP]
$ns attach-agent $n14 $tcp1
set sink3 [new Agent/TCPSink]
$ns attach-agent $n10 $sink3
$ns connect $tcp1 $sink3
$tcp1 set packetSize_ 1500


#===================================
#        Applications Definition        
#===================================
#Setup a FTP Application over TCP connection
set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0
$ns at 1.0 "$ftp0 start"
$ns at 15.0 "$ftp0 stop"

#Setup a FTP Application over TCP connection
set ftp1 [new Application/FTP]
$ftp1 attach-agent $tcp1
$ns at 2.0 "$ftp1 start"
$ns at 20.0 "$ftp1 stop"


#===================================
#        Termination        
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam AODV.nam &
    exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "\$n$i reset"
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run

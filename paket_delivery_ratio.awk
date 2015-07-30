
## AWK file for Packet Delivery Ratio ##

BEGIN {   
  maxpac_id=0;

  recevepkt = 0;
   
  sendspkt = 0;
   
  routingpkts = 0;
   
  receivespkt = 0;
   
  sum = 0;


}


{
   
  evento = $1;
   
  tempo = $3;
   
  pac_id = $41;
   
  agt = $4;
   
  tcbr = $35;

   
  token19 = $4;
   
  token1 = $1;
   
  token35 = $35;

  

  if ( token1 == "s" && token19=="AGT")
	
     sendspkt++;

   

  if ( (token1 == "s" || token1 == "f") && token19=="RTR")
	
     rountingpkts++;

   

  if ( token1 == "r" && token19=="AGT")
	
     receivespkt++;

   

  if ( evento == "r" && agt=="AGT")
	
     recevepkt++;

   

  if ( pac_id > maxpac_id ) maxpac_id = pac_id;
   
  if ( ! ( pac_id in tempIn ) ) tempIn[pac_id] = tempo;
   
  if ( evento != "d" ) {
        
          if ( evento == "r" )  tempoFim[pac_id] = tempo;
   
     } else tempoFim[pac_id] = 0;


}

END {

  
  
   for ( pac_id = 0; pac_id <= maxpac_id + 1; pac_id++ ) {
     
        duracao =  tempoFim[pac_id] - tempIn[pac_id];
      
       if ( duracao > 0 ) {
         
         
          sum = sum + duracao;
     
       }
 
   }

  
 printf("Packets Sent = %d pkts\n", sendspkt);
  
 printf("Packets Received = %d pkts\n", receivespkt);
  
 printf("Packet Delivery Ratio = %f \n", recevepkt/sendspkt*100);
  
 printf("Network Overhead = %d pkts\n", rountingpkts);
 
 exit 0

}

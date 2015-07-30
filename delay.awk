## AWK file for end to end delay. ## 




BEGIN{
	
    seqno = -1;
    count = 0;
 
}


{

    if($4 == "AGT" && $1 == "s" && seqno < $6){
	
       seqno=$6;

    }
  
 
    if($4 == "AGT" && $1 == "s") {
	
            start_time[$6] = $2;

    } else if(($7 == "tcp") && ($1 == "r")) {
	
            end_time[$6] = $2;

    } else if(($1 == "D") && ($7 == "tcp")) {
	
            end_time[$6] = -1;

    }  


}


END { 

      for(i=0; i<= seqno; i++) {
 
        if(end_time[i] > 0){

          delay[i]= end_time[i] - start_time[i];

          count++;

        }

        else
{

          delay[i]= -1;

            }

      }

  
      for(i=0; i <= seqno; i++) {
        
if(delay[i] >0) {

           n_to_n_delay = n_to_n_delay + delay[i];

        }
   
   }

   
   n_to_n_delay = n_to_n_delay/count;


   print "Average end to end delay = " n_to_n_delay * 1000 "msec";

   
}


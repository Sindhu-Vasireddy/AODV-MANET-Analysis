## AWK file for throughput ##

BEGIN {

  recvsize=0;

  txsize=0;

  drpsize=0;

  stopTime=0;

  startTime=400;

  throughput=0;

}
 
{
 
  if($4=="AGT" && $1=="s")
     
    {
       if($2<startTime)
           
          {startTime=$2;}
     
    txsize++;
    
    }
 
  

  if($4=="AGT" && $1=="r")
    
    {
        
       if($2>stopTime)
         
          {stopTime=$2;}
      
    recvsize++;
     
    } 
          

   if($4=="AGT" && $1=="d")
     
    {
      
       drpsize++;

    }
     

}


END {


print("throughput = ",recvsize/(stopTime-startTime),"Kbps");
 

}






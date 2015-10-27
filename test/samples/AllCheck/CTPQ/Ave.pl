#!/usr/local/bin/perl
  $Sample =5;
  printf("$Sample \n");
  
  for($rand_i=0;$rand_i<$Sample;$rand_i++){
#===============def input====================
    $cnt =0;
    $file=sprintf("SS_rand%d.dat",$rand_i);
    open(INPUTFILE,$file);
    while($name=<INPUTFILE>){
      chomp $name;
      #DELETE EMPTY
      $_=$name; 
      s/^\s+//;
      $name=$_; 
      #DELETE EMPTY FINISH
      @foo = split /\s+/, $name;
      #printf "$cnt $foo[0] $foo[1] $foo[2] $foo[3] $foo[4] $foo[5] $foo[6] $foo[7] \n";
      if($cnt>0){
        for($i=0;$i<5;$i++){
          $phys[$rand_i][$cnt][$i]=$foo[$i];
        }
      }
      $cnt+=1;
    }
    close(INPUTFILE);
#================Sq=================
  }
  $fname=sprintf("Ave_SS.dat");
  open(FILE,">$fname");
  $cnt_max=$cnt;
  for($cnt=1;$cnt< $cnt_max;$cnt++){
    $Ave_temp  = 0.0; 
    $Ave_ene   = 0.0; 
    $Ave_var   = 0.0; 
    $Ave_dbl   = 0.0; 
    $Ave_C     = 0.0; 
    #$Ave_S     = 0.0; 

    $DAve_temp = 0.0; 
    $DAve_ene  = 0.0; 
    $DAve_var  = 0.0; 
    $DAve_dbl  = 0.0; 
    $DAve_C    = 0.0; 
    #$DAve_S    = 0.0; 
    for($rand_i=0;$rand_i<$Sample;$rand_i++){
       $DAve_temp    +=  (1.0/$phys[$rand_i][$cnt][0])**2; 
       $DAve_ene     +=  ($phys[$rand_i][$cnt][1])**2; 
       $DAve_var     +=  ($phys[$rand_i][$cnt][2])**2; 
       $DAve_dbl     +=  ($phys[$rand_i][$cnt][3])**2; 
       $Ave_temp     +=  1.0/$phys[$rand_i][$cnt][0]; 
       $Ave_ene      +=  $phys[$rand_i][$cnt][1]; 
       $Ave_var      +=  $phys[$rand_i][$cnt][2]; 
       $Ave_dbl      +=  $phys[$rand_i][$cnt][3]; 
       $tmp_C         =  (($phys[$rand_i][$cnt][2]-$phys[$rand_i][$cnt][1]**2)*$phys[$rand_i][$cnt][0]*$phys[$rand_i][$cnt][0]); 
       $Ave_C        +=  $tmp_C;
       $DAve_C       +=  $tmp_C**2;
       #$Ave_S        +=  $tmp_S;
       #$DAve_S       +=  $tmp_S**2;
    }
    $Ave_temp = $Ave_temp/(1.0*$Sample);
    $Ave_ene  = $Ave_ene/(1.0*$Sample);
    $Ave_var  = $Ave_var/(1.0*$Sample);
    $Ave_dbl  = $Ave_dbl/(1.0*$Sample);
    $Ave_C    = $Ave_C/(1.0*$Sample);
    #$Ave_S    = $Ave_S/(1.0*$Sample);
    $Err_temp  = sqrt(abs($DAve_temp/(1.0*($Sample-1.0))-$Sample/($Sample-1.0)*$Ave_temp**2));
    $Err_ene  =  sqrt($DAve_ene/(1.0*($Sample-1.0))-$Sample/($Sample-1.0)*$Ave_ene**2);
    $Err_var = sqrt($DAve_var/(1.0*($Sample-1.0))-$Sample/($Sample-1.0)*$Ave_var**2);
    $Err_dbl  =  sqrt($DAve_dbl/(1.0*($Sample-1.0))-$Sample/($Sample-1.0)*$Ave_dbl**2);
    $Err_C   =  sqrt(abs($DAve_C/(1.0*($Sample-1.0))-$Sample/($Sample-1.0)*$Ave_C**2));
    #$Err_S   =  sqrt(abs($DAve_S/(1.0*($Sample-1.0))-$Sample/($Sample-1.0)*$Ave_S**2));
    #printf FILE "$Ave_temp $Err_temp $Ave_ene $Err_ene $Ave_var $Err_var $Ave_dbl $Err_dbl $Ave_C $Err_C $Ave_S $Err_S $cnt\n";
    printf FILE "$Ave_temp $Err_temp $Ave_ene $Err_ene $Ave_var $Err_var $Ave_dbl $Err_dbl $Ave_C $Err_C $cnt\n";
  } 
  close(FILE);

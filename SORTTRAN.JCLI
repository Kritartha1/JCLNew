//* *******************************************************************         
//* Filter the transactions for a the parm date and sort by card num            
//* *******************************************************************         
//STEP05R  EXEC PGM=SORT                                                        
//SORTIN   DD DISP=SHR,                                                         
//         DSN=AWS.M2.CARDDEMO.TRANSACT.BKUP(+1)                                
//SYMNAMES DD *                                                                 
TRAN-CARD-NUM,263,16,ZD                                                         
TRAN-PROC-DT,305,10,CH                                                          
PARM-START-DATE,C'2022-01-01'                                      //Date       
PARM-END-DATE,C'2022-07-06'                                        //Date       
//SYSIN    DD *                                                                 
 SORT FIELDS=(TRAN-CARD-NUM,A)                                                  
 INCLUDE COND=(TRAN-PROC-DT,GE,PARM-START-DATE,AND,                             
         TRAN-PROC-DT,LE,PARM-END-DATE)                                         
/*                                                                              
//SYSOUT   DD SYSOUT=*                                                          
//SORTOUT  DD DISP=(NEW,CATLG,DELETE),                                          
//         UNIT=SYSDA,                                                          
//         DCB=(*.SORTIN),                                                      
//         SPACE=(CYL,(1,1),RLSE),                                              
//         DSN=AWS.M2.CARDDEMO.TRANSACT.DALY(+1)        

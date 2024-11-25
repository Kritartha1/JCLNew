//BANKJOB  JOB (ACCT),'BANKING JOB',CLASS=A,MSGCLASS=A,MSGLEVEL=(1,1) 
//STEP1    EXEC TRANSFER,FROMACCT=12345,TOACCT=67890,AMOUNT=100.00 
/* 
//TRANSFER PROC 
//* 
//* Step to Check Balance using instream procedure 
//CHKBLNCE EXEC CHKBALPR,PARM='FROMACCT=&FROMACCT' 
/* 
//* Condition Code Check for Sufficient Balance 
//IFCHK    IF (CHKBLNCE.RC = 0) THEN 
//* 
//* Step to Deduct Amount from From Account 
//DEDUCT   EXEC PGM=DEDUCT,PARM='FROMACCT=&FROMACCT,AMOUNT=&AMOUNT' 
//STEPLIB  DD DSN=YOUR.LIB,DISP=SHR 
//* 
//* Step to Add Amount to To Account 
//ADD      EXEC PGM=ADD,PARM='TOACCT=&TOACCT,AMOUNT=&AMOUNT' 
//STEPLIB  DD DSN=YOUR.LIB,DISP=SHR 
//* 
//ENDIF 
//* 
//         PEND 
//* End of Procedure 
/* 
//CHKBALPR PROC 
//* 
//* Step to Check Balance 
//CHKBLNCE EXEC PGM=CHKBLNCE,PARM='FROMACCT=&FROMACCT' 
//STEPLIB  DD DSN=YOUR.LIB,DISP=SHR 
//* 
//         PEND 
//* End of Procedure 
/* 

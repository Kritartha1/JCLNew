//TRANSFER PROC FROMACCT=,TOACCT=,AMOUNT=
//*
//* Step to Check Balance using a separate cataloged procedure
//JCLLIB ORDER=YOUR.PROCLIB
//CHKBLNCE EXEC CHKBALPR,PARM='FROMACCT=&FROMACCT'
//*
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
//* End of Procedure

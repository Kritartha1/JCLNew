//DAILYJOB JOB (ACCT#),'Daily Transaction Processing', 
//             CLASS=A,MSGCLASS=X,NOTIFY=&SYSUID 
//SET LASTQUAL=D100724 
//*------------------------------------------------------------- 
//* 1. DELETE THE NEWLY CREATED DATASETS 
//*------------------------------------------------------------- 
//DELSTEP  EXEC PGM=IEFBR14 
//DELENRL  DD  DSN=YOUR.ENROLL.DATA.&LASTQUAL,DISP=(MOD,DELETE,DELETE) 
//DELCLMS  DD  DSN=YOUR.CLAIMS.DATA.&LASTQUAL,DISP=(MOD,DELETE,DELETE)   
//*------------------------------------------------------------- 
//* 2. SPLIT THE TRANSACTION DATA INTO ENROLL DATA AND CLAIMS DATA 
//*------------------------------------------------------------- 
//SPLITSTP EXEC PGM=SORT,COND=(0,NE)  
//SYSOUT   DD  SYSOUT=* 
//SORTIN   DD  DSN=YOUR.DAILY.TRAN.FILE,DISP=SHR 
//SORTOF01 DD  DSN=YOUR.ENROLL.DATA.&LASTQUAL, 
//             DISP=(NEW,CATLG,DELETE), 
//             SPACE=(CYL,(1,1),RLSE), 
//             DCB=(RECFM=FB,LRECL=80,BLKSIZE=800) 
//SORTOF02 DD  DSN=YOUR.CLAIMS.DATA.&LASTQUAL, 
//             DISP=(NEW,CATLG,DELETE), 
//             SPACE=(CYL,(1,1),RLSE), 
//             DCB=(RECFM=FB,LRECL=80,BLKSIZE=800) 
//SYSIN    DD  DSN=YOUR.CNTRL.DATA(SPLITDATA), DISP=SHR
//*------------------------------------------------------------- 
//* 3. PROCESS ENROLL DATA USING COBOL PROGRAM 
//*------------------------------------------------------------- 
//JCLLIB ORDER=YOUR.PROCLIB 
//ENRLPROC EXEC ENROLLPR,COND=(0,NE)
//*------------------------------------------------------------- 
//* 4. PROCESS CLAIMS DATA BY CROSS CHECK WITH XREF DATA 
//*------------------------------------------------------------- 
//JCLLIB ORDER=YOUR.PROCLIB 
//CLMPROC  INCLUDE MEMBER=CLMPROC 
//*------------------------------------------------------------- 
//* 5. CONCATENATE PROCESSED DATA FROM STEP 3 AND STEP 4 
//*------------------------------------------------------------- 
//CONCAT   EXEC PGM=IEBGENER,COND=(0,NE) 
//SYSPRINT DD  SYSOUT=* 
//SYSIN    DD  DUMMY 
//SYSUT1   DD  DSN=YOUR.ENROLL.PROC.D&LASTQUAL,DISP=SHR 
//         DD  DSN=YOUR.CLAIM.PROC.D&LASTQUAL,DISP=SHR 
//SYSUT2   DD  DSN=YOUR.FINAL.PROC.DATA, 
//             DISP=(MOD,CATLG,DELETE) 
//*------------------------------------------------------------- 
//* 6. CHECK RETURN CODE AND TRIGGER MAIL IF RC > 0 
//*------------------------------------------------------------- 
//IFSTEP   IF (RC > 0) THEN 
//MAILSTEP EXEC PGM=SMTP 
//MAIL     DD * 
HELO your.smtp.server.com 
MAIL FROM:< sender@example.com> 
RCPT TO:< recipient@example.com> 
DATA 
Subject: Processing failed with RC > 0 

The job DAILYJOB has failed with a return code greater than Zero. 
. 
QUIT 
//SYSOUT   DD SYSOUT=* 
//ENDIF 
//
*************************************************************************************
*************************************************************************************

//JOBNAME  JOB (ACCT),'YOUR NAME',CLASS=A,MSGCLASS=X,NOTIFY=&SYSUID
//JCLLIB   ORDER=YOUR.PDS.LIBRARY
//STEP1    EXEC PGM=IEBGENER
//INCLUDE MEMBER=COMMON
//SYSUT1   DD  DSN=INPUT.DATASET1,DISP=SHR
//SYSUT2   DD  DSN=OUTPUT.DATASET1,DISP=(NEW,CATLG,DELETE),
//             UNIT=SYSDA,SPACE=(CYL,(1,1)),DCB=(RECFM=FB,LRECL=80)
//SYSIN    DD  DUMMY
//*
//STEP2    EXEC PGM=SORT
//INCLUDE MEMBER=COMMON
//SORTIN   DD  DSN=INPUT.DATASET2,DISP=SHR
//SORTOUT  DD  DSN=OUTPUT.SORTED.DATASET,DISP=(NEW,CATLG,DELETE),
//             UNIT=SYSDA,SPACE=(CYL,(1,1)),DCB=(RECFM=FB,LRECL=80)
//SYSIN    DD  *
  SORT FIELDS=(1,10,CH,A)
/*

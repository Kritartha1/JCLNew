//DSNUPROC PROC
//STEP1 EXEC PGM=DSNUTILB,REGION=0M,PARM='DEFAULT'
//STEPLIB DD DSN=DSNEXIT,DISP=SHR
//        DD DSN=DSNLOAD,DISP=SHR
//SYSPRINT DD SYSOUT=*
//SYSUDUMP DD SYSOUT=*
//UTPRINT DD SYSOUT=*
//DSNTRACE DD SYSOUT=*
//SORTLIB DD DUMMY
//SORTWK01 DD DUMMY
//SORTWK02 DD DUMMY
//SORTWK03 DD DUMMY
//SORTWK04 DD DUMMY
//SORTOUT DD DUMMY
//SYSREC00 DD DUMMY
//SYSUT1 DD DUMMY
//SYSIN DD DUMMY

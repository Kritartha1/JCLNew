//*------------------------------------------------------------- 
//* CLMPROC PROCEDURE DEFINITION 
//*------------------------------------------------------------- 
//STEP1    EXEC PGM=CLAIMSP2,PARM='TN'COND=(0,NE),
//STEPLIB  DD  DSN=YOUR.COBOL.LOADLIB,DISP=SHR 
//CLMSIN   DD  DSN=YOUR.CLAIMS.DATA.D&LASTQUAL,DISP=SHR 
//XREFIN   DD  DSN=YOUR.XREF.DATA,DISP=SHR 
//CLMPROC  DD  DSN=YOUR.CLAIM.PROC.D&LASTQUAL, 
//             DISP=(NEW,CATLG,DELETE), 
//             SPACE=(CYL,(1,1),RLSE), 
//             DCB=(RECFM=FB,LRECL=80,BLKSIZE=800) 
//CLMUNPRC DD  DSN=YOUR.CLAIM.UNPRC.D&LASTQUAL, 
//             DISP=(NEW,CATLG,DELETE), 
//             SPACE=(CYL,(1,1),RLSE), 
//             DCB=(RECFM=FB,LRECL=80,BLKSIZE=800) 

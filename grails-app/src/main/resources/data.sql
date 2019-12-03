INSERT INTO SEMESTER (ID, VERSION, SEMESTER_TYP, JAHR) VALUES (0,0,'PRE',0);
INSERT INTO SEMESTER (ID, VERSION, SEMESTER_TYP, JAHR) VALUES (1,0,'HS',16);
INSERT INTO SEMESTER (ID, VERSION, SEMESTER_TYP, JAHR) VALUES (2,0,'FS',17);
INSERT INTO SEMESTER (ID, VERSION, SEMESTER_TYP, JAHR) VALUES (3,0,'HS',17);
INSERT INTO SEMESTER (ID, VERSION, SEMESTER_TYP, JAHR) VALUES (4,0,'FS',18);
INSERT INTO SEMESTER (ID, VERSION, SEMESTER_TYP, JAHR) VALUES (5,0,'HS',18);
INSERT INTO SEMESTER (ID, VERSION, SEMESTER_TYP, JAHR) VALUES (6,0,'FS',19);
INSERT INTO SEMESTER (ID, VERSION, SEMESTER_TYP, JAHR) VALUES (7,0,'HS',19);
INSERT INTO SEMESTER (ID, VERSION, SEMESTER_TYP, JAHR) VALUES (8,0,'FS',20);

INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (1,'syspr',3,0,true,false,false,false,0);
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (2,'Praxisimersion 1',3,0,true,false,false,false,0);
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (3,'Praxisimersion 2',3,0,true,false,false,false,0);
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (4,'chp',3,0,true,false,false,false,0);
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (5,'eipr',3,0,true,false,false,false,0);
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (6,'oopI1',3,0,true,false,false,false,0);
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (7,'IP1',6,0,true,false,false,false,0);
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (8,'IP2',6,0,true,false,false,false,0);
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (9,'Anrechnung BFH',2,0,true,false,false,false,0);
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (10,'mgli',3,1,false,true,false,false,0);	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (10,0,3.8,10); UPDATE MODUL SET MSP_ID = 10 where ID = 10;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (101,0,4.6,10); UPDATE MODUL SET MSP_ID = 10 where ID = 101;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (102,0,4.1,10); UPDATE MODUL SET MSP_ID = 10 where ID = 102;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (11,'sysad',3,1,false,false,false,false,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (111,0,4.9,11); UPDATE MODUL SET MSP_ID = 11 where ID = 111;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (112,0,5.75,11); UPDATE MODUL SET MSP_ID = 11 where ID = 112;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (12,'algd1',3,1,false,true,false,false,0);	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (12,0,3,12); UPDATE MODUL SET MSP_ID = 12 where ID = 12;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (121,0,2.9,12); UPDATE MODUL SET MSP_ID = 12 where ID = 121;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (122,0,3.6,12); UPDATE MODUL SET MSP_ID = 12 where ID = 122;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (13,'swc',3,1,false,true,false,false,0);	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (13,0,4.9,13); UPDATE MODUL SET MSP_ID = 13 where ID = 13;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (131,0,4.1,13); UPDATE MODUL SET MSP_ID = 13 where ID = 131;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (132,0,5.1,13); UPDATE MODUL SET MSP_ID = 13 where ID = 132;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (14,'e4',2,1,false,false,false,false,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (141,0,4.5,14); UPDATE MODUL SET MSP_ID = 14 where ID = 141;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (142,0,4.1,14); UPDATE MODUL SET MSP_ID = 14 where ID = 142;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (15,'bsys',3,2,false,false,false,false,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (151,0,5.4,15); UPDATE MODUL SET MSP_ID = 15 where ID = 151;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (152,0,4.8,15); UPDATE MODUL SET MSP_ID = 15 where ID = 152;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (16,'uuid',3,2,false,false,false,false,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (161,0,5.8,16); UPDATE MODUL SET MSP_ID = 16 where ID = 161;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (162,0,6,16); UPDATE MODUL SET MSP_ID = 16 where ID = 162;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (17,'oopI2',3,2,false,true,false,false,0);	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (17,0,5.5,17); UPDATE MODUL SET MSP_ID = 17 where ID = 17;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (171,0,6,17); UPDATE MODUL SET MSP_ID = 17 where ID = 171;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (18,'ekn2',2,2,false,false,false,false,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (181,0,4.79,18); UPDATE MODUL SET MSP_ID = 18 where ID = 181;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (182,0,3.8,18); UPDATE MODUL SET MSP_ID = 18 where ID = 182;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (19,'sprx',2,2,false,false,true,true,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (191,0,5.8,19); UPDATE MODUL SET MSP_ID = 19 where ID = 191;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (20,'edbs',3,2,false,false,false,false,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (201,0,4.3,20); UPDATE MODUL SET MSP_ID = 20 where ID = 201;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (202,0,3.7,20); UPDATE MODUL SET MSP_ID = 20 where ID = 202;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (21,'IP3',6,3,false,false,false,false,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (211,0,5.5,21); UPDATE MODUL SET MSP_ID = 21 where ID = 211;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (22,'IP4',6,3,false,false,false,false,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (221,0,5.4,22); UPDATE MODUL SET MSP_ID = 22 where ID = 221;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (23,'mada',3,3,false,true,false,false,0);	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (23,0,2.5,23); UPDATE MODUL SET MSP_ID = 23 where ID = 23;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (231,0,5,23); UPDATE MODUL SET MSP_ID = 23 where ID = 231;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (24,'eana',3,3,false,true,false,false,0);	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (24,0,3.8,24); UPDATE MODUL SET MSP_ID = 24 where ID = 24;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (241,0,3.9,24); UPDATE MODUL SET MSP_ID = 24 where ID = 241;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (242,0,4.1,24); UPDATE MODUL SET MSP_ID = 24 where ID = 242;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (25,'req',3,3,false,false,false,false,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (251,0,6,25); UPDATE MODUL SET MSP_ID = 25 where ID = 251;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (252,0,5.2,25); UPDATE MODUL SET MSP_ID = 25 where ID = 252;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (26,'ekn',2,3,false,false,false,false,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (261,0,4.44,26); UPDATE MODUL SET MSP_ID = 26 where ID = 261;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (262,0,4.66,26); UPDATE MODUL SET MSP_ID = 26 where ID = 262;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (27,'argh',2,3,false,false,true,true,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (271,0,5.6,27); UPDATE MODUL SET MSP_ID = 27 where ID = 271;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (28,'lag',3,3,false,true,false,false,0);	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (28,0,3.7,28); UPDATE MODUL SET MSP_ID = 28 where ID = 28;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (281,0,3.9,28); UPDATE MODUL SET MSP_ID = 28 where ID = 281;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (282,0,4.7,28); UPDATE MODUL SET MSP_ID = 28 where ID = 282;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (29,'tet',2,4,false,false,true,true,0);
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (30,'trade',2,4,false,false,true,true,0);
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (31,'algd2',3,4,false,true,false,false,0);	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (31,0,3.6,31); UPDATE MODUL SET MSP_ID = 31 where ID = 31;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (311,0,4.3,31); UPDATE MODUL SET MSP_ID = 31 where ID = 311;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (32,'vesys',3,4,false,true,false,false,0);	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (32,0,4.4,32); UPDATE MODUL SET MSP_ID = 32 where ID = 32;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (321,0,4.6,32); UPDATE MODUL SET MSP_ID = 32 where ID = 321;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (33,'swa',0,4,false,true,false,false,0);	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (33,0,2.6,33); UPDATE MODUL SET MSP_ID = 33 where ID = 33;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (331,0,3,33); UPDATE MODUL SET MSP_ID = 33 where ID = 331;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (34,'conpr',0,4,false,true,false,false,0);	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (34,0,3.4,34); UPDATE MODUL SET MSP_ID = 34 where ID = 34;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (341,0,3.6,34); UPDATE MODUL SET MSP_ID = 34 where ID = 341;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (35,'kry',3,4,false,false,false,false,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (351,0,4,35); UPDATE MODUL SET MSP_ID = 35 where ID = 351;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (352,0,3.55,35); UPDATE MODUL SET MSP_ID = 35 where ID = 352;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (36,'eis',3,5,false,false,false,false,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (361,0,5.3,36); UPDATE MODUL SET MSP_ID = 36 where ID = 361;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (362,0,5.9,36); UPDATE MODUL SET MSP_ID = 36 where ID = 362;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (37,'eaf',3,5,false,true,false,false,0);	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (37,0,3.7,37); UPDATE MODUL SET MSP_ID = 37 where ID = 37;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (371,0,3.8,37); UPDATE MODUL SET MSP_ID = 37 where ID = 371;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (38,'fprog',3,5,false,false,false,false,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (381,0,4.8,38); UPDATE MODUL SET MSP_ID = 38 where ID = 381;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (382,0,5.18,38); UPDATE MODUL SET MSP_ID = 38 where ID = 382;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (39,'stqm',3,5,false,true,false,false,0);	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (39,0,5.3,39); UPDATE MODUL SET MSP_ID = 39 where ID = 39;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (391,0,4.8,39); UPDATE MODUL SET MSP_ID = 39 where ID = 391;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (40,'depa',3,5,false,true,false,false,0);	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (40,0,4.2,40); UPDATE MODUL SET MSP_ID = 40 where ID = 40;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (401,0,2.5,40); UPDATE MODUL SET MSP_ID = 40 where ID = 401;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (41,'dist',3,5,false,true,false,false,0);	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (41,0,3.4,41); UPDATE MODUL SET MSP_ID = 41 where ID = 41;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (411,0,3.7,41); UPDATE MODUL SET MSP_ID = 41 where ID = 411;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (412,0,4.9,41); UPDATE MODUL SET MSP_ID = 41 where ID = 412;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (42,'kmgt',2,5,false,false,true,true,0);
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (43,'brwsm',2,5,false,false,false,false,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (431,0,3.6,43); UPDATE MODUL SET MSP_ID = 43 where ID = 431;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (432,0,4.1,43); UPDATE MODUL SET MSP_ID = 43 where ID = 432;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (44,'IP5',6,6,false,false,false,false,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (441,0,5,44); UPDATE MODUL SET MSP_ID = 44 where ID = 441;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (45,'ddm',3,6,false,true,false,false,0);	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (45,0,3.7,45); UPDATE MODUL SET MSP_ID = 45 where ID = 45;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (451,0,5.6,45); UPDATE MODUL SET MSP_ID = 45 where ID = 451;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (46,'apm',3,6,false,false,false,false,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (461,0,4.8,46); UPDATE MODUL SET MSP_ID = 46 where ID = 461;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (462,0,4.4,46); UPDATE MODUL SET MSP_ID = 46 where ID = 462;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (47,'itsm',3,6,false,false,false,false,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (471,0,5,47); UPDATE MODUL SET MSP_ID = 47 where ID = 471;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (472,0,5.85,47); UPDATE MODUL SET MSP_ID = 47 where ID = 472;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (48,'prcpp',3,6,false,false,false,false,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (481,0,3,48); UPDATE MODUL SET MSP_ID = 48 where ID = 481;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (482,0,4.6,48); UPDATE MODUL SET MSP_ID = 48 where ID = 482;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (49,'bprma',2,6,false,false,false,false,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (491,0,5.1,49); UPDATE MODUL SET MSP_ID = 49 where ID = 491;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (492,0,4.7,49); UPDATE MODUL SET MSP_ID = 49 where ID = 492;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (50,'sepc',3,7,false,false,false,false,0);
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (51,'apsi',3,7,false,true,false,false,0);
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (52,'webfr',3,7,false,true,false,false,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (521,0,5.3,52); UPDATE MODUL SET MSP_ID = 52 where ID = 521;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (53,'webec',3,7,false,true,false,false,0);
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (54,'algd1',3,7,false,true,false,false,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (541,0,4.75,54); UPDATE MODUL SET MSP_ID = 54 where ID = 541;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (55,'webpr',3,7,false,false,false,false,0);
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (56,'webcl',3,7,false,false,false,false,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (561,0,6,56); UPDATE MODUL SET MSP_ID = 56 where ID = 561;
INSERT INTO MODUL (ID, KUERZEL, CREDITS, SEMESTER_ID,  ANGERECHNET, HAS_MSP, HAS_TESTAT,TESTAT_PASSED, VERSION) VALUES (57,'egi',2,7,false,false,false,false,0);		INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (571,0,4.58,57); UPDATE MODUL SET MSP_ID = 57 where ID = 571;	INSERT INTO NOTE (ID, VERSION, NOTE, MODUL_ID) VALUES (572,0,4.5,57); UPDATE MODUL SET MSP_ID = 57 where ID = 572;
#define rand	pan_rand
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :init: */
	case 3: /* STATE 1 - phil:75 - [i = 0] (0:0:1 - 1) */
		IfNotBlocked
		reached[2][1] = 1;
		(trpt+1)->bup.oval = ((P2 *)this)->i;
		((P2 *)this)->i = 0;
#ifdef VAR_RANGES
		logval(":init::i", ((P2 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 4: /* STATE 2 - phil:75 - [((i<=(4-1)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][2] = 1;
		if (!((((P2 *)this)->i<=(4-1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: /* STATE 3 - phil:76 - [hunger[i] = 20] (0:0:1 - 1) */
		IfNotBlocked
		reached[2][3] = 1;
		(trpt+1)->bup.oval = now.hunger[ Index(((P2 *)this)->i, 4) ];
		now.hunger[ Index(((P2 *)this)->i, 4) ] = 20;
#ifdef VAR_RANGES
		logval("hunger[:init::i]", now.hunger[ Index(((P2 *)this)->i, 4) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 6: /* STATE 4 - phil:77 - [fork[i] = -(1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[2][4] = 1;
		(trpt+1)->bup.oval = now.fork[ Index(((P2 *)this)->i, 4) ];
		now.fork[ Index(((P2 *)this)->i, 4) ] =  -(1);
#ifdef VAR_RANGES
		logval("fork[:init::i]", now.fork[ Index(((P2 *)this)->i, 4) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: /* STATE 5 - phil:75 - [i = (i+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[2][5] = 1;
		(trpt+1)->bup.oval = ((P2 *)this)->i;
		((P2 *)this)->i = (((P2 *)this)->i+1);
#ifdef VAR_RANGES
		logval(":init::i", ((P2 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: /* STATE 11 - phil:81 - [(run check())] (0:0:0 - 3) */
		IfNotBlocked
		reached[2][11] = 1;
		if (!(addproc(II, 1, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 9: /* STATE 12 - phil:82 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][12] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC check */
	case 10: /* STATE 1 - phil:66 - [((philosopher._p==L))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((int)((P0 *)Pptr(f_pid(0)))->_p)==33)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: /* STATE 2 - phil:71 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][2] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC philosopher */
	case 12: /* STATE 1 - phil:43 - [((hunger[id]>=0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][1] = 1;
		if (!((now.hunger[ Index(((P0 *)this)->id, 4) ]>=0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 13: /* STATE 2 - phil:45 - [printf('%d is still alive\\n',id)] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][2] = 1;
		Printf("%d is still alive\n", ((P0 *)this)->id);
		_m = 3; goto P999; /* 0 */
	case 14: /* STATE 3 - phil:48 - [((hunger[id]<15))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][3] = 1;
		if (!((now.hunger[ Index(((P0 *)this)->id, 4) ]<15)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: /* STATE 4 - phil:12 - [(((fork[id]<0)&&(fork[((id+1)%4)]<0)))] (19:0:2 - 1) */
		IfNotBlocked
		reached[0][4] = 1;
		if (!(((now.fork[ Index(((P0 *)this)->id, 4) ]<0)&&(now.fork[ Index(((((P0 *)this)->id+1)%4), 4) ]<0))))
			continue;
		/* merge: fork[id] = id(19, 5, 19) */
		reached[0][5] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.fork[ Index(((P0 *)this)->id, 4) ];
		now.fork[ Index(((P0 *)this)->id, 4) ] = ((P0 *)this)->id;
#ifdef VAR_RANGES
		logval("fork[philosopher:id]", now.fork[ Index(((P0 *)this)->id, 4) ]);
#endif
		;
		/* merge: fork[((id+1)%4)] = id(19, 6, 19) */
		reached[0][6] = 1;
		(trpt+1)->bup.ovals[1] = now.fork[ Index(((((P0 *)this)->id+1)%4), 4) ];
		now.fork[ Index(((((P0 *)this)->id+1)%4), 4) ] = ((P0 *)this)->id;
#ifdef VAR_RANGES
		logval("fork[((philosopher:id+1)%4)]", now.fork[ Index(((((P0 *)this)->id+1)%4), 4) ]);
#endif
		;
		/* merge: .(goto)(19, 9, 19) */
		reached[0][9] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 16: /* STATE 9 - phil:17 - [.(goto)] (0:19:0 - 2) */
		IfNotBlocked
		reached[0][9] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 17: /* STATE 12 - phil:24 - [(((fork[id]==id)&&(fork[((id+1)%4)]==id)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][12] = 1;
		if (!(((now.fork[ Index(((P0 *)this)->id, 4) ]==((P0 *)this)->id)&&(now.fork[ Index(((((P0 *)this)->id+1)%4), 4) ]==((P0 *)this)->id))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 18: /* STATE 13 - phil:27 - [printf('%d: eating\\n',id)] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][13] = 1;
		Printf("%d: eating\n", ((P0 *)this)->id);
		_m = 3; goto P999; /* 0 */
	case 19: /* STATE 14 - phil:31 - [fork[id] = -(1)] (0:30:3 - 1) */
		IfNotBlocked
		reached[0][14] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = now.fork[ Index(((P0 *)this)->id, 4) ];
		now.fork[ Index(((P0 *)this)->id, 4) ] =  -(1);
#ifdef VAR_RANGES
		logval("fork[philosopher:id]", now.fork[ Index(((P0 *)this)->id, 4) ]);
#endif
		;
		/* merge: fork[((id+1)%4)] = -(1)(30, 15, 30) */
		reached[0][15] = 1;
		(trpt+1)->bup.ovals[1] = now.fork[ Index(((((P0 *)this)->id+1)%4), 4) ];
		now.fork[ Index(((((P0 *)this)->id+1)%4), 4) ] =  -(1);
#ifdef VAR_RANGES
		logval("fork[((philosopher:id+1)%4)]", now.fork[ Index(((((P0 *)this)->id+1)%4), 4) ]);
#endif
		;
		/* merge: hunger[id] = (hunger[id]+10)(30, 16, 30) */
		reached[0][16] = 1;
		(trpt+1)->bup.ovals[2] = now.hunger[ Index(((P0 *)this)->id, 4) ];
		now.hunger[ Index(((P0 *)this)->id, 4) ] = (now.hunger[ Index(((P0 *)this)->id, 4) ]+10);
#ifdef VAR_RANGES
		logval("hunger[philosopher:id]", now.hunger[ Index(((P0 *)this)->id, 4) ]);
#endif
		;
		/* merge: .(goto)(0, 20, 30) */
		reached[0][20] = 1;
		;
		/* merge: .(goto)(0, 26, 30) */
		reached[0][26] = 1;
		;
		/* merge: .(goto)(0, 31, 30) */
		reached[0][31] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 20: /* STATE 23 - phil:51 - [printf('%d: philosophizing\\n',id)] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][23] = 1;
		Printf("%d: philosophizing\n", ((P0 *)this)->id);
		_m = 3; goto P999; /* 0 */
	case 21: /* STATE 24 - phil:53 - [hunger[id] = (hunger[id]-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][24] = 1;
		(trpt+1)->bup.oval = now.hunger[ Index(((P0 *)this)->id, 4) ];
		now.hunger[ Index(((P0 *)this)->id, 4) ] = (now.hunger[ Index(((P0 *)this)->id, 4) ]-1);
#ifdef VAR_RANGES
		logval("hunger[philosopher:id]", now.hunger[ Index(((P0 *)this)->id, 4) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 22: /* STATE 28 - phil:57 - [printf('%d is DEAD\\n',id)] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][28] = 1;
		Printf("%d is DEAD\n", ((P0 *)this)->id);
		_m = 3; goto P999; /* 0 */
	case 23: /* STATE 33 - phil:61 - [(0)] (0:0:0 - 3) */
		IfNotBlocked
		reached[0][33] = 1;
		if (!(0))
			continue;
		_m = 3; goto P999; /* 0 */
	case 24: /* STATE 34 - phil:62 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][34] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}


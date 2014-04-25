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

		 /* PROC check */
	case 3: /* STATE 1 - phil:73 - [((philosopher._p==DEAD))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((int)((P0 *)Pptr(f_pid(0)))->_p)==22)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: /* STATE 2 - phil:74 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][2] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC philosopher */
	case 5: /* STATE 1 - phil:33 - [((hunger[id]>=0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][1] = 1;
		if (!((now.hunger[ Index(((P0 *)this)->id, 4) ]>=0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: /* STATE 2 - phil:35 - [printf('%d is still alive\\n',id)] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][2] = 1;
		Printf("%d is still alive\n", ((P0 *)this)->id);
		_m = 3; goto P999; /* 0 */
	case 7: /* STATE 3 - phil:12 - [(((fork[id]<0)&&(fork[((id+1)%4)]<0)))] (19:0:2 - 1) */
		IfNotBlocked
		reached[0][3] = 1;
		if (!(((now.fork[ Index(((P0 *)this)->id, 4) ]<0)&&(now.fork[ Index(((((P0 *)this)->id+1)%4), 4) ]<0))))
			continue;
		/* merge: fork[id] = id(19, 4, 19) */
		reached[0][4] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.fork[ Index(((P0 *)this)->id, 4) ];
		now.fork[ Index(((P0 *)this)->id, 4) ] = ((P0 *)this)->id;
#ifdef VAR_RANGES
		logval("fork[philosopher:id]", now.fork[ Index(((P0 *)this)->id, 4) ]);
#endif
		;
		/* merge: fork[((id+1)%4)] = id(19, 5, 19) */
		reached[0][5] = 1;
		(trpt+1)->bup.ovals[1] = now.fork[ Index(((((P0 *)this)->id+1)%4), 4) ];
		now.fork[ Index(((((P0 *)this)->id+1)%4), 4) ] = ((P0 *)this)->id;
#ifdef VAR_RANGES
		logval("fork[((philosopher:id+1)%4)]", now.fork[ Index(((((P0 *)this)->id+1)%4), 4) ]);
#endif
		;
		/* merge: .(goto)(19, 8, 19) */
		reached[0][8] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 8: /* STATE 8 - phil:17 - [.(goto)] (0:19:0 - 2) */
		IfNotBlocked
		reached[0][8] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 9: /* STATE 11 - phil:49 - [(((fork[id]==id)&&(fork[((id+1)%4)]==id)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][11] = 1;
		if (!(((now.fork[ Index(((P0 *)this)->id, 4) ]==((P0 *)this)->id)&&(now.fork[ Index(((((P0 *)this)->id+1)%4), 4) ]==((P0 *)this)->id))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: /* STATE 12 - phil:52 - [printf('%d: eating\\n',id)] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][12] = 1;
		Printf("%d: eating\n", ((P0 *)this)->id);
		_m = 3; goto P999; /* 0 */
	case 11: /* STATE 13 - phil:56 - [fork[id] = -(1)] (0:24:3 - 1) */
		IfNotBlocked
		reached[0][13] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = now.fork[ Index(((P0 *)this)->id, 4) ];
		now.fork[ Index(((P0 *)this)->id, 4) ] =  -(1);
#ifdef VAR_RANGES
		logval("fork[philosopher:id]", now.fork[ Index(((P0 *)this)->id, 4) ]);
#endif
		;
		/* merge: fork[((id+1)%4)] = -(1)(24, 14, 24) */
		reached[0][14] = 1;
		(trpt+1)->bup.ovals[1] = now.fork[ Index(((((P0 *)this)->id+1)%4), 4) ];
		now.fork[ Index(((((P0 *)this)->id+1)%4), 4) ] =  -(1);
#ifdef VAR_RANGES
		logval("fork[((philosopher:id+1)%4)]", now.fork[ Index(((((P0 *)this)->id+1)%4), 4) ]);
#endif
		;
		/* merge: hunger[id] = (hunger[id]+3)(24, 15, 24) */
		reached[0][15] = 1;
		(trpt+1)->bup.ovals[2] = now.hunger[ Index(((P0 *)this)->id, 4) ];
		now.hunger[ Index(((P0 *)this)->id, 4) ] = (now.hunger[ Index(((P0 *)this)->id, 4) ]+3);
#ifdef VAR_RANGES
		logval("hunger[philosopher:id]", now.hunger[ Index(((P0 *)this)->id, 4) ]);
#endif
		;
		/* merge: .(goto)(0, 20, 24) */
		reached[0][20] = 1;
		;
		/* merge: .(goto)(0, 25, 24) */
		reached[0][25] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 12: /* STATE 18 - phil:60 - [printf('%d can not eat',id)] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][18] = 1;
		Printf("%d can not eat", ((P0 *)this)->id);
		_m = 3; goto P999; /* 0 */
	case 13: /* STATE 22 - phil:65 - [printf('%d is DEAD\\n',id)] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][22] = 1;
		Printf("%d is DEAD\n", ((P0 *)this)->id);
		_m = 3; goto P999; /* 0 */
	case 14: /* STATE 27 - phil:69 - [-end-] (0:0:0 - 3) */
		IfNotBlocked
		reached[0][27] = 1;
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


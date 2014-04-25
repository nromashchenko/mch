	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: /* STATE 1 */
		;
		((P2 *)this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 5: /* STATE 3 */
		;
		now.hunger[ Index(((P2 *)this)->i, 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 6: /* STATE 4 */
		;
		now.fork[ Index(((P2 *)this)->i, 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 7: /* STATE 5 */
		;
		((P2 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 8: /* STATE 11 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 9: /* STATE 12 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC check */
;
		;
		
	case 11: /* STATE 2 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC philosopher */
;
		;
		;
		;
		;
		;
		
	case 15: /* STATE 6 */
		;
		now.fork[ Index(((((P0 *)this)->id+1)%4), 4) ] = trpt->bup.ovals[1];
		now.fork[ Index(((P0 *)this)->id, 4) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		
	case 16: /* STATE 9 */
		goto R999;
;
		;
		;
		;
		
	case 19: /* STATE 16 */
		;
		now.hunger[ Index(((P0 *)this)->id, 4) ] = trpt->bup.ovals[2];
		now.fork[ Index(((((P0 *)this)->id+1)%4), 4) ] = trpt->bup.ovals[1];
		now.fork[ Index(((P0 *)this)->id, 4) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;
;
		;
		
	case 21: /* STATE 24 */
		;
		now.hunger[ Index(((P0 *)this)->id, 4) ] = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 24: /* STATE 34 */
		;
		p_restor(II);
		;
		;
		goto R999;
	}


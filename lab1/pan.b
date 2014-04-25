	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC check */
;
		;
		
	case 4: /* STATE 2 */
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
		
	case 7: /* STATE 5 */
		;
		now.fork[ Index(((((P0 *)this)->id+1)%4), 4) ] = trpt->bup.ovals[1];
		now.fork[ Index(((P0 *)this)->id, 4) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		
	case 8: /* STATE 8 */
		goto R999;
;
		;
		;
		;
		
	case 11: /* STATE 15 */
		;
		now.hunger[ Index(((P0 *)this)->id, 4) ] = trpt->bup.ovals[2];
		now.fork[ Index(((((P0 *)this)->id+1)%4), 4) ] = trpt->bup.ovals[1];
		now.fork[ Index(((P0 *)this)->id, 4) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;
;
		;
		
	case 13: /* STATE 22 */
		;
		now.hunger[ Index(((P0 *)this)->id, 4) ] = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 16: /* STATE 32 */
		;
		p_restor(II);
		;
		;
		goto R999;
	}


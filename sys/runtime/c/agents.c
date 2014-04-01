/*
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
*/
#ifdef SE_GC_LIB
TLS(gc_agent *) store_agent = NULL;
TLS(gc_agent *) gc_free_agent = NULL;
TLS(int       ) store_left_agent = 0;
TLS(int       ) count_agent=0;
TLS(int       ) gc_info_nb_agent = 0;
TLS(fsoc     *) store_chunk_agent = NULL;
TLS(fsoc      ) H_agent =
{
  {
    FSOC_SIZE, FSO_STORE_CHUNK,
    (void (*)(mch *, void *)) gc_align_mark_agent,
    (void (*)(mch *)) gc_sweep_agent
  },
  NULL,
  (((FSOC_SIZE - sizeof (fsoc) + sizeof (double)) / sizeof (gc_agent)) - 1)
};
#endif

se_agent* new_agent(Tid id) {
#ifdef SE_GC_LIB
  int i;
  gc_agent *agent;
  fsoc *c;
  if (store_left_agent > 1)
    {
      store_left_agent--;
      agent = store_agent++;
    }
  else if (gc_free_agent != NULL)
    {
      agent = gc_free_agent;
      gc_free_agent = agent->header.next;
    }
  else if (store_left_agent == 1)
    {
      store_left_agent = 0;
      store_chunk_agent->header.state_type = FSO_USED_CHUNK;
      agent = store_agent++;
    }
  else
    {
      c = gc_fsoc_get1 ();
      if (c == NULL)
        c = gc_fsoc_get2 ();
      store_chunk_agent = c;
      *store_chunk_agent = H_agent;
      store_agent = ((gc_agent *) (&(store_chunk_agent->first_object)));
      store_left_agent = H_agent.count_minus_one;
      agent = store_agent++;
    }
  agent->header.flag = FSOH_UNMARKED;
  for(i=0;i<(sizeof(se_agent)/sizeof(int));i++)
    ((int*) (agent))[i] = 0;

#else /* SE_GC_LIB */
  se_agent* agent = se_calloc(1,sizeof(se_agent));

#endif /* SE_GC_LIB */

  ((se_agent*) agent)->u0.id = id;

#ifdef SE_GC_LIB
  gc_info_nb_agent++;
#endif /* SE_GC_LIB */
  return (se_agent *) agent;
}


#ifdef SE_GC_LIB
void gc_sweep_agent (fsoc * c) {
  gc_agent *a1, *a2, *flt, flh;
  a1 = ((gc_agent *) (&(c->first_object)));
  if (c->header.state_type == FSO_STORE_CHUNK) {
    for (; a1 < store_agent; a1++) {
      if ((a1->header.flag) == FSOH_MARKED) {
        a1->header.flag = FSOH_UNMARKED;
      }
      else if ((a1->header.flag) == FSOH_UNMARKED) {
        a1->header.next = gc_free_agent;
        gc_free_agent = a1;
      }
    }
  }
  else {
    int dead = 1;
    flh.header.next = NULL;
    flt = &flh;
    a2 = a1 + c->count_minus_one;
    for (; a1 <= a2; a2--) {
      if ((a2->header.flag) == FSOH_MARKED) {
        a2->header.flag = FSOH_UNMARKED;
        dead = 0;
      }
      else if ((a2->header.flag) == FSOH_UNMARKED) {
        flt->header.next = a2;
        flt = a2;
      }
    }
    if (dead) {
      gc_agent **prvnxt=&gc_free_agent;
      char *inf=(char*)((gc_agent*)(&(c->first_object)));
      char *sup=(char*)(((gc_agent*)(&(c->first_object)))+c->count_minus_one);
      a1=gc_free_agent;
      while(a1!=NULL) {
        if(inf>(char*)a1 || (char*)a1>sup) {
          *prvnxt=a1;
          prvnxt=&a1->header.next;
        }
        a1=a1->header.next;
      }
      *prvnxt=NULL;
      c->next = fsocfl;
      fsocfl = c;
      c->header.state_type = FSO_FREE_CHUNK;
    }
    else if (flh.header.next != NULL) {
      flt->header.next = gc_free_agent;
      gc_free_agent = flh.header.next;
    }
  }
}

void gc_align_mark_agent (fsoc * c, gc_agent * p) {
  gc_agent *b = ((gc_agent *) (&(c->first_object)));
  if ((c->header.state_type == FSO_STORE_CHUNK)
      && (((char *) p) >= ((char *) store_agent)))
    return;

  if (((char *) p) > ((char *) (b + (c->count_minus_one))))
    return;

  if (((char *) p) < ((char *) b))
    return;
  if (((((char *) p) - ((char *) b)) % sizeof (*p)) == 0)
    {
      se_agent *ta = (&(p->object));
      (*(ta->u0.gc_mark_agent_mold))(ta);
    }
}

#endif /* SE_GC_LIB */

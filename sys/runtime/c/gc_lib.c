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

/*
   This file (Liberty/sys/runtime/gc_lib.c) is automatically included
   when the Garbage Collector is used (default, unless option -no_gc has been
   selected).
*/
/*
   The `mark_stack_and_registers' C function is called by the Garbage
   Collector (GC) of SmartEiffel. It has to be customized for some systems,
   but also for some C compilers. This file provides some definitions in the
   end and has to be completed for systems which need specific work.

   On some architectures, addresses increase as the stack grows; or,
   conversely, addresses decrease as the stack grows. A C compiler may be
   clever enough to hide some root object inside registers. Unfortunately all
   registers are not always accessible via the C `setjmp' function!

   Thus, in order to be able to use the GC on your architecture/C-compiler,
   you have to provide the correct `mark_stack_and_registers' function.

   What is the `mark_stack_and_registers' function supposed to do?  The
   `mark_stack_and_registers' function is supposed to notify the GC with all
   the possible roots one can find in the C stack and registers by calling the
   `gc_mark' function. A root is an object which must not be collected.  The
   SmartEiffel GC already knows about some root objects like once function
   results or manifest strings. The `mark_stack_and_registers' function has to
   notify the other possible roots. Obviously, one can find in the C stack any
   kind of adresses, but the `gc_mark' function is clever enough to determine
   if the passed pointer is an Eiffel object or not.  When the passed pointer
   reaches some Eiffel object, this object as well as its descendant(s) are
   automatically marked as un-collectable.

   In order to provide the most appropriate `mark_stack_and_registers'
   function, the very first question is to know about the way the C stack is
   managed (addresses of the stack may increase or decrease as the C stack
   grows). The DEFAULT BEHAVIOUR FOR UNKNOWN SYSTEMS is to consider ADDRESSES
   DECREASE AS THE STACK GROWS, as it's the most common case.  The global C
   variable `stack_bottom' is set with some pointer which is supposed to be
   the bottom of the stack (this variable is automatically initialized in the
   C main function).  Note: using the current stack pointer inside
   `mark_stack_and_registers', it is quite obvious to determine if addresses
   increase or not as the C stack grows.  Note2: on some systems, the stack is
   not in contiguous addresses. In such case, `mark_stack_and_registers' has
   to go through all the stack fragments.

   Some roots may be stored only in registers and not in the C stack.  In
   order to reach the registers as well, the first attempt is to use setjmp,
   in the hope that setjmp will save registers in the stack!  Note: this
   technique do not work on processors using windows registers (such as sparc
   processors).

*/


#ifdef SE_BOOST
#    define GC_BUG(tag, expr) do {if (expr) {    \
         handle(SE_HANDLE_RUNTIME_ERROR, NULL); \
         se_print_run_time_stack();             \
         exit(EXIT_FAILURE);                    \
      }} while(0)
#else
#    define GC_BUG(tag, expr) do {if (expr) {                    \
         char msg[512];                                         \
         sprintf(msg, "GC BUG: %s (%s).\n", tag, #expr);        \
         error0(msg, NULL);                                     \
      }} while(0)
#endif


TLS(int) se_gc_strategy = SE_GC_DEFAULT_MEMORY_STRATEGY;

volatile int collector_counter = 0;

static void gcna_align_mark(rsoc*c,void*o);
static TLS(rsoc*)rsocfl=NULL; /* ReSizable Object Chunk Free List. */

TLS(void**      ) stack_bottom=NULL;
TLS(mch**       ) gcmt=NULL; /* Garbage Collector Main Table. */
TLS(int         ) gcmt_max=2048;
TLS(int         ) gcmt_used=0;
TLS(fsoc*       ) fsocfl=NULL; /* Fixed Size Object Chunk Free List. */
TLS(int         ) gc_is_off=0;
TLS(unsigned int) fsoc_count=0;
TLS(unsigned int) rsoc_count=0;
TLS(void*       ) gcmt_tail_addr=NULL;

static int chunk_rounded(int size) {
  int rounded_size = size;
  int diff = rounded_size%RSOC_SIZE;

  if (diff != 0) rounded_size += (RSOC_SIZE-diff);
  return rounded_size;
}

/* Return the index where chunk `c' is (or is to be) in the `gcmt',
   between `min' and `max' indexes. */
static unsigned int binary_search_in_gcmt(register unsigned int min,
                                          register unsigned int max,
                                          register mch* c){
  register unsigned int mid;
  while (min<max){
    mid=(min+max)>>1;
    if (gcmt[mid]<c)
      min=mid+1;
    else
      max=mid;
  }
  if (gcmt[min]<c)
    return min+1;
  else
    return min;
}

static void may_free_rsocfl(void) {
  /* May free all chunks of `rsocfl' (ReSizable Object Chunk Free List)
     in some circumstances.
  */
  rsoc* next; register rsoc *current;
  unsigned int count = rsocfl_count();
  register unsigned int where = gcmt_used;
  register unsigned int how_many;

  if ((count > 50) && (count > (rsoc_count >> 1))) {
    current=rsocfl;
    rsocfl=NULL;
    while (NULL != current) {
      next=current->next;
      if (current->isize == current->header.size) {
        where = binary_search_in_gcmt(0, where-1, (mch*)current);
        how_many = gcmt_used - 1 - where;
        if (how_many > 0)
          memmove(gcmt+where, gcmt+where+1, how_many*sizeof(mch*));
        free(current); gcmt_used--; rsoc_count--;
      }
      else {
        current->next=rsocfl;
        rsocfl=current;
      }
      current = next;
    }
  }
}

int gc_memory_used(void) {
  int i;
  int result = 0;
  mch* mch;
  for (i = gcmt_used; i --> 0; ) {
    mch = gcmt[i];
    switch(mch->state_type) {
    case RSO_USED_CHUNK:
    case FSO_USED_CHUNK:
    case FSO_STORE_CHUNK:
      result += mch->size;
      break;
    default:
      break;
    }
  }
  return result;
}

void gc_sweep(void) {
  mch** p2 = gcmt;
  mch** p1 = gcmt+1;
  mch**eogcmt=gcmt+gcmt_used;
  if (FREE_CHUNK((*p2)->state_type)) {
    if (RSO_FREE_CHUNK == ((*p2)->state_type)) {
      ((rsoc*)(*p2))->next=NULL;
      rsocfl=((rsoc*)(*p2));
    }
    else {
      rsocfl=NULL;
    }
  }
  else {
    ((*gcmt)->swfp)(*p2);
    if (RSO_FREE_CHUNK==((*p2)->state_type)) {
      ((rsoc*)(*p2))->next=NULL;
      rsocfl=((rsoc*)(*p2));
    }
    else {
      rsocfl=NULL;
    }
  }
  while (p1 < eogcmt) {
    if (FREE_CHUNK((*p1)->state_type)) {
      if (RSO_FREE_CHUNK == ((*p1)->state_type)) {
        if (RSO_FREE_CHUNK == ((*p2)->state_type)) {
          if ( (((rsoc*)*p1)->isize==0) && ((char*)(*p2))+(*p2)->size == ((char*)(*p1))) {
            ((*p2)->size)+=((*p1)->size);
            p1++;
          }
          else {
            ((rsoc*)(*p1))->next=rsocfl;
            rsocfl=((rsoc*)(*p1));
            *(p2+1)=*p1; p2++; p1++;
          }
        }
        else {
          ((rsoc*)(*p1))->next=rsocfl;
          rsocfl=((rsoc*)(*p1));
          *(p2+1)=*p1; p2++; p1++;
        }
      }
      else {
        *(p2+1)=*p1; p2++; p1++;
      }
    }
    else {
      ((*p1)->swfp)(*p1);
      if (RSO_FREE_CHUNK == ((*p1)->state_type)) {
        if (RSO_FREE_CHUNK == ((*p2)->state_type)) {
          if ( (((rsoc*)*p1)->isize==0) && ((char*)(*p2))+(*p2)->size == ((char*)(*p1))) {
            ((*p2)->size)+=((*p1)->size);
            p1++;
          }
          else {
            ((rsoc*)(*p1))->next=rsocfl;
            rsocfl=((rsoc*)(*p1));
            *(p2+1)=*p1; p2++; p1++;
          }
        }
        else {
          ((rsoc*)(*p1))->next=rsocfl;
          rsocfl=((rsoc*)(*p1));
          *(p2+1)=*p1; p2++; p1++;
        }
      }
      else {
        *(p2+1)=*p1; p2++; p1++;
      }
    }
  }
  gcmt_used=(p2-gcmt)+1;
  may_free_rsocfl();
}

/* return the mch containing p or NULL if p is not
 * a valid address or was externally allocated
 */
mch * gc_find_chunk(void * p){
  if ((p>((void*)*gcmt))&&(p<=gcmt_tail_addr)) {
    int i1=0;
    int i2=gcmt_used-1;
    int m=i2>>1;
    mch*c;
    for (;i2>i1;m=((i1+i2)>>1)) {
      if (p<=((void*)gcmt[m+1])) {
        i2=m;
      }
      else {
        i1=m+1;
      }
    }
    c=gcmt[i2];
    if((char*)p<(char*)c+c->size)   /* check for upper bound */
      if (!(FREE_CHUNK(c->state_type))){
        return c;
      }
  }
  return NULL;
}

void gc_mark(void*p) {
  mch * c;
  c = gc_find_chunk(p);
  if(NULL != c) {
    (c->amfp)(c,p);
  }
}

int gc_stack_size(void) {
  void*stack_top[2]={NULL,NULL};
  if (stack_top > stack_bottom) {
    return ((void**)stack_top)-((void**)stack_bottom);
  }
  else {
    return ((void**)stack_bottom)-((void**)stack_top);
  }
}

/*
  To delay Garbage Collection when the stack is too large.
  To allow fast increase of ceils.
*/
#define FSOC_LIMIT (10240/((FSOC_SIZE)>>10))
#define RSOC_LIMIT (10240/((RSOC_SIZE)>>10))

/*
  When stack is too large, collection may be delayed.
*/
#define GCLARGESTACK 50000

int garbage_delayed(void) {
  /*
    To delay the first GC call.
  */
  if (gc_stack_size() > GCLARGESTACK) {
    if (fsoc_count_ceil <= fsoc_count) {
      if (rsoc_count_ceil <= rsoc_count) {
        if ((fsoc_count<FSOC_LIMIT)&&(rsoc_count<RSOC_LIMIT)) {
          fsoc_count_ceil++;
          rsoc_count_ceil++;
          return 1;
        }
        else return 0;
      }
      else {
        if (fsoc_count<FSOC_LIMIT) {
          fsoc_count_ceil++;
          return 1;
        }
        else return 0;
      }
    }
    else {
      if (rsoc_count_ceil <= rsoc_count) {
        if (rsoc_count<RSOC_LIMIT) {
          rsoc_count_ceil++;
          return 1;
        }
        else return 0;
      }
      else return 0;
    }
  }
  else {
    return 0;
  }
}

void gc_update_ceils(void) {
  /* This function is automatically called after each collection
     cycle.
  */
  if (se_gc_strategy == SE_GC_LOW_MEMORY_STRATEGY) {
    fsoc_count_ceil = fsoc_count;
    rsoc_count_ceil = rsoc_count;
    /* Todo: we should also consider to free unused chunks here. */
    return;
  }
  if (se_gc_strategy == SE_GC_HIGH_MEMORY_STRATEGY) {
    fsoc_count_ceil = (256 + fsoc_count) << 2;
    rsoc_count_ceil = (256 + rsoc_count) << 2;
    return;
  }
  /* The SE_GC_DEFAULT_MEMORY_STRATEGY. */
  /* Compute fsoc_count_ceil: */

  /* The lines commented out with --perf-- were killing performance under certain circumstances, *
   * especially with gcc -O3 <FM-15/04/2005>                                                     */

  /* --perf-- if (fsocfl == NULL) { */
  if (fsoc_count >= fsoc_count_ceil) {
    if (fsoc_count_ceil < FSOC_LIMIT) {
      fsoc_count_ceil <<= 1;
    }
    else {
      unsigned int c = fsoc_count + (fsoc_count/3);
      if (fsoc_count_ceil < c)
        fsoc_count_ceil = c;
    }
  }
  /* --perf-- }
     else {
     if (fsoc_count_ceil < fsoc_count) {
     fsoc_count_ceil = fsoc_count;
     }
     }
  */
  /* Compute rsoc_count_ceil: */
  /* --perf-- if (rsocfl == NULL) {*/
  if (rsoc_count >= rsoc_count_ceil) {
    if (rsoc_count_ceil < RSOC_LIMIT) {
      rsoc_count_ceil <<= 1;
    }
    else {
      unsigned int c = rsoc_count + (rsoc_count / 3);
      if (rsoc_count_ceil < c) {
        rsoc_count_ceil = c;
      }
    }
  }
  /* --perf -- }
     else {
     if (rsoc_count_ceil < rsoc_count) {
     rsoc_count_ceil = rsoc_count;
     }
     }
  */
}

static void gc_add_into_gcmt(mch*c) {
  /* Update the `gcmt' (Garbage Collector Main Table) by adding the
     new `mch' (Memory Chunk Header).`gcmt_used' is updated.
  */
  unsigned int where=0;
  unsigned how_many;
  if (gcmt_used>0){
    where=binary_search_in_gcmt(0, gcmt_used-1, c);
    if (gcmt_used == gcmt_max) {
      gcmt_max <<= 1;
      gcmt = ((mch**)(se_realloc(gcmt,(gcmt_max+1)*sizeof(mch*))));
    }
    how_many = gcmt_used - where;
    if (how_many > 0)
      memmove(gcmt+where+1, gcmt+where, how_many*sizeof(mch*));
  }
  gcmt[where]=c;
  gcmt_used++;
}

static char*rso_from_store(na_env*nae,unsigned int size) {
  rsoh*r=(nae->store);
  GC_BUG("zero-size for rso_from_store()", size==0);
  nae->store_left-=size;
  if ((nae->store_left) > sizeof(rsoh)) {
    r->header.size=size;
    nae->store=((rsoh*)(((char*)(nae->store))+size));
  }
  else {
    r->header.size=size+nae->store_left;
    nae->store_left=0;
  }
  (r->header.magic_flag)=RSOH_UNMARKED;
  ((void)memset((r+1),0,r->header.size-sizeof(rsoh)));
  return (char*)(r+1);
}

static void rsoc_sweep(rsoc*c) {
  na_env*nae=c->nae;
  rsoh*gp=(rsoh*)&(c->first_header);
  rsoh*pp;
  rsoh*eoc=((rsoh*)(((char*)c)+c->header.size));
  c->free_list_of_large=NULL;
  if (c->header.size > RSOC_SIZE) {
    if (gp->header.magic_flag == RSOH_MARKED) {
      gp->header.magic_flag=RSOH_UNMARKED;
      /* No need to register chunks with no free_list_of_large
      c->next=nae->chunk_list;
      nae->chunk_list=c;
      */
    }
    else {
      c->header.state_type=RSO_FREE_CHUNK;
    }
    return;
  }

  while (gp<eoc) {
    while (gp->header.magic_flag == RSOH_MARKED) {
      gp->header.magic_flag=RSOH_UNMARKED;
      GC_BUG("rsoc_sweep(), unmarking marked rsoh", gp->header.size==0);
      gp=((rsoh*)(((char*)gp)+gp->header.size));
      if(gp>=eoc) {
        /* No need to register chunks with no free_list_of_large
        c->next=nae->chunk_list;
        nae->chunk_list=c;
        */
        return;
      }
    }

    gp->header.magic_flag=RSOH_FREE;
    GC_BUG("rsoc_sweep(), sweeping unmaked rsoh", gp->header.size==0);
    pp=(rsoh*)(((char*)gp)+gp->header.size);
    while ((pp<eoc)&&(pp->header.magic_flag != RSOH_MARKED)) {
      gp->header.size+=pp->header.size;
      GC_BUG("rsoc_sweep(), coalescing unmarked rsoh", pp->header.size==0);
      pp=((rsoh*)(((char*)pp)+pp->header.size));
    }

    if (gp->header.size >= RSOC_MIN_STORE) {
      if (nae->store_left==0) {
        nae->store_left=gp->header.size;
        nae->store=gp;
        nae->store_chunk=c;
      }
      else if (nae->store->header.size < gp->header.size) {
        ((fll_rsoh*)nae->store)->nextflol=nae->store_chunk->free_list_of_large;
        nae->store_chunk->free_list_of_large=((fll_rsoh*)nae->store);
        nae->store_left=gp->header.size;
        nae->store=gp;
        nae->store_chunk=c;
      }
      else {
        ((fll_rsoh*)gp)->nextflol=c->free_list_of_large;
        c->free_list_of_large=((fll_rsoh*)gp);
      }
    }
    GC_BUG("rsoc_sweep(), checking next rsoh", pp==gp);
    gp=pp;
  }

  if (((rsoh*)(&c->first_header))->header.size >=
      (c->header.size-sizeof(rsoc)+sizeof(rsoh))){
    c->header.state_type=RSO_FREE_CHUNK;
    nae->store_chunk=NULL;
    nae->store_left=0;
  }
  else{
    c->next=nae->chunk_list;
    nae->chunk_list=c;
  }
}

/* *** To be removed */
static const rsoc MRSOC = {
    {
        RSOC_SIZE,
        RSO_USED_CHUNK,
        ((void(*)(mch*,void*))gcna_align_mark),
        ((void(*)(mch*))rsoc_sweep)
    },
    0,
    NULL,
    NULL,
    NULL,
    {
      {
        0,
        RSOH_MARKED
      }
    }
};

static void rsoc_malloc(na_env*nae) {
  rsoc* r = ((rsoc*)(se_malloc(RSOC_SIZE)));
  rsoc_count++;
  *r=MRSOC;
  r->nae=nae;
  r->isize=RSOC_SIZE;
  nae->store=(&(r->first_header));
  nae->store_left=RSOC_SIZE-sizeof(rsoc)+sizeof(rsoh);
  nae->store_chunk=r;
  r->next=nae->chunk_list;
  nae->chunk_list=r;
  gc_add_into_gcmt((mch*)r);
}

static rsoc* rsocfl_best_fit(unsigned int size) {
  register unsigned int best_size = 0;
  unsigned int acceptable_loss;
  register rsoc *pc, *best_pc, *best_c, *c;
  if (NULL==rsocfl)
    return NULL;
  pc=NULL;
  best_pc=NULL;
  best_c=NULL;
  c=rsocfl;
  if (SE_GC_DEFAULT_MEMORY_STRATEGY == se_gc_strategy)
    acceptable_loss = (size >> 4);
  else if (SE_GC_LOW_MEMORY_STRATEGY == se_gc_strategy)
    acceptable_loss = 0;
  else /* SE_GC_HIGH_MEMORY_STRATEGY == se_gc_strategy */
    acceptable_loss = (size >> 2);

  while ((NULL!=c)&&(NULL==best_c)){
    if (c->header.size>=size){
      best_c=c;
      best_pc=pc;
      best_size=c->header.size;
    }
    pc=c;
    c=c->next;
  }
  if (NULL==c){
    if (NULL != best_pc)
      best_pc->next=best_c->next;
    else if (best_c==rsocfl)
      rsocfl=best_c->next;
    return best_c;
  }
  if ((best_size - size) > acceptable_loss){
    do {
      if ((c->header.size >= size) && (c->header.size < best_size)) {
        best_c = c;
        best_pc = pc;
        best_size = c->header.size;
        if ((best_size - size) <= acceptable_loss) break;
      }
      pc=c;
      c=c->next;
    }
    while(NULL!=c);
  }
  if (NULL==best_pc) {
    rsocfl = best_c->next;
  }
  else {
    best_pc->next=best_c->next;
  }
  return best_c;
}

static int get_store_in(rsoc*c,unsigned int size) {
  na_env*nae=c->nae;
  fll_rsoh*pf=NULL;
  fll_rsoh*f=c->free_list_of_large;
  while (f != NULL) {
    if (f->rsoh_field.size >= size) {
      nae->store_left=f->rsoh_field.size;
      nae->store=(rsoh*)f;
      GC_BUG("check nae store size", nae->store->header.size==0);
      nae->store_chunk=c;
      if (pf == NULL) {
        c->free_list_of_large=f->nextflol;
      }
      else {
        pf->nextflol=f->nextflol;
      }
      return 1;
    }
    pf = f;
    f = f->nextflol;
  }
  return 0;
}

char*new_na_from_chunk_list(na_env*nae,unsigned int size) {
  rsoc*c=nae->chunk_list;
  unsigned int csize;
  GC_BUG("zero-size for new_na_from_chunk_list()", size==0);
  while (c != NULL) {
    if (get_store_in(c,size)) {
      return rso_from_store(nae,size);
    }
    c = c->next;
  }
  csize=size+(sizeof(rsoc)-sizeof(rsoh));
  c=rsocfl_best_fit(csize);
  if (c != NULL){
    if (c->header.size > RSOC_SIZE) {
      if (c->header.size-csize > RSOC_MIN_STORE*4) {
        int csize_left=c->header.size-csize;
        if ((csize_left%sizeof(void*))!=0) {
          csize_left-=(csize_left%sizeof(void*));
          csize=c->header.size-csize_left;
        }
        c->header.size=csize_left;
        c->next=rsocfl;
        rsocfl=c;
        c=(rsoc*)(((char*)c)+csize_left);
        c->isize=0; /* c split from a larger chunk */
        gc_add_into_gcmt((mch*)c);
        c->header.amfp=(void(*)(mch*,void*))gcna_align_mark;
        c->header.swfp=(void(*)(mch*))rsoc_sweep;
      }
      /* since objects bigger than RSOC_SIZE must be the only object in their chunk, we do not want to have
         some store left after them. Therefore, we do not set csize to c->header.size in an else block
         here. */
      c->header.size=csize;
    }
    else {
      csize=c->header.size;
    }
    c->header.state_type=RSO_USED_CHUNK;
    c->free_list_of_large=NULL;
    c->nae=nae;
    nae->store=(&(c->first_header));
    nae->store_left=csize-sizeof(rsoc)+sizeof(rsoh);
    nae->store_chunk=c;
    /* No need to register chunks with no free_list_of_large
    c->next=nae->chunk_list;
    nae->chunk_list=c;
    */
    return rso_from_store(nae,size);
  }
  return NULL;
}

/* size in bytes, including header size */
char*new_na(na_env*nae,unsigned int size) {
  GC_BUG("zero-size for new_na()", size == 0);
  if (nae->store_left>0) {
    nae->store->header.size=nae->store_left;
    nae->store->header.magic_flag=RSOH_FREE;
    if (nae->store_left >= RSOC_MIN_STORE) {
      ((fll_rsoh*)(nae->store))->nextflol=nae->store_chunk->free_list_of_large;
      nae->store_chunk->free_list_of_large=((fll_rsoh*)nae->store);
    }
    nae->store_left=0;
  }
  if ((nae->store_chunk!=NULL)&&(get_store_in(nae->store_chunk,size))) {
    return rso_from_store(nae,size);
  }
  {
    char*r=new_na_from_chunk_list(nae,size);
    if (r!=NULL)
      return r;
  }
  if (rsoc_count<rsoc_count_ceil) {
    if((size+sizeof(rsoc)-sizeof(rsoh))>RSOC_SIZE){
      rsoc*c;
      rsoh*r;
      unsigned int rounded_size= chunk_rounded(size+sizeof(rsoc)-sizeof(rsoh));
      c=((rsoc*)(se_malloc(rounded_size)));
      r=(&(c->first_header));
      rsoc_count++;
      *c=MRSOC;
      c->isize = rounded_size;
      c->header.size=rounded_size;
      c->nae=nae;
      /* No need to register chunks with no free_list_of_large
      c->next=nae->chunk_list;
      nae->chunk_list=c;
      */
      gc_add_into_gcmt((mch*)c);
      r->header.size=size;
      GC_BUG("check rsoh size from nae", r->header.size==0);
      (r->header.magic_flag)=RSOH_UNMARKED;
      ((void)memset((r+1),0,size-sizeof(rsoh)));
      return (char*)(r+1);
    }
    else {
      rsoc_malloc(nae);
      return rso_from_store(nae,size);
    }
  }
  gc_start();
  if (size<=(nae->store_left)) {
    return rso_from_store(nae,size);
  }
  {
    char*r=new_na_from_chunk_list(nae,size);
    if (r!=NULL) {
      return r;
    }
  }
  if((size+sizeof(rsoc)-sizeof(rsoh))>RSOC_SIZE){
    rsoc*c;
    rsoh*r;
    unsigned int rounded_size = chunk_rounded(size+sizeof(rsoc)-sizeof(rsoh));
    c=((rsoc*)(se_malloc(rounded_size)));
    r=(&(c->first_header));
    rsoc_count++;
    *c=MRSOC;
    c->isize = rounded_size;
    c->header.size=rounded_size;
    c->nae=nae;
    /* No need to register chunks with no free_list_of_large
    c->next=nae->chunk_list;
    nae->chunk_list=c;
    */
    gc_add_into_gcmt((mch*)c);
    r->header.size=size;
    (r->header.magic_flag)=RSOH_UNMARKED;
    ((void)memset((r+1),0,size-sizeof(rsoh)));
    gc_update_ceils();
    return (char*)(r+1);
  }
  else {
    rsoc_malloc(nae);
    gc_update_ceils();
    return rso_from_store(nae,size);
  }
}

static void gcna_align_mark(rsoc*c,void*o) {
  na_env* nae = c->nae;
  fll_rsoh* f;
  fll_rsoh* pf;
  char* b = (char*)&(c->first_header);

  /* properly aligned ? */
  if (((((char*)o)-((char*)c))%sizeof(void*)) != 0) {
      return;
  }
  /* already marked ? */
  if ((((rsoh*)o)-1)->header.magic_flag != RSOH_UNMARKED) {
      return;
  }
  if (((char*)o) < ((char*)(c+1))) {
      return;
  }
  /* a large chunck ? */
  if (c->header.size > RSOC_SIZE) {
      if (o == (c+1)) {
        nae->gc_mark((T0*)o);
      }
      return;
  }
  pf=NULL;
  f=c->free_list_of_large;
  while ((f != NULL) && (f < ((fll_rsoh*)o))) {
      pf=f;
      f=f->nextflol;
  }
  if (pf == NULL) {
      pf=(fll_rsoh*)b;
  }
  while ((((rsoh*)pf)+1) < (rsoh*)o) {
      GC_BUG("gcna_align_mark(), zero-size rsoh", pf->rsoh_field.size==0);
      pf = ((fll_rsoh*)(((char*)pf)+pf->rsoh_field.size));
  }
  if (o == (((rsoh*)pf)+1)) {
      nae->gc_mark((T0*)o);
  }
}

unsigned int rsocfl_count(void) {
  /* Returns the number of items in the ReSizable Object Free List.
  */
  register unsigned int r=0;
  register rsoc*p=rsocfl;
  while (p!=NULL) {
    r++;
    p=p->next;
  }
  return r;
}

unsigned int fsocfl_count(void) {
  register unsigned int r=0;
  register fsoc*p=fsocfl;
  while (p!=NULL) {
    r++;
    p=p->next;
  }
  return r;
}

static int __se_dispose_before_exit;

void gc_set_dispose_before_exit(int enable) {
   __se_dispose_before_exit = enable;
}

void gc_dispose_before_exit(void) {
  mch** p = gcmt;
  mch**eogcmt=gcmt+gcmt_used;
  if (__se_dispose_before_exit) {
    handle(SE_HANDLE_ENTER_GC,NULL);
    while (p < eogcmt) {
      if (((*p)->state_type == FSO_STORE_CHUNK) ||
          ((*p)->state_type == FSO_USED_CHUNK)) {
        ((*p)->swfp)(*p);
      }
      p++;
    }
    handle(SE_HANDLE_EXIT_GC,NULL);
  }
}

fsoc* gc_fsoc_get1(void) {
  /* Get a `fsoc' (Fixed Size Object Chunk) from the free fsoc list or
     allocate a new one (using `se_malloc') only when the ceil is not
     yet reached. Otherwise, call the `gc_start()' function and
     return NULL.
  */
  fsoc* result;
  if (fsocfl != NULL) {
    result = fsocfl;
    fsocfl = fsocfl->next;
    return result;
  }
  else if (fsoc_count_ceil > fsoc_count) {
    result = ((fsoc*)se_malloc(FSOC_SIZE));
    fsoc_count++;
    gc_add_into_gcmt((mch*)result);
    return result;
  }
  else {
    gc_start();
    return NULL;
  }
}

fsoc* gc_fsoc_get2(void) {
  /* Get a `fsoc' (Fixed Size Object Chunk) or force the allocation of a
     new `fsoc' (using the `se_malloc' function). Update various ceils
     accordingly.
  */
  fsoc* result;
  if (fsocfl != NULL) {
    result = fsocfl;
    fsocfl=fsocfl->next;
    return result;
  }
  else {
    result = ((fsoc*)(se_malloc(FSOC_SIZE)));
    fsoc_count++;
    gc_update_ceils();
    gc_add_into_gcmt((mch*)result);
    return result;
  }
}

/****************************************************************************
 * Generic code for architectures where addresses decrease as the stack grows.
 ****************************************************************************/

void mark_stack_and_registers(void){
  void** max = stack_bottom;
  JMP_BUF registers;   /* The jmp_buf buffer is in the C stack. */
  void**stack_pointer; /* Used to traverse the stack and registers assuming
                          that `setjmp' will save registers in the C stack.
                       */

  (void)SETJMP(registers);  /* To fill the C stack with registers. */
  stack_pointer = (void**)(void*)(&registers);

#  if !defined(SE_BOOST)
  if (stack_pointer > max) {
    fprintf(stderr, "Wrong stack direction: the stack addresses increase as the stack grows (or complex stack management). Please drop an e-mail to liberty-eiffel@gnu.org\n");
    exit(1); }
#  endif

  while (stack_pointer <= max) {
    gc_mark(*(stack_pointer++));
  }
}


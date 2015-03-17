expanded class WEIGHTED_CREATION_PROCEDURE

insert
   COMPARABLE

create {ANY}
   default_create, make

feature {ANY}
   infix "<" (other: like Current): BOOLEAN
      do
         if dead_expanded_count = other.dead_expanded_count then
            if live_expanded_count = other.live_expanded_count then
               if is_live = other.is_live then
                  Result := kernel_count < other.kernel_count
               else
                  Result := is_live
               end
            else
               Result := live_expanded_count < other.live_expanded_count
            end
         else
            Result := dead_expanded_count < other.dead_expanded_count
         end
      end

feature {}
   make (creation_procedure_stamp: FEATURE_STAMP; creation_name_: like creation_name; type: TYPE)
      local
         args: FORMAL_ARG_LIST
         j: INTEGER
         arg_type: TYPE
         arg_live_type: LIVE_TYPE
      do
         creation_procedure ::= creation_procedure_stamp.anonymous_feature(type)
         creation_name := creation_name_
         is_live := type.live_type.collected(creation_procedure_stamp)
         args := creation_procedure.arguments
         if args /= Void then
            from
               j := args.count
            until
               j < 1
            loop
               arg_type := args.type_mark(j).resolve_in(type)
               if arg_type.is_reference or else arg_type.is_kernel_expanded then
                  kernel_count := kernel_count + 1
               else
                  arg_live_type := arg_type.live_type
                  if arg_live_type /= Void and then arg_live_type.at_run_time then
                     live_expanded_count := live_expanded_count + 1
                  else
                     dead_expanded_count := dead_expanded_count + 1
                  end
               end
               j := j - 1
            end
         end
      end

feature {WEIGHTED_CREATION_PROCEDURE}
   dead_expanded_count, live_expanded_count, kernel_count: INTEGER

   is_live: BOOLEAN

feature {ANY}
   creation_procedure: E_ROUTINE

   creation_name: STRING

end -- class WEIGHTED_CREATION_PROCEDURE

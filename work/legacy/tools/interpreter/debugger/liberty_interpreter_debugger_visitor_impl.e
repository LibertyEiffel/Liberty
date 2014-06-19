-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
class LIBERTY_INTERPRETER_DEBUGGER_VISITOR_IMPL

inherit
   LIBERTY_INTERPRETER_DEBUGGER_VISITOR

create {LIBERTY_INTERPRETER_DEBUGGER}
   make

feature {LIBERTY_INTERPRETER_DEBUGGER}
   should_continue: BOOLEAN

feature {LIBERTY_INTERPRETER_DEBUGGER_FACTORY}
   visit_entry (a_entry: LIBERTY_INTERPRETER_DEBUGGER_NON_TERMINAL_NODE)
      do
         should_continue := False
         check
            a_entry.lower = 0
            a_entry.name_at(a_entry.upper).is_equal(once "KW end of line")
            a_entry.count.in_range(2, 3)
         end
         inspect
            a_entry.name_at(0)
         when "KW show" then
            check
               a_entry.name_at(1).is_equal(once "Show")
            end
            a_entry.node_at(1).accept(Current)
         when "KW up" then
            check
               a_entry.name_at(1).is_equal(once "Up")
            end
            a_entry.node_at(1).accept(Current)
         when "KW down" then
            check
               a_entry.name_at(1).is_equal(once "Down")
            end
            a_entry.node_at(1).accept(Current)
         when "KW continue" then
            should_continue := True
         when "KW step" then
            check
               a_entry.name_at(1).is_equal(once "Step")
            end
            a_entry.node_at(1).accept(Current)
            should_continue := True
         when "KW quit" then
            die_with_code(0)
         end
      end

   visit_show (a_show: LIBERTY_INTERPRETER_DEBUGGER_NON_TERMINAL_NODE)
      do
         check
            a_show.lower = 0
         end
         inspect
            a_show.name_at(0)
         when "KW stack" then
            interpreter.show_stack(std_output)
         when "KW frame" then
            interpreter.show_current_frame(std_output)
         end
      end

   visit_step (a_step: LIBERTY_INTERPRETER_DEBUGGER_NON_TERMINAL_NODE)
      local
         step_count_node: EIFFEL_TERMINAL_NODE_IMPL
         step_count: TYPED_EIFFEL_IMAGE[INTEGER_64]
      do
         if a_step.is_empty then
            interpreter.debug_step(1)
         else
            check
               a_step.lower = 0
            end
            inspect
               a_step.name_at(0)
            when "KW in" then
               interpreter.debug_step_in
            when "KW out" then
               interpreter.debug_step_out
            when "KW number" then
               step_count_node ::= a_step.node_at(0)
               step_count ::= step_count_node.image
               if step_count.decoded <= 0 then
                  std_error.put_line(once "Cannot step zero or less times :-)")
               else
                  interpreter.debug_step(step_count.decoded.to_integer_32)
               end
            end
         end
      end

   visit_up (a_up: LIBERTY_INTERPRETER_DEBUGGER_NON_TERMINAL_NODE)
      local
         up_node: EIFFEL_TERMINAL_NODE_IMPL
         up: TYPED_EIFFEL_IMAGE[INTEGER_64]
      do
         if a_up.is_empty then
            set_frame(1)
         else
            check
               a_up.lower = 0
               a_up.name_at(0).is_equal(once "KW number")
            end
            up_node ::= a_up.node_at(0)
            up ::= up_node.image
            set_frame(up.decoded)
         end
      end

   visit_down (a_down: LIBERTY_INTERPRETER_DEBUGGER_NON_TERMINAL_NODE)
      local
         down_node: EIFFEL_TERMINAL_NODE_IMPL
         down: TYPED_EIFFEL_IMAGE[INTEGER_64]
      do
         if a_down.is_empty then
            set_frame(-1)
         else
            check
               a_down.lower = 0
               a_down.name_at(0).is_equal(once "KW number")
            end
            down_node ::= a_down.node_at(0)
            down ::= down_node.image
            set_frame(-(down.decoded))
         end
      end

feature {}
   set_frame (delta: INTEGER_64)
      local
         new_frame: INTEGER
      do
         new_frame := interpreter.current_frame + delta.to_integer_32
         if new_frame <= interpreter.frame_lower then
            std_error.put_line(once "Bottom reached.")
            new_frame := interpreter.frame_lower
         elseif new_frame >= interpreter.frame_upper then
            std_error.put_line(once "Top reached.")
            new_frame := interpreter.frame_upper
         end
         interpreter.set_current_frame(new_frame)
      end

   make (a_interpreter: like interpreter)
      require
         a_interpreter /= Void
      do
         interpreter := a_interpreter
      ensure
         interpreter = a_interpreter
      end

   interpreter: LIBERTY_INTERPRETER

end -- class LIBERTY_INTERPRETER_DEBUGGER_VISITOR_IMPL

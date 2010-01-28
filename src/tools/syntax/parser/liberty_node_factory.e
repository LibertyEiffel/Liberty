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
class LIBERTY_NODE_FACTORY

inherit
	EIFFEL_NODE_FACTORY

create {ANY}
	make

feature {EIFFEL_GRAMMAR}
	list (name: STRING): EIFFEL_LIST_NODE is
		do
			create {EIFFEL_LIST_NODE_IMPL} Result.make(name)
		end

	non_terminal (name: STRING; names: TRAVERSABLE[STRING]): EIFFEL_NON_TERMINAL_NODE is
		do
			inspect
				name
			when "Class" then
				create {LIBERTY_AST_CLASS} Result.make(name, names)
			when "Classes" then
				create {LIBERTY_AST_CLASSES} Result.make(name, names)
			when "One_Class" then
				create {LIBERTY_AST_ONE_CLASS} Result.make(name, names)
			when "Class_Header" then
				create {LIBERTY_AST_CLASS_HEADER} Result.make(name, names)
			when "Obsolete" then
				create {LIBERTY_AST_OBSOLETE} Result.make(name, names)
			when "Invariant" then
				create {LIBERTY_AST_INVARIANT} Result.make(name, names)
			when "Indexing" then
				create {LIBERTY_AST_INDEXING} Result.make(name, names)
			when "Indexing_Clause" then
				create {LIBERTY_AST_INDEXING_CLAUSE} Result.make(name, names)
			when "Inherit" then
				create {LIBERTY_AST_INHERIT} Result.make(name, names)
			when "Insert" then
				create {LIBERTY_AST_INSERT} Result.make(name, names)
			when "Class_Marker" then
				create {LIBERTY_AST_CLASS_MARKER} Result.make(name, names)
			when "Type_Parameters" then
				create {LIBERTY_AST_TYPE_PARAMETERS} Result.make(name, names)
			when "Type_Parameter" then
				create {LIBERTY_AST_TYPE_PARAMETER} Result.make(name, names)
			when "Type_Definition" then
				create {LIBERTY_AST_TYPE_DEFINITION} Result.make(name, names)
			when "Parent_Clause" then
				create {LIBERTY_AST_PARENT_CLAUSE} Result.make(name, names)
			when "Parent" then
				create {LIBERTY_AST_PARENT} Result.make(name, names)
			when "Parent_Rename" then
				create {LIBERTY_AST_PARENT_RENAME} Result.make(name, names)
			when "Parent_Export" then
				create {LIBERTY_AST_PARENT_EXPORT} Result.make(name, names)
			when "Parent_Undefine" then
				create {LIBERTY_AST_PARENT_UNDEFINE} Result.make(name, names)
			when "Parent_Redefine" then
				create {LIBERTY_AST_PARENT_REDEFINE} Result.make(name, names)
			when "Rename" then
				create {LIBERTY_AST_RENAME} Result.make(name, names)
			when "Export" then
				create {LIBERTY_AST_EXPORT} Result.make(name, names)
			when "Export_Features" then
				create {LIBERTY_AST_EXPORT_FEATURES} Result.make(name, names)
			when "Class_Creation" then
				create {LIBERTY_AST_CLASS_CREATION} Result.make(name, names)
			when "Creation_Expression" then
				create {LIBERTY_AST_CREATION_EXPRESSION} Result.make(name, names)
			when "Routine_Definition" then
				create {LIBERTY_AST_ROUTINE_DEFINITION} Result.make(name, names)
			when "Routine_Execution" then
				create {LIBERTY_AST_ROUTINE_EXECUTION} Result.make(name, names)
			when "Require" then
				create {LIBERTY_AST_REQUIRE} Result.make(name, names)
			when "Local_Block" then
				create {LIBERTY_AST_LOCAL_BLOCK} Result.make(name, names)
			when "Do_Block" then
				create {LIBERTY_AST_DO_BLOCK} Result.make(name, names)
			when "Rescue_Block" then
				create {LIBERTY_AST_RESCUE_BLOCK} Result.make(name, names)
			when "Ensure" then
				create {LIBERTY_AST_ENSURE} Result.make(name, names)
			when "External" then
				create {LIBERTY_AST_EXTERNAL} Result.make(name, names)
			when "Declaration" then
				create {LIBERTY_AST_DECLARATION} Result.make(name, names)
			when "Variable" then
				create {LIBERTY_AST_VARIABLE} Result.make(name, names)
			when "Instruction" then
				create {LIBERTY_AST_INSTRUCTION} Result.make(name, names)
			when "Assignment_Or_Call" then
				create {LIBERTY_AST_ASSIGNMENT_OR_CALL} Result.make(name, names)
			when "Call" then
				create {LIBERTY_AST_CALL} Result.make(name, names)
			when "Target" then
				create {LIBERTY_AST_TARGET} Result.make(name, names)
			when "If_Then_Else" then
				create {LIBERTY_AST_IF_THEN_ELSE} Result.make(name, names)
			when "Inspect" then
				create {LIBERTY_AST_INSPECT} Result.make(name, names)
			when "Loop" then
				create {LIBERTY_AST_LOOP} Result.make(name, names)
			when "Check" then
				create {LIBERTY_AST_CHECK} Result.make(name, names)
			when "Debug" then
				create {LIBERTY_AST_DEBUG} Result.make(name, names)
			when "Old_Creation" then
				create {LIBERTY_AST_OLD_CREATION} Result.make(name, names)
			when "Creation" then
				create {LIBERTY_AST_CREATION} Result.make(name, names)
			when "Retry" then
				create {LIBERTY_AST_RETRY} Result.make(name, names)
			when "Writable" then
				create {LIBERTY_AST_WRITABLE} Result.make(name, names)
			when "Expression" then
				create {LIBERTY_AST_EXPRESSION} Result.make(name, names)
			when "r1" then
				create {LIBERTY_AST_R1} Result.make(name, names)
			when "r2" then
				create {LIBERTY_AST_R2} Result.make(name, names)
			when "r3" then
				create {LIBERTY_AST_R3} Result.make(name, names)
			when "r4" then
				create {LIBERTY_AST_R4} Result.make(name, names)
			when "r5" then
				create {LIBERTY_AST_R5} Result.make(name, names)
			when "r6" then
				create {LIBERTY_AST_R6} Result.make(name, names)
			when "r7" then
				create {LIBERTY_AST_R7} Result.make(name, names)
			when "r8" then
				create {LIBERTY_AST_R8} Result.make(name, names)
			when "r10" then
				create {LIBERTY_AST_R10} Result.make(name, names)
			when "e1" then
				create {LIBERTY_AST_E1} Result.make(name, names)
			when "e2" then
				create {LIBERTY_AST_E2} Result.make(name, names)
			when "e3" then
				create {LIBERTY_AST_E3} Result.make(name, names)
			when "e4" then
				create {LIBERTY_AST_E4} Result.make(name, names)
			when "e5" then
				create {LIBERTY_AST_E5} Result.make(name, names)
			when "e6" then
				create {LIBERTY_AST_E6} Result.make(name, names)
			when "e7" then
				create {LIBERTY_AST_E7} Result.make(name, names)
			when "e8" then
				create {LIBERTY_AST_E8} Result.make(name, names)
			when "e9" then
				create {LIBERTY_AST_E9} Result.make(name, names)
			when "e10" then
				create {LIBERTY_AST_E10} Result.make(name, names)
			when "Precursor_Type_Mark" then
				create {LIBERTY_AST_PRECURSOR_TYPE_MARK} Result.make(name, names)
			when "If" then
				create {LIBERTY_AST_IF} Result.make(name, names)
			when "ElseIf" then
				create {LIBERTY_AST_IF} Result.make(name, names)
			when "Else" then
				create {LIBERTY_AST_ELSE} Result.make(name, names)
			when "When" then
				create {LIBERTY_AST_WHEN} Result.make(name, names)
			when "When_Slice" then
				create {LIBERTY_AST_WHEN_SLICE} Result.make(name, names)
			when "When_Value" then
				create {LIBERTY_AST_WHEN_VALUE} Result.make(name, names)
			when "Actuals" then
				create {LIBERTY_AST_ACTUALS} Result.make(name, names)
			when "Actual" then
				create {LIBERTY_AST_ACTUAL} Result.make(name, names)
			when "Array" then
				create {LIBERTY_AST_ARRAY} Result.make(name, names)
			when "Expression_No_Array" then
				create {LIBERTY_AST_EXPRESSION_NO_ARRAY} Result.make(name, names)
			when "Agent_Signature" then
				create {LIBERTY_AST_AGENT_SIGNATURE} Result.make(name, names)
			when "Manifest_Or_Type_Test" then
				create {LIBERTY_AST_MANIFEST_OR_TYPE_TEST} Result.make(name, names)
			when "Feature" then
				create {LIBERTY_AST_FEATURE} Result.make(name, names)
			when "Feature_Definition" then
				create {LIBERTY_AST_FEATURE_DEFINITION} Result.make(name, names)
			when "Signature" then
				create {LIBERTY_AST_SIGNATURE} Result.make(name, names)
			when "Feature_Name" then
				create {LIBERTY_AST_FEATURE_NAME} Result.make(name, names)
			when "Feature_Name_Or_Alias" then
				create {LIBERTY_AST_FEATURE_NAME_OR_ALIAS} Result.make(name, names)
			when "Alias" then
				create {LIBERTY_AST_ALIAS} Result.make(name, names)
			when "Effective_Type_Parameters" then
				create {LIBERTY_AST_EFFECTIVE_TYPE_PARAMETERS} Result.make(name, names)
			when "Effective_Type_Parameter" then
				create {LIBERTY_AST_EFFECTIVE_TYPE_PARAMETER} Result.make(name, names)
			when "Require_Else" then
				create {LIBERTY_AST_REQUIRE_ELSE} Result.make(name, names)
			when "Ensure_Then" then
				create {LIBERTY_AST_ENSURE_THEN} Result.make(name, names)
			when "Debug_Keys" then
				create {LIBERTY_AST_DEBUG_KEYS} Result.make(name, names)
			when "From" then
				create {LIBERTY_AST_FROM} Result.make(name, names)
			when "Variant" then
				create {LIBERTY_AST_VARIANT} Result.make(name, names)
			when "Assertion" then
				create {LIBERTY_AST_ASSERTION} Result.make(name, names)
			when "Assertion_Tag" then
				create {LIBERTY_AST_ASSERTION_TAG} Result.make(name, names)
			when "Assertion_Expression" then
				create {LIBERTY_AST_ASSERTION_EXPRESSION} Result.make(name, names)
			when "Clients" then
				create {LIBERTY_AST_CLIENTS} Result.make(name, names)
			when "Client" then
				create {LIBERTY_AST_CLIENT} Result.make(name, names)
			end
		end

	terminal (name: STRING; image: EIFFEL_IMAGE): EIFFEL_TERMINAL_NODE is
		do
			inspect
				name
			when "KW class name" then
				create {LIBERTY_AST_CLASS_NAME} Result.make(name, image)
			when "KW entity name" then
				create {LIBERTY_AST_ENTITY_NAME} Result.make(name, image)
			when "KW number" then
				create {LIBERTY_AST_NUMBER} Result.make(name, image)
			when "KW character" then
				create {LIBERTY_AST_CHARACTER} Result.make(name, image)
			when "KW string" then
				create {LIBERTY_AST_STRING} Result.make(name, image)
			else
				-- most keywords don't hold any information in their image;
				-- we don't need to distinguish them.
				create {LIBERTY_AST_KEYWORD} Result.make(name, image)
			end
		end

feature {}
	make is
		do
		end

end -- class LIBERTY_NODE_FACTORY


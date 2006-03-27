indexing
	description: "MessageType -- The type of message being displayed in a dialog."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class MESSAGE_TYPES
inherit GTK_MESSAGE_TYPE
		rename
			gtk_message_info as info_message,
			gtk_message_warning as warning_message,
			gtk_message_question as question_message,
			gtk_message_error as error_message
		end
end


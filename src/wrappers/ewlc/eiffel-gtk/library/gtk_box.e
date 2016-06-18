note
	description: "GtkBox - Base class for box containers."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_BOX
	-- Gtkbox is an abstract widget which encapsulates functionallity
	-- for a particular kind of container, one that organizes a
	-- variable number of widgets into a rectangular area. GtkBox
	-- currently has two derived classes, GtkHBox and GtkVBox.

	-- The rectangular area of a GtkBox is organized into either a
	-- single row or a single column of child widgets depending upon
	-- whether the box is of type GtkHBox or GtkVBox,
	-- respectively. Thus, all children of a GtkBox are allocated one
	-- dimension in common, which is the height of a row, or the width
	-- of a column.

	-- GtkBox uses a notion of packing. Packing refers to adding
	-- widgets with reference to a particular position in a
	-- GtkContainer. For a GtkBox, there are two reference positions:
	-- the start and the end of the box. For a GtkVBox, the start is
	-- defined as the top of the box and the end is defined as the
	-- bottom. For a GtkHBox the start is defined as the left side and
	-- the end is defined as the right side.
	
	-- Use repeated calls to `pack_start' to pack widgets into a GtkBox
	-- from start to end. Use `pack_end' to add widgets from
	-- end to start. You may intersperse these calls and add widgets
	-- from both ends of the same GtkBox.

	-- Use `pack_start_defaults' or `pack_end_defaults' to pack widgets
	-- into a GtkBox if you do not need to specify the expand, fill, or
	-- padding attributes of the child to be added.

	-- Because GtkBox is a GtkContainer, you may also use `add' to
	-- insert widgets into the box, and they will be packed as if with
	-- `pack_start_defaults'. Use `remove' to remove widgets from the
	-- GtkBox.

	-- Use `set_homogeneous' and `unset_homogeneous' to specify whether
	-- or not all children of the GtkBox are forced to get the same
	-- amount of space.

	-- Use `set_spacing' to determine how much space will be minimally
	-- placed between all children in the GtkBox.

	-- Use `reorder_child' to move a GtkBox child to a different place
	-- in the box.

	-- Use `set_child_packing_start' and `set_child_packing_end' to
	-- reset the expand, fill, and padding attributes of any GtkBox
	-- child. Use `child_packing' to query these fields.

inherit
	GTK_CONTAINER
		
		-- TODO: GtkBox implements AtkImplementorIface.

insert GTK_BOX_EXTERNALS

feature {} -- Hack to avoid warnings

	-- make_container is
	-- obsolete "Hack to avoid warnings. It will never be called"
	--	do
	--	check this_should_not_be_called: False end
	-- end

feature {ANY}

	pack_start (a_widget: GTK_WIDGET; expand,fill: BOOLEAN; a_padding: INTEGER)
			-- Add `a_widget' to box, packed with reference to the start
			-- of box. The child is packed after any other child packed
			-- with reference to the start of box.  When `expand' is True
			-- the new child is to be given extra space allocated to
			-- box. The extra space will be divided evenly between all
			-- children of box that use this option. When `fill' is True
			-- the space given to child by the expand option is actually
			-- allocated to child, rather than just padding it. This
			-- parameter has no effect if expand is set to False. A child
			-- is always allocated the full height of a GtkHBox and the
			-- full width of a GtkVBox. This option affects the other
			-- dimension. `padding' is the extra space in pixels to put
			-- between this child and its neighbors, over and above the
			-- global amount specified by spacing in GtkBox-struct. If
			-- child is a widget at one of the reference ends of box,
			-- then padding pixels are also put between child and the
			-- reference edge of box.
		require
			a_widget /= Void
		do
			gtk_box_pack_start (handle,a_widget.handle,
									  expand.to_integer, fill.to_integer,
									  a_padding);
		end

	pack_end (a_widget: GTK_WIDGET; expand,fill: BOOLEAN; a_padding: INTEGER)
			-- Adds `a_widget' to box, packed with reference to the end
			-- of box. The child is packed after (away from end of) any
			-- other child packed with reference to the end of box. See pack_end
		require
			a_widget /= Void
		do
			gtk_box_pack_end (handle,a_widget.handle,
									expand.to_integer, fill.to_integer,
									a_padding);
		end

		
	pack_start_defaults (a_widget: GTK_WIDGET)
			-- Add `a_widget' to box, packed with reference to the start
			-- of box. The child is packed after any other child packed
			-- with reference to the start of box.  Parameters for how to
			-- pack the child widget, expand, fill, and padding in
			-- GtkBoxChild-struct, are given their default values, TRUE,
			-- TRUE, and 0, respectively.
		require
			a_widget /= Void
		do
			gtk_box_pack_start_defaults (handle, a_widget.handle)
		end

	pack_end_defaults (a_widget: GTK_WIDGET)
			-- Add `a_widget' to box, packed with reference to the end
			-- of box. The child is packed after any other child packed
			-- with reference to the end of box.  Parameters for how to
			-- pack the child widget, expand, fill, and padding in
			-- GtkBoxChild-struct, are given their default values, TRUE,
			-- TRUE, and 0, respectively.
		require
			a_widget /= Void
		do
			gtk_box_pack_end_defaults (handle, a_widget.handle)
		end


	is_homogeneous: BOOLEAN
			-- Is the box homogeneous? It means that all children are the same size
		do
			Result:=(gtk_box_get_homogeneous(handle)).to_boolean
		end

	set_homogeneous
			-- Give all children of box equal space in the box.
		do
			gtk_box_set_homogeneous (handle,1)
		end

	unset_homogeneous
			-- Give children of box variable space in the box.
		do
			gtk_box_set_homogeneous (handle,0)
		end

	spacing: INTEGER
		do
			Result:= gtk_box_get_spacing (handle)
		end
	

	set_spacing (a_spacing: INTEGER)
			-- Sets the spacing field of GTK_BOX, which is the number of
			-- pixels to place between children of box.
		do
			gtk_box_set_spacing (handle,a_spacing)
		end

	reorder_child (a_child: GTK_WIDGET; a_position: INTEGER)
			-- Moves `a_child' to a new position in the list of box
			-- children. The list is the children field of GtkBox-struct,
			-- and contains both widgets packed GTK_PACK_START as well as
			-- widgets packed GTK_PACK_END, in the order that these
			-- widgets were added to box. A widget's position in the box
			-- children list determines where the widget is packed into
			-- box. A child widget at some position in the list will be
			-- packed just after all other widgets of the same packing
			-- type that appear earlier in the list. `a_position' is the
			-- new position for child in the children list of
			-- GtkBox-struct, starting from 0. If negative, indicates the
			-- end of the list.
		require valid_child: a_child/=Void
		do
			gtk_box_reorder_child (handle, a_child.handle,a_position)
		end


	child_packing (a_child: GTK_WIDGET): TUPLE[BOOLEAN,BOOLEAN,INTEGER,INTEGER]
			-- informations about how child is packed into box, with format

			-- [expand, fill, padding, pack_type]
		
		require valid_child: a_child/=Void
		local expand,fill: BOOLEAN; padding,pack_type: INTEGER
		do
			gtk_box_query_child_packing (handle,a_child.handle,
												  $expand,$fill,$padding,$pack_type)
			Result := [expand,fill, padding,pack_type]
		ensure valid_packing: is_valid_gtk_pack_type (Result.item_4)
		end

	set_child_packing_start (a_child: GTK_WIDGET; expand,fill: BOOLEAN; a_padding: INTEGER)
			-- Sets the way child is packed into box. From the start
		require valid_child: a_child/=Void
		do
			gtk_box_set_child_packing (handle,  a_child.handle, expand.to_integer, fill.to_integer,
												a_padding, gtk_pack_start)
		end
	set_child_packing_end (a_child: GTK_WIDGET; expand,fill: BOOLEAN; a_padding: INTEGER)
			-- Sets the way child is packed into box. From the end
		require valid_child: a_child/=Void
		do
			gtk_box_set_child_packing (handle,  a_child.handle, expand.to_integer, fill.to_integer,
												a_padding, gtk_pack_end)
		end

	feature -- Property Details TODO
-- The "homogeneous" property

--   "homogeneous"          gboolean              : Read / Write

-- Whether the children should all be the same size.

-- Default value: FALSE
-- The "spacing" property

--   "spacing"              gint                  : Read / Write

-- The amount of space between children.

-- Allowed values: >= 0

-- Default value: 0
-- Child Property Details
-- The "expand" child property

--   "expand"               gboolean              : Read / Write

-- Whether the child should receive extra space when the parent grows.

-- Default value: TRUE
-- The "fill" child property

--   "fill"                 gboolean              : Read / Write

-- Whether extra space given to the child should be allocated to the child or used as padding.

-- Default value: TRUE
-- The "pack-type" child property

--   "pack-type"            GtkPackType           : Read / Write

-- A GtkPackType indicating whether the child is packed with reference to the start or end of the parent.

-- Default value: GTK_PACK_START
-- The "padding" child property

--   "padding"              guint                 : Read / Write

-- Extra space to put between the child and its neighbors, in pixels.

-- Allowed values: <= G_MAXINT

-- Default value: 0
-- The "position" child property

--   "position"             gint                  : Read / Write

-- The index of the child in the parent.

-- Allowed values: >= -1

-- Default value: 0

end

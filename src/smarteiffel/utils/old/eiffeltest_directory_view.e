class EIFFELTEST_DIRECTORY_VIEW

inherit
   GRAPHIC
   LAYOUT
      redefine set_container, container
      end

create {EIFFELTEST}
   make

feature {ANY}
   container: SUB_WINDOW

   set_container (c: like container)
      do
         container := c
         container.set_background_color(white_color)
         if eiffeltest.locked_directories.valid_index(index) then
            container.set_requisition(20, 20, 80, 80)
         else
            container.set_requisition(0, 0, 0, 0)
         end
      end

   redo_layout (x, y: INTEGER)
      do
         check
            container.child.count = 0
         end
      end

   update_requisition
      local
         min_w, min_h, std_w, std_h: INTEGER
      do
         if eiffeltest.locked_directories.valid_index(index) then
            min_w := 20
            min_h := 20
            std_w := 80
            std_h := 80
            if tiny_mode then
               std_h := 20
            end
         else
            min_w := 0
            min_h := 0
            std_w := 0
            std_h := 0
         end
         if min_w /= container.min_width or else
            min_h /= container.min_height or else
            std_w /= container.std_width or else
            std_h /= container.std_height
          then
            container.set_requisition(min_w, min_h, std_w, std_h)
         end
      end

feature {CONTAINER}
   expose_paint
      local
         locked_directory, now_running: STRING; log_ref_size, log_new_size: INTEGER; has_failures: BOOLEAN
      do
         if eiffeltest.locked_directories.valid_index(index) then
            locked_directory := eiffeltest.locked_directories.item(index)
            now_running := now_running_of(locked_directory, once "log.new")
            log_ref_size := size_of(locked_directory, once "log.ref")
            log_new_size := size_of(locked_directory, once "log.new")
            has_failures := not same_files(locked_directory, once "log.ref", once "log.new")

            if log_ref_size = 0 then
               log_ref_size := 100
               log_new_size := 50
            elseif log_new_size > log_ref_size then
               log_new_size := log_ref_size
            end

            draw(locked_directory, now_running, log_ref_size, log_new_size, has_failures)
         end
      end

feature {EIFFELTEST}
   redraw
      local
         locked_directory: STRING; log_ref_size, log_new_size: INTEGER
      do
         if eiffeltest.locked_directories.valid_index(index) then
            locked_directory := eiffeltest.locked_directories.item(index)
            log_ref_size := size_of(locked_directory, once "log.ref")
            log_new_size := size_of(locked_directory, once "log.new")
            if log_new_size_memory /= log_new_size or else log_ref_size_memory /= log_ref_size then
               log_ref_size_memory := log_ref_size
               log_new_size_memory := log_new_size
               container.clear
            end
         elseif log_ref_size_memory /= 0 then
            log_ref_size_memory := 0
            container.clear
         end
      end

feature {}
   eiffeltest: EIFFELTEST

   index: INTEGER

   make (et: like eiffeltest; i: like index)
      require
         et /= Void
         i >= 0
      do
         eiffeltest := et
         index := i
      ensure
         eiffeltest = et
         index = i
      end

   draw_kit_black: DRAW_KIT
      once
         create Result
      end

   draw_kit_red: DRAW_KIT
      once
         create Result
         Result.set_line_width(5)
         Result.set_color(red_color)
      end

   draw_kit_green: DRAW_KIT
      once
         create Result
         Result.set_line_width(5)
         Result.set_color(green_color)
      end

   tiny_mode: BOOLEAN
      do
         Result := container.width < 200
      end

   draw (locked_directory, now_running: STRING; log_ref_size, log_new_size: INTEGER; has_failures: BOOLEAN)
      require
         log_ref_size > 0
         log_new_size.in_range(0, log_ref_size)
      local
         x, y, w_max, w_done: INTEGER details_mode: BOOLEAN
      do
         draw_kit_black.set_drawable(container)

         w_max := container.width - 6
         x := 3

         details_mode := (container.height > 60) and not tiny_mode
         if details_mode then
            unicode_string.clear_count
            if unicode_string.utf8_decode_from(locked_directory) then
               draw_kit_black.put_string(unicode_string, x, y)
               y := y + 25
            end

            unicode_string.clear_count
            if unicode_string.utf8_decode_from(now_running) then
               draw_kit_black.put_string(unicode_string, x, y)
               y := y + 30
            end
         end

         w_done := ((log_new_size / log_ref_size) * w_max).force_to_integer_32

         if w_done > 0 then
            if has_failures then
               draw_kit_red.set_drawable(container)
               draw_kit_red.fill_rectangle(x, y, w_done, 10)
            else
               draw_kit_green.set_drawable(container)
               draw_kit_green.fill_rectangle(x, y, w_done, 10)
            end
         end
         draw_kit_black.rectangle(x, y, w_max, 10)
      end

   log_new_size_memory, log_ref_size_memory: INTEGER

   unicode_string: UNICODE_STRING
      once
         create Result.make(0)
      end

   basic_directory: BASIC_DIRECTORY

   file_tools: FILE_TOOLS

   tfr1: TEXT_FILE_READ
      once
         create Result.make
      end

   tfr2: TEXT_FILE_READ
      once
         create Result.make
      end

   size_of (dirpath: STRING; file_name: STRING): INTEGER
      local
         file_path: STRING
      do
         basic_directory.compute_subdirectory_with(dirpath, once "eiffeltest")
         file_path := once ""
         file_path.copy(basic_directory.last_entry)
         basic_directory.compute_file_path_with(file_path, file_name)
         file_path.copy(basic_directory.last_entry)
         Result := file_tools.size_of(file_path).max(0)
      end

   same_files (dirpath: STRING; ref, new: STRING): BOOLEAN
         -- Tests that the ref file is equal to the new file for the length of the new file
      local
         ref_path, new_path: STRING
      do
         basic_directory.compute_subdirectory_with(dirpath, once "eiffeltest")
         ref_path := once ""
         ref_path.copy(basic_directory.last_entry)
         basic_directory.compute_file_path_with(ref_path, ref)
         ref_path.copy(basic_directory.last_entry)
         basic_directory.compute_subdirectory_with(dirpath, once "eiffeltest")
         new_path := once ""
         new_path.copy(basic_directory.last_entry)
         basic_directory.compute_file_path_with(new_path, new)
         new_path.copy(basic_directory.last_entry)
         Result := True
         tfr1.connect_to(ref_path)
         if tfr1.is_connected then
            tfr2.connect_to(new_path)
            if tfr2.is_connected then
               from
                  tfr1.read_character
                  tfr2.read_character
               until
                  not Result or else tfr1.end_of_input or else tfr2.end_of_input
               loop
                  Result := tfr1.last_character = tfr2.last_character
                  tfr1.read_character
                  tfr2.read_character
               end
               if Result and then tfr1.end_of_input and then not tfr2.end_of_input then
                  Result := False
               end
               tfr2.disconnect
            end
            tfr1.disconnect
         end
      end

   now_running_of (dirpath: STRING; file_name: STRING): STRING
      local
         file_path: STRING
      do
         Result := once "............................................................"
         basic_directory.compute_subdirectory_with(dirpath, once "eiffeltest")
         file_path := basic_directory.last_entry.twin
         basic_directory.compute_file_path_with(file_path, file_name)
         file_path.copy(basic_directory.last_entry)
         text_file_read.connect_to(file_path)
         Result.copy(once "   ")
         if text_file_read.is_connected then
            from
            until
               text_file_read.end_of_input
            loop
               text_file_read.read_line
               if not text_file_read.last_string.is_empty then
                  Result.copy(text_file_read.last_string)
               end
            end
            text_file_read.disconnect
         end
      ensure
         Result /= Void
      end

   text_file_read: TEXT_FILE_READ
      once
         create Result.make
      end

end

#!/usr/bin/awk -f

# print .id live types in JSON format (some information is not generated)

function reset() {
   dead = -1;
   class_name = "";
   class_path = "";
   inherit = "";
   insert = "";
   rts = "";
   is_ref = 0;
   id = 0;
}

function print_cell() {
   if (id && class_path != "") {
      if (more) printf(",\n");
      printf("  \"%s\": {\n    \"cluster\": \"%s\",\n    \"class\": %s,\n    \"path\": %s,\n", id, cluster_name, class_name, class_path);
      if (dead != -1) {
         printf("    \"alive\": %s,\n", dead ? "false":"true");
         if (!dead) {
            printf("    \"is-reference\": %s,\n", is_ref ? "true":"false");
         }
      }
      printf("    \"inherit\": [%s],\n    \"insert\": [%s],\n    \"run-time-set\": [%s],\n", inherit, insert, rts);
      printf("  }");
      more = 1;
   }
   reset();
}

BEGIN {
   reset();
   more = 0;
   cluster_name = "";
   print "{";
}

/^\t/ {
   i = substr($2, 2, length($2) - 2);
   if (rts == "") {
      rts = sprintf("\"%s\"", i);
   }
   else {
      rts = sprintf("%s, \"%s\"", rts, i);
   }
   next
}

/^\|/ {
   cluster_name = substr($0, 2);
   next
}

/^#/ {
   print_cell();
   next
}

$1 ~ /[0-9]+/ {
   id = $1;
   class_name = $2;
   if ($3 != "l") dead = 1;
   next
}

/^class-path:/ {
   class_path = $2;
   next
}

/^ref-status:/ {
   if (dead == -1 && $2 == "dead") {
      dead = 1;
   }
   is_ref = 1;
   next
}

/^run-time-set-count:/ {
   if (dead == -1) {
      if ($2 > 0) {
         dead = 0;
      }
      else {
         dead = 1;
      }
   }
   next
}

/^parent-count:/ {
   array = ""; tag = "";
   for (i = 3; i <= NF; i++) {
      if ($i == "inherit:" || $i == "insert:") {
         if (tag == "inherit:") {
            inherit = array;
         }
         else if (tag == "insert:") {
            insert = array;
         }
         array = "";
         tag = $i;
      }
      else {
         if (array == "") {
            array = sprintf("\"%s\"", $i);
         }
         else {
            array = sprintf("%s, \"%s\"", array, $i);
         }
      }
   }
   if (tag == "inherit:") {
      inherit = array;
   }
   else if (tag == "insert:") {
      insert = array;
   }
   next
}

END {
   print_cell();
   if (more) printf("\n");
   print "}";
}

#!/usr/bin/env python

import re
import sys

eiffel_feature = re.compile(r'^\s*(?P<feature_name>\w+)(?P<signature> \(((; )?((, )?(\w+))+: (\w+(\[\w+\])?))*\))?(: (?P<result_type>\w+))? is$')
eiffel_signature = re.compile(r'(?P<locals>((, )?(\w+))+): (NATIVE_ARRAY\[(?P<array_type>\w+)\]|(?P<type>\w+))')
eiffel_locals = re.compile(r'(?P<local>\w+)')

code = sys.argv[1]
symbol = sys.argv[2]
classname = sys.argv[3][:-2].upper()

i = 5
while i > 0:
    line = sys.stdin.readline()
    match = eiffel_feature.match(line)
    if match:
        feature = match.groupdict()

        feature_name = "liberty_plugin__%s__%s" % (classname, feature["feature_name"])

        r = feature["result_type"]
        if r:
            result_type = "EIF_%s" % r
            do_return = " return"
        else:
            result_type = "void"
            do_return = ""

        c_signature = ""
        c_locals = ""

        s = feature["signature"]
        if s:
            i = 0
            for match in eiffel_signature.finditer(s):
                signature = match.groupdict()
                if signature["type"]:
                    local_type = "EIF_%s" % signature["type"]
                else:
                    local_type = "EIF_%s*" % signature["array_type"]
                for match in eiffel_locals.finditer(signature["locals"]):
                    local = match.groupdict()["local"]
                    if i:
                        c_signature = c_signature + ", "
                        c_locals = c_locals + ", "
                    i = i + 1
                    c_signature = c_signature + "%s a%d" % (local_type, i)
                    c_locals = c_locals + "a%d" % i
            c_locals = "(" + c_locals + ")"

        if code == "code":
            print "%s __attribute__((visibility(\"default\"))) %s(%s) {%s %s%s; }" % (result_type, feature_name, c_signature, do_return, symbol, c_locals)
        elif code == "header":
            print "extern %s %s(%s);" % (result_type, feature_name, c_signature)

        i = 0
    else:
        i = i - 1

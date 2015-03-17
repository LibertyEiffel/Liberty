#!/bin/bash

{
    find query -name \*.e
    find model -name \*.e
} | while read eiffel; do
    name=$(basename $eiffel)
    class=$(echo ${name%.e} | tr '[a-z]' '[A-Z]')
    visitor_name=${name%.e}_visitor.e
    visitor_class=$(echo ${visitor_name%.e} | tr '[a-z]' '[A-Z]')
    visitor_feature=$(echo ${class#DATA_} | tr '[A-Z]' '[a-z]')
    if [ ! -r visitor/$visitor_name ]; then
	if grep -q -E '(deferred|expanded)' $eiffel; then
	    :
	else
	    echo $class' -> '$visitor_class'.visit_'$visitor_feature
	    cat >visitor/$visitor_name <<EOF
deferred class $visitor_class

inherit
	VISITOR

feature {$class}
	visit_$visitor_feature (a_$visitor_feature: $class) is
		deferred
		end

end
EOF
	fi
    fi
done

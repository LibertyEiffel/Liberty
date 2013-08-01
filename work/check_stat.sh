#!/bin/sh

# This program makes a few stats on class client clauses, trying to understand why the doc is so big

export LIBERTY_HOME=$(cd $(dirname $(readlink -f $0))/..; pwd)
mkdir -p $LIBERTY_HOME/target/log

cd $LIBERTY_HOME/src
for section in *; do
    if [ -d $section ]; then
        find $section -name \*.e -exec egrep -Ho '^(feature|create|creation) *{[^}]*}' {} + | sed -r 's/(feature|create|creation) \{//g;s/\}$//g' | sort -u | awk -vsection=$section -F: '

function clean(source) {
    a = source;
    delete class_clients;
}

function record_client(client,    i) {
    class_clients[client] = class_clients[client] + 1;
    all_clients[client] = all_clients[client] + 1;
}

function record(clients,    i) {
    nb = split(clients, feature_clients, ", *");
    if (nb) {
        for (i = 1; i <= nb; i++) {
            record_client(feature_clients[i]);
        }
    } else {
        record_client("NONE");
    }
}

function list_clients(    r, i, client, sorted_clients) {
    nb = asorti(class_clients, sorted_clients);
    r = sorted_clients[1];
    for (i = 2; i <= nb; i++) {
        client = sorted_clients[i];
        r = sprintf("%s, %s", r, client);
    }
    return r;
}

BEGIN {
    n = 0;
    i = 0;
    m = 0;
    o = 0;
    clean("NONE");
    delete all_clients;
}

{
    if ($1 != a) {
        i = length(class_clients);
        if (i) {
            printf("%d %s [%s]\n",i,a,list_clients());
            n++;
            m += i;
            o += i*i;
        }
        clean($1);
    }

    record($2);
}

END {
    if (n) {
        total = sprintf("Total: [1;36m%5d[m\t(%5d classes, %5d different clients)", m, n, length(all_clients));
        mean = sprintf("Mean: [1;33m%g[m", 1.0*m/n);
        sdev = sprintf("Std deviation: [1;32m%g[m", sqrt(1.0*o/n/n));
        printf("%14s %-65s %-30s %-30s\n", section, total, mean, sdev);
    }
}' > $LIBERTY_HOME/target/log/stat-$section.txt

        tail -n 1 $LIBERTY_HOME/target/log/stat-$section.txt
    fi
done

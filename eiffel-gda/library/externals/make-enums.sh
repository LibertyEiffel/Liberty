#!/bin/sh

## Creates Gnome Data Access enumerations

PACKAGE=libgda3-dev
HEADERS_PATH=/usr/include/libgda-3.0/libgda
HEADER="<libgda/libgda.h>"

if [ -d $HEADERS_PATH ]
then
    ##/usr/include/libgda-3.0/libgda/gda-client.h \
    ../../../scripts/create-enums.sh \
    /usr/include/libgda-3.0/libgda/gda-blob-op.h \
    /usr/include/libgda-3.0/libgda/gda-column.h \
    /usr/include/libgda-3.0/libgda/gda-column-index.h \
    /usr/include/libgda-3.0/libgda/gda-command.h \
    /usr/include/libgda-3.0/libgda/gda-config.h \
    /usr/include/libgda-3.0/libgda/gda-connection-event.h \
    /usr/include/libgda-3.0/libgda/gda-connection.h \
    /usr/include/libgda-3.0/libgda/gda-connection-private.h \
    /usr/include/libgda-3.0/libgda/gda-data-access-wrapper.h \
    /usr/include/libgda-3.0/libgda/gda-data-handler.h \
    /usr/include/libgda-3.0/libgda/gda-data-model-array.h \
    /usr/include/libgda-3.0/libgda/gda-data-model-extra.h \
    /usr/include/libgda-3.0/libgda/gda-data-model-filter-sql.h \
    /usr/include/libgda-3.0/libgda/gda-data-model.h \
    /usr/include/libgda-3.0/libgda/gda-data-model-hash.h \
    /usr/include/libgda-3.0/libgda/gda-data-model-import.h \
    /usr/include/libgda-3.0/libgda/gda-data-model-index.h \
    /usr/include/libgda-3.0/libgda/gda-data-model-iter.h \
    /usr/include/libgda-3.0/libgda/gda-data-model-private.h \
    /usr/include/libgda-3.0/libgda/gda-data-model-query.h \
    /usr/include/libgda-3.0/libgda/gda-data-model-row.h \
    /usr/include/libgda-3.0/libgda/gda-data-proxy.h \
    /usr/include/libgda-3.0/libgda/gda-decl.h \
    /usr/include/libgda-3.0/libgda/gda-dict-aggregate.h \
    /usr/include/libgda-3.0/libgda/gda-dict-constraint.h \
    /usr/include/libgda-3.0/libgda/gda-dict-database.h \
    /usr/include/libgda-3.0/libgda/gda-dict-field.h \
    /usr/include/libgda-3.0/libgda/gda-dict-function.h \
    /usr/include/libgda-3.0/libgda/gda-dict.h \
    /usr/include/libgda-3.0/libgda/gda-dict-private.h \
    /usr/include/libgda-3.0/libgda/gda-dict-reg-aggregates.h \
    /usr/include/libgda-3.0/libgda/gda-dict-reg-functions.h \
    /usr/include/libgda-3.0/libgda/gda-dict-reg-queries.h \
    /usr/include/libgda-3.0/libgda/gda-dict-reg-types.h \
    /usr/include/libgda-3.0/libgda/gda-dict-table.h \
    /usr/include/libgda-3.0/libgda/gda-dict-type.h \
    /usr/include/libgda-3.0/libgda/gda-entity-field.h \
    /usr/include/libgda-3.0/libgda/gda-entity.h \
    /usr/include/libgda-3.0/libgda/gda-enums.h \
    /usr/include/libgda-3.0/libgda/gda-enum-types.h \
    /usr/include/libgda-3.0/libgda/gda-graphviz.h \
    /usr/include/libgda-3.0/libgda/gda-log.h \
    /usr/include/libgda-3.0/libgda/gda-marshal.h \
    /usr/include/libgda-3.0/libgda/gda-object.h \
    /usr/include/libgda-3.0/libgda/gda-object-ref.h \
    /usr/include/libgda-3.0/libgda/gda-parameter.h \
    /usr/include/libgda-3.0/libgda/gda-parameter-list.h \
    /usr/include/libgda-3.0/libgda/gda-parameter-util.h \
    /usr/include/libgda-3.0/libgda/gda-quark-list.h \
    /usr/include/libgda-3.0/libgda/gda-query-condition.h \
    /usr/include/libgda-3.0/libgda/gda-query-field-agg.h \
    /usr/include/libgda-3.0/libgda/gda-query-field-all.h \
    /usr/include/libgda-3.0/libgda/gda-query-field-field.h \
    /usr/include/libgda-3.0/libgda/gda-query-field-func.h \
    /usr/include/libgda-3.0/libgda/gda-query-field.h \
    /usr/include/libgda-3.0/libgda/gda-query-field-value.h \
    /usr/include/libgda-3.0/libgda/gda-query.h \
    /usr/include/libgda-3.0/libgda/gda-query-join.h \
    /usr/include/libgda-3.0/libgda/gda-query-object.h \
    /usr/include/libgda-3.0/libgda/gda-query-parsing.h \
    /usr/include/libgda-3.0/libgda/gda-query-private.h \
    /usr/include/libgda-3.0/libgda/gda-query-target.h \
    /usr/include/libgda-3.0/libgda/gda-referer.h \
    /usr/include/libgda-3.0/libgda/gda-renderer.h \
    /usr/include/libgda-3.0/libgda/gda-row.h \
    /usr/include/libgda-3.0/libgda/gda-server-operation.h \
    /usr/include/libgda-3.0/libgda/gda-server-provider-extra.h \
    /usr/include/libgda-3.0/libgda/gda-server-provider.h \
    /usr/include/libgda-3.0/libgda/gda-server-provider-private.h \
    /usr/include/libgda-3.0/libgda/gda-threader.h \
    /usr/include/libgda-3.0/libgda/gda-transaction-status.h \
    /usr/include/libgda-3.0/libgda/gda-transaction-status-private.h \
    /usr/include/libgda-3.0/libgda/gda-util.h \
    /usr/include/libgda-3.0/libgda/gda-value.h \
    /usr/include/libgda-3.0/libgda/gda-xml-storage.h \
    /usr/include/libgda-3.0/libgda/libgda.h 

fi


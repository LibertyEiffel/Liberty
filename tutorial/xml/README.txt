There are two ways of using the XML library:

== SAX ==

(Simple API for XML)

It is event-oriented: implement your own XML_CALLBACKS and all its
features.

== DOM ==

(Document Object Model)

It is data-oriented: just use XML_TREE that provides a generic
(non-validated) tree containing your XML data.

You can also subclass XML_TREE if you want some validation (just
redefine the `new_node' feature).

XMLimpress.js
=============

Generate impress.js presentations with predesigned transitions from a XML file

Usage
-----

The XML file can be viewed directly in a browser by including the XSL stylesheet in it:

> <?xml-stylesheet href="impress.xsl" type="text/xsl"?>

HTML file can be generated with the command:

> xsltproc impress.xsl file.xml > file.html

XHTML file can be generated executing the same command after changing 
the `output method` to `xml` in the fifth line of `impress.xsl`.

To avoid malfunctions is better to save the xml or html file, `impress.xsl` and `impress.js`
in the same directory.


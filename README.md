## niem-conformance-validator

niem-conformance-validator is a single-purposed component that assesses the NIEM 3.0 conformance of XML Schema.  The only run requirement is to have an installation of [ <a href="http://ant.apache.org/" target="_blank">Apache Ant</a> ].  With Ant and/or Maven, add niem-conformance-validator to build and test automation, or run it ad-hoc from the command-line when an IDE slows you down.

Included with this component are the following:

*  [ <a href="https://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/NIEM-NDR-3.0-2014-07-31.html" target="_blank">NIEM NDR 3.0 Schematron</a> ]

*  [ <a href="http://www.saxonica.com/products/products.xml" target="_blank">Saxon-HE</a> ], an XSL Transformer, and

*  an XSL reference implementation of [ <a href="https://www.iso.org/obp/ui/#iso:std:iso-iec:19757:-3:ed-2:v1:en" target="_blank">Rule-based validation — Schematron (ISO/IEC 19757-3:2016)</a> ], as proposed in 2010.  

The default Ant Task "validate-niem-conformance" produces a report.  The report contains a table with XPATH instructions to data objects that failed assertions.  The report also contains a list of all the assertions applied to the XML Schema file.

Open the Ant build.xml file for more details.

# How to clone this repository
To clone this repository, first download [ <a href="https://git-scm.com" target="_blank">git</a> ] , if you don't already have it.

With git is installed, enter the following in a target directory:

    git clone https://github.com/gmoyanollc/validate-niem-conformance
    
Let me know what you think!

https://github.com/gmoyanollc

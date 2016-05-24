## niem-conformance-validator

niem-conformance-validator is a single-purposed component that assesses the NIEM 3.0 conformance of XML Schema.  The only run requirement is to have an installation of [ <a href="http://ant.apache.org/" target="_blank">Apache Ant</a> ].  With Ant and/or Maven, add niem-conformance-validator to build and test automation, or run it ad-hoc from the command-line when an IDE slows you down.

    /------------------\    /--------------------------------------------\
    |  [ xml-schema ]  |    |  ndr-rules-conformance-target-ext.sch.xsl  |
    \------------------/    \--------------------------------------------/
                  \              /
                   |             |
                   V             V
            /--------------------------\
           /   [ xsl-transformations ]  \
           \----------------------------/
                         |
                         V
            /---------------------------\
            |  [ xml-schema.svrl.html]  |
            \---------------------------/
                             
The default Ant Task "validate-niem-conformance" produces a report.  The report contains a table with XPATH instructions to data objects that failed assertions.  The report also contains a list of all the assertions applied to the XML Schema file.

Open the Ant build.xml file for more details.

Included with this component are the following:

*  [ <a href="https://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/NIEM-NDR-3.0-2014-07-31.html" target="_blank">NIEM NDR 3.0 Schematron</a> ]

*  [ <a href="http://www.saxonica.com/products/products.xml" target="_blank">Saxon-HE</a> ], an XSL Transformer, and

*  an XSL reference implementation of [ <a href="https://www.iso.org/obp/ui/#iso:std:iso-iec:19757:-3:ed-2:v1:en" target="_blank">Rule-based validation — Schematron (ISO/IEC 19757-3:2016)</a> ], as proposed in 2010.  

How to get started
------------------
1. [git-clone] (https://git-scm.com) this repository to a folder for projects:

        cd dev-project
        git clone https://github.com/gmoyanollc/niem-conformance-validator
    
    Expected result:
    
        .
        `-- niem-conformance-validator
            `-- external
                |-- iso-schematron-xslt2
                |-- niem-ndr
                `-- saxon
    
2. Test the configuration for Ant and Saxon:   

        cd niem-conformance-validator
        ant test-config -lib ./external/saxon/SaxonHE9-7-0-1J/saxon9he.jar
        
    Expected result:
    
        ...
        BUILD SUCCESSFUL
        ...
        
3. Run and validate an XML Schema folder by providing its folder path as a value to the Ant Property 'xml-to-validate.dir':

    Example command-line:
      
      ant -Dxml-to-validate.dir="/project/src/main/resources/iep-schema/extension" -lib ./external/saxon/SaxonHE9-7-0-1J/saxon9he.jar
      
    Expected result:
    
        ...
        BUILD SUCCESSFUL
        ...
        
Feedback
--------
If you feel like the component is missing a feature or has a defect, contact me or create an [issue] (https://github.com/gmoyanollc/niem-conformance-validator/issues). When creating a new issue, please provide a comprehensive description of your concern. Especially for fixing bugs it is crucial that I can reproduce your problem. For this reason, entire debug logs, source or most preferably little demo projects attached to the issue are very much appreciated. Of course, patches are welcome, too.

https://github.com/gmoyanollc

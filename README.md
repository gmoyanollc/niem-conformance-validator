# niem-conformance-validator

niem-conformance-validator is a single-purposed component for assessing the NIEM 3.0 conformance of XML Schema.  

## requirements
niem-conformance-validator requires [ <a href="http://ant.apache.org/" target="_blank">Apache Ant</a> ].  Ant is free and runs on any Java-enabled operating system.  Either install it directly for command-line operations or look for support in popular development and build tools such as Eclipse, Visual Studio, Maven, Gradle, and others.

## function
niem-conformance-validator takes XML Schema as input and produces a NIEM Conformance report as output.

    /------------------\    /----------------------------------------------\
    |  [ xml-schema ]  |    |  "ndr-rules-conformance-target-ext.sch.xsl"  |
    \------------------/    \----------------------------------------------/
                  \              /
                   |             |
                   V             V
            /--------------------------\
           /   [ xsl-transformations ]  \
           \----------------------------/
                         |
                         V
            /---------------------------\
            |  [ xml-schema.svrl.html ]  |
            \---------------------------/
                             
The report contains a table with XPATH instructions to objects that failed assertions, followed by a list of all assertions.

The default Ant Task is "validate-niem-conformance", which produces the report.  Open the Ant build.xml file for more details.

## what's included
niem-conformance-validator includes the following components:

*  [ <a href="https://reference.niem.gov/niem/specification/naming-and-design-rules/3.0/NIEM-NDR-3.0-2014-07-31.html" target="_blank">NIEM NDR 3.0 Schematron</a> ]

*  [ <a href="http://www.saxonica.com/products/products.xml" target="_blank">Saxon-HE</a> ], an XSL Transformer, and

*  an XSL reference implementation of [ <a href="https://www.iso.org/obp/ui/#iso:std:iso-iec:19757:-3:ed-2:v1:en" target="_blank">Rule-based validation — Schematron (ISO/IEC 19757-3:2016)</a> ], as proposed in 2010.  

##get started
1. Expand or [git-clone] (https://git-scm.com) to a folder for projects:

        cd dev-project        
        unzip niem-conformance-validator.zip
        
			or
			
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
        
##feedback
If you feel like the component is missing a feature or has a defect, contact me or create an [issue] (https://github.com/gmoyanollc/niem-conformance-validator/issues). When creating a new issue, please provide a comprehensive description of your concern. Especially for fixing bugs it is crucial that I can reproduce your problem. For this reason, entire debug logs, source or most preferably little demo projects attached to the issue are very much appreciated. Of course, patches are welcome, too.

https://github.com/gmoyanollc

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="svrl xs xd"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Nov 16, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b>George Moyano</xd:p>
            <xd:p><xd:b>Version:</xd:b>1.0.0</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <!-- modified original source available at https://github.com/JATS4R/validator -->
        
    <xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="svrl:schematron-output">
        <html> 
            <head>
                <title>Schematron Validation Report</title>
                <link rel="stylesheet" type="text/css" href="./css/palette.css"/>
            </head>
            <body>
            <div>
                <xsl:variable name='problems' select='svrl:failed-assert|svrl:successful-report'/>
                <xsl:choose>
                    <xsl:when test="$problems">
                        <p>Problems were found:</p>
                        <table class='results'>
                            <thead>
                                <tr>
                                    <th>Location</th>
                                    <th>Message</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="$problems">
                                    <xsl:call-template name='problem-report'/>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </xsl:when>
                    <xsl:otherwise>
                        <p>No problems were found.</p>
                    </xsl:otherwise>
                </xsl:choose>
                <p>Checks performed:</p>
                <ul>
                    <xsl:apply-templates select="svrl:active-pattern"/>
                </ul>
            </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="svrl:active-pattern">
        <li>
            <xsl:value-of select="@name"/>
        </li>
    </xsl:template>
    
    <xsl:template name='problem-report'>
        <xsl:variable name='active-pattern' 
            select='preceding-sibling::svrl:active-pattern[1]/@name'/>
        <xsl:variable name='level'>
            <xsl:choose>
                <xsl:when test="contains($active-pattern, 'errors')">
                    <xsl:value-of select="'error'"/>
                </xsl:when>
                <xsl:when test="contains($active-pattern, 'warnings')">
                    <xsl:value-of select="'warn'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'info'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <tr>
            <td class='{$level}' width="50%">
                <!-- Insert zero-width spaces to allow the browser to wrap the location cell -->
<!--                <span class='xpath-display'>
                    <xsl:value-of select="replace(@location, '/', '&#x200B;/&#x200B;')"/>
                </span>-->
                <span class='xpath-location'>
                    <xsl:value-of select='@location'/>
                </span>
            </td>
            <td class='{$level}' width="50%">
                <xsl:apply-templates select="svrl:text"/>
                <!--<xsl:value-of select="svrl:text"/>-->
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template match="svrl:text">
        <span>
            <xsl:value-of select="text()"/>
        </span>
    </xsl:template>

 
    
</xsl:stylesheet>
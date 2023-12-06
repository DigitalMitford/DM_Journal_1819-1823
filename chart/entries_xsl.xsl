<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    exclude-result-prefixes="xs math" version="3.1">

    <!-- 2023-12-02 ebb: This stylesheet outputs geoJSON for plotting place info from the Quark contributor lists on a Leaflet web map. -->
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes"/>

    <!--2023-11-28 ebb: The line below is a variable definining a directory or collection of XML files. -->
    <xsl:variable name="si" as="document-node()+" select="doc('https://digitalmitford.org/si.xml')"/>
    <xsl:variable name="journal" as="document-node()+" select="doc('https://raw.githubusercontent.com/DigitalMitford/stu2023_Journal/hamBranch/1819-1823MRMJournal.xml')"/>
    

    <xsl:template match="/">
        <xsl:variable name="myPlaces" as="xs:string+" select="$si//listPlace[@sortKey='histPlaces']/place/@xml:id ! normalize-space() => distinct-values()"/>
        <xsl:variable name="myEntries" as="item()+" select="$journal//div[@type='entry']"/>
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="style.css"/> 
            </head>
            <body>
                <span>                
                    <div class="journalIndex">
                        <table>
                            <tr>
                                <th> Date </th>
                                <th> Locations </th>
                                <th> People </th>
                            </tr>
                            <xsl:for-each select="$myEntries">
                                <tr>
                                    <td><xsl:value-of select="current()/head/date/@when"/></td>
                                    <td><xsl:value-of select="current()//placeName"/></td>
                                    <td><xsl:value-of select="current()//persName"/></td>
                                    
                                </tr>
                            </xsl:for-each>
                        </table>
                    </div>
                    <div class="journalViewer">
                        hihihi
                    </div>
                </span>
            </body>
        </html>
    </xsl:template>
    

</xsl:stylesheet>

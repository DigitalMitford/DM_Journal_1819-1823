<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes"/>
    <xsl:variable name="si" as="document-node()" select="doc('https://digitalmitford.org/si.xml')"/>
    <xsl:variable name="journal" as="document-node()" select="doc('https://raw.githubusercontent.com/DigitalMitford/stu2023_Journal/master/1819-1823MRMJournal.xml')"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Exploring Mitford's Journal and Site Index</title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
                <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
                    integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
                    crossorigin=""/>
                <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
                    integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
                    crossorigin=""></script>
            </head>
            <body>
                <h1>Exploring Mitford's Journal mentions with the Project Site Index</h1>
                <xsl:variable name="places" as="item()+" select="$si//place"/>
                <div class="journalIndex">
                <table>
                    <tr>
                        <th> Locations </th>
                        <th> Mentioned entries </th>
                    </tr>
                    <xsl:for-each select="$places">
                        <xsl:variable name="placeID" as="item()" select="current()/@xml:id"/>
                        <tr>
                            <td>
                                <button id="{$placeID}"><xsl:value-of select="$placeID"/></button>
                            </td>
                            <td>
                                <ul>
                                <xsl:for-each select="$journal//div[@type ='entry'][.//placeName[@ref = concat('#', $placeID)]]">
                                    <li><xsl:value-of select="current()/@xml:id"/></li>
                                </xsl:for-each>
                                </ul>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                </div>
                <div class="journalViewer">
                    <div id="map" style="width: 100%; height: 100%;"></div>
                    <script src="script.js"></script>
                </div>
            </body> 
        </html>
    </xsl:template>
    
    
    
</xsl:stylesheet>
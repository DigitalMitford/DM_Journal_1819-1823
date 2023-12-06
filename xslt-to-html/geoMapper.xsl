<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    exclude-result-prefixes="xs math" version="3.1">
    
    <!-- 2023-12-02 ebb: This stylesheet outputs geoJSON for plotting place info from the Quark contributor lists on a Leaflet web map. -->
    
    <xsl:output method="text" indent="yes"/> 
    
    <!--2023-11-28 ebb: The line below is a variable definining a directory or collection of XML files. -->
    <xsl:variable name="si" as="document-node()+"
        select="doc('https://digitalmitford.org/si.xml')"/>
    
    
    <xsl:template match="/">
        <xsl:variable name="places" as="xs:string+" select="//placeName/@ref ! substring-after(., '#') ! normalize-space() => distinct-values() => sort()"/>
    
        <xsl:variable name="journal" as="document-node()" select="."/>
        {
        "type": "FeatureCollection",
        "features": [
        
        <xsl:for-each select="$places">
            <xsl:variable name="treeWalker" select="$si//place[@xml:id ! normalize-space() = current()]"/>
            <xsl:if test="$treeWalker//geo">
            {
            "type": "Feature",
            "geometry": {
            "type": "Point",
            <!-- Call a template to perform geocoding and get coordinates -->
            "coordinates": 
            
            <!--<xsl:if test="$treeWalker//geo">-->
                [<xsl:value-of select="$treeWalker//geo ! normalize-space() ! tokenize(., '\s+') => string-join(',')"/>]
            <!--</xsl:if>-->
            
            
            <!--<xsl:choose>
                <xsl:when test="$treeWalker//geo">
                    <xsl:value-of select="$treeWalker//geo ! normalize-space() ! tokenize(., '/s+') => string-join(',')"/>
                </xsl:when>
                <xsl:otherwise>
                    <!-\-<xsl:call-template name="geocode">
                        <xsl:with-param name="placeName" select="$treeWalker/placeName[1]"/>
                    </xsl:call-template>-\->
                    <xsl:text>
                        N/A
                    </xsl:text>
                </xsl:otherwise>
            </xsl:choose>--> <!--<xsl:call-template name="geocode">
                <xsl:with-param name="placeName" select="current()"/>
            </xsl:call-template>-->
            },
            "properties": {
            <!-- Add other properties as needed -->
            "placeName": "<xsl:value-of select="$treeWalker/placeName[1]"/>",
            <!-- ebb: Tree walker: Return the count of the number of times this place is mentioned. -->
            "count": <xsl:value-of select="$journal//*[@ref ! substring-after(., '#') ! normalize-space() = current()] => count()"/>
            }
            }
            <!-- Add a comma if this is not the last place node NOT WORKING!!!!!!!!!!!!! -->
            <xsl:if test="current() ! position() != last()">,</xsl:if>
            </xsl:if>
        </xsl:for-each>
        
        ]
        }
    </xsl:template>
    
    
    <!-- Template to perform geocoding API lookup -->
    <xsl:template name="geocode">
        <xsl:param name="placeName"/>
        <xsl:variable name="apiKey" select="'003dd3cc5cf8407c872d4de44b3a180f'"/>
        <xsl:variable name="url" select="concat('https://api.opencagedata.com/geocode/v1/json?q=', encode-for-uri($placeName), '&amp;key=', $apiKey)"/>
        
        <!-- <xsl:value-of select="$url"/>-->
        <!-- Make the API request and parse the JSON response -->
        <xsl:variable name="response" select="json-to-xml(unparsed-text($url))"/>
        
        <!-- Use XPath to extract the coordinates from the parsed JSON -->
        <!--  <xsl:variable name="coordinates" select="map:get('lat')"/>-->
        
        <xsl:value-of select="'[' || ($response//*[@key='geometry'])[1]/*[@key='lat'] || ', ' || ($response//*[@key='geometry'])[1]/*[@key='lng'] || ']' "/>
        
        
        
    </xsl:template>
    
    
    
</xsl:stylesheet>
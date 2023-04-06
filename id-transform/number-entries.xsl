<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:template match="div[@type='entry']">
        
        <div type="entry" xml:id="e-{count(preceding::div[@type='entry'])+1}">
        <xsl:apply-templates/>
        </div>
    </xsl:template>
</xsl:stylesheet>
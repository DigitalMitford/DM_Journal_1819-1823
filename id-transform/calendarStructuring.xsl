<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    
    <xsl:mode on-no-match="shallow-copy"/>

<!-- 2023-04-04 ebb DONE! <xsl:template match="text/body//add[matches(., '^[A-Z]+$')]"/>-->
    
    <xsl:template match="text/body//add[matches(., '^[A-Z]+$')]"/>
  
  <!-- How will we raise div elements around months? Let's try xsl:for-each group -->
    <!--<xsl:template match="body">
     
            
           
 <xsl:for-each-group select="child::div[@type='year']" group-adjacent="$keyDate">
           
            <!-\- 2023-04-04 ebb: This strategy didn't work out so well. We tried various combinations but we 
               are having trouble getting the grouping to work: one entry comes out per month, or all the entries come out in each of 21 months.
                ARE there 21 months total in the Journal so far? We think so. 
            We also run a risk of losing the neighboring elements surrounding the entries or output them above or below the for-each-group.
            
            -\->
            
        </xsl:for-each-group>
        
    </xsl:template>-->
  
</xsl:stylesheet>
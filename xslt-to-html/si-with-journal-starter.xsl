<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs math"
    version="3.0">
    <!-- 2023-11-23 ebb: This XSLT is a starter set up to output some HTML from the Mitford Journal and project files. (We could change it so it outputs an XML structure if we want) 
    Source file: 1819-1823MRMJournal.xml
    -->
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes"/>
   
    
    <xsl:variable name="si" as="document-node()" select="doc('https://digitalmitford.org/si.xml')"/>
    <!--ebb: This $si variable reaches for the published site index file for the Mitford project.  -->
    
    <xsl:variable name="backList" as="element()" select="//back"/>
    <!-- ebb: This $backlist variable reaches into the <back> element of the Journal documnt for new SI updates we've been adding! 
    We can work with both variables to look up names and other information on people in the journal.
    -->
    
    <xsl:template match="/">
        <xsl:variable name="treeWalker" as="document-node()" select="current()"/>
        <!-- ebb: Here's our tree walker variable that will help us look stuff up in the current tree
        when we move into our for-each over distinct values. 
        -->
        
        <html>
            <head>
                <title>Exploring Mitford's Journal and Site Index</title>
                <!-- add a <link> to pull in some CSS here. for example:
                 <link rel="stylesheet" type="text/css" href="../journal.css"/>
                -->
            </head>
            <body>
                <h1>Exploring Mitford's Journal mentions with the Project Site Index</h1>
                
                <!-- ebb: Let's try exploring place names, just in the <body> element of the hournal that 
                    stores all the entries. Let's grab the @ref attributes from these entries.
                because the back portion will encoding them in new SI entries-->
                
                <table>
                    <tr>
                        <th>Places coded with @ref</th>
                        <th>Which Journal entries mention this place?</th>
                        <th>Details on the Place from the Site Index</th>
                    </tr>
               <xsl:for-each select="//body//placeName/@ref ! substring-after(., '#') ! normalize-space() => distinct-values() => sort() ">
                   
                   <xsl:variable name="myJournalEntries" 
                       select="$treeWalker//div[@type='entry'][.//placeName[@ref ! normalize-space() ! substring-after(., '#') = current()]]"/>
                  <tr> 
                      <td><xsl:value-of select="current()"/></td>
                   
                   <td>
                       <ul>
                       <xsl:for-each select="$myJournalEntries//date/@when">
                           <li><xsl:value-of select="current()"/></li>
                       </xsl:for-each>
                       </ul>
                   </td>
                      <td>
                          <!-- ebb: Try setting up an xsl:choose here. When there is an entry in the <back> of the current Journal,
                          get its information. Otherwise, go to the $si file. -->
                         <xsl:apply-templates select='$si//*[@xml:id = current()]/*[1]'/>
                          
                          
                      </td>
                  
                  </tr>
                
                   
                   
               </xsl:for-each>
                </table>
                
            </body> 
        </html>

    </xsl:template>
    
    
    
</xsl:stylesheet>
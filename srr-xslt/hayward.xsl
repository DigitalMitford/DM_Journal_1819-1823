<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no"
        indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>The Haywards</title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <div id="navblock">
                    
                    <nav id="nav">
                        <ul>
                            <li><h1>Digital Mitford:</h1></li>
                             <li>
                                 <a href="https://digitalmitford.org//index.html" class="indexbut"
                                    >Main</a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <h2>The Haywards</h2>
                <div id="entries">
                    <h3>Mrs. Hayward - <xsl:apply-templates select="//date[@when='1819']/parent::head"/></h3>
                    <xsl:apply-templates select="//date[@when='1819']/parent::head/following-sibling::div//persName[@ref='#Hayward_MrsW']/.. /.."/>
                    <h3><xsl:apply-templates select="//date[@when='1820']/parent::head"/></h3>
                    <xsl:apply-templates select="//date[@when='1820']/parent::head/following-sibling::div//persName[@ref='#Hayward_MrsW']/.. /.."/>
                    <h3>Watlington - <xsl:apply-templates select="//date[@when='1819']/parent::head"/></h3>
                    <xsl:apply-templates select="//body//placeName[@ref='#Watlington']/../.."/>
                    
                </div>
            </body>
        </html>
    </xsl:template>
    
    
    
    <xsl:template match="//div[@type='entry']">
        <div class="entry">
           <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="//body//div[@type='entry']//date">
        <h4>
            <xsl:apply-templates/>
        </h4>
    </xsl:template>

    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <!-- 
        select="//persName[@ref='#Hayward_MrsW']/ ../ .. ! string()"
        
        Hayward_da
        
        <org xml:id="Haywards">
                  <orgName>the Hayward family </orgName>
                  <orgName>Haywards</orgName>
                  <orgName>
                     <surname>Hayward</surname>
                  </orgName>
                  <note resp="#ebb">Likely includes <persName ref="#Hayward_MrW #Hayward_MrsW">Mr. &amp; Mrs. W.
                     Hayward</persName>, a brewing family connected with inns in <placeName ref="#Watlington">Watlington</placeName>.</note>
               </org> 
    -->
</xsl:stylesheet>











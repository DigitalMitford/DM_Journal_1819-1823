<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    Mitford Journal - 1819 to 1823
                    <xsl:apply-templates select="descendant::titleStmt/title"/>
                </title>
                <link rel="stylesheet" type="text/css" href="akam-mitford-css.css"/>
            </head>
            <body id="akam">
                <div id="navblock">
                    <h1 class="h1">Digital Mitford:</h1>
                    
                    <nav id="nav">
                        <ul>
                            <li><a href="index.html" class="indexbut">Home</a></li>
                            <li><a href="akam-mitford-html.html" class="indexbut">Journal</a></li>
                            <li><a href="haywardOUT.html" class="indexbut">Haywards</a></li>
                            <li><a href="plantsAnimals.html" class="indexbut">Plants &amp; Animals</a></li>
                            <li><a href="about.html" class="indexbut">About</a></li>
                            <li><a href="https://digitalmitford.org//index.html" class="indexbut">Main
                                Page</a></li>
                        </ul>
                    </nav>
                </div>
                <h1>The Digital Mitford Journals</h1>
                <div id="flex">
                <section id="toc">
                    <h2>Contents</h2>
                    <table>
                        <tr>
                            <th>Year</th>
                            
                        </tr>
                        <tr>
                        <xsl:apply-templates select=".//div[@type='year']" mode="toc"/>
                        </tr>
                    </table>
                </section>
                    
        <section id="rv">
            <xsl:apply-templates select="descendant::body"/>
        </section>
                </div>
      </body>
            
        </html>
    </xsl:template>
    <xsl:template match="div[@type='year']" mode="toc">
        <td>
            <h2>
             <xsl:apply-templates select="head/date/@when" mode="toc"/>   
           </h2> 
            <ol>
                <xsl:apply-templates select="./div[@type='entry']" mode="toc"/>
            </ol>
            
        </td>
    </xsl:template>
    <xsl:template match="div[@type='entry']" mode="toc">
        <li>
            <a href="#{@xml:id}"><xsl:apply-templates select="./head/date/@when" mode="toc"/></a>
        </li>
    </xsl:template>
        
   <!--table of contents end-->
   
   
   <!--div elements around the entries and the years-->
   <xsl:template match="div[@type='entry']"> <br/>
        <div class="{@type}" id="{@xml:id}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="head">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    <xsl:template match="div[@type='year']">
        <div class="{@type}">
        <xsl:apply-templates/>
        </div>
    </xsl:template>
    
  <!-- classsifiyng the elements in the text-->  
    
    <xsl:template match="date">
        <span class="date">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="persName">
        <span class="persName">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="placeName">
        <span class="placeName">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="name">
        <span class="name">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="body//title">
        <span class="title">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
   
</xsl:stylesheet>
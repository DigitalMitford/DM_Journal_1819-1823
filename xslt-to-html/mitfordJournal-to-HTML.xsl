<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        
        <xsl:apply-templates select="descendant::div[@type='month']"/>
        
    </xsl:template>
    
    <xsl:template match="div[@type='month']">
        <xsl:variable name="filename" as="xs:string" select="concat(@xml:id, '.html')"/>
        <xsl:variable name="currentMonth" as="xs:string" select="replace(@xml:id, '-', ' ')"/>
     
        <xsl:result-document method="xhtml" html-version="5" _omit-xml-declaration="yes" href="../docs/journal-view/{$filename}">
            <html>
                <head>
                    <title>
                        <xsl:apply-templates select="concat($currentMonth, ': ', ancestor::TEI//titleStmt/title)"/>
                    </title>
                    <link rel="stylesheet" type="text/css" href="../journal.css"/>
                </head>
                <body>
                    <!--  <div id="navblock">
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
                </div>-->
                    <h1>
                        <xsl:value-of select="concat($currentMonth, ': ', ancestor::TEI//titleStmt/title)"/>
                    </h1>
                    <div id="flex">
                        <section id="toc">
                            <h2>Contents</h2>
                            <table>
                                <tr>
                                    <th>Year</th>
                                    
                                </tr>
                                
                                    <xsl:apply-templates select="ancestor::body//div[@type = 'year']" mode="toc"/>
                            </table>
                        </section>
                        
                        <section id="rv">
                            <h2><xsl:value-of select="$currentMonth"/></h2>
                            
                            <div id="calendarDays"> 
                            <xsl:for-each select="child::div[@type='entry']">
                                <div class="calendarNum"> 
                                    <a href="#{@xml:id}"><xsl:value-of select="tokenize(./head/date/@when, '-')[last()]"/></a>
                                </div>
                                
                                
                            </xsl:for-each>
                            
                            </div>
                            
                            <div id="content">
                                <section id="entries">
                                    <xsl:apply-templates select="descendant::div[@type='entry']"/>
                                </section>
                                <section id="gloss"> 
                                    <h2>Gloss</h2>
                                    <p>ADDING SOME TEXT HERE TO TAKE UP SPACE. ADDING SOME TEXT HERE TO TAKE UP SPACE.ADDING SOME TEXT HERE TO TAKE UP SPACE.ADDING SOME TEXT HERE TO TAKE UP SPACE.ADDING SOME TEXT HERE TO TAKE UP SPACE.ADDING SOME TEXT HERE TO TAKE UP SPACE.ADDING SOME TEXT HERE TO TAKE UP SPACE.ADDING SOME TEXT HERE TO TAKE UP SPACE.ADDING SOME TEXT HERE TO TAKE UP SPACE.ADDING SOME TEXT HERE TO TAKE UP SPACE.ADDING SOME TEXT HERE TO TAKE UP SPACE.</p>
                                </section>
                            </div>
        
                        </section>
                    </div>
                </body>
                
            </html>
            
            
            
        </xsl:result-document>
        
        
        
    </xsl:template>
    
    
   
    
    <xsl:template match="div[@type = 'year']" mode="toc">
       <tr> 
           <td>
            <h2>
                <xsl:apply-templates select="head/date" mode="toc"/>
            </h2>
            <ul>
                <xsl:apply-templates select="./div[@type = 'month']" mode="toc"/>
            </ul>

        </td>
       </tr>
    </xsl:template>

    <xsl:template match="div[@type = 'month']" mode="toc">
        <li>
            <a href="{concat(@xml:id, '.html')}">
                <xsl:value-of select="tokenize(@xml:id, '-')[1]"/>
            </a>
        </li>
    </xsl:template>

    <!--table of contents end-->


    <!--div elements around the entries and the years-->
    <xsl:template match="div[@type = 'entry']">
        <br/>
        <div class="{@type}" id="{@xml:id}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="div[@type='entry']/head">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
<!--    <xsl:template match="div[@type = 'year']">
        <div class="{@type}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>-->

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

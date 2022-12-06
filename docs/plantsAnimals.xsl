<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    
   <xsl:template match="/">
   <html>
       <head>
           <title> Plants and Animals</title>
           <link rel="stylesheet" type="text/css" href="mitty.css"/>
       </head>
       <body>
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
          <div id="entries">
              <h2>Plants</h2>
              <xsl:apply-templates select="//name[@ref='#flower']/.. /.."/>
              <h2>Animals</h2>
              <xsl:apply-templates select="//name[@ref='#spaniel']/.. /.."/>
              <xsl:apply-templates select="//name[@ref='#greyhound']/.. /.."/>
              <xsl:apply-templates select="//name[@ref='#butterfly']/.. /.."/>
              <xsl:apply-templates select="//name[@ref='#cat']/.. /.."/>
              <xsl:apply-templates select="//name[@ref='#chicken']/.. /.."/>
          </div>
       </body>
   </html>
   </xsl:template>
    <xsl:template match="//div[@type='entry']">
        <div class="entry">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="//name[@ref='#flower']">
        <div class="flower">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="//name[@ref='#spaniel']">
        <div class="animal">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="//name[@ref='#greyhound']">
        <div class="animal">
            <xsl:apply-templates/>
        </div>
    </xsl:template><xsl:template match="//name[@ref='#butterfly']">
        <div class="animal">
            <xsl:apply-templates/>
        </div>
    </xsl:template><xsl:template match="//name[@ref='#cat']">
        <div class="animal">
            <xsl:apply-templates/>
        </div>
    </xsl:template><xsl:template match="//name[@ref='#chicken']">
        <div class="animal">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">

    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no"
        indent="yes"/>

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
                            <li>
                                <a href="index.html" class="indexbut">Home</a>
                            </li>
                            <li>
                                <a href="akam-mitford-html.html" class="indexbut">Journal</a>
                            </li>
                            <li>
                                <a href="haywardOUT.html" class="indexbut">Haywards</a>
                            </li>
                            <li>
                                <a href="plantsAnimals.html" class="indexbut">Plants &amp;
                                    Animals</a>
                            </li>
                            <li>
                                <a href="about.html" class="indexbut">About</a>
                            </li>
                            <li>
                                <a href="https://digitalmitford.org//index.html" class="indexbut"
                                    >Main Page</a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div id="entries">
                    <h2>Plants and Animals</h2>
                    <div id="entries">
                        <div class="sect">
                            <h3>Plants - <xsl:apply-templates
                                    select="//date[@when = '1819']/parent::head"/></h3>
                            <xsl:apply-templates
                                select="//date[@when = '1819']/parent::head/following-sibling::div//name[@ref = '#flower']/../.."/>
                            <h3>
                                <xsl:apply-templates select="//date[@when = '1820']/parent::head"/>
                            </h3>

                            <xsl:apply-templates
                                select="//date[@when = '1820']/parent::head/following-sibling::div//name[@ref = '#flower']/../.."
                            />
                        </div>
                    </div>
                </div>
                <div class="sect">
                    <h3>Animals - <xsl:apply-templates
                        select="//date[@when = '1819']/parent::head"/></h3>
                    <xsl:apply-templates select="//body//name[@ref = '#spaniel']/../.."/>
                    
                    
                </div>
                <footer>
                    <p>In the making by: <br/> Tyler Cameron, Savannah Ricks, Tyler Akam, and Jacob
                        Huellen</p>
                    <p>We are at <a href="https://behrend.psu.edu/">Penn State Erie, The Behrend
                            College</a>.</p>
                </footer>
            </body>
        </html>

    </xsl:template>
    <xsl:template match="div[@type = 'entry']">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="div[@type = 'entry']//date">
        <h4>
            <xsl:apply-templates/>
        </h4>
    </xsl:template>
    
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
</xsl:stylesheet>

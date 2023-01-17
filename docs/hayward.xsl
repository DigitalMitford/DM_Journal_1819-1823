<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no"
        indent="yes"/>

    <xsl:template match="/">
        <html lang="en">
            <head>
                <title>The Haywards</title>
                <link rel="stylesheet" type="text/css" href="hayward_STYLE.css"/>
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
                                <a href="plantsAnimals.html" class="indexbut">Plants &amp; Animals</a>
                            </li>
                            <li>
                                <a href="about.html" class="indexbut">About</a>
                            </li>
                            <li>
                                <a href="https://digitalmitford.org//index.html" class="indexbut">Main
                                    Page</a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <h2>The Haywards:</h2>
                <div id="entries">
                    <div class="sect">
                        <h3>Mrs. Hayward - <xsl:apply-templates
                                select="//date[@when = '1819']/parent::head"/></h3>
                        <xsl:apply-templates
                            select="//date[@when = '1819']/parent::head/following-sibling::div//persName[@ref = '#Hayward_MrsW']/../.."/>
                        <h3>
                            <xsl:apply-templates select="//date[@when = '1820']/parent::head"/>
                        </h3>
                        <xsl:apply-templates
                            select="//date[@when = '1820']/parent::head/following-sibling::div//persName[@ref = '#Hayward_MrsW']/../.."/>
                        <div class="backInfo">
                            <h4>Mrs. Hayward BACK Description</h4>
                            <xsl:apply-templates select="//person[@xml:id = 'Hayward_MrsW']"/>
                        </div>
                        <div class="backInfo">
                            <h4>The Haywards BACK Description</h4>
                            <xsl:apply-templates select="//org[@xml:id = 'Haywards']"/>
                        </div>

                    </div>
                    <div class="sect">
                        <h3>Watlington - <xsl:apply-templates
                                select="//date[@when = '1819']/parent::head"/></h3>
                        <xsl:apply-templates select="//body//placeName[@ref = '#Watlington']/../.."/>
                        <div class="backInfo">
                            <h4>Watlington BACK Description</h4>
                            <xsl:apply-templates select="//place[@xml:id = 'Watlington']"/>
                        </div>

                    </div>
                    <div class="backInfo">
                        <h3>Notes:</h3>
                        <p>There is no information about Mr. Hayward whatsoever in this Digital
                            Mitford Journal Document.</p>
                        <p>There are mentions of a daughter, but there is no information about her
                            except in the entries where Mrs. Hayward is mentioned.</p>
                        <p>There is a mention of the Hayward family owning many inns in Watlington,
                            but further investigation shows there is no more information regarding
                            the subject in this document.</p>

                    </div>
                </div>
                <footer>
                    <p>In the making by: <br /> Tyler Cameron, Savannah Ricks, Tyler Akam, and Jacob
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



    <xsl:template match="person[@xml:id = 'Hayward_MrsW']/*[1]">
        <p>Person Name: <xsl:apply-templates/></p>
    </xsl:template>

    <xsl:template match="org[@xml:id = 'Haywards']/*[1]">
        <p> Org Name: <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="org[@xml:id = 'Haywards']/*[2]">
        <p> Org Name: <xsl:apply-templates/>
        </p>
    </xsl:template>


    <xsl:template match="surname">
        <p> Surname: <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="roleName">
        <p> Role Name: <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="note[1]">
        <p> Notes: <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="place/placeName">
        <p> Place Name: <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="place/region">
        <p> Region: <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="place/country">
        <p> Country: <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="place/location">
        <p> Location: <xsl:apply-templates/>
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



    <!-- TO DO:
    
    Include BACK descriptions of each improtant thing
    
    block by subject
    
        - Mrs Hayward
            -entries
            -BACK desc
            -Notes
        - Watlington
            -entries
            -BACK desc
            -Notes
            
    Organize files and rename them -->
</xsl:stylesheet>

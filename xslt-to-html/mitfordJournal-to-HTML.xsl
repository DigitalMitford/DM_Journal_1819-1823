<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes"/>



    <xsl:variable name="si" as="document-node()" select="doc('https://digitalmitford.org/si.xml')"/>

    <xsl:variable name="siAdd" as="document-node()"
        select="doc('https://raw.githubusercontent.com/DigitalMitford/DM_SiteIndex/master/si_Full_IP/si-local.xml')"/>

    <xsl:template match="/">

        <xsl:apply-templates select="descendant::div[@type = 'month']"/>

    </xsl:template>

    <xsl:template match="div[@type = 'month']">
        <xsl:variable name="filename" as="xs:string" select="concat(@xml:id, '.html')"/>
        <xsl:variable name="currentMonth" as="xs:string" select="replace(@xml:id, '-', ' ')"/>

        <xsl:result-document method="xhtml" html-version="5" _omit-xml-declaration="yes"
            href="../docs/journal-view/{$filename}">
            <html>
                <head>
                    <title>
                        <xsl:apply-templates
                            select="concat($currentMonth, ': ', ancestor::TEI//titleStmt/title)"/>
                    </title>
                    <link rel="stylesheet" type="text/css" href="../journal.css"/>
                    <link href="https://fonts.googleapis.com/css?family=Alice" rel="stylesheet" />
                    <script type="text/javascript" src="../journal.js"></script>
                </head>
                <body>
                    <div id="nav_wide">   <!--<h1>Digital Mitford:
            The Mary Russell Mitford Archive</h1>-->
                        <div id="menu">       
                            <!-- <h2><a href="index.html">Welcome</a> | <a href="about.html">About</a> | <a href="bibliogType.html">Published Works</a> | <a href="lettersData.html">Manuscript Locations</a> | <a href="letters.html">Letters</a> | <a href="visual.html">People, Places, and Networks</a> | <a href="staff.html">Staff</a> | <a href="workshop.html">Workshop Materials</a></h2>-->
                            <ul id="siteMenu">
                                <li class="title"><span class="mainTitle">Digital Mitford:</span><br/> <span class="subTitle"><xsl:value-of
                                    select="ancestor::TEI//titleStmt/title"/></span>
                                
                           
                                </li>
                                <li class="mainMenu"><ul class="mainMenu"><li class="section" id="Overview"><!--Overview-->
                                    <ul class="subSec"><li class="subMenu"><a href="index.html">Home</a></li>
                                        <li class="subMenu"><a href="visual.html">Mitford’s Worlds</a></li>
                                    </ul></li>
                                    <li class="section" id="Bib"><!--Life Writing, Bibliography, Papers-->
                                        <ul class="subSec">
                                            <li class="subMenu"><a href="letters.html">Letters</a></li>
                                            <li class="subMenu">Journal</li>
                                            <li class="subMenu"><a href="bibliogType.html">Bibliography</a></li>
                                            <li class="subMenu"><a href="lettersData.html">Manuscript Locations</a></li>
                                            
                                        </ul>
                                    </li>
                                    <li class="section" id="Editions"><!--Editions-->
                                        <ul class="subSec">
                                            
                                            <li class="subMenu">Plays</li>
                                            <li class="subMenu">Poems</li>
                                            <li class="subMenu">Fiction</li>
                                        </ul>
                                    </li>
                                    
                                    
                                    
                                    <li class="section" id="Project"><!--Project-->
                                        <ul class="subSec">
                                            <li class="subMenu"><a href="about.html">Methods &amp; Background</a></li>
                                            <li class="subMenu"><a href="staff.html">Staff</a></li>
                                            <li class="subMenu">Scholarship</li>
                                        </ul>
                                    </li>
                                    <li class="section" id="Outreach"><!--Outreach-->
                                        <ul class="subSec">
                                            <li class="subMenu"><a href="workshop.html">Coding School</a></li>
                                            <li class="subMenu"><a href="https://digitalmitford.wordpress.com/">Blog</a></li>
                                            <li class="subMenu"><a href="applicationProcess.html">Become a Mitford Editor</a></li>
                                        </ul>
                                        
                                    </li>
                                    
                                </ul>
                                </li>
                            </ul>
                        </div>
                    </div>  
                    
                  <!--  <h1>
                        <xsl:value-of
                            select="concat($currentMonth, ': ', ancestor::TEI//titleStmt/title)"/>
                    </h1>-->
                    <div id="flex">
                        <section id="toc">
                            <table>


                                <xsl:apply-templates select="ancestor::body//div[@type = 'year']"
                                    mode="toc"/>
                            </table>
                        </section>

                        <section id="rv">
                            

                            <div id="calendarDays">
                                <xsl:for-each select="child::div[@type = 'entry']">
                                    <div class="calendarNum">
                                        <a href="#{@xml:id}">
                                            <xsl:value-of
                                                select="tokenize(./head/date/@when, '-')[last()]"/>
                                        </a>
                                    </div>


                                </xsl:for-each>

                            </div>

                            <div id="content">
                                <section id="entries">
                                    <h2>
                                        <xsl:value-of select="$currentMonth"/>
                                    </h2>
                                    <xsl:apply-templates select="descendant::div[@type = 'entry']"/>
                                </section>
                                <section id="gloss">
                                    <h2>Gloss of Names Mentioned</h2>
                                    <br/>
                                    <h3>Nature</h3>
                                    <xsl:for-each
                                        select="current()//name/@ref ! tokenize(., '\s+') ! normalize-space() => distinct-values()">
                                      <div class="si" id="{current() ! substring-after(., '#')}">
                                          
                                          <h3><xsl:value-of select="$si//*[@xml:id = substring-after(current(), '#')]/*[position() eq 1]"/></h3>
                                          
                                          
                                                 <ul>
                                                     <xsl:for-each select="$si//*[@xml:id = substring-after(current(), '#')]/*[position() gt 1][not(self::note)]">
    
           
                                                      <li><xsl:choose><xsl:when test="@*"><xsl:for-each select="@*">
                                                          <xsl:value-of select="name()"/>: <xsl:value-of select="current()"/><xsl:if test="not(position()[last()])"><xsl:text> </xsl:text></xsl:if>
                                                      </xsl:for-each></xsl:when></xsl:choose></li>
                                                     </xsl:for-each>    
                                                  </ul>
                                                    <section class="glossNote"><xsl:apply-templates select="$si//*[@xml:id = substring-after(current(), '#')]/note[1]"/></section>
                                             
                                       
                                                    <xsl:if test="$si//*[@xml:id = substring-after(current(), '#')]//ptr">
                                                        <iframe src="{($si//*[@xml:id = substring-after(current(), '#')]//ptr)[1]/@target}"/>  
                                                        <ul>
                                                            <xsl:for-each select="$si//*[@xml:id = substring-after(current(), '#')]//ptr">
                                                                <li><a href="{@target}"><xsl:value-of select="@target"/></a></li>
                                                        </xsl:for-each>
                                                        </ul>
                                                    </xsl:if>
                                       </div>


                                    </xsl:for-each>
                                    <br/>
                                    <h3>Places</h3>
                                    <br/>
                                    <h3>Publications</h3>
                                    <xsl:variable name="pubs" select="(current()//bibl/@corresp ! tokenize(., '\s+') ! normalize-space() => distinct-values(), 
                                        current()//title/@ref ! tokenize(., '\s+') ! normalize-space() => distinct-values())"/>
                                    
                                    <xsl:for-each select="$pubs">
                                        <xsl:variable name="pubMatch" as="element()?" select="$si//*[@xml:id = substring-after(current(), '#')]"/>
                                        <h3><xsl:value-of select="$pubMatch/*[position() eq 1]"/></h3>
                                        <!-- 2023-07-04 ebb with srr and tsa: ONLY MINIMAL OUTPUT FOR THE MOMENT -->
                                        
                                        <ul>
                                            <li>Author: <xsl:choose>
                                                <xsl:when test="$pubMatch//author[text()[matches(., '\S+')]]"><xsl:value-of select="$pubMatch//author"/></xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:choose>
                                                        <xsl:when test="$pubMatch//author"><xsl:value-of select="$pubMatch//author/@ref"/>
                                                          <!-- 2023-07-04 ebb: THIS IS LAZY. 
                                                              WE SHOULD CHANGE THE ABOVE LINE TO GO PULL THE ACTUAL ENTRY FOR THIS AUTHOR TO GET HIS NAME> -->
                                                        </xsl:when>
                                                        <xsl:otherwise><span class="null"><xsl:value-of select="'No author listed.'"/></span>
                                                        </xsl:otherwise>
                     
                                                    </xsl:choose>
                                                
                                                </xsl:otherwise>
                                            
                                            </xsl:choose></li>
                                            <li>Date: 
                                            <xsl:choose>
                                                <xsl:when test="$pubMatch//date">
                                                    <xsl:choose>
                                                        <xsl:when test="$pubMatch//date[text()[matches(., '\S+')]]">
                                                        <xsl:value-of select="$pubMatch//date"/>
                                                    </xsl:when>
                                                        <xsl:when test="$pubMatch/date//text()[not(matches(., '\S+'))]">
                                                            <xsl:choose>
                                                                <xsl:when test="$pubMatch/date/@when">
                                                                    <xsl:value-of select="$pubMatch/date/@when"/>
                                                                </xsl:when>
                                                                <xsl:when test="$pubMatch/date/@from">
                                                                    From <xsl:value-of select="$pubMatch/date/@from"/>, to 
                                                                    <xsl:value-of select="$pubMatch/date/@to"/>.
  
                                                                </xsl:when>
                                                            </xsl:choose>

                                                        </xsl:when>
                                                        
                                                    </xsl:choose>
                                                    
                                                    
                                                </xsl:when>
                                                
                                                <xsl:otherwise>
                                                    <span class="null"><xsl:value-of select="'No date listed.'"/></span>
                                                </xsl:otherwise>
                                                
                                            </xsl:choose>
                                                
                                               <xsl:if test="$pubMatch//note"> 
                                                   <section class="glossNote"><xsl:apply-templates select="$pubMatch/note[1]"/></section>
                                               </xsl:if>
                                            
                                            </li>
                                        </ul>
                                        
                                    </xsl:for-each>
                                    <br/>
                                    <h3>Persons, Personas, and Characters</h3>
                                    <xsl:for-each
                                        select="current()//persName/@ref ! tokenize(., '\s+') ! normalize-space()  => distinct-values()">
                                        <div class="si" id="{current() ! substring-after(., '#')}">
                                            
                                            <h3><xsl:value-of select="$si//*[@xml:id = substring-after(current(), '#')]/*[position() eq 1]"/></h3>
                                            
                                            
                                            <ul>
                                                <xsl:for-each select="$si//*[@xml:id = substring-after(current(), '#')]/*[position() gt 1][not(self::note)]">
                                                    
                                                    
                                                    <li><xsl:sequence select="current() ! normalize-space()"/></li>
                                                </xsl:for-each>    
                                            </ul>
                                            <section class="glossNote"><xsl:apply-templates select="$si//*[@xml:id = substring-after(current(), '#')]/note[1]"/></section>
                                            
                                            
                                            <xsl:if test="$si//*[@xml:id = substring-after(current(), '#')]//ptr">
                                                <iframe src="{($si//*[@xml:id = substring-after(current(), '#')]//ptr)[1]/@target}"/>  
                                                <ul>
                                                    <xsl:for-each select="$si//*[@xml:id = substring-after(current(), '#')]//ptr">
                                                        <li><a href="{@target}"><xsl:value-of select="@target"/></a></li>
                                                    </xsl:for-each>
                                                </ul>
                                            </xsl:if>
                                        </div>
                                        
                                    </xsl:for-each>

                                    <h3>Collectives</h3>


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
    <xsl:template match="div[@type = 'entry']/head">
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>
    <!--    <xsl:template match="div[@type = 'year']">
        <div class="{@type}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>-->
    
    <xsl:template match="div[@type = 'poem']/head[@type='title']">
        <h4>
            <xsl:apply-templates/>
        </h4>
    </xsl:template>
    <xsl:template match="div[@type = 'poem']/head[@type='subtitle']">
        <h5>
            <xsl:apply-templates/>
        </h5>
    </xsl:template>
    
    <xsl:template match="lg">
        <div class="lg">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="l">
        <div class="line"> 
            <xsl:choose>
                <xsl:when test="@rend">
                    <span class="line {@rend ! translate(., '+)', '') ! translate(., '(', '-')}" id="L{@n}">
                        <xsl:apply-templates/></span>
                    <span class="lineNumber"><xsl:value-of select="@n"/></span>
                    
                </xsl:when>
                <xsl:otherwise>
                    <span class="line" id="L{@n}">
                        <xsl:apply-templates/></span>
                    <span class="lineNumber"><xsl:value-of select="@n"/></span>
                </xsl:otherwise>
            </xsl:choose>
        </div>
    </xsl:template>

    <!-- classsifiyng the elements in the text-->

    <xsl:template match="date">
        <span class="date">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="persName | placeName | name | body//title">
       <xsl:choose> 
           <xsl:when test="@ref">
              <xsl:choose> 
                  <xsl:when test="current()[parent::*[@ref or @corresp]]">
                      <xsl:apply-templates/>
                      
                  </xsl:when>
                  
                  
                  <xsl:otherwise><span class="{current() ! name()} gloss" data-gloss="{@ref}"><a href="{@ref ! tokenize(., '\s+')[1]}"><xsl:apply-templates/></a></span></xsl:otherwise>
              
              
              </xsl:choose>
               
               
           </xsl:when>
           <xsl:otherwise>
               <span class="{name()}"><xsl:apply-templates/></span>
           </xsl:otherwise>
       </xsl:choose>
    </xsl:template> 
    <xsl:template match="body//bibl">
        <xsl:choose> 
            <xsl:when test="@corresp">
                <span class="title gloss" data-gloss="{@corresp}"><a href="{@corresp ! tokenize(., '\s+')[1]}"><xsl:apply-templates/></a></span>
            </xsl:when>
            <xsl:otherwise>
                <span class="title"><xsl:apply-templates/></span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>

</xsl:stylesheet>

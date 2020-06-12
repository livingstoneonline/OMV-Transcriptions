<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
	xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:jc="http://james.blushingbunny.net/ns.html"
	xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs xd tei jc"
	version="2.0">
<!-- /*xmlns="http://www.w3.org/TR/REC-html40"*/ -->
<!-- Useful for DTDs https://www.w3.org/TR/xhtml1/dtds.html#h-A2 -->
	<xd:doc scope="stylesheet">
		<xd:desc>
			<xd:p><xd:b>Author:</xd:b> Adrian S. Wisnicki</xd:p>
			<xd:p>Rewire LO XSL to Create OMV XSL</xd:p>
			<xd:p>May 2020</xd:p>
			<xd:p>Creative Commons Attribution 4.0 International (https://creativecommons.org/licenses/by/4.0/)</xd:p>
		</xd:desc>
	</xd:doc>
	
	<xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>

	<!-- Incoming parameters -->
	<xsl:param name="page" select="'0001'"/>
	<xsl:param name="paged" select="'true'"/>

	<!-- Transform these to global variables in case I need to use them anywhere -->
	<xsl:variable name="pagenumber" select="$page"/>
	<xsl:variable name="isPaged" select="$paged"/>

	<!-- When not producing full HTML files, this template could be removed but javascript and CSS will need to be copied to correct location. -->
	<xsl:template match="/">
		<xsl:variable name="additional-authors-1">			
			<xsl:choose>
				<xsl:when test="//teiHeader//titleStmt/author[@role='normalized']">
					<xsl:text>, </xsl:text><xsl:value-of select="//teiHeader//titleStmt/author[@role='normalized']" separator=", "/>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="LEAP-ID">
			<xsl:value-of select="//idno[@type='LEAP-ID']"/>
		</xsl:variable>
		<html>
			<xsl:comment>This HTML has been generated from an XML original. Do not manually modify this as a source.</xsl:comment>
			<head>
				<title>
					<xsl:value-of select="//teiHeader//titleStmt/author[@role='first-normalized']"/><xsl:value-of select="$additional-authors-1"/>, <xsl:value-of select="//teiHeader//titleStmt/title[1]"/> | One More Voice
				</title>
			    <meta charset="UTF-8"/>
				<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
			    <meta name="description" content="Critically-edited primary material for One More Voice. One More Voice, a work of digital humanities scholarship, focuses on recovering non-European contributions from the nineteenth-century British imperial and colonial archives." />
    			<meta name="keywords" content="one more voice,livingstone online,recovery,archives,colonial,colonialism,postcolonial,postcolonialism,empire,imperialism,digital humanities,minimal computing,travel,missionary,expeditionary,exploration,intercultural,encounter,non-western,non-European,literature,British,African,Africa,Victorian,nineteenth-century,travel narratives,autobiographies,letters,diaries,testimonies,interviews,maps,oral histories,genealogies,vocabularies,coronavirus,covid-19,creative commons" />
			    <link rel="stylesheet" type="text/css" href="http://livingstoneonline.github.io/onemorevoice/style.css" />
			    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
			    <script src="http://livingstoneonline.github.io/onemorevoice/overlay.js"></script>
			    <script src="http://livingstoneonline.github.io/onemorevoice/stickynav.js" defer=""></script>
				<!-- Global site tag (gtag.js) - Google Analytics -->
				<script async='' src="https://www.googletagmanager.com/gtag/js?id=UA-31768072-5"></script>
				<script>
			  		window.dataLayer = window.dataLayer || [];
			  		function gtag(){dataLayer.push(arguments);}
			  		gtag('js', new Date());
			  		gtag('config', 'UA-31768072-5');
				</script>    
			</head>
			<body class="transcription "><!-- style="background:#{$body-color};" -->
			
				<!-- Mobile sticky nav adapted from https://www.mattmorgante.com/technology/sticky-navigation-bar-javascript -->
			    <nav id="navigation">    
			    <div class="menu">
			        <span class="icon-title"><a style="cursor:pointer" class="icon" onclick="openNav()"><i class="fa fa-bars" aria-hidden="true"></i></a></span>
					<span class="nav-title">One More Voice</span>
			    </div>
			    </nav>
			
			    <!-- Topnav adapted from https://www.w3schools.com/howto/howto_js_responsive_navbar_dropdown.asp -->
			    <!-- Dropdown menu adapted from https://www.smashingmagazine.com/2017/11/building-accessible-menu-systems/ -->
			    <!-- Idea for checkboxes that act like radio buttons adapted from https://stackoverflow.com/questions/42870002/how-to-uncheck-a-checkbox-when-another-one-is-checked-->
				<nav class="topnav" id="topnav-div">
			    <ul>
			      <li><a href="../index.html">home</a></li>
			      <li><a href="../texts.html">texts</a></li>
			      <li>
			          <div class="dropdown" data-menu-component="">
			              <input type="checkbox" id="toggle-1" class="vh" role="button" aria-haspopup="true" onclick="document.getElementById('toggle-2').checked = false">
			              <label class="dropbtn" for="toggle-1" data-opens-menu="">
			                concepts <!--<i class="fa fa-caret-down"></i>-->
			                <span class="vh expanded-text">expanded</span>
			                <span class="vh collapsed-text">collapsed</span>
			              </label>
			              <div class="dropdown-content" role="menu" data-menu-origin="left">
			                <ul>
			                  <li><a href="../analytical_priorities.html">analytical priorities</a></li>
			                  <li><a href="../project_design.html">project design</a></li>
			                  <li><a href="../coding_guidelines.html">coding guidelines</a></li>
			                </ul>
			              </div></input>
			            </div>
			        </li>
			        <li>
			          <div data-menu-component="" class="dropdown">
			              <input type="checkbox" id="toggle-2" class="vh" role="button" aria-haspopup="true" onclick="document.getElementById('toggle-1').checked = false">
			              <label class="dropbtn" for="toggle-2" data-opens-menu="">
			                misc <!--<i class="fa fa-caret-down"></i>-->
			                <span class="vh expanded-text">expanded</span>
			                <span class="vh collapsed-text">collapsed</span>
			              </label>
			              <div class="dropdown-content" role="menu" data-menu-origin="left">
			                <ul>
			                  <li><a href="../contributors.html">contributors</a></li>
			                  <li><a href="../bibliography.html">bibliography</a></li>
			                  <li><a href="https://github.com/livingstoneonline/onemorevoice/" target="_blank">github repo</a></li>
			                  <li><a href="mailto:awisnicki@yahoo.com">contact</a></li>
			                </ul>
			              </div></input>
			            </div>
			        </li>
			    </ul>
				</nav>
			
			    <!-- Overlay adapted from from https://www.w3schools.com/howto/howto_js_fullscreen_overlay.asp -->
			    <div class="overlay" id="overlay">
			      <div class="menu">
			          <span class="close-title"><a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&#215;</a></span>
			          <span class="nav-title">One More Voice</span>
			      </div>
			        <div class="overlay-content">
			            <ul>
			                <li><a href="../index.html">home</a></li>
			                <li><a href="../texts.html">texts</a></li>
			                <li class="section">concepts <i class="fa fa-caret-down"></i>
			                    <ul>
			                        <li><a href="../analytical_priorities.html">analytical priorities</a></li>
			                        <li><a href="../project_design.html">project design</a></li>
			                        <li><a href="../coding_guidelines.html">coding guidelines</a></li>
			                    </ul>
			                </li>
			                <li class="section">misc <i class="fa fa-caret-down"></i>
			                    <ul>
			                        <li><a href="../contributors.html">contributors</a></li>
			                        <li><a href="../bibliography.html">bibliography</a></li>
			                        <li><a href="https://github.com/livingstoneonline/onemorevoice/" target="_blank">github repo</a> (external)</li>
			                        <li><a href="mailto:awisnicki@yahoo.com">contact</a> (mailto)</li>
			                    </ul>
			                </li>
			       			<li><a href="../site_map.html">site map</a></li>
			            </ul>
			        </div>
			    </div>
				       
				<div class="title" id="title-div" role="banner"> 
				    <img class="image image-border" src="../images/xml-code.png" alt="A segment of coded text taken from the One More Voice project." title="A segment of coded text taken from the One More Voice project." />
	        		<h1 class="header-title">One More Voice</h1>
	        		<hr/>
	        		<div><span class="back-button"><a href="../texts.html#{$LEAP-ID}">&#11013; Back</a></span><h2 class="italic">Critically-edited Primary Text</h2></div>
	    		</div>
				<xsl:apply-templates select="TEI"/>
			</body>
		</html>
	</xsl:template>

	<!-- Don't show -->
	<xsl:template match="teiHeader|facsimile|surface|zone"/>

	<!-- The following section is key as it sets up the whole text and chooses one of two paths, either manuscript or journal. -->
	<!-- TEI -->
	<xsl:template match="TEI">
		<xsl:variable name="body-color-front">
			<xsl:apply-templates select="//front/@n[1]"/>
		</xsl:variable>
		<xsl:variable name="body-color-back">
			<xsl:apply-templates select="//back/@n[1]"/>
		</xsl:variable>
		<xsl:variable name="body-color">
			<xsl:apply-templates select="//body/@n[1]"/>
		</xsl:variable>
		<xsl:variable name="front">
			<xsl:choose>
				<xsl:when test="//front"/>
				<xsl:otherwise>none</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="back">
			<xsl:choose>
				<xsl:when test="//back"/>
				<xsl:otherwise>none</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="encoding">
			<xsl:choose>
				<xsl:when test="//teiHeader//respStmt/name">
					<xsl:value-of select="//teiHeader//respStmt/name[not(.=preceding::name)]" separator=", "/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="//teiHeader//revisionDesc/change/name[not(.=preceding::name)]" separator=", "/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="sortedDates" as="xs:string*">
			<xsl:choose>
				<xsl:when test="//revisionDesc/change[@when]">
					<xsl:perform-sort select="//revisionDesc/change/@when[not(.=preceding::change/@when)]"><xsl:sort select="." order="ascending"/></xsl:perform-sort>
				</xsl:when>
				<xsl:otherwise>
					<xsl:perform-sort select="//revisionDesc/change/date[not(.=preceding::change/date)]"><xsl:sort select="." order="ascending"/></xsl:perform-sort>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="additional-authors-1">			
			<xsl:choose>
				<xsl:when test="//teiHeader//titleStmt/author[@role='normalized']">
					<xsl:text>, </xsl:text><xsl:value-of select="//teiHeader//titleStmt/author[@role='normalized']" separator=", "/>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="additional-authors-2">			
			<xsl:choose>
				<xsl:when test="//teiHeader//titleStmt/author[@role='normalized']">
					<xsl:text>; </xsl:text><xsl:value-of select="//teiHeader//titleStmt/author[@role='normalized']" separator="; "/>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="license">
			<xsl:value-of select="//teiHeader//publicationStmt/availability/licence/ref/@target"/>
		</xsl:variable>
		<xsl:variable name="LEAP-ID">
			<xsl:value-of select="//idno[@type='LEAP-ID']"/>
		</xsl:variable>
		<xsl:variable name="base-uri" select="base-uri(.)"/>
		<!--<xsl:variable name="document-uri" select="document-uri(.)"/>-->
 		<xsl:variable name="filename" select="(tokenize($base-uri,'/'))[last()]"/>

		<xsl:choose>
			<xsl:when test="//sourceDesc/msDesc[@type='manuscript']">
		    	<div class="credits" id="credits1-div">
					<p class="bold site-blue"><xsl:value-of select="//teiHeader//titleStmt/title[@type='alternative']"/></p>
					<p><span class="bold">Author(s) &amp; contributor(s):</span><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//titleStmt/author[@role='first-normalized']"/><xsl:value-of select="$additional-authors-1"/></p>
					<!--<p><span class="bold">Date(s):</span><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//sourceDesc/bibl[@type='sourceMetadata']/date"/></p>-->
					<p><span class="bold">Place(s) of creation:</span><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//sourceDesc/bibl[@type='sourceMetadata']/placeName[@type='compositionPlace']" separator=", "/></p>
					<p><span class="bold">Repository:</span><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//sourceDesc/msDesc/msIdentifier/repository" /> (<xsl:value-of select="//teiHeader//sourceDesc/msDesc/msIdentifier/settlement" />, <xsl:value-of select="//teiHeader//sourceDesc/msDesc/msIdentifier/country" />)</p>
					<p><span class="bold">Shelfmark / Identifier:</span><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//sourceDesc/msDesc/msIdentifier/idno[@type='shelfmark']" /></p>
					<p><span class="bold">Digital edition &amp; date:</span><xsl:text> </xsl:text><a href="https://onemorevoice.org/" target="_blank"><xsl:value-of select="//teiHeader//authority"/></a>, an imprint of <a href="http://livingstoneonline.org/" target="_blank">Livingstone Online</a>,<xsl:text> </xsl:text><xsl:value-of select="//teiHeader//publicationStmt/date"/></p>
					<p><span class="bold">Critical editing &amp; encoding</span><xsl:text>: </xsl:text> <xsl:value-of select="$encoding"/></p>
					<!--<p class="item-spec"><span class="bold">Encoding dates</span><xsl:text>: </xsl:text><xsl:value-of select="$sortedDates" separator=", "/></p>-->
					<p><span class="bold">Note:</span> This historical document, published in unabridged form, reflects the cultural distortions and prejudices of its time and may contain material that will upset or distress some readers.</p>
					<hr/>
				</div>
			</xsl:when>
			<xsl:when test="//sourceDesc/biblStruct[@type='journal']">
		    	<div class="credits" id="credits1-div">
					<p class="bold site-blue">“<xsl:value-of select="//teiHeader//titleStmt/title[1]"/>”</p>
					<p><span class="bold">Author(s) &amp; contributor(s):</span><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//titleStmt/author[@role='first-normalized']"/><xsl:value-of select="$additional-authors-1"/></p>
					<p><span class="bold">Date(s):</span><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//sourceDesc/bibl[@type='sourceMetadata']/date"/></p>
					<p><span class="bold">Original publication details:</span><xsl:text> </xsl:text>
						<span class="italic"><xsl:value-of select="//teiHeader//sourceDesc/biblStruct[@type='journal']//title"/></span>
						<xsl:text> </xsl:text>
						<xsl:value-of select="//teiHeader//sourceDesc/biblStruct[@type='journal']//imprint/biblScope[@unit='vol']"/>
						<xsl:text> (</xsl:text>
						<xsl:value-of select="//teiHeader//sourceDesc/biblStruct[@type='journal']//imprint/date"/>
						<xsl:text>): </xsl:text>
						<xsl:value-of select="//teiHeader//sourceDesc/biblStruct[@type='journal']//imprint/biblScope[@unit='pages']"/>
					</p>
					<p><span class="bold">Digital edition &amp; date:</span><xsl:text> </xsl:text><a href="https://onemorevoice.org/" target="_blank"><xsl:value-of select="//teiHeader//authority"/></a>, an imprint of <a href="http://livingstoneonline.org/" target="_blank">Livingstone Online</a>,<xsl:text> </xsl:text><xsl:value-of select="//teiHeader//publicationStmt/date"/></p>
					<p><span class="bold">Critical editing &amp; encoding</span><xsl:text>: </xsl:text> <xsl:value-of select="$encoding"/></p>
					<!--<p class="item-spec"><span class="bold">Encoding dates</span><xsl:text>: </xsl:text><xsl:value-of select="$sortedDates" separator=", "/></p>-->
					<p><span class="bold">Note:</span> This historical document, published in unabridged form, reflects the cultural distortions and prejudices of its time and may contain material that will upset or distress some readers.</p>
					<hr/>
				</div>
			</xsl:when>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="//sourceDesc/msDesc[@type='manuscript']">
				<div class="narrow-mobile" id="narrow-mobile-div">
					<p>Please turn your mobile device to <span class="site-red">landscape</span> or <span class="site-red">widen your browser window</span> for optimal viewing of this archival document.</p>
				</div>
				<div class="manuscript" id="manuscript-div"><!-- style="background:#{$body-color};" -->
					<div class="TEI front {$front}" style="background:#{$body-color-front};">
						<div class="ms-container">
						<xsl:comment><xsl:value-of select="$isPaged"/></xsl:comment>
						<xsl:choose>
							<xsl:when test="$isPaged='true' and //jc:page[@n=$pagenumber]">
								<xsl:apply-templates select="//jc:page[@n=$pagenumber]"/>
							</xsl:when>
							<xsl:when test="$isPaged='false'">
								<xsl:apply-templates select="text/front"/>
							</xsl:when>
							<xsl:when test="//jc:page[@n=$pagenumber]">
								<xsl:apply-templates select="//jc:page[@n=$pagenumber]"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="text/front"/>
							</xsl:otherwise>
						</xsl:choose>
						</div>
					</div>
					<div class="TEI" style="background:#{$body-color};">
						<div class="ms-container">
						<xsl:comment><xsl:value-of select="$isPaged"/></xsl:comment>
						<xsl:choose>
							<xsl:when test="$isPaged='true' and //jc:page[@n=$pagenumber]">
								<xsl:apply-templates select="//jc:page[@n=$pagenumber]"/>
							</xsl:when>
							<xsl:when test="$isPaged='false'">
								<xsl:apply-templates select="text/body"/>
							</xsl:when>
							<xsl:when test="//jc:page[@n=$pagenumber]">
								<xsl:apply-templates select="//jc:page[@n=$pagenumber]"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="text/body"/>
							</xsl:otherwise>
						</xsl:choose>
						</div>
					</div>
					<div class="TEI back {$back}" style="background:#{$body-color-back};">
						<div class="ms-container">
						<xsl:comment><xsl:value-of select="$isPaged"/></xsl:comment>
						<xsl:choose>
							<xsl:when test="$isPaged='true' and //jc:page[@n=$pagenumber]">
								<xsl:apply-templates select="//jc:page[@n=$pagenumber]"/>
							</xsl:when>
							<xsl:when test="$isPaged='false'">
								<xsl:apply-templates select="text/back"/>
							</xsl:when>
							<xsl:when test="//jc:page[@n=$pagenumber]">
								<xsl:apply-templates select="//jc:page[@n=$pagenumber]"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="text/back"/>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					</div>
				</div>
			</xsl:when>
			<xsl:when test="//sourceDesc/biblStruct[@type='journal']">
				<div class="journal" id="journal-div"><!-- style="background:#{$body-color};" -->
					<div class="TEI"><!-- style="background:#{$body-color};" -->	
						<xsl:comment><xsl:value-of select="$isPaged"/></xsl:comment>
						<xsl:choose>
							<xsl:when test="$isPaged='true' and //jc:page[@n=$pagenumber]">
								<xsl:apply-templates select="//jc:page[@n=$pagenumber]"/>
							</xsl:when>
							<xsl:when test="$isPaged='false'">
								<xsl:apply-templates select="text"/>
							</xsl:when>
							<xsl:when test="//jc:page[@n=$pagenumber]">
								<xsl:apply-templates select="//jc:page[@n=$pagenumber]"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="text"/>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</xsl:when>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="//sourceDesc/msDesc[@type='manuscript']">
				<div class="credits" id="credits2-div">
					<hr />
					<p class="back-button"><a href="../texts.html#{$LEAP-ID}">&#11013; Back</a></p>
					<p><span class="bold">Cite item (MLA)</span><xsl:text>: </xsl:text>
					<xsl:value-of select="//teiHeader//titleStmt/author[@role='first']"/>
					<xsl:value-of select="$additional-authors-2"/><xsl:text>. “</xsl:text>
					<xsl:value-of select="//teiHeader//titleStmt/title[@type='alternative']"/><xsl:text>.” </xsl:text><xsl:value-of select="$encoding"/><xsl:text>, eds. </xsl:text>
					<span class="italic">One More Voice</span>, an imprint of <span class="italic">Livingstone Online</span>. Site launch edition, <xsl:value-of select="//teiHeader//publicationStmt/date"/>. Web. <a href="https://onemorevoice.org/texts/{substring-before($filename, '.xml')}.html">https://onemorevoice.org/texts/<xsl:value-of select="substring-before($filename, '.xml')"/>.html</a>.</p>	
					<p><span class="bold">Terms of use:</span><xsl:text> </xsl:text><a href="{$license}" target="_blank"><xsl:value-of select="//teiHeader//publicationStmt/availability"/></a></p>
					<p><span class="bold">Production note</span>: This digital edition duplicates as much as possible the textual, structural, and material characteristics of the original document. The editors produced the edition by transcribing and encoding the text directly from images of the original document using the <span class="italic">One More Voice</span><xsl:text> </xsl:text><a href="../coding_guidelines.html">coding guidelines</a>. Users are encouraged, however, to consult the original document if possible.</p>
				</div>
			</xsl:when>
			<xsl:when test="//sourceDesc/biblStruct[@type='journal']">
				<div class="credits" id="credits2-div">
					<hr/>
					<p class="back-button"><a href="../texts.html#{$LEAP-ID}">&#11013; Back</a></p>
					<p><span class="bold">Cite item (MLA)</span><xsl:text>: </xsl:text>
					<xsl:value-of select="//teiHeader//titleStmt/author[@role='first']"/>
					<xsl:value-of select="$additional-authors-2"/><xsl:text>. “</xsl:text>
					<xsl:value-of select="//teiHeader//titleStmt/title[1]"/><xsl:text>.” </xsl:text><xsl:value-of select="$encoding"/><xsl:text>, eds. </xsl:text>
					<span class="italic">One More Voice</span>, an imprint of <span class="italic">Livingstone Online</span>. Site launch edition, <xsl:value-of select="//teiHeader//publicationStmt/date"/>. Web. <a href="https://onemorevoice.org/texts/{substring-before($filename, '.xml')}.html">https://onemorevoice.org/texts/<xsl:value-of select="substring-before($filename, '.xml')"/>.html</a>.</p>
					<p><span class="bold">Terms of use:</span><xsl:text> </xsl:text><a href="{$license}" target="_blank"><xsl:value-of select="//teiHeader//publicationStmt/availability"/></a></p>
					<p><span class="bold">Production note</span>: This digital edition duplicates as much as possible the textual and material characteristics of the original document. The editors produced the edition by using the following workflow: 1) Convert PDF of original document via OCR to Word; 2) Convert Word to XML;  3) Proofread XML against PDF of original document; and 4) Edit and encode XML using the <span class="italic">One More Voice</span><xsl:text> </xsl:text><a href="../coding_guidelines.html">coding guidelines</a>. Users are encouraged, however, to consult the original document if possible.</p>
				</div>
			</xsl:when>
		</xsl:choose>
			
		<div class="footer" id="footer-div">
            <hr />
			<p>&#169; 2020, <a href="https://creativecommons.org/licenses/by/4.0/" target="_blank">CC BY 4.0</a> | <span class="italic">One More Voice</span> is an imprint of <a href="https://livingstoneonline.org/" target="_blank">Livingstone Online</a> | Hosted by <a href="https://github.com/" target="_blank">GitHub</a> | Design &amp; admin: <a href="mailto:awisnicki@yahoo.com">Adrian S. Wisnicki</a> (University of Nebraska-Lincoln) | <a href="../site_map.html">Site Map</a></p>
        </div>
	</xsl:template>

	<!-- General match -->
	<xsl:template match="*" priority="-10">
		<xsl:variable name="class">
			<xsl:if test="@rend">
				<xsl:value-of select="translate(@rend, '-', '')"/>
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:if test="@place">
				<xsl:value-of select="translate(@place, '-', '')"/>
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:if test="@type">
				<xsl:value-of select="translate(@type, '-', '')"/>
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="title">
			<xsl:for-each select="@*">
				<xsl:sort/>
				<xsl:if test="not(name()='status')">
					<xsl:value-of select="concat(name(),': ', ., '; ')"/>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>
		<span>
			<xsl:if test="$class/text()">
				<xsl:attribute name="class">
					<xsl:value-of select="$class"/>
				</xsl:attribute>
			</xsl:if>
			<!--<xsl:if test="$title/text()">
				<xsl:attribute name="title">
					<xsl:value-of select="$title"/>
				</xsl:attribute>
			</xsl:if>-->
			<!-- Necessary to turn this off, otherwise it creates wonky tooltips.
			Tooltips as needed should be set on the specific element. -->
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<!-- Make rend class -->
	<xsl:template match="*/@rend" priority="-1">
		<xsl:attribute name="class">
			<xsl:value-of select="concat(parent::node()/name(), ' ')"/>
			<xsl:value-of select="translate(., '-', '')"/>
		</xsl:attribute>
	</xsl:template>

	<!-- Textual divisions -->
	<xsl:template match="text|body|front|back">
		<div class="{concat(name(), ' ', translate(@rend, '-', ''))}">
			<xsl:apply-templates/>
		</div>
	</xsl:template>

	<xsl:template match="div">
		<div class="{concat(name(), ' ', translate(@rend, '-', ''))}">
			<xsl:apply-templates/>
		</div>
	</xsl:template>

	<xsl:template match="lb">
		<xsl:variable name="class">
			<xsl:if test="@rend">
				<xsl:value-of select="translate(@rend, '-', '')"/>
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:if test="@place">
				<xsl:value-of select="translate(@place, '-', '')"/>
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:if test="@type">
				<xsl:value-of select="translate(@type, '-', '')"/>
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:variable>
		<!--<br/><xsl:if test="$class/text()"><xsl:attribute name="class"><xsl:value-of select="$class"/></xsl:attribute></xsl:if></br>-->
		<!--<xsl:variable name="lb-with-p">
			<xsl:choose>
				<xsl:when test="lb[child::p]"/>
				<xsl:otherwise>
					<br/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>-->
		<!-- <xsl:value-of select="$lb-with-p"/>  -->
			<br/>
		<xsl:variable name="num">
			<xsl:number level="any" from="pb"/>
		</xsl:variable>
		<xsl:if test="number($num) mod 5 =0">
			<span class="linenumber">
				<xsl:value-of select="$num"/>
			</span>
		</xsl:if>
	</xsl:template>

	<xsl:template match="choice">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="choice/sic">
			<xsl:variable name="choice-orig-sic">
			<xsl:choose>
				<!-- If there are orig and reg values in the corr, show the orig -->
				<xsl:when test="../corr/choice/orig">
					<xsl:value-of select="../corr/choice/orig"/>
				</xsl:when>
				<!-- If there are sic and corr values in the corr, show both sic and corr -->
				<xsl:when test="../corr/choice/sic">
					<xsl:value-of select="../corr/choice/sic"/> [or] <xsl:value-of select="../corr/choice/corr"/>
				</xsl:when>
				<!-- If there are two rdgs, show both rdgs -->
				<xsl:when test="../corr/app/rdg">
					<xsl:value-of select="../corr/app/rdg[1]"/> [or] <xsl:value-of select="../corr/app/rdg[2]"/>
				</xsl:when>
				<xsl:when test="../corr[not(text())]">[no text]</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="../corr"/>
				</xsl:otherwise>
			</xsl:choose>			
			</xsl:variable>
			<span class="sic diplomatic">
				<xsl:attribute name="title">The editors suggest a correction as follows: <xsl:value-of select="$choice-orig-sic"/></xsl:attribute>
				<xsl:apply-templates/>
			</span>
	</xsl:template>

	<!-- "Choice" variants begin here -->

	<xsl:template match="abbr|orig">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="corr|expan|reg"/>
	
	<!-- Text below removed for annotated edition; also see app, supplied & unclear -->
	
	<!--<xsl:template match="choice/abbr">
		<span class="abbr diplomatic">
			<xsl:if test="../expan">
				<xsl:attribute name="title"><xsl:value-of select="../expan"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="choice/expan">
		<span class="abbr edited hidden">
			<xsl:if test="../abbr">
				<xsl:attribute name="title"><xsl:value-of select="."/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="../abbr[1]/node()"/>
		</span>
	</xsl:template>

	<xsl:template match="choice/orig|choice/reg">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="orig">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="reg" priority="10"> </xsl:template>-->

	<!-- "Choice" variants end here -->

	<!-- Alphabetical list of elements. Alphabetized by last element in path *or* first element among options. -->

	<xsl:template match="ab|p">
		<p class="{concat(name(), ' ', translate(@rend, '-', ''))}">
			<xsl:apply-templates/>
		</p>
	</xsl:template>

	<!-- For "abbr" see above -->

	<xsl:template match="add">
			<span class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', translate(@place, '-', ''))}">
			<xsl:apply-templates/></span>
	</xsl:template>

	<xsl:template match="add[@place='marginleft']|add[@place='marginright']" priority="10">
		<span class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', translate(@place, '-', ''))}"> [<xsl:apply-templates/>] </span>
	</xsl:template>

	<xsl:template match="add[@place='over-text']">
		<span class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', translate(@place, '-', ''))}" title="Addition written over existing text">{<xsl:apply-templates/>}</span>
	</xsl:template>

	<xsl:template match="opener/add">
		<span
			class="opener-add {concat(name(), ' ', translate(@rend, '-', ''), ' ', translate(@place, '-', ''))}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="address">
		<span class="address">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="addrLine">
		<br/>
		<span class="{concat(name(), ' ', translate(@rend, '-', ''))}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<!-- Start of addSpan/anchor -->

	<xsl:template match="tei:addSpan[preceding-sibling::node()[1][name()='p']]|tei:addSpan[preceding-sibling::node()[2][name()='p']]|p/addSpan">
		<br/>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="tei:addSpan|p/anchor">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="tei:anchor">		
		<xsl:apply-templates/>
		<br/>
	</xsl:template>

	<!-- End of addSpan/anchor -->

	<!-- app: show first rdg, offer alternatives in title -->
	<xsl:template match="app">
		<!-- Hidden for annotated version. Also choice, supplied & unclear. -->
		<!--<span class="app">
			<xsl:attribute name="title">
				<xsl:for-each select="rdg">
					<xsl:value-of select="concat(name(),': ', ., '; ')"/>
				</xsl:for-each>
			</xsl:attribute>
			<xsl:apply-templates select="rdg[1]"/>
		</span>-->
		<xsl:variable name="rdg-rdg">
			<xsl:value-of select="../app/rdg" separator=" [or] "/>
		</xsl:variable>
		<span class="app">
			<xsl:attribute name="title">This passage can be read in alternate ways: <xsl:value-of select="$rdg-rdg"/></xsl:attribute>
			<xsl:apply-templates select="rdg[1]"/>
		</span>
	</xsl:template>

	<!-- For "back" see above -->

	<!-- For "body" see above -->
	<xsl:template match="cb">
		<xsl:choose>
			<xsl:when test="//sourceDesc/msDesc[@type='manuscript']">
				<br/>
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when test="//sourceDesc/biblStruct [@type='journal']">
				<xsl:apply-templates/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="div/cb">
		<xsl:apply-templates/>
	</xsl:template>

	<!-- For "choice" see above -->

	<xsl:template match="closer">
		<span class="{concat(name(), ' ', translate(@rend, '-', ''))}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<!-- For "corr" see above -->

	<xsl:template match="dateline">
		<span class="{concat(name(), ' ', translate(@rend, '-', ''))}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="del">
		<span class="del cancelled">
			<!--<xsl:if test="@*">
				<xsl:attribute name="title">
					<xsl:value-of select="concat(name(), 'etion, ')"/>
					<xsl:for-each select="@*">
						<xsl:sort/>
						<xsl:if test="not(name()='status')">
							<xsl:value-of select="concat(name(),': ', ., '; ')"/>
						</xsl:if>
					</xsl:for-each>
				</xsl:attribute>
			</xsl:if>-->
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="del[following-sibling::add[1][@place='over-text']]" priority="10">
		<span class="del-by-over-text" title="Text deleted by over-writing"><xsl:apply-templates/></span>
	</xsl:template>

	<!-- For "div" see above -->

	<!-- For "expan" see above -->

	<!-- For "facsimile" see above -->

	<!-- For "front" see above -->

	<xsl:template match="figure">
		<!-- newFigDesc goes away and applies templates to content to get it into a single dedupped string -->
		<xsl:variable name="newHead">
			<xsl:apply-templates select="head" mode="normalizeHead"/>
		</xsl:variable>
		<xsl:variable name="newFigDesc">
			<xsl:apply-templates select="figDesc" mode="normalizeFigDesc"/>
		</xsl:variable>
		<xsl:variable name="graphicURL">
			<xsl:apply-templates select="..//@url"/>
		</xsl:variable>
		<xsl:choose>
			<!--<xsl:when test="head and $newFigDesc/text()">
				<span class="{concat(name(), ' ', @rend, ' ', @place)}" title="{concat('&quot;', $newHead, '.&quot; ', $newFigDesc)}">{figure}</span>
			</xsl:when>
			<xsl:when test="head and not($newFigDesc/text())">
				<span class="{concat(name(), ' ', @rend, ' ', @place)}" title="{concat('&quot;', $newHead, '.&quot; ')}">{figure}</span>
			</xsl:when>
			<xsl:when test="not(head) and $newFigDesc/text()">
				<span class="{concat(name(), ' ', @rend, ' ', @place)}" title="{$newFigDesc}">{figure}</span>
			</xsl:when>-->
			<xsl:when test="..//graphic[@n='medium']">
				<span class="graphic image-medium"><!--<a href="{$graphicURL}">--><img src="{$graphicURL}" style="width:100%;"/><!--</a>--></span>
			</xsl:when>
			<xsl:when test="..//graphic[@n='small']">
				<span class="graphic image-small"><!--<a href="{$graphicURL}">--><img src="{$graphicURL}" style="width:100%;"/><!--</a>--></span>
			</xsl:when>
			<xsl:when test="..//graphic[@n='inline-left small']">
				<span class="graphic image-small inline-left"><!--<a href="{$graphicURL}">--><img src="{$graphicURL}" style="width:100%;"/><!--</a>--></span>
			</xsl:when>
			<xsl:when test="..//graphic">
				<span class="graphic"><!--<a href="{$graphicURL}">--><img src="{$graphicURL}" style="width:100%;"/><!--</a>--></span>
			</xsl:when>
			<xsl:otherwise>
				<span class="{concat(name(), ' ', @rend, ' ', @place)}">{figure}</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Template passes through abbr, sic, and orig in head in normalizeHead mode -->
	<xsl:template match="head//abbr|head//sic|head//orig" mode="normalizeHead">
		<xsl:apply-templates/>
	</xsl:template>

	<!-- Template kills through expan, corr, reg, and supplied in head in normalizeHead mode -->
	<xsl:template match="head//expan|head//corr|head//reg|head//supplied"
		mode="normalizeHead"/>

	<!-- Template passes through abbr, sic, and orig in figDesc in normalizeFigDesc mode -->
	<xsl:template match="figDesc//abbr|figDesc//sic|figDesc//orig" mode="normalizeFigDesc">
		<xsl:apply-templates/>
	</xsl:template>

	<!-- Template kills through expan, corr, reg, and supplied in figDesc in normalizeFigDesc mode -->
	<xsl:template match="figDesc//expan|figDesc//corr|figDesc//reg|figDesc//supplied"
		mode="normalizeFigDesc"/>

	<xsl:template match="add[@place='marginleft']/figure|add[@place='marginright']/figure" priority="10">
		<xsl:choose>
		<xsl:when test="head">
			<span class="figure" title="{concat('&quot;', head, '.&quot; ', figDesc)}">figure</span>
		</xsl:when>
		<xsl:otherwise>
			<span class="figure" title="{figDesc}">figure</span>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- An undefined foreign word. -->
	<xsl:template match="foreign[not(term[@xml:lang])]">
		<!--<xsl:variable name="title">A foreign word (not defined).</xsl:variable>
		<span class="foreign" title="{$title}">-->
			<xsl:apply-templates/>
		<!--</span>-->
	</xsl:template>

	<xsl:template match="fw|fw[@type='catch']|fw[@type='pageno']">
		<span class="{concat(name(), ' ', @type, ' ', @rend, ' ', @place)}" title="">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="gap[@extent][@unit]" priority="10">
		<xsl:choose>
			<xsl:when test="@unit='chars'"><span class="gap" title="{concat(name(), ', extent: ',@extent, ' ', @unit)}">[<xsl:for-each select="1 to @extent">&#x00A0;</xsl:for-each>]</span></xsl:when>
			<xsl:when test="@unit='words'"><span class="gap" title="{concat(name(), ', extent: ',@extent, ' ', @unit)}">[<xsl:for-each select="1 to @extent">&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;</xsl:for-each>]</span></xsl:when>
			<xsl:when test="@unit='lines'"><span class="gap" title="{concat(name(), ', extent: ',@extent, ' ', @unit)}">[&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;]</span></xsl:when>
			<xsl:otherwise><span class="gap" title="{concat(name(), ', extent: ',@extent, ' ', @unit)}">[<xsl:for-each select="1 to @extent">&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;</xsl:for-each>]</span></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- remove gb spans -->
	<xsl:template match="gb">
		<xsl:apply-templates/>
	</xsl:template>

	<!-- do not show graphic -->
	<xsl:template match="graphic"/>

	<xsl:template match="head">
		<span class="{concat(name(), ' ', @type, ' ', @rend, ' ', @place)}" title="">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="idno[@type='LEAP-ID']">
		<span class="idno"><xsl:apply-templates/></span>
	</xsl:template>

	<xsl:template match="list/item">
		<span class="listitem" title="item">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<!-- For "lb" see above -->

	<xsl:template match="list">
		<span class="{concat(name(), ' ', @type, ' ', @rend, ' ', @place)}" title="list">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="metamark"><span class="metamark {@rend} {@function} {@place}" title="Editorial symbol, mark, or unusual character">#</span></xsl:template>

	<xsl:template match="add[@place='marginleft']/metamark|add[@place='marginright']/metamark" priority="10">
			<span class="metamark {@rend} {@function} {@place}" title="Editorial symbol, mark, or unusual character">#</span>
	</xsl:template>

	<xsl:template match="milestone">
		<xsl:choose>
			<xsl:when test="//sourceDesc/msDesc[@type='manuscript']">
				<xsl:choose>
					<xsl:when test="contains(@rend,'double-line')">
						<hr class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', 'line', ' ', 'first-double')}"/><br/>
						<!--<hr class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', 'second-line')}"/>-->
					</xsl:when>
					<xsl:when test="contains(@rend,'triple-line')">
						<hr class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', 'line')}"/>
						<hr class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', 'third-line')}"/>
						<hr class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', 'third-line')}"/>
					</xsl:when>
					<xsl:otherwise>
						<hr class="{concat(name(), ' ', translate(@rend, '-', ''))}"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="//sourceDesc/biblStruct[@type='journal']">
				<xsl:choose>
					<xsl:when test="contains(@rend,'double-line')">
						<hr class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', 'line', ' ', 'first-double')}"/>
						<!--<hr class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', 'second-line')}"/>-->
					</xsl:when>
					<xsl:when test="contains(@rend,'triple-line')">
						<hr class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', 'line')}"/>
						<hr class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', 'third-line')}"/>
						<hr class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', 'third-line')}"/>
					</xsl:when>
					<xsl:otherwise>
						<hr class="{concat(name(), ' ', translate(@rend, '-', ''))}"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="note">
		<xsl:choose>
			<xsl:when test="//sourceDesc/msDesc[@type='manuscript']">
				<span class="{concat(name(), ' ', @type, ' ', @rend, ' ', @place, ' ', @anchored)}">[<xsl:apply-templates/>]</span>
			</xsl:when>
			<xsl:when test="//sourceDesc/biblStruct[@type='journal']">
				<span class="{concat(name(), ' ', @type, ' ', @rend, ' ', @place, ' ', @anchored)}"><xsl:apply-templates/></span>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="note[ancestor::add[@place='marginleft']]" priority="10">
		<span class="{concat(name(), ' ', @type, ' ', @rend, ' ', @place)}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="p/note" priority="8">
		<span class="{concat(name(), ' ', @type, ' ', @rend, ' ', @place)}"><xsl:apply-templates/></span>
	</xsl:template>

	<xsl:template match="opener">
		<span class="{concat(name(), ' ', translate(@rend, '-', ''))}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="orgName">
		<span class="orgName"><xsl:attribute name="title">A formally-named group or organization.</xsl:attribute><xsl:apply-templates/></span>
	</xsl:template>

	<!-- For "orig" see above -->

	<xsl:template match="text/body/div[1]/pb[1]|text/front/div[1]/pb[1]|text/back/div[1]/pb[1]" priority="10">
		<span class="pb-title">
			<xsl:value-of select="@n"/>
		</span>
	</xsl:template>

	<xsl:template match="pb[@type='blank']">
		<br/>
		<span class="pb-title">
			<xsl:value-of select="@n"/>
		</span>
		<span class="blank">&lt;This page is blank in the original manuscript.&gt;</span>
		<!--<xsl:for-each select="1 to @ana"><br/></xsl:for-each>-->
	</xsl:template>

	<xsl:template match="pb">
		<xsl:choose>
			<xsl:when test="//sourceDesc/msDesc[@type='manuscript']">
				<br/>
				<span class="pb-title">
					<xsl:value-of select="@n"/>
				</span>
			</xsl:when>
			<xsl:when test="//sourceDesc/biblStruct[@type='journal']">
				<span class="pb-title">
					<xsl:value-of select="@n"/>
				</span>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<!-- Not sure what this does. AW -->
	<xsl:template match="jc:page">
		<xsl:choose> 
			<xsl:when test="//sourceDesc/msDesc[@type='manuscript']">
			<div class="page">
				<!--<br/>-->
				<span class="pb-title">
					<xsl:value-of select="@n"/>
				</span>
				<xsl:apply-templates/>
			</div>
			</xsl:when>
			<xsl:when test="//sourceDesc/biblStruct[@type='journal']">
				<div class="page">
					<span class="pb-title">
						<xsl:value-of select="@n"/>
					</span>
					<xsl:apply-templates/>
				</div>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

<!-- placeNames -->

	<xsl:template match="placeName">
		<span class="region"><xsl:attribute name="title">A formally-named place.</xsl:attribute><xsl:apply-templates/></span>
	</xsl:template>

	<xsl:template match="geogName">
		<span class="geogName"><xsl:attribute name="title">A formally-named geographical entity.</xsl:attribute><xsl:apply-templates/></span>
	</xsl:template>

	<!--<xsl:template match="bloc">
		<span class="bloc"><xsl:attribute name="title">A multinational entity, usually continents.</xsl:attribute><xsl:apply-templates/></span>
	</xsl:template>-->

	<!--<xsl:template match="country">
		<span class="country"><xsl:attribute name="title">A country.</xsl:attribute><xsl:apply-templates/></span>
	</xsl:template>-->

	<xsl:template match="region">
		<span class="region"><xsl:attribute name="title">A formally-named region.</xsl:attribute><xsl:apply-templates/></span>
	</xsl:template>

	<xsl:template match="settlement">
		<span class="region"><xsl:attribute name="title">A settlement, such as a city, town, or village.</xsl:attribute><xsl:apply-templates/></span>
	</xsl:template>

	<xsl:template match="bloc|country">
		<xsl:apply-templates/>
	</xsl:template>

<!-- end placeNames -->

	<xsl:template match="postscript">
		<xsl:apply-templates/>
	</xsl:template>

	<!-- For "reg" see above -->

	<xsl:template match="rdg">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="opener/salute">
		<span class="opener-salute">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="closer/salute">
		<span class="closer-salute">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="seg[@n='none']">
		<span class="{concat(name(), ' ', translate(@n, '-', ''))}"><xsl:apply-templates/></span>
	</xsl:template>


	<!-- For "sic" see above -->

	<xsl:template match="signed">
		<span class="signed">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="space[@extent][@unit]" priority="10">
		<xsl:choose>
			<xsl:when test="@unit='chars'">
				<span class="space">
					<xsl:for-each select="1 to @extent">&#x00A0;&#x00A0;</xsl:for-each>
				</span>
			</xsl:when>
			<xsl:when test="@unit='words'">
				<span class="space">
					<xsl:for-each select="1 to @extent"
						>&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;</xsl:for-each>
				</span>
			</xsl:when>
			<xsl:when test="@dim='vertical'">
				<!--<xsl:for-each select="1 to @extent"><br/></xsl:for-each>-->
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:otherwise>
				<span class="space-other">
					[<xsl:for-each select="1 to @extent">&#x00A0;&#x00A0;</xsl:for-each>]</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="subst">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="supplied">			
		<span class="supplied"><xsl:attribute name="title">The editors have supplied this text because it is illegible, not visible in, or missing from the original item.</xsl:attribute><xsl:text>[</xsl:text><xsl:apply-templates/><xsl:text>]</xsl:text>
		</span>
	</xsl:template>
	
	<!-- Text below removed for annotated edition; also see app, choice & unlcear -->
	<!--<xsl:template match="supplied">
		<span class="supplied edited hidden"> <xsl:if test="@*"> <xsl:attribute name="title">
			<xsl:value-of select="concat(name(), ', certainty: ', @cert, ', reason: ', @reason)"/>
			</xsl:attribute> </xsl:if>[<xsl:apply-templates select="node()"/>]</span>
	</xsl:template>-->

	<!-- For "surface" see above -->

	<!-- Beginning of elements that go with table -->
	<xsl:template match="table">
		<table>
			<xsl:apply-templates/>
			<!-- select="@*|node()" -->
		</table>
	</xsl:template>

	<xsl:template match="row">
		<tr>
			<xsl:apply-templates/>
			<!-- select="@*|node()" -->
		</tr>
	</xsl:template>

	<xsl:template match="cell">
		<td> &#x00A0;<xsl:apply-templates/>&#x00A0;<!-- select="@*|node()" --> </td>
	</xsl:template>
	<!-- End of elements that go with table -->

	<!-- For "TEI" see above -->

	<!-- For "teiHeader" see above -->

	<xsl:template match="term[@type]" priority="1">
		<!--<span class="term" title="{@type}">-->
		<xsl:apply-templates/>
		<!--</span>-->
	</xsl:template>

	<xsl:template match="term[@type='collective']" priority="10">
		<span class="collective"><xsl:attribute name="title">A collective term that signifies an individual or plural entity.</xsl:attribute><xsl:apply-templates/></span>
	</xsl:template>

	<!-- For "text" see above -->

	<xsl:template match="trailer">
		<span class="{concat(name(), ' ', translate(@rend, '-', ''))}"><xsl:apply-templates/></span>
	</xsl:template>

	<xsl:template match="unclear">
		<span class="unclear">
				<xsl:choose>
				<xsl:when test="@cert">
					<xsl:attribute name="title">
						<xsl:value-of select="concat('word(s) ', name(), '; certainty of transcription: ', @cert)"/>
					</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="title">
						<xsl:value-of select="concat('word(s) ', name())"/>
					</xsl:attribute>
				</xsl:otherwise>
				</xsl:choose>
			<xsl:apply-templates select="node()"/>
		</span>
	</xsl:template>

	<xsl:template match="w">
		<xsl:apply-templates/>
	</xsl:template>

	<!-- For "zone" see above -->


	<!-- Code not in use, but that could be useful -->

	<!--  <xsl:template match="*[not(@type)][not(@reason)][not(@unit)][not(@extent)]" priority="-1">
		<span class="{name()}"><xsl:apply-templates select="@*|node()"/></span>
		</xsl:template> -->

	<!--<xsl:template match="choice/orig">
		<span class="orig diplomatic">
			<xsl:if test="../reg">
				<xsl:attribute name="title">reg: <xsl:value-of select="../reg"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</span>
	</xsl:template>-->

	<!--<xsl:template match="choice/reg" priority="10">
		<span class="reg edited hidden">
			<xsl:if test="../orig">
				<xsl:attribute name="title">orig: <xsl:value-of select="../orig"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="../orig/node()"/>
		</span>
	</xsl:template>-->

	<!--<xsl:template match="figure/head">
		<span class="figHead">
			<xsl:apply-templates/>
		</span>
	</xsl:template>-->

	<!--<xsl:template match="figure/figDesc">
		<xsl:variable name="title"><xsl:apply-templates/></xsl:variable>
		<span class="figfigDesc" title="{$title}">{figure}</span>
	</xsl:template>-->


	<!-- foreign should be italiced in edited view -->
	<!-- <xsl:template match="foreign" xml:space="preserve">
		<span class="foreign diplomatic">
		<xsl:if test="@xml:lang">
			<xsl:attribute name="title">
				<xsl:value-of select="concat('lang: ', @xml:lang)"/>
			</xsl:attribute>
		</xsl:if>
				<xsl:apply-templates/>
		</span>
		<span class="foreign foreignItalic edited hidden" style="font-style:italic;">
		<xsl:if test="@xml:lang">
			<xsl:attribute name="title">
				<xsl:value-of select="concat('lang: ', @xml:lang)"/>
			</xsl:attribute>
		</xsl:if>
			<xsl:apply-templates/></span>
		</xsl:template>-->

	<!--<xsl:template match="fw[@type='pageno']">
		<span class="fw pageno" title="">
			<xsl:apply-templates/>
		</span>
		<br/>
	</xsl:template>-->

	<!--<xsl:template match="lb">
		<br/>
		<xsl:variable name="num">
			<xsl:number level="any" from="pb"/>
		</xsl:variable>
		<xsl:if test="number($num) mod 5 =0">
			<span class="linenumber">
				<xsl:value-of select="$num"/>
			</span>
		</xsl:if>
	</xsl:template>-->
	<!--[not(ancestor::note)]-->

	<!--<xsl:template match="space[@extent][@unit][@dim='vertical']" priority="1">
		<span class="space-other vertical verticalSpace">
			<xsl:attribute name="title">
				<xsl:for-each select="@*">
					<xsl:sort/>
					<xsl:value-of select="concat(name(),': ', ., '; ')"/>
				</xsl:for-each>
			</xsl:attribute>
			<xsl:for-each select="1 to @extent">
				<br class="verticalSpace"/>
			</xsl:for-each>
		</span>
	</xsl:template>-->

</xsl:stylesheet>

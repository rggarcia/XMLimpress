<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" 
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" 
  doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="UTF-8" indent="yes"/>

<xsl:template match="impress">
	<html>
	<head>
	<xsl:if test="/impress/@numbered='yes'">
	<script>
		window.addEventListener("impress:stepleave", function (event) {
 			document.getElementById("header").innerHTML="";
	        }, false);
		window.addEventListener("impress:stepenter", function (event) {
			document.getElementById("header").innerHTML="- "+event.target.id.slice(5)+" -";
		}, false);
	</script>
	</xsl:if>
	<style>
		<xsl:value-of select="/impress/style"/>
		#header {
			witdh:100%;
			text-align:center;
			color: gray;
		}
	</style>
	<title><xsl:value-of select="/impress/title"/></title>
	</head>
	<body onload="impress().init();">
		<script src="impress.js"></script>

		<div id="header">
		</div>
		<div id="impress"> 
			<xsl:apply-templates select="step"/>
		</div>
	</body>
	</html>
</xsl:template>

<xsl:template match="step">
	<xsl:variable name="x-inc"><xsl:value-of select="../increment/@x"/></xsl:variable>
	<xsl:variable name="y-inc"><xsl:value-of select="../increment/@y"/></xsl:variable>
	<xsl:variable name="rotate-inc"><xsl:value-of select="../increment/@angle"/></xsl:variable>
	<xsl:variable name="loop"><xsl:value-of select="../increment/@length"/></xsl:variable>

	<xsl:variable name="data-x" select="position() * $x-inc - floor(position() div $loop) * $loop * $x-inc" />
	<xsl:variable name="data-y" select="floor((position() - 1) div $loop) * $y-inc" />
	<xsl:variable name="data-rotate" select="(position() - 1) * $rotate-inc - floor(position() div $loop) * $rotate-inc" />

	<div class="step" data-x="{$data-x}" data-y="{$data-y}" data-rotate="{$data-rotate}"> 
		<xsl:copy-of select="."/>
	</div>
</xsl:template>

</xsl:stylesheet>


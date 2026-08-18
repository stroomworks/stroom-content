<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:stroom="stroom"
   xmlns:pb="plan-b:2"
   exclude-result-prefixes="stroom"
   version="2.0">

   <xsl:template match="*:records">
       <pb:plan-b
           version="2.0"
           xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
           xsi:schemaLocation="plan-b:2 file://plan-b-v2.0.xsd">
         <xsl:apply-templates select="*:record"/>
       </pb:plan-b>
   </xsl:template>

   <xsl:template match="*:record">
       <xsl:variable name="type" select="*:data[@name='type']/@value"/>
      <xsl:variable name="timestamp" select="*:data[@name='timestamp']/@value"/>
       <xsl:variable name="thingIdref" select="*:data[@name='thing-idref']/@value"/>
       <xsl:variable name="locationIdref" select="*:data[@name='location-idref']/@value"/>
       <xsl:variable name="status" select="*:data[@name='status']/@value"/>
       <xsl:variable name="message" select="*:data[@name='message']/@value"/>

       <!-- Extract strings manually from the flat JSON returned by the lookup stores -->
       <xsl:variable name="locationJson" select="stroom:lookup('location_mysql_store', $locationIdref, $timestamp)"/>
       <xsl:variable name="coords" select="substring-before(substring-after($locationJson, '&quot;location&quot;:&quot;'), '&quot;')"/>

       <xsl:variable name="personJson" select="stroom:lookup('person_mysql_store', $thingIdref, $timestamp)"/>
       <xsl:variable name="name" select="substring-before(substring-after($personJson, '&quot;name&quot;:&quot;'), '&quot;')"/>
       <xsl:variable name="icon" select="substring-before(substring-after($personJson, '&quot;icon&quot;:&quot;'), '&quot;')"/>

       <xsl:variable name="fmtTimestamp" select="format-dateTime(xs:dateTime($timestamp), '[Y0001]-[M01]-[D01]T[H01]:[m01]:[s01].[f001]Z')"/>

       <!-- Parse coordinates for Edit Mode placement -->
       <xsl:variable name="mapId" select="normalize-space(substring-before($coords, ','))"/>
       <xsl:variable name="coordsRest" select="substring-after($coords, ',')"/>
       <xsl:variable name="x" select="normalize-space(substring-before($coordsRest, ','))"/>
       <xsl:variable name="y" select="normalize-space(substring-after($coordsRest, ','))"/>

       <pb:temporal-state>
           <pb:map>map_mysql_store</pb:map>
           <pb:key><xsl:value-of select="$thingIdref"/></pb:key>
           <pb:time><xsl:value-of select="$fmtTimestamp"/></pb:time>
           <pb:value>
{
 "type": "person",
 "name": "<xsl:choose><xsl:when test="$name"><xsl:value-of select="$name"/></xsl:when><xsl:otherwise><xsl:value-of select="$thingIdref"/></xsl:otherwise></xsl:choose>",
 "location": "<xsl:choose><xsl:when test="$coords"><xsl:value-of select="$coords"/></xsl:when><xsl:otherwise>map3, 0.0, 0.0</xsl:otherwise></xsl:choose>",
 "icon": "<xsl:choose><xsl:when test="$icon"><xsl:value-of select="$icon"/></xsl:when><xsl:otherwise></xsl:otherwise></xsl:choose>",
 "coords": [<xsl:choose><xsl:when test="$x"><xsl:value-of select="$x"/></xsl:when><xsl:otherwise>0.0</xsl:otherwise></xsl:choose>, <xsl:choose><xsl:when test="$y"><xsl:value-of select="$y"/></xsl:when><xsl:otherwise>0.0</xsl:otherwise></xsl:choose>],
 "maps": ["<xsl:choose><xsl:when test="$mapId"><xsl:value-of select="$mapId"/></xsl:when><xsl:otherwise>map3</xsl:otherwise></xsl:choose>"],
 "tm-world-to-map": [1.0, 0.0, 0.0, 1.0, 0.0, 0.0],
 "status": "<xsl:choose><xsl:when test="$status"><xsl:value-of select="$status"/></xsl:when><xsl:otherwise>OK</xsl:otherwise></xsl:choose>",
 "message": "<xsl:value-of select="$message"/>"
}
           </pb:value>
       </pb:temporal-state>
   </xsl:template>

   <xsl:template match="text()"/>
</xsl:stylesheet>

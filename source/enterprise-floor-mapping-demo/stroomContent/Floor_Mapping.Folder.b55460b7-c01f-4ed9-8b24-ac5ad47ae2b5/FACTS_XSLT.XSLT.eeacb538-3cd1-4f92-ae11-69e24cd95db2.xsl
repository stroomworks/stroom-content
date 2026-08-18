<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:pb="plan-b:2"
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
       <xsl:variable name="id" select="*:data[@name='id']/@value"/>
       <xsl:variable name="rawTime" select="*:data[@name='valid-from']/@value"/>
       <xsl:variable name="name" select="*:data[@name='name']/@value"/>
       <xsl:variable name="icon" select="*:data[@name='icon']/@value"/>
       <xsl:variable name="location" select="*:data[@name='location']/@value"/>

       <!-- Normalize 2007-04-05T12:30.045Z to 2007-04-05T12:30:00.045Z -->
       <xsl:variable name="normalizedTime">
           <xsl:choose>
               <xsl:when test="contains($rawTime, '.') and string-length(substring-before(substring-after($rawTime, 'T'), '.')) = 5">
                   <xsl:value-of select="concat(substring-before($rawTime, '.'), ':00.', substring-after($rawTime, '.'))"/>
               </xsl:when>
               <xsl:otherwise>
                   <xsl:value-of select="$rawTime"/>
               </xsl:otherwise>
           </xsl:choose>
       </xsl:variable>
       <xsl:variable name="fmtTimestamp" select="format-dateTime(xs:dateTime($normalizedTime), '[Y0001]-[M01]-[D01]T[H01]:[m01]:[s01].[f001]Z')"/>

       <xsl:choose>
           <!-- 1. People facts -> store in person_mysql_store as flat JSON string -->
           <xsl:when test="$type = 'person'">
               <pb:temporal-state>
                   <pb:map>person_mysql_store</pb:map>
                   <pb:key><xsl:value-of select="$id"/></pb:key>
                   <pb:time><xsl:value-of select="$fmtTimestamp"/></pb:time>
                   <pb:value>{"name":"<xsl:value-of select="$name"/>","icon":"<xsl:value-of select="$icon"/>"}</pb:value>
               </pb:temporal-state>
           </xsl:when>

           <!-- 2. Gates / Printers / Network-devices -> store in location_mysql_store as flat JSON string -->
           <xsl:when test="$type = 'gate' or $type = 'network-device'">
               <pb:temporal-state>
                   <pb:map>location_mysql_store</pb:map>
                   <pb:key><xsl:value-of select="$id"/></pb:key>
                   <pb:time><xsl:value-of select="$fmtTimestamp"/></pb:time>
                   <pb:value>{"name":"<xsl:value-of select="$name"/>","location":"<xsl:value-of select="$location"/>"}</pb:value>
               </pb:temporal-state>

               <!-- Parse coordinates and write to map_mysql_store for Facts tab static visualization -->
               <xsl:variable name="mapId" select="normalize-space(substring-before($location, ','))"/>
               <xsl:variable name="coordsRest" select="substring-after($location, ',')"/>
               <xsl:variable name="x" select="normalize-space(substring-before($coordsRest, ','))"/>
               <xsl:variable name="y" select="normalize-space(substring-after($coordsRest, ','))"/>

               <pb:temporal-state>
                   <pb:map>map_mysql_store</pb:map>
                   <pb:key><xsl:value-of select="$id"/></pb:key>
                   <pb:time><xsl:value-of select="$fmtTimestamp"/></pb:time>
                   <pb:value>
{
 "type": "<xsl:choose><xsl:when test="$type='gate'">gates</xsl:when><xsl:otherwise>computers</xsl:otherwise></xsl:choose>",
 "name": "<xsl:value-of select="$name"/>",
 "coords": [<xsl:choose><xsl:when test="$x"><xsl:value-of select="$x"/></xsl:when><xsl:otherwise>0.0</xsl:otherwise></xsl:choose>,<xsl:choose><xsl:when test="$y"><xsl:value-of select="$y"/></xsl:when><xsl:otherwise>0.0</xsl:otherwise></xsl:choose>],
 "maps": ["<xsl:value-of select="$mapId"/>"],
 "tm-world-to-map": [1.0, 0.0, 0.0, 1.0, 0.0, 0.0]
}
                   </pb:value>
               </pb:temporal-state>
           </xsl:when>

           <!-- 3. Background Images -> store in map_mysql_store -->
           <xsl:when test="$type = 'background-image'">
               <xsl:variable name="mapId" select="normalize-space(substring-before($location, ','))"/>

               <pb:temporal-state>
                   <pb:map>map_mysql_store</pb:map>
                   <pb:key><xsl:value-of select="$mapId"/></pb:key>
                   <pb:time><xsl:value-of select="$fmtTimestamp"/></pb:time>
                   <pb:value>
{
 "type": "background",
 "name": "<xsl:value-of select="$name"/>",
 "img": "<xsl:value-of select="$icon"/>",
 "coords": [0.0, 0.0],
 "tm-world-to-map": [1.0, 0.0, 0.0, 1.0, 0.0, 0.0],
 "tm-map-to-screen": [1.0, 0.0, 0.0, 1.0, 0.0, 0.0]
}
                   </pb:value>
               </pb:temporal-state>
           </xsl:when>
       </xsl:choose>
   </xsl:template>

   <xsl:template match="text()"/>
</xsl:stylesheet>

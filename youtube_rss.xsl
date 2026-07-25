<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:atom="http://www.w3.org/2005/Atom"
    xmlns:media="http://search.yahoo.com/mrss/">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <div class="youtube-playlist">
      <ul class="video-list">
        <xsl:for-each select="atom:feed/atom:entry">
          <li class="video-item">
            <a href="{atom:link/@href}" target="_blank">
              <img src="{media:group/media:thumbnail/@url}" alt="{atom:title}" />
              <div class="video-info">
                <h3><xsl:value-of select="atom:title"/></h3>
                <p><xsl:value-of select="substring(media:group/media:description, 1, 120)"/>...</p>
              </div>
            </a>
          </li>
        </xsl:for-each>
      </ul>
    </div>
  </xsl:template>

</xsl:stylesheet>

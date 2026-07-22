<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="no" doctype-system="about:legacy-compat"/>

<xsl:template match="/programmation">
<html lang="fr">
<head>
<meta charset="UTF-8"/>
<title>Programmation de la semaine</title>
<style>
  * { box-sizing: border-box; }
  body {
    margin: 0;
    padding: 20px;
    font-family: 'Helvetica Neue', Arial, sans-serif;
    background: #12121a;
    color: #f0f0f0;
  }
  .conteneur {
    max-width: 900px;
    margin: 0 auto;
  }
  h1 {
    text-align: center;
    font-size: 1.4em;
    letter-spacing: 0.05em;
    text-transform: uppercase;
    margin-bottom: 20px;
    color: #ffffff;
  }

  /* --- Système d'onglets 100% CSS (aucun JS) --- */
  .onglets {
    display: flex;
    flex-wrap: wrap;
  }
  .onglets input[type="radio"] {
    display: none;
  }
  .onglets label {
    flex: 1 1 0;
    text-align: center;
    padding: 14px 4px;
    margin: 0 3px 0 0;
    background: #23233060;
    border: 1px solid #3a3a4a;
    border-radius: 8px 8px 0 0;
    cursor: pointer;
    font-weight: bold;
    font-size: 0.9em;
    text-transform: uppercase;
    letter-spacing: 0.03em;
    color: #b8b8c8;
    transition: background 0.2s, color 0.2s;
  }
  .onglets label:last-of-type { margin-right: 0; }
  .onglets label:hover {
    background: #2f2f40;
    color: #ffffff;
  }
  .onglets input[type="radio"]:checked + label {
    background: #e63946;
    color: #ffffff;
    border-color: #e63946;
  }

  .panneaux {
    flex-basis: 100%;
    background: #1a1a24;
    border: 1px solid #3a3a4a;
    border-top: none;
    border-radius: 0 0 8px 8px;
    padding: 10px 20px;
  }
  .panneau { display: none; }

  <xsl:for-each select="jour">
  #tab-<xsl:value-of select="position()"/>:checked ~ .panneaux #panneau-<xsl:value-of select="position()"/> { display: block; }
  </xsl:for-each>

  table.programme {
    width: 100%;
    border-collapse: collapse;
    margin: 10px 0;
  }
  table.programme td {
    padding: 4px 2px;
    vertical-align: top;
  }
  .ligne-titre td {
    padding-top: 14px;
  }
  .heure {
    width: 70px;
    font-weight: bold;
    color: #e63946;
    white-space: nowrap;
  }
  .titre {
    text-align: right;
    font-weight: bold;
    font-size: 1.05em;
    color: #ffffff;
  }
  .frequence {
    display: block;
    font-weight: normal;
    font-size: 0.75em;
    color: #9a9aac;
    text-transform: none;
  }
  .animateur {
    color: #f4a259;
    font-style: italic;
    font-size: 0.9em;
  }
  .description {
    color: #c8c8d4;
    font-size: 0.9em;
    line-height: 1.4;
  }
  .separateur td {
    padding: 0;
  }
  .separateur hr {
    border: none;
    border-top: 1px solid #3a3a4a;
    margin: 10px 0 0 0;
  }

  @media (max-width: 600px) {
    .onglets label { font-size: 0.7em; padding: 10px 2px; }
    .titre { text-align: left; }
  }
</style>
</head>
<body>
<div class="conteneur">
  <h1><xsl:value-of select="@semaine"/></h1>

  <div class="onglets">
    <xsl:for-each select="jour">
      <xsl:variable name="pos" select="position()"/>
      <input type="radio" name="jour" id="tab-{$pos}">
        <xsl:if test="$pos = 1">
          <xsl:attribute name="checked">checked</xsl:attribute>
        </xsl:if>
      </input>
      <label for="tab-{$pos}"><xsl:value-of select="@nom"/></label>
    </xsl:for-each>

    <div class="panneaux">
      <xsl:for-each select="jour">
        <xsl:variable name="pos" select="position()"/>
        <div class="panneau" id="panneau-{$pos}">
          <table class="programme">
            <xsl:for-each select="emission">
              <tr class="ligne-titre">
                <td class="heure"><xsl:value-of select="heure"/></td>
                <td class="titre">
                  <xsl:value-of select="titre"/>
                  <xsl:if test="@frequence">
                    <span class="frequence">(<xsl:value-of select="@frequence"/>)</span>
                  </xsl:if>
                </td>
              </tr>
              <xsl:if test="normalize-space(animateur) != ''">
                <tr>
                  <td colspan="2" class="animateur"><xsl:value-of select="animateur"/></td>
                </tr>
              </xsl:if>
              <xsl:if test="normalize-space(description) != ''">
                <tr>
                  <td colspan="2" class="description"><xsl:value-of select="description"/></td>
                </tr>
              </xsl:if>
              <tr class="separateur">
                <td colspan="2"><hr/></td>
              </tr>
            </xsl:for-each>
          </table>
        </div>
      </xsl:for-each>
    </div>
  </div>
</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

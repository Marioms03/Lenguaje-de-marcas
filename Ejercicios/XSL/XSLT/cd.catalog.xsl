<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/"> <!-- el template sirve para crear plantillas y el match sirve para asociar la plantilla con el xml-->
<html> 
<body>
  <h2>My CD Collection</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th style="text-align:left">Title</th>    
      <th style="text-align:left">Artist</th>
      <th style="text-align:left">Country</th>
      <th style="text-align:left">Company</th>
      <th style="text-align:left">Price</th>
      <th style="text-align:left">Year</th>
    </tr>
    <xsl:for-each select="catalog/cd">
    <xsl:sort select="artist"/>
    <xsl:sort select="price" data-type="number" order="descending"/>
    <xsl:if test="price &gt; 10"> <!--&gt; significa mayor que, &lt; menor que, &gt;= significa mayor o igual que y &lt;= significa menor o igual que-->
    <!--xsl:if test="artist='Bob Dylan'"--> <!-- filtramos por elementos con cadenas, poniendo = 'valor'-->
    <!--xsl:if test="title/@id='2'"-->  <!-- Filtramos por atributos de elementos con la @atributo -->
   
    <tr>
      <td><xsl:value-of select="title"/></td>
      

      <xsl:choose>
        <xsl:when test="price &gt; 10">
          <td bgcolor="#ff00ff">
          <xsl:value-of select="artist"/></td>
        </xsl:when>
        <xsl:when test="price &gt; 0 and price &lt; 8">
          <td bgcolor="green">
          <xsl:value-of select="artist"/></td>
        </xsl:when>
        <xsl:otherwise> <!-- Con otherwise especificamos que se hace si la condicion no se cumple-->
          <td><xsl:value-of select="artist"/></td>
        </xsl:otherwise>
      </xsl:choose>


      <td><xsl:value-of select="country"/></td>
      <td><xsl:value-of select="company"/></td>
      

      <xsl:if test="price &gt; 10">
        <td bgcolor="yellow">
          <xsl:value-of select="price"/></td>
      </xsl:if>
      <xsl:if test="price &gt; 0 and price &lt; 8">
        <td bgcolor="blue">
          <xsl:value-of select="price"/></td>
        </xsl:if>
      

      <td><xsl:value-of select="year"/></td>
    </tr>

   
    </xsl:if>
    <!--/xsl:if>
    </xsl:if-->

    

    </xsl:for-each>

    <xsl:for-each select="catalog/pelicula">
    <xsl:if test="((price &lt; 10) and (price &gt;7.50)) or (price &gt; 12)">
    <tr>
      <td><xsl:value-of select="title"/></td>
      <td><xsl:value-of select="artist"/></td>
      <td><xsl:value-of select="country"/></td>
      <td><xsl:value-of select="company"/></td>
      <td><xsl:value-of select="price"/></td>
      <td><xsl:value-of select="year"/></td>
    </tr>
    </xsl:if>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

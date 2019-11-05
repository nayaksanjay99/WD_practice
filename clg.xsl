<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h2>DJ SANGHVI</h2>
                <table border="1">
                    <tr>
                        <td>Division</td>
                        <td>Student</td>
                    </tr>
                    <xsl:for-each select="dept/division">
                        <tr>
                            <td>
                                <xsl:value-of select="@divi"/>
                            </td>
                            <td>
                                <xsl:for-each select="student">
                                    <table>
                                        <tr>
                                            <td>
                                                <xsl:value-of select="sapid"></xsl:value-of>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <xsl:value-of select="name"></xsl:value-of>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <xsl:value-of select="pointer"></xsl:value-of>
                                            </td>
                                        </tr>
                                    </table>
                                </xsl:for-each>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
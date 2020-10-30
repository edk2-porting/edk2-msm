<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" indent="no" />
    <xsl:template match="/">
        <xsl:apply-templates select="IdleData" />
    </xsl:template>
    
    <xsl:template match="IdleData">

Scope(\_SB.PEP0)
{
<xsl:apply-templates select="IdleLevelData" />
}
    </xsl:template>
    <xsl:template match="IdleLevelData">
    Method(UIDL)
    {
        Return(NIDL)
    }    

    Name(NIDL,
    package(){
        "MICROPEP_IDLE",
        <xsl:value-of select="@Version" />, 
        <xsl:apply-templates select="Level" />
    })
    </xsl:template>

    <xsl:template match="Level">
        package(){
            "LPR",
            "<xsl:value-of select="@Name" />", // LPR Name
            <xsl:value-of select="@Mask" />, // LPR Core Mask (0xFFFFFFFF is coordinated)
            <xsl:value-of select="@LastManAdder" />, //LastMan Adder             
            <xsl:apply-templates select="Modes/Mode" />
        },
    </xsl:template>

    <xsl:template match="Mode">
            package(){
                "MODE",
                "<xsl:value-of select="@Name"/>", // Mode name
                <xsl:value-of select="@Latency" />, // Mode Latency
                <xsl:value-of select="@BreakEven" />, // Mode BreakEven
                <xsl:value-of select="@Flags" />, // Mode Flags
                <xsl:value-of select="@ClockFlags" />, // Mode Clock Flags
                <xsl:value-of select="@PSCIAdder" />, // Mode PSCI Flags <xsl:apply-templates select="Dependencies" />
                
            },
    </xsl:template>

    <xsl:template match="Dependencies">
        <xsl:apply-templates select="RequireAll" />
    </xsl:template>

    <xsl:template match="RequireAll">
                <xsl:apply-templates select="RequireOne" />
    </xsl:template>

    <xsl:template match="RequireOne">
                package(){
                    "DEPENDENCY_CONTAINER",
                    <xsl:apply-templates select="Ref" />
                },
    </xsl:template>

    <xsl:template match="Ref">
                    package(){
                        "DEPENDENCY",
                        "<xsl:value-of select="@Level" />", // Dependency LPR
                        "<xsl:value-of select="@Mode" />", // Dependency Mode
                        <xsl:value-of select="@Type" />, // Dependency Type
                    },
    </xsl:template>

</xsl:stylesheet>


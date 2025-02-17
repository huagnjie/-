<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
        			<title>SM Analysis Data Style Sheet Ver1.00</title>
			</head>
			<body>
				<xsl:apply-templates select="Ophthalmology" />
				<br />
				<a title="Nidek home page" href="http://www.nidek.co.jp/">
					<address align="center">NIDEK CO., LTD.</address>
				</a>
			</body>
		</html>
	</xsl:template>

	<!--============================================================================================-->
	<xsl:template match="Ophthalmology">
		<h1 align="center">
			<xsl:value-of select="Common/ModelName" /> Analysis Data
		</h1>
		<table border="1" width="1000" align="center">
			<colgroup>
				<col span="2" style="background:#E0E0E0" />
			</colgroup>
			<xsl:apply-templates select="Common" />
		</table>
		<br />
		<table width="1000" align="center" cellpadding="0" cellspacing="0">
			<xsl:apply-templates select="Measure" mode="DATA" />
		</table>
	</xsl:template>

	<!--============================================================================================-->
	<xsl:template match="Common">
		<tr>
			<th colspan="2" width="500">Company</th>
			<td width="500">
				<xsl:value-of select="Company" />
			</td>
		</tr>
		<tr>
			<th colspan="2">Model Name</th>
			<td>
				<xsl:value-of select="ModelName" />
			</td>
		</tr>
		<tr>
			<th colspan="2">ROM Version</th>
			<td>
				<xsl:value-of select="ROMVersion" />
			</td>
		</tr>
		<tr>
			<th colspan="2">Format Version</th>
			<td>
				<xsl:value-of select="Version" />
			</td>
		</tr>
		<tr>
			<th colspan="2">Date</th>
			<td>
				<xsl:value-of select="Date" />
			</td>
		</tr>
		<tr>
			<th colspan="2">Time</th>
			<td>
				<xsl:value-of select="Time" />
			</td>
		</tr>
		<xsl:apply-templates select="Patient" />
		<xsl:apply-templates select="Operator" />
	</xsl:template>

	<!--============================================================================================-->
	<xsl:template match="Patient">
		<tr>
			<th rowspan="8">Patient</th>
			<th>No.</th>
			<td>
				<xsl:value-of select="No." />
			</td>
		</tr>
		<tr>
			<th>ID</th>
			<td>
				<xsl:value-of select="ID" />
			</td>
		</tr>
		<tr>
			<th>First Name</th>
			<td>
				<xsl:value-of select="FirstName" />
			</td>
		</tr>
		<tr>
			<th>Middle Name</th>
			<td>
				<xsl:value-of select="MiddleName" />
			</td>
		</tr>
		<tr>
			<th>Last Name</th>
			<td>
				<xsl:value-of select="LastName" />
			</td>
		</tr>
		<tr>
			<th>Sex</th>
			<td>
				<xsl:value-of select="Sex" />
			</td>
		</tr>
		<tr>
			<th>Date of Birth</th>
			<td>
				<xsl:value-of select="DOB" />
			</td>
		</tr>
		<tr>
			<th>Memo</th>
			<td>
				<xsl:value-of select="Memo" />
			</td>
		</tr>
	</xsl:template>

	<!--============================================================================================-->
	<xsl:template match="Operator">
		<tr>
			<th rowspan="2">Operator</th>
			<th>No.</th>
			<td>
				<xsl:value-of select="No." />
			</td>
		</tr>
		<tr>
			<th>ID</th>
			<td>
				<xsl:value-of select="ID" />
			</td>
		</tr>
	</xsl:template>

	<!--============================================================================================-->
	<xsl:template name="RightEye">
		<a name="Right">
			<h2 align="center">Right Eye</h2>
		</a>
	</xsl:template>

	<!--============================================================================================-->
	<xsl:template name="LeftEye">
		<a name="Left">
			<h2 align="center">Left Eye</h2>
		</a>
	</xsl:template>

	<!--============================================================================================-->
	<xsl:template match="Measure" mode="DATA">
		<table width="1000" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<th colspan="2" align="center">
					<font size="+3">
						Analysis
					</font>
				</th>
			</tr>
		</table>
		<xsl:call-template name="PIXELTOAREA" />
		<br />
		<table width="1000" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<th width="500">
					<xsl:call-template name="RightEye" />
				</th>
				<th width="500">
					<xsl:call-template name="LeftEye" />
				</th>
			</tr>
		</table>
		<xsl:if test="@type='SM'">
			<table width="1000" align="center" cellpadding="0" cellspacing="0">
				<xsl:call-template name="MEASURE_SM" />
			</table>
		</xsl:if>
	</xsl:template>

	<!--============================================================================================-->
	<xsl:template name="PIXELTOAREA">
		<table border="1"  width="1000" align="center">
			<tr>
				<th width="700" style="background:#E0E0E0">
					Area Per Pixel (μm2/pixel)
				</th>
				<td width="300">
					<xsl:value-of select="PixelToArea" />
				</td>
			</tr>
		</table>
	</xsl:template>

	<!--============================================================================================-->
	<xsl:template name="MEASURE_SM">
		<tr>
			<td style="vertical-align:top">
				<table border="0" width="500" align="center">
					<xsl:apply-templates select="SM/R" />
				</table>
				<br />
			</td>
			<td style="vertical-align:top">
				<table border="0" width="500" align="center">
					<xsl:apply-templates select="SM/L" />
				</table>
				<br />
			</td>
		</tr>
	</xsl:template>

	<!--============================================================================================-->
	<xsl:template match="SM/R">
		<xsl:call-template name="SM_RL" />
	</xsl:template>

	<!--============================================================================================-->
	<xsl:template match="SM/L">
		<xsl:call-template name="SM_RL" />
	</xsl:template>

	<!--============================================================================================-->
	<xsl:template name="SM_RL">
		<tr>
			<td style="vertical-align:top">
				<xsl:apply-templates select="List" mode="SM" />
				<table border="1" width="500" align="center">
					<xsl:apply-templates select="Image" mode="Detail"/>
				</table>
			</td>
		</tr>
	</xsl:template>

	<!--============================================================================================-->
	<xsl:template match="List" mode="SM">
		<table border="1" width="500" align="center">
			<colgroup>
				<col span="1" style="background:#E0E0E0" />
			</colgroup>
			<tr style="background:silver">
				<th>No</th>
				<th colspan="10">
					Analysis
				</th>
			</tr>
			<tr style="background:#E0E0E0">
				<!--xsl:if test="count(Range)!=0"-->
				<th rowspan="13">
					<xsl:value-of select="@No" />
				</th>

				<th width="90">NUM</th>
				<th width="90">CD</th>
				<th width="90">AVG</th>
				<th width="90">SD</th>
				<th width="90">CV</th>
				<th width="90">MAX</th>
				<th width="90">MIN</th>
				<th width="90">HEX</th>
				<th width="90">CT</th>
				<th width="90">FIX</th>
			</tr>
			<tr>
				<xsl:if test="count(ErrorAnalysis)!=0">
					<td colspan="8"  align="center">
						<xsl:value-of select="ErrorAnalysis" />
					</td>
				</xsl:if>
				<xsl:if test="count(ErrorAnalysis)=0">
					<td>
						<xsl:value-of select="NUM" />
					</td>
					<td>
						<xsl:value-of select="CD" />
					</td>
					<td>
						<xsl:value-of select="AVG" />
					</td>
					<td>
						<xsl:value-of select="SD" />
					</td>
					<td>
						<xsl:value-of select="CV" />
					</td>
					<td>
						<xsl:value-of select="MAX" />
					</td>
					<td>
						<xsl:value-of select="MIN" />
					</td>
					<td>
						<xsl:value-of select="HEX" />
					</td>
				</xsl:if>
				<xsl:if test="count(ErrorCT)!=0">
					<td>
						<xsl:value-of select="ErrorCT" />
					</td>
				</xsl:if>
				<xsl:if test="count(ErrorCT)=0">
					<td>
					<xsl:value-of select="CT" />
					</td>
				</xsl:if>
				<td>
					<xsl:value-of select="FIX" />
				</td>
			</tr>
			<tr>
				<th colspan="10" style="background:silver" align="center">Area</th>
			</tr>
			<tr style="background:#E0E0E0">
				<th>0-</th>
				<th>100-</th>
				<th>200-</th>
				<th>300-</th>
				<th>400-</th>
				<th>500-</th>
				<th>600-</th>
				<th>700-</th>
				<th>800-</th>
				<th>900-</th>
			</tr>
			<tr>
				<xsl:if test="count(ErrorAnalysis)!=0">
					<td colspan="10"  align="center">
						<xsl:value-of select="ErrorAnalysis" />
					</td>
				</xsl:if>
				<xsl:if test="count(ErrorAnalysis)=0">
					<td>
						<xsl:value-of select="Area0" />
					</td>
					<td>
						<xsl:value-of select="Area100" />
					</td>
					<td>
						<xsl:value-of select="Area200" />
					</td>
					<td>
						<xsl:value-of select="Area300" />
					</td>
					<td>
						<xsl:value-of select="Area400" />
					</td>
					<td>
						<xsl:value-of select="Area500" />
					</td>
					<td>
						<xsl:value-of select="Area600" />
					</td>
					<td>
						<xsl:value-of select="Area700" />
					</td>
					<td>
						<xsl:value-of select="Area800" />
					</td>
					<td>
						<xsl:value-of select="Area900" />
					</td>
				</xsl:if>
			</tr>
			<tr>
				<th colspan="10" style="background:silver" align="center">Apex</th>
			</tr>
			<tr style="background:#E0E0E0">
				<th>3</th>
				<th>4</th>
				<th>5</th>
				<th>6</th>
				<th>7</th>
				<th>8</th>
				<th>9</th>
				<th>10</th>
			</tr>
			<tr>
				<xsl:if test="count(ErrorAnalysis)!=0">
					<td colspan="8"  align="center">
						<xsl:value-of select="ErrorAnalysis" />
					</td>
				</xsl:if>
				<xsl:if test="count(ErrorAnalysis)=0">
					<td>
						<xsl:value-of select="Apex3" />
					</td>
					<td>
						<xsl:value-of select="Apex4"/>
					</td>
					<td>
						<xsl:value-of select="Apex5"/>
					</td>
					<td>
						<xsl:value-of select="Apex6"/>
					</td>
					<td>
						<xsl:value-of select="Apex7"/>
					</td>
					<td>
						<xsl:value-of select="Apex8"/>
					</td>
					<td>
						<xsl:value-of select="Apex9"/>
					</td>
					<td>
						<xsl:value-of select="Apex10"/>
					</td>
				</xsl:if>
			</tr>
			<tr>
				<th width="100">
					<xsl:apply-templates select="Image" mode="Endo"/>
				</th>
			</tr>
			<xsl:if test="count(Range)!=0">
				<xsl:apply-templates select="Range" mode="List"/>
			</xsl:if>
		</table>
		<xsl:if test="count(Range)=0">
			<br />
			<br />
			<br />
			<br />
		</xsl:if>
		<br />

	</xsl:template>

	<!--============================================================================================-->
	<xsl:template match="Range" mode="List">
		<tr>
			<th colspan="10" style="background:silver" align="center">Range</th>
		</tr>
		<tr style="background:#E0E0E0">
			<th colspan="3">StartX</th>
			<th colspan="3">StartY</th>
			<th colspan="2">Width</th>
			<th colspan="2">Height</th>
		</tr>
		<tr>
			<td colspan="3">
				<xsl:value-of select="StartX"/>
			</td>
			<td colspan="3">
				<xsl:value-of select="StartY"/>
			</td>
			<td colspan="2">
				<xsl:value-of select="Width"/>
			</td>
			<td colspan="2">
				<xsl:value-of select="Height"/>
			</td>
		</tr>
	</xsl:template>

	<!--============================================================================================-->
	<xsl:template match="Image" mode="Endo">
		<tr>
			<td colspan="3" style="background:white">
				<a target="_blank">
					<xsl:attribute name="href">
						<xsl:value-of select="FileName" />
					</xsl:attribute>
					<img border="0" width="80" alt="BMP Image">
						<xsl:attribute name="src">
							<xsl:value-of select="FileName" />
						</xsl:attribute>
					</img>
				</a>
			</td>
			<td colspan="7" style="background:white;font-size:8pt;word-break:break-all">
				<a title="image" target="_blank">
					<xsl:attribute name="href">
						<xsl:value-of select="FileName" />
					</xsl:attribute>
					<xsl:value-of select="FileName" />
				</a>
			</td>
		</tr>
	</xsl:template>

	<!--============================================================================================-->
	<xsl:template match="Image" mode="Detail">
		<tr style="background:silver">
			<th colspan="11">Selected Data</th>
		</tr>
		<tr>
			<td colspan="4" style="background:white">
				<a target="_blank">
					<xsl:attribute name="href">
						<xsl:value-of select="FileName" />
					</xsl:attribute>
					<img border="0" width="140" alt="JPG Image">
						<xsl:attribute name="src">
							<xsl:value-of select="FileName" />
						</xsl:attribute>
					</img>
				</a>
			</td>
			<td colspan="7" style="background:white;font-size:8pt;word-break:break-all">
				<a title="image" target="_blank">
					<xsl:attribute name="href">
						<xsl:value-of select="FileName" />
					</xsl:attribute>
					<xsl:value-of select="FileName" />
				</a>
			</td>
		</tr>
	</xsl:template>

</xsl:stylesheet>

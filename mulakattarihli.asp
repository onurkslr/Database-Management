<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="stil2.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>..:: STAJ TAKİP SİSTEMİ ::.. Onur KÖSELER - Yaşam KARADAĞ - Ezgi ŞAHİN </title>
</head>

<script type="text/javascript">
var tableToExcel = (function() {
  var uri = 'data:application/vnd.ms-excel;base64,'
    , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta http-equiv="content-type" content="text/plain; charset=UTF-8"/></head><body><table>{table}</table></body></html>'
    , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
    , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
  return function(table, name) {
    if (!table.nodeType) table = document.getElementById(table)
    var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
    window.location.href = uri + base64(format(template, ctx))
  }
})()
</script>

<script src="jspdf.js"></script>
		<script src="FileSaver.js"></script>
		<script src="jspdf.plugin.table.js"></script>
		<script>
			

			function generatefromtable() {
				var data = [], fontSize = 7, height = 0, doc;
				doc = new jsPDF('p', 'pt', 'a4', true);
				doc.setFont("helvetica", "bold");
				doc.setFontSize(fontSize);
				
				doc.text(20, 20, "STAJ TAKİP SİSTEMİ");
				data = [];
				data = doc.tableToJson('tbl');
				height = doc.drawTable(data, {
					xstart : 15,
					ystart : 35,
					tablestart : 50,
					marginleft : 5,
					xOffset : 15,
					yOffset :25
				});
				doc.text(50, height + 20, 'ONUR KOSELER.com');
				doc.save("RAPOR.pdf");
			}
		</script>

<%  
   
   			 
Response.ContentType="text/html"
Response.Charset ="UTF-8"


  mysql_server = "localhost" 
     mysql_user = "root" 
     mysql_pass = "12345" 
     mysql_db = "staj" 

	 Connection_DSN= "DRIVER={MySQL ODBC 3.51 Driver}; SERVER="&mysql_server&"; UID="&mysql_user&"; pwd="&mysql_pass&";db="&mysql_db&";" 
     Set baglanti= Server.CreateObject("ADODB.Connection") 
     baglanti.Open Connection_DSN 


baglanti.Execute "SET NAMES 'UTF8'"
baglanti.Execute "SET CHARACTER Set utf8"
baglanti.Execute "SET COLLATION_CONNECTION= 'utf8_bin'"


 
bit = 	Request.Form("bit")
bas = 	Request.Form("bas")
but = 	Request.Form("but")




%>


<body leftmargin="0" rightmargin="0" topmargin="0">
<table width="680" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="35" bgcolor="#0066FF" class="menuyazi">&nbsp;YILLARA GÖRE MÜLAKAT SONUÇLARI</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <form name="forr" action="mulakattarihli.asp"  target="_self"  method="post">
  <tr>
    <td>Başlangın Yılı : 
    <input type="text" name="bas" id="bas" /></td>
  </tr>
  <tr>
    <td>Bitiş Yılı :
      <input type="text" name="bit" id="bit" /></td>
  </tr>
  <tr>
    <td><input type="submit" name="but" id="but" value="Gönder" /></td>
  </tr>
  </form>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table  id="tbl" width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="10">&nbsp;</td>
        <td width="42">Sıra</td>
        <td>Ad Soyad</td>
        <td>Tarih</td>
        <td>Kabul Edilen Gün</td>
        </tr>
      <%
	  
	  
			
			if(but="Gönder") then
	
	 rapor ="SELECT ad,soyad,tarih, kabul_gun FROM mulakat,staj_bilgi,ogrenci where mulakat.staj_no = staj_bilgi.staj_no and ogrenci.no = staj_bilgi.ogr_no and year(tarih) between "&bas&" and "&bit&""	
					
  sayi =0
set ilrap = baglanti.Execute(rapor)	
		
		 While (NOT ilrap.EOF)
		

		  %>
      <tr>
        <td width="20">&nbsp;</td>
        <td><% sayi=sayi+1 
		Response.Write(sayi)  %></td>
        <td width="119"><% Response.Write(ilrap.Fields.Item("ad").Value)%>&nbsp;<% Response.Write(ilrap.Fields.Item("soyad").Value)%></td>
        <td width="204"><% Response.Write(ilrap.Fields.Item("tarih").Value)%></td>
        <td width="204"><% Response.Write(ilrap.Fields.Item("kabul_gun").Value)%></td>
        </tr>
      <% 
				   ilrap.MoveNext()
							  
				  wend
		
		
		
		
		 end if
			
							  
				  %>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>

    
    </td>
  </tr>
  <tr>
    <td><button onclick="generatefromtable()">
			PDF kaydet
		</button>
    cc   <input type="button" onclick="tableToExcel('tbl', 'W3C Example Table')" value="Export to Excel"></td>
  </tr>

  
  
  
  
  
  
</table>
</body>
</html>

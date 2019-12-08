<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="stil2.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>..:: STAJ TAKİP SİSTEMİ ::.. Onur KÖSELER - Yaşam KARADAĞ - Ezgi ŞAHİN </title>
</head>
  
   
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

%>

<body leftmargin="0" rightmargin="0" topmargin="0">
<table width="680" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="35" bgcolor="#0066FF" class="menuyazi">&nbsp; DEĞERLENDİRMESİ YAPILMAYANLAR</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr></table>
<table id="customers"  width="100%" border="0" cellspacing="0" cellpadding="0">
    
  <tr>
    <td>&nbsp;</td>
    <td>No</td>
    <td>Ad</td>
    <td>Soyad</td>
    <td>Gün</td>
    <td>Staj Kurum</td>
    <td width="109">&nbsp;</td>
    </tr>
    <%
			
  stajlar ="SELECT * FROM staj_bilgi,ogrenci,mulakat where ogrenci.no = staj_bilgi.ogr_no and mulakat.staj_no = staj_bilgi.staj_no and mulakat.deger = 0"

set stajliste = baglanti.Execute(stajlar)	
		
		While (NOT stajliste.EOF)
		

		  %>
                                         
                                       
  
  <tr>
  
 <td width="27">&nbsp; </td>
          <td width="55"><% Response.Write(stajliste.Fields.Item("no").Value)%></td>
          <td width="100"><% Response.Write(stajliste.Fields.Item("ad").Value)%></td>
          <td width="142"><% Response.Write(stajliste.Fields.Item("soyad").Value)%> </td>
          <td width="106"><% Response.Write(stajliste.Fields.Item("toplam_gun").Value)%></td>
          <td width="203"><% Response.Write(stajliste.Fields.Item("kurum_adi").Value)%></td>
          <td><a target="_self" href="mulakat.asp?duzenleme=1&mulno=<% Response.Write(stajliste.Fields.Item("m_no").Value)%>&noo=<% Response.Write(stajliste.Fields.Item("no").Value)%>">Düzelt</a></td>
      </tr>

         <% 
				   stajliste.MoveNext()
							  
				  wend %>
      
      
        
</table>

<br />
<table width="680" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr></tr>
</table>
</body>
</html>

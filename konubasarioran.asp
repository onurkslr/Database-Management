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
    <td height="35" bgcolor="#0066FF" class="menuyazi">&nbsp;YILLARA GÖRE KONU BAŞARI ORANLARI</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <form name="forr" action="konubasarioran.asp"  target="_self"  method="post">
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
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
        <td width="42">Sıra</td>
        <td>Konu </td>
        <td>Kabul Gün</td>
        <td>Toplam Gün</td>
        <td>Başarı Oran</td>
        </tr>
      <%
	  
	  
			
			if(but="Gönder") then
	
	 rapor ="SELECT konu.konu_no,konu_Adi, sum(kabul_gun) as kabul, sum(toplam_gun) as toplam, ((sum(kabul_gun) / sum(toplam_gun))*100) as oran FROM mulakat,staj_bilgi,konu where mulakat.staj_no = staj_bilgi.staj_no and staj_bilgi.k_no = konu.konu_no and year(bas_tar) between "&bas&" and "&bit&" group by konu.konu_no"	
					
  sayi =0
set ilrap = baglanti.Execute(rapor)	
		
		 While (NOT ilrap.EOF)
		

		  %>
      <tr>
        <td width="20">&nbsp;</td>
        <td><% sayi=sayi+1 
		Response.Write(sayi)  %></td>
        <td width="119"><% Response.Write(ilrap.Fields.Item("konu_Adi").Value)%></td>
        <td width="204"><% Response.Write(ilrap.Fields.Item("kabul").Value)%></td>
        <td width="204"><% Response.Write(ilrap.Fields.Item("toplam").Value)%></td>
        <td width="204"><% Response.Write(ilrap.Fields.Item("oran").Value)%></td>
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
    <td>&nbsp;</td>
  </tr>

  
  
  
  
  
  
</table>
</body>
</html>

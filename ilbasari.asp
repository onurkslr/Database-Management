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
    <td height="35" bgcolor="#0066FF" class="menuyazi">&nbsp;ŞEHİRLERE GÖRE STAJ  BAŞARI ORANLARI </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
        <td width="42">Sıra</td>
        <td>Şehir</td>
        <td>Kabul Gün</td>
        <td>Toplam Gün</td>
        <td width="145">Başarı Oranı</td>
      </tr>
      <%
			
  rapor ="SELECT s_adi as sehir,sum(kabul_gun) as kabul,sum(toplam_gun) as toplam,(sum(kabul_gun) / sum(toplam_gun)*100) as Oran FROM mulakat,staj_bilgi,sehir where mulakat.staj_no = staj_bilgi.staj_no and staj_bilgi.sehir = sehir.s_no group by s_no order by oran desc"
sayi =0
set ilrap = baglanti.Execute(rapor)	
		
		 While (NOT ilrap.EOF)
		

		  %>
      <tr>
        <td width="20">&nbsp;</td>
        <td><% sayi=sayi+1 
		Response.Write(sayi)  %></td>
        <td width="119"><% Response.Write(ilrap.Fields.Item("sehir").Value)%></td>
        <td width="204"><% Response.Write(ilrap.Fields.Item("kabul").Value)%></td>
        <td width="150"><% Response.Write(ilrap.Fields.Item("toplam").Value)%></td>
        <td width="145"><% Response.Write(ilrap.Fields.Item("oran").Value)%></td>
        
      </tr>
      <% 
				   ilrap.MoveNext()
							  
				  wend%>
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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Başlıksız Belge</title>
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

komisyon = Request.Form("komisyon")
but = Request.Form("but")

if (but="Kaydet") then 
uyekaydet ="INSERT INTO uyeler (uye_adi) VALUES ('"&komisyon&"');"
set ooo = baglanti.Execute(uyekaydet)
end if

%>
<body leftmargin="0" rightmargin="0" topmargin="0">
<table width="680" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="35" bgcolor="#0066FF" class="menuyazi">&nbsp; KOMİSYON ÜYESİ EKLEME EKRANI</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr></table>
   <form name="forr" action="uyeler.asp"  target="_self"  method="post">
    
    
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Komisyon Üyesi Adı</td>
        <td>:
          <input type="text" name="komisyon" id="komisyon" />
          <input type="submit" name="but" id="but" value="Kaydet" /></td>
      </tr>

<body>
</body>
</html>
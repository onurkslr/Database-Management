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


 
no = 	Request.Form("no")
kurum = Request.Form("kurum")
okul = 	Request.Form("okul")
tip = 	Request.Form("tip") 
but = 	Request.Form("but") 
gun = 	Request.Form("gun")

'response.Write(but)
'response.Write("fedsafds")
'response.Write(kurum)
if (but="Kaydet") then 



ekkaydet = "INSERT INTO `staj`.`ek` (`o_no`, `tip`, `okul`, `kurum`, `gun`) VALUES ('"&no&"', '"&tip&"','"&okul&"','"&kurum&"','"&gun&"');"
'response.Write(ekkaydet)
set ooo = baglanti.Execute(ekkaydet)

end if




%>












<body leftmargin="0" rightmargin="0" topmargin="0">
<table width="680" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="35" bgcolor="#0066FF" class="menuyazi">&nbsp; EK STAJ EKRANI</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td> 
   
     
    <form action="ek.asp"  method="post" name="forr"  target="_self">
    
    
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik"> No</td>
        <td>:
          <input type="text" name="no" id="no" /></td>
      </tr>
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Önceki Okul</td>
        <td>:
          <input type="text" name="okul" id="okul" /></td>
      </tr>
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Kurum</td>
        <td>:
          <input type="text" name="kurum" id="kurum" /></td>
      </tr>
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Tip</td>
        <td>:          
          <select name="tip" id="tip">
            <option value="1">YGS</option>
            <option value="2">DGS</option>
          </select></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td class="altmenubaslik">Gün Sayısı</td>
        <td>: 
          <input type="text" name="gun" id="gun" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td class="altmenubaslik">Dosya</td>
        <td>: <input type="file" name="file" id="file" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td class="altmenubaslik">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">&nbsp;</td>
        <td><input type="submit" name="but" id="but" value="Kaydet" /></td>
      </tr>
    </table>
    
    </form>
    
    
    
    
    
    
    </td>
  </tr>

  
  
  
  
  
  
</table>
</body>
</html>

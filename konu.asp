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

konu = Request.Form("konu")
but = Request.Form("but")
but2 = Request.Form("but2")
noo = Request.Form("noo")
islem = Request.QueryString("islem") 
nom = 	Request.QueryString("nom")

if (but="Kaydet") then 
konukaydet ="INSERT INTO konu (konu_Adi) VALUES ('"&konu&"');"
set ooo = baglanti.Execute(konukaydet)
end if



if(islem="sil") then

ogrensil ="DELETE FROM konu WHERE (konu_no = "&nom&");"
set ooo = baglanti.Execute(ogrensil)


%>
Silindi

<%
end if


if(but2="Düzelt") then

ogrenduz ="UPDATE `staj`.`konu` SET `konu_Adi` = '"&konu&"' WHERE (`konu_no` = "&noo&");"

set ooo = baglanti.Execute(ogrenduz)




%>
Düzeltildi

<%
end if




%>

<body leftmargin="0" rightmargin="0" topmargin="0">
<table width="680" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="35" bgcolor="#0066FF" class="menuyazi">&nbsp; KONU EKLEME EKRANI</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  
  
  <tr></table>
  
   <% if (islem="duzelt") then
   
       
			
  duzeltt ="SELECT * FROM konu where konu_no="&nom

set duz = baglanti.Execute(duzeltt)	
		
		While (NOT duz.EOF)
		
        
							
   
    %>
  
   <form name="forr" action="konu.asp"  target="_self"  method="post">
    
    
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Konu Adı</td>
      <td>:
          <input type="text" name="konu" id="konu" value="<% Response.Write(duz.Fields.Item("konu_Adi").Value)%>" />
        <input type="submit" name="but2" id="but2" value="Düzelt" /></td>
      </tr>
      </table>
      <input type="hidden" name="noo" value="<% Response.Write(duz.Fields.Item("konu_no").Value)%>" />
      </form>
      
        <%
       duz.MoveNext()
							  
	 wend 
		
   else %>
      
      
      <form name="forr" action="konu.asp"  target="_self"  method="post">
    
    
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Konu Adı</td>
        <td>:
          <input type="text" name="konu" id="konu" />
          <input type="submit" name="but" id="but" value="Kaydet" /></td>
      </tr>
      </table>
      </form>
      
        <% end if%>
      <table width="680" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="35" bgcolor="#0066FF" class="menuyazi">&nbsp; Konular</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  
  <tr>
    <td>
    
    
    <table id="customers"  width="100%" border="0" cellspacing="0" cellpadding="0">
    
      <tr>
    <td>&nbsp;</td>
    <td>No</td>
    <td>Konu Adı</td>
    <td width="89">&nbsp;</td>
    <td width="76">&nbsp;</td>
    </tr>
    <%
			
  konum ="SELECT * FROM konu "

set konus = baglanti.Execute(konum)	
		
		While (NOT konus.EOF)
		

		  %>
                                         
                                       
  
  <tr>
  
 <td width="20">&nbsp; </td>
          <td width="40"><% Response.Write(konus.Fields.Item("konu_no").Value)%></td>
          <td width="110"><% Response.Write(konus.Fields.Item("konu_Adi").Value)%></td>
          <td><a target="_self" href="konu.asp?islem=sil&nom=<% Response.Write(konus.Fields.Item("konu_no").Value)%>">Sil</a></td>
          <td><a target="_self" href="konu.asp?islem=duzelt&nom=<% Response.Write(konus.Fields.Item("konu_no").Value)%>">Düzelt</a></td>
        </tr>

         <% 
				   konus.MoveNext()
							  
				  wend %>
      
      
        
     </table>
    
    
    
     
    
    
    
    </td>
  </tr>
  
  
  
  
  <tr></table>
    
      
      
</body>
</html>

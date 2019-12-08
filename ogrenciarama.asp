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
but2 = 	Request.Form("but2")





%>

<body leftmargin="0" rightmargin="0" topmargin="0">
<table width="680" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="35" bgcolor="#0066FF" class="menuyazi">&nbsp; ÖĞRENCİ ARAMA EKRANI</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr></table>
   <form name="forr" action="ogrenciarama.asp"  target="_self"  method="post">
    
    
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Öğrenci No</td>
        <td>:
          <input value="<% Response.Write(no)%>" type="text" name="no" id="no" />
          <input type="submit" name="but2" id="but2" value="Getir" /></td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">&nbsp;</td>
	    <td>&nbsp;</td>
      </tr>
      
      
     <% if (but2="Getir") then 
	 
	 adet = 0
 
			
  adett ="SELECT * FROM ogrenci where no = "&no
  
set adettt = baglanti.Execute(adett)	
		
		While (NOT adettt.EOF)
		

		adet= adet + 1
				   adettt.MoveNext()
							  
				  wend 
	 
	 if(adet=1) then
	 
	 
	 
ogbul ="Select * FROM ogrenci WHERE no = "&no&";"
set obul = baglanti.Execute(ogbul)




%>
      
      
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">Öğrenci Bilgileri</td>
	    <td>&nbsp; </td>
      </tr>
	  <tr>
	    <td colspan="3" height="1"  bgcolor="#000099"></td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik"><% Response.Write(obul.Fields.Item("ad").Value)%>&nbsp;<% Response.Write(obul.Fields.Item("soyad").Value)%></td>
	    <td>&nbsp;</td>
      </tr>
      
      
      
      
      
      
    <%  
	else
	%>
	
	 <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">Öğrenci Bilgileri</td>
	    <td>&nbsp; </td>
      </tr>
	  <tr>
	    <td colspan="3" height="1"  bgcolor="#000099"></td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">Öğrenci Yok</td>
	    <td>&nbsp;</td>
      </tr>
      
	<%
	end if
      end if
      %>
      
    </table>
    <%
	
	if(adet=1)then
	%>
    
    STAJ BİLGİLERİ
    <table width="680" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="33">Sıra</td>
        <td width="92">Kurum Adı</td>
        <td width="56">Şehir</td>
        <td width="67">Konu</td>
        <td width="76">Baş Tar</td>
        <td width="83">Bit Tar</td>
        <td width="134">Toplam</td>
        <td width="139">Kabul</td>
      </tr>
      <%
	  
	  if (but2="Getir") then 
 ogbul ="SELECT * FROM mulakat,staj_bilgi,konu, sehir where sehir.s_no = staj_bilgi.sehir and mulakat.staj_no = staj_bilgi.staj_no and staj_bilgi.k_no = konu.konu_no and staj_bilgi.ogr_no = "&no&";"
 
 gentop = 0
 engentop = 0
set obul = baglanti.Execute(ogbul)
sayi =0
While (NOT obul.EOF)


%>
       
	  <tr>
        <td width="33"><% sayi=sayi+1 
		Response.Write(sayi) %></td>
        <td width="92"><% Response.Write(obul.Fields.Item("kurum_adi").Value)%></td>
        <td width="56"><% Response.Write(obul.Fields.Item("s_adi").Value)%></td>
        <td width="67"><% Response.Write(obul.Fields.Item("konu_Adi").Value)%></td>
        <td width="76"><% Response.Write(obul.Fields.Item("bas_tar").Value)%></td>
        <td width="83"><% Response.Write(obul.Fields.Item("bit_tar").Value)%></td>
        <td width="134"><% Response.Write(obul.Fields.Item("toplam_gun").Value)%></td>
        <td width="139"><% Response.Write(obul.Fields.Item("kabul_gun").Value)%></td>
      </tr>
      
      <%  
	  gentop = CInt(obul.Fields.Item("kabul_gun").Value) + gentop
	   engentop = CInt(obul.Fields.Item("toplam_gun").Value) + engentop
	   obul.MoveNext()
							  
				  wend 
				  %>
				   <tr>
				     <td>&nbsp;</td>
				     <td>&nbsp;</td>
				     <td>&nbsp;</td>
				     <td>&nbsp;</td>
				     <td>&nbsp;</td>
				     <td>&nbsp;</td>
				     <td>&nbsp;</td>
				     <td>&nbsp;</td>
      </tr>
				   <tr>
        <td width="33">Sıra</td>
        <td width="92">Kurum Adı</td>
        <td width="56">Okul</td>
        <td width="67">Gün</td>
        <td width="76">tip</td>
        <td width="83">&nbsp;</td>
        <td width="134">&nbsp;</td>
        <td width="139">Kabul</td>
      </tr>
				  
				  <%
				  
ogbul ="SELECT * FROM ek where o_no = "&no&";"
set obul = baglanti.Execute(ogbul)
sayi2 =0
While (NOT obul.EOF)


%>
       
	  <tr>
        <td width="33"><% sayi2=sayi2+1 
		Response.Write(sayi2) %></td>
        <td width="92"><% Response.Write(obul.Fields.Item("kurum").Value)%></td>
        <td width="56"><% Response.Write(obul.Fields.Item("okul").Value)%></td>
        <td width="67"><% 
		gun = CInt(obul.Fields.Item("gun").Value)
		response.Write(gun)
		%></td>
        <td width="76"><% Response.Write(obul.Fields.Item("tip").Value)%></td>
        <td width="83"></td>
        <td width="134"></td>
        <td width="139"><% kk = gun/2 
		response.Write(Round(kk))
		engentop = engentop + gun
		gentop = kk + gentop
		 %></td>
      </tr>
     
      <%   obul.MoveNext()
							  
				  wend 				  
				  


				  end if
				  %>
      
     
    </table>
    
    <% end if%>
    <br />
      <br />
    
    
   
   </form>
   
    <%
	gentop = round(gentop)
	
	if((gentop>=57)and (engentop>60))then
	response.Write("Öğrenci Toplam ")
	response.Write(gentop)
	response.Write(" Gün staj yapmıştır.")
	%>
   <br /> <img src="images/ok.jpg"  />
    <%
	
	elseif (gentop>0)then
	response.Write("Öğrenci Toplam ")
	response.Write(gentop)
	response.Write(" Gün staj yapmıştır.")
	%>
    <br /><img src="images/no.jpg"  />
    <%
	end if
	
	%>
   <body> 
</body>
</html>

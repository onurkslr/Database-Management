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
buton = 	Request.Form("buton")
staj = 	Request.Form("staj")
tarih = Request.Form("tarih")
saat = 	Request.Form("saat") 
uye1 = 	Request.Form("uye1") 
uye2 = 	Request.Form("uye2")
uye3 = 	Request.Form("uye3")
uye4= 	Request.Form("uye4")
d1 = 	Request.Form("d1")
d2 = 	Request.Form("d2")
d3 = 	Request.Form("d3")
d4 = 	Request.Form("d4")
d5 = 	Request.Form("d5")
d6 = 	Request.Form("d6")
d7 = 	Request.Form("d7")
d8 = 	Request.Form("d8")
d9 = 	Request.Form("d9")
d10 = 	Request.Form("d10")
deger = 	Request.Form("deger")

m_no = 	Request.Form("m_no")
duzenleme = request.QueryString("duzenleme")

noo = request.QueryString("noo")
mulno = request.QueryString("mulno")




if (buton="Düzelt") then 

toplamgun=0 
	     

topgun ="Select * FROM staj_bilgi WHERE staj_no = "&staj
set ogun = baglanti.Execute(topgun)	  
toplamgun = ogun.Fields.Item("toplam_gun").Value
		   

oran = (d1*0.04)+(d2*0.04)+(d3*0.04)+(d4*0.04)+(d5*0.04)+(d6*0.15)+(d7*0.05)+(d8*0.05)+(d9*0.15)+(d10*0.4)

oran = (oran*toplamgun)/100


 btarih = YEAR(tarih)&"."&MONTH(tarih)&"."& DAY(tarih)



mulakatk ="UPDATE `staj`.`mulakat` SET `tarih` = '"&btarih&"', `saat` = '"&saat&"', `uy1` = "&uye1&", `uy2` = "&uye2&", `uy3` =  "&uye3&", `uy4` = "&uye4&", `d1` ="&d1&", `d2` = "&d2&", `d3` = "&d3&", `d4` = "&d4&", `d5` = "&d5&", `d6` = "&d6&", `d7` = "&d7&", `d8` = "&d8&", `d9` = "&d9&", `d10` = "&d10&", `kabul_gun` = "&Round(oran)&", `deger` = "&deger&" WHERE (`m_no` = "&m_no&");"

set ooo = baglanti.Execute(mulakatk)







end if




	 







%>

<body leftmargin="0" rightmargin="0" topmargin="0">
<table width="680" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="35" bgcolor="#0066FF" class="menuyazi">&nbsp; MÜLAKAT BİLGİLERİ EKRANI</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr></table>
   <form name="forr" action="mulakat.asp"  target="_self"  method="post">
    
    
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
      
      
     <% if ((but2="Getir") or(duzenleme=1)) then 
	 
	 
	 if(but2="Getir") then
ogbul ="Select * FROM ogrenci WHERE no = "&no&";"
else
ogbul ="Select * FROM ogrenci WHERE no = "&noo&";"
end if
'response.Write(ogbul)


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
	  <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Stajları</td>
        <td  align="left"><%
 
  if(but2="Getir") then
 ogbul ="Select * FROM staj_bilgi,mulakat WHERE ogr_no = "&no&" and mulakat.staj_no = staj_bilgi.staj_no;"
 else
  ogbul ="Select * FROM staj_bilgi,mulakat WHERE ogr_no = "&noo&" and mulakat.staj_no = staj_bilgi.staj_no;"
 end if
 
 
set obul = baglanti.Execute(ogbul)

While (NOT obul.EOF)


 Response.Write(obul.Fields.Item("staj_no").Value) %> - <% 
  Response.Write(obul.Fields.Item("kurum_adi").Value)



  %> - <a href="?duzenleme=1&mulno=<%
  Response.Write(obul.Fields.Item("m_no").Value)
  
  %>&noo=<% 
  
  if(but2="Getir") then
  response.write(no)
  else
  response.write(noo)
  end if
  
  
  %>"> Mülakat </a>&nbsp;<%    
  if(obul.Fields.Item("deger").Value=1)then
  
  Response.Write("Değerlendirildi")
  else
   Response.Write("Değerlendirilmedi")
  end if
  
  
  %><br /><% 
          
            obul.MoveNext()
							  
				  wend %>
          
          
        </td>
      </tr>
      
      
        <%  
      end if
      %>
      
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">&nbsp;</td>
	    <td  align="left">&nbsp;</td>
      </tr>
	  <tr>
	    <td colspan="3" height="1"  bgcolor="#000099"></td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">&nbsp;</td>
	    <td>&nbsp;</td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">&nbsp;</td>
	    <td>&nbsp;</td>
      </tr>
	  <%
	  
	 if (duzenleme=1) then 


mul ="Select * FROM mulakat where m_no="&mulno

set mula = baglanti.Execute(mul)




	  %>
      
      
      
      
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">Mulakat Tarihi</td>
	    <td>:
	      <input type="text" name="tarih" id="tarih" value="<% 
		  
		  
		  
		  tarihh = DAY(mula.Fields.Item("tarih").Value)&"."&MONTH(mula.Fields.Item("tarih").Value)&"."& YEAR(mula.Fields.Item("tarih").Value)
		  
		  
		  Response.Write(tarihh)%>" /></td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">Mülakat Saati</td>
	    <td>:
	      <input type="saat" name="saat" id="saat" value="<% Response.Write(mula.Fields.Item("saat").Value)%>" /></td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">Uye 1</td>
	    <td>:
	      <select name="uye1" id="uye1">
	        
	        <%
 uye ="Select * FROM uyeler"
set uyeler = baglanti.Execute(uye)

While (NOT uyeler.EOF)


%>
	        <option<% if(mula.Fields.Item("uy1").Value=uyeler.Fields.Item("uye_no").Value) then %> selected="selected" <% end if%>  value="<% Response.Write(uyeler.Fields.Item("uye_no").Value)%>">
	          <% Response.Write(uyeler.Fields.Item("uye_adi").Value)%>
            </option>
	        <%   uyeler.MoveNext()
							  
				  wend %>
          </select></td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">Uye 2</td>
	    <td>:
	      <select name="uye2" id="uye2">
	        
	        <%
 uye ="Select * FROM uyeler"
set uyeler = baglanti.Execute(uye)

While (NOT uyeler.EOF)


%>
	        <option <% if(mula.Fields.Item("uy2").Value=uyeler.Fields.Item("uye_no").Value) then %> selected="selected" <% end if%> value="<% Response.Write(uyeler.Fields.Item("uye_no").Value)%>">
	          <% Response.Write(uyeler.Fields.Item("uye_adi").Value)%>
            </option>
	        <%   uyeler.MoveNext()
							  
				  wend %>
          </select></td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">Uye 3</td>
	    <td>:
	      <select name="uye3" id="uye3">
	    
	        <%
 uye ="Select * FROM uyeler"
set uyeler = baglanti.Execute(uye)

While (NOT uyeler.EOF)


%>
	        <option <% if(mula.Fields.Item("uy3").Value=uyeler.Fields.Item("uye_no").Value) then %> selected="selected" <% end if%> value="<% Response.Write(uyeler.Fields.Item("uye_no").Value)%>">
	          <% Response.Write(uyeler.Fields.Item("uye_adi").Value)%>
            </option>
	        <%   uyeler.MoveNext()
							  
				  wend %>
          </select></td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">Uye 4</td>
	    <td>:
	      <select name="uye4" id="uye4">
	        
	        <%
 uye ="Select * FROM uyeler"
set uyeler = baglanti.Execute(uye)

While (NOT uyeler.EOF)


%>
	        <option <% if(mula.Fields.Item("uy4").Value=uyeler.Fields.Item("uye_no").Value) then %> selected="selected" <% end if%> value="<% Response.Write(uyeler.Fields.Item("uye_no").Value)%>">
	          <% Response.Write(uyeler.Fields.Item("uye_adi").Value)%>
            </option>
	        <%   uyeler.MoveNext()
							  
				  wend %>
          </select></td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">Devam</td>
	    <td><input  type="text" name="d1" id="d1" value="<% Response.Write(mula.Fields.Item("d1").Value)%>" /></td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">Çaba ve Çalışma</td>
	    <td><input type="text" name="d2" id="d2" value="<% Response.Write(mula.Fields.Item("d2").Value)%>"/></td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">İşi Vaktinde Yapma</td>
	    <td><input  type="text" name="d3" id="d3" value="<% Response.Write(mula.Fields.Item("d3").Value)%>"/></td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">Amirine Karşı Davranışı</td>
	    <td><input  type="text" name="d4" id="d4" value="<% Response.Write(mula.Fields.Item("d4").Value)%>"/></td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">İş Arkadaşlarına Karşı Davranışı</td>
	    <td><input  type="text" name="d5" id="d5" value="<% Response.Write(mula.Fields.Item("d5").Value)%>" /></td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">Prova</td>
	    <td><input  type="text" name="d6" id="d6" value="<% Response.Write(mula.Fields.Item("d6").Value)%>"/></td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">Düzen</td>
	    <td><input type="text" name="d7" id="d7" value="<% Response.Write(mula.Fields.Item("d7").Value)%>"/></td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">Sunum</td>
	    <td><input  type="text" name="d8" id="d8" value="<% Response.Write(mula.Fields.Item("d8").Value)%>" /></td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">İçerik</td>
	    <td><input  type="text" name="d9" id="d9" value="<% Response.Write(mula.Fields.Item("d9").Value)%>"/></td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">Mülakat</td>
	    <td><input  type="text" name="d10" id="d10" value="<% Response.Write(mula.Fields.Item("d10").Value)%>" /></td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">Staj Durumu</td>
	    <td><select name="deger" id="deger">
	      
         <% 
         if(mula.Fields.Item("deger").Value)   then
          
          %><option selected="selected"  value="1">Değerlendirildi</option>
          <option   value="0">Değerlendirilmedi</option>
          
          <%
		  
		  else
		  %>
          
          <option   value="1">Değerlendirildi</option>
          <option  selected="selected" value="0">Değerlendirilmedi</option>
          
          <% end if%>
   
	   
        </select></td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">&nbsp;</td>
	    <td>&nbsp;</td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">&nbsp;</td>
	    <td>&nbsp;</td>
      </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td class="altmenubaslik">&nbsp;</td>
	    <td>
        
        <input type="hidden" name="m_no" value="<% Response.Write(mulno)%>" />
        <input type="hidden" name="staj" value="<% Response.Write(mula.Fields.Item("staj_no").Value) %>" />
        <input type="submit" name="buton" id="buton" value="Düzelt" /></td>
      </tr>
  <%
   
  end if
  
  %>
      
    </table>
    
    </form>
   <body> 
</body>
</html>

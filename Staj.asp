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
sinif = 	Request.Form("sinif")
k_ad = 	Request.Form("k_ad")
il = 	Request.Form("il") 
toplamgun = 	Request.Form("toplamgun") 
stajBT = 	Request.Form("stajBT")
stajST = 	Request.Form("stajST")
kegs = 	Request.Form("kegs")
okul = 	Request.Form("okul")
tip = 	Request.Form("tip") 
konu = 	Request.Form("konu") 
but = 	Request.Form("but")
stajno = Request.Form("stajno")
butduzelt = 	Request.Form("butduzelt")
Dim numara,numara1

islem = 	Request.QueryString("islem") 
nom = 	Request.QueryString("nom")



if (but="Kaydet") then 

adet = 0
 
			
  adett ="SELECT * FROM ogrenci where no = "&no
  
set adettt = baglanti.Execute(adett)	
		
		While (NOT adettt.EOF)
		

		adet= adet + 1
				   adettt.MoveNext()
							  
				  wend 



if (adet=1) then

if(toplamgun<15) then

response.Write("Öğrenci staj gün sayısı 15 den küçük ")
else 



if((sinif=2)and(toplamgun>25)) then
response.Write("Öğrenci 2. sınıfta en fazla 25 gün staj yapılır")
else

if(((sinif=3)or(sinif=4))and((toplamgun<=60)and(konu=1))) then 

ogrenkaydet ="INSERT INTO `staj`.`staj_bilgi` (`ogr_no`, `kurum_adi`, `sehir`, `bas_tar`, `bit_tar`, `toplam_gun`, `k_no`, `tip`, `onceki_okul`, `sinif`) VALUES ("&no&", '"&k_ad&"',"&il&",'"&stajBT&"','"&stajST&"',"&toplamgun&","&konu&","&tip&",'"&okul&"',"&sinif&");"
'response.Write(ogrenkaydet)
'response.Write(adet)
set ooo = baglanti.Execute(ogrenkaydet)


stajlar ="SELECT * FROM staj_bilgi,ogrenci where ogrenci.no = staj_bilgi.ogr_no and staj_bilgi.staj_no NOT IN (select mulakat.staj_no from mulakat)"

set stajliste = baglanti.Execute(stajlar)	
		
While (NOT stajliste.EOF)
		

Randomize
numara = Int((rnd*5))+1
numara1 = Int((rnd*5))+1

tarih = year(date())&"."&MONTH(date())&"."& day(date())
	 
saat = "13:30"
uye1 = Round(numara)
uye2 = Round(numara1)

mulakatk ="INSERT INTO `staj`.`mulakat` (`staj_no`, `tarih`, `saat`, `uy1`, `uy2`, `uy3`, `uy4`, `d1`, `d2`, `d3`, `d4`, `d5`, `d6`, `d7`, `d8`, `d9`, `d10`,`kabul_gun`,`deger`)   VALUES ("&stajliste.Fields.Item("staj_no").Value&", '"&tarih&"', '"&saat&"', "&uye1&", "&uye2&", 0, 0, 0, 0, 0, 0, 0,0, 0,0,0,0,0,0);"

'response.Write(mulakatk)
set ooo = baglanti.Execute(mulakatk)		  
stajliste.MoveNext()
wend 




elseif (((sinif=3)or(sinif=4))and(toplamgun<=40)) then
ogrenkaydet ="INSERT INTO `staj`.`staj_bilgi` (`ogr_no`, `kurum_adi`, `sehir`, `bas_tar`, `bit_tar`, `toplam_gun`, `k_no`, `tip`, `onceki_okul`, `sinif`) VALUES ("&no&", '"&k_ad&"',"&il&",'"&stajBT&"','"&stajST&"',"&toplamgun&","&konu&","&tip&",'"&okul&"',"&sinif&");"
'response.Write(ogrenkaydet)
'response.Write(adet)
set ooo = baglanti.Execute(ogrenkaydet)



stajlar ="SELECT * FROM staj_bilgi,ogrenci where ogrenci.no = staj_bilgi.ogr_no and staj_bilgi.staj_no NOT IN (select mulakat.staj_no from mulakat)"

set stajliste = baglanti.Execute(stajlar)	
		
While (NOT stajliste.EOF)
		

Randomize
numara = Int((rnd*5))+1
numara1 = Int((rnd*5))+1

tarih = year(date())&"."&MONTH(date())&"."& day(date())
	 
saat = "13:30"
uye1 = Round(numara)
uye2 = Round(numara1)

mulakatk ="INSERT INTO `staj`.`mulakat` (`staj_no`, `tarih`, `saat`, `uy1`, `uy2`, `uy3`, `uy4`, `d1`, `d2`, `d3`, `d4`, `d5`, `d6`, `d7`, `d8`, `d9`, `d10`,`kabul_gun`,`deger`)   VALUES ("&stajliste.Fields.Item("staj_no").Value&", '"&tarih&"', '"&saat&"', "&uye1&", "&uye2&", 0, 0, 0, 0, 0, 0, 0,0, 0,0,0,0,0,0);"

'response.Write(mulakatk)
set ooo = baglanti.Execute(mulakatk)		  
stajliste.MoveNext()
wend 





elseif ((sinif=2) and(toplamgun<=25)) then
'response.Write("dddd")
ogrenkaydet ="INSERT INTO `staj`.`staj_bilgi` (`ogr_no`, `kurum_adi`, `sehir`, `bas_tar`, `bit_tar`, `toplam_gun`, `k_no`, `tip`, `onceki_okul`, `sinif`) VALUES ("&no&", '"&k_ad&"',"&il&",'"&stajBT&"','"&stajST&"',"&toplamgun&","&konu&","&tip&",'"&okul&"',"&sinif&");"
'response.Write(ogrenkaydet)
'response.Write(adet)
set ooo = baglanti.Execute(ogrenkaydet)


stajlar ="SELECT * FROM staj_bilgi,ogrenci where ogrenci.no = staj_bilgi.ogr_no and staj_bilgi.staj_no NOT IN (select mulakat.staj_no from mulakat)"

set stajliste = baglanti.Execute(stajlar)	
		
While (NOT stajliste.EOF)
		

Randomize
numara = Int((rnd*5))+1
numara1 = Int((rnd*5))+1

tarih = year(date())&"."&MONTH(date())&"."& day(date())
	 
saat = "13:30"
uye1 = Round(numara)
uye2 = Round(numara1)

mulakatk ="INSERT INTO `staj`.`mulakat` (`staj_no`, `tarih`, `saat`, `uy1`, `uy2`, `uy3`, `uy4`, `d1`, `d2`, `d3`, `d4`, `d5`, `d6`, `d7`, `d8`, `d9`, `d10`,`kabul_gun`,`deger`)   VALUES ("&stajliste.Fields.Item("staj_no").Value&", '"&tarih&"', '"&saat&"', "&uye1&", "&uye2&", 0, 0, 0, 0, 0, 0, 0,0, 0,0,0,0,0,0);"

'response.Write(mulakatk)
set ooo = baglanti.Execute(mulakatk)		  
stajliste.MoveNext()
wend 



else

response.Write("Öğrenci Arge için Max 60 işgünü diğerleri için 40 işgünüdür. ")
end if


end if

end if

else 
response.Write("Öğrenci no eşleşmedi")

end if

end if




if(islem="sil") then

ogrensil ="DELETE FROM staj_bilgi WHERE (staj_no = "&nom&");"
set ooo = baglanti.Execute(ogrensil)


%>
Silindi

<%
end if



if(butduzelt="Düzelt") then




if(toplamgun<15) then

response.Write("Öğrenci staj gün sayısı 15 den küçük ")

else 


if((sinif=2)and(toplamgun>25)) then

response.Write("Öğrenci 2. sınıfta en fazla 25 gün staj yapılır")

else

if(((sinif=3)or(sinif=4))and((toplamgun<=60)and(konu=1))) then 

 btarih = YEAR(stajBT)&"."&MONTH(stajBT)&"."& DAY(stajBT)
 bitarih = YEAR(stajST)&"."&MONTH(stajST)&"."& DAY(stajST)
		 		 
ogrenduz ="UPDATE `staj`.`staj_bilgi` SET `sinif` = "&sinif&",`kurum_adi` = '"&k_ad&"',`toplam_gun` = "&toplamgun&",`bas_tar` = '"&btarih&"',`bit_tar` = '"&bitarih&"',`onceki_okul` = '"&okul&"',`tip` = "&tip&",`k_no` = "&konu&"  WHERE (`staj_no` = "&stajno&");"

'response.Write(ogrenduz)
set ooo = baglanti.Execute(ogrenduz)
response.Write("Düzeltildi")



elseif (((sinif=3)or(sinif=4))and(toplamgun<=40)) then





 btarih = YEAR(stajBT)&"."&MONTH(stajBT)&"."& DAY(stajBT)
 bitarih = YEAR(stajST)&"."&MONTH(stajST)&"."& DAY(stajST)
		 		 
ogrenduz ="UPDATE `staj`.`staj_bilgi` SET `sinif` = "&sinif&",`kurum_adi` = '"&k_ad&"',`toplam_gun` = "&toplamgun&",`bas_tar` = '"&btarih&"',`bit_tar` = '"&bitarih&"',`onceki_okul` = '"&okul&"',`tip` = "&tip&",`k_no` = "&konu&"  WHERE (`staj_no` = "&stajno&");"

'response.Write(ogrenduz)
set ooo = baglanti.Execute(ogrenduz)
response.Write("Düzeltildi")


elseif ((sinif=2) and(toplamgun<=25)) then




 btarih = YEAR(stajBT)&"."&MONTH(stajBT)&"."& DAY(stajBT)
 bitarih = YEAR(stajST)&"."&MONTH(stajST)&"."& DAY(stajST)
		 		 
ogrenduz ="UPDATE `staj`.`staj_bilgi` SET `sinif` = "&sinif&",`kurum_adi` = '"&k_ad&"',`toplam_gun` = "&toplamgun&",`bas_tar` = '"&btarih&"',`bit_tar` = '"&bitarih&"',`onceki_okul` = '"&okul&"',`tip` = "&tip&",`k_no` = "&konu&"  WHERE (`staj_no` = "&stajno&");"

'response.Write(ogrenduz)
set ooo = baglanti.Execute(ogrenduz)
response.Write("Düzeltildi")


else

response.Write("Öğrenci Arge için Max 60 işgünü diğerleri için 40 işgünüdür. ")

end if








end if

end if

















end if







%>

<body leftmargin="0" rightmargin="0" topmargin="0">
<table width="680" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="35" bgcolor="#0066FF" class="menuyazi">&nbsp; STAJ BİLGİLERİ EKRANI</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr></table>
  
  
  
  
<% if (islem="duzelt") then
   
       
			
  duzeltt ="SELECT * FROM staj_bilgi where staj_no="&nom

set duz = baglanti.Execute(duzeltt)	
		
		While (NOT duz.EOF)
		
        
							
   
    %>
  
  
   <form name="forr" action="Staj.asp"  target="_self"  method="post">
    
    
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">No</td>
        <td>:
          <input type="text" name="no" id="no"  disabled="disabled" value="<% Response.Write(duz.Fields.Item("ogr_no").Value)%>" /></td>
      </tr>
	  <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Sınıf</td>
        <td>:          
          <select name="sinif" id="sinif">
           
           <option <% if(duz.Fields.Item("sinif").Value=2) then %> selected="selected" <% end if%>>2</option>
         <option <% if(duz.Fields.Item("sinif").Value=3) then %> selected="selected" <% end if%>>3</option>
         <option <% if(duz.Fields.Item("sinif").Value=4) then %> selected="selected" <% end if%>>4</option>
          
          
          
        </select></td>
      </tr>
	  <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Kurum Adı</td>
        <td>:
          <input type="text" name="k_ad" id="k_ad" value="<% Response.Write(duz.Fields.Item("kurum_adi").Value)%>" /></td>
      </tr>
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Şehir</td>
        <td>: 
        <select name="il" id="il">
       <option selected="selected" value="0">Seçiniz ..</option> 
        <%
 sehirim ="Select * FROM sehir"
set sehirler = baglanti.Execute(sehirim)

While (NOT sehirler.EOF)


%>
	      <option  <% if(duz.Fields.Item("sinif").Value=sehirler.Fields.Item("s_no").Value) then %> selected="selected" <% end if%> value="<% Response.Write(sehirler.Fields.Item("s_no").Value)%>" >
	        <% Response.Write(sehirler.Fields.Item("s_adi").Value)%>
	          </option>
	      <%   sehirler.MoveNext()
							  
				  wend %>

</select>
</td>
      </tr>
	  <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Staj Yapılan Gün Sayısı</td>
        <td>:
          <input type="text" name="toplamgun" id="toplamgun" value="<% 
		  
		  
		  Response.Write(duz.Fields.Item("toplam_gun").Value)%>"  /></td>
      </tr>
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Staj Başlangıç Tarihi</td>
        <td>:
          <input type="text" name="stajBT" id="stajBT" value="<% 
		  
		  
		  tarih = DAY(duz.Fields.Item("bas_tar").Value)&"."&MONTH(duz.Fields.Item("bas_tar").Value)&"."& YEAR(duz.Fields.Item("bas_tar").Value)
		  
		  
		  Response.Write(tarih) %>"/>
          12.12.2018</td>
      </tr>
	  <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Staj Bitiş Tarihi</td>
        <td>:
          <input type="text" name="stajST" value="<%  tarih = DAY(duz.Fields.Item("bit_tar").Value)&"."&MONTH(duz.Fields.Item("bit_tar").Value)&"."& YEAR(duz.Fields.Item("bit_tar").Value)
		  
		  
		  Response.Write(tarih)%>" id="stajST" />
          12.12.2018</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td class="altmenubaslik">Önceki Okul</td>
        <td>:
        <input type="text" name="okul" id="okul" value="<% Response.Write(duz.Fields.Item("onceki_okul").Value)%>" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td class="altmenubaslik">Tip (DGS - YGS)</td>
        <td>: 
          <select name="tip" id="tip">
            <option selected="selected" value ="1" >Normal</option>
           
        </select></td>
      </tr>
      
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Staj Konusu</td>
        <td>:          
          <select contenteditable="true" name="konu" id="konu">
             <%
			
  konular ="SELECT * FROM konu order by  konu_no "

set konu = baglanti.Execute(konular)	
		
		While (NOT konu.EOF)
		

		  %>
            
            <option <% if(duz.Fields.Item("k_no").Value=konu.Fields.Item("konu_no").Value) then %> selected="selected" <% end if%> value="<% Response.Write(konu.Fields.Item("konu_no").Value)%>"><% Response.Write(konu.Fields.Item("konu_Adi").Value)%></option>
            
             <% 
				   konu.MoveNext()
							  
				  wend %>
            
          </select></td>
      </tr>
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">&nbsp;</td>
        <td><input type="hidden" name="stajno" value="<% Response.Write(nom) %>" />
        <input type="submit" name="butduzelt" id="butduzelt" value="Düzelt" /></td>
      </tr>
    </table>
    
</form>
    <br />
    
     
    <%
       duz.MoveNext()
							  
	 wend 
		
   else %>
    
    
    <form name="forr" action="Staj.asp"  target="_self"  method="post">
    
    
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">No</td>
        <td>:
          <input type="text" name="no" id="no" /></td>
      </tr>
	  <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Sınıf</td>
        <td>:          
          <select name="sinif" id="sinif">
           
            <option>2</option>
         <option>3</option>
          <option>4</option>
        </select></td>
      </tr>
	  <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Kurum Adı</td>
        <td>:
          <input type="text" name="k_ad" id="k_ad" /></td>
      </tr>
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Şehir</td>
        <td>: 
        <select name="il" id="il">
       <option selected="selected" value="0">Seçiniz ..</option> 
        <%
 sehirim ="Select * FROM sehir"
set sehirler = baglanti.Execute(sehirim)

While (NOT sehirler.EOF)


%>
	      <option value="<% Response.Write(sehirler.Fields.Item("s_no").Value)%>">
	        <% Response.Write(sehirler.Fields.Item("s_adi").Value)%>
          </option>
	      <%   sehirler.MoveNext()
							  
				  wend %>

</select>
</td>
      </tr>
	  <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Staj Yapılan Gün Sayısı</td>
        <td>:
          <input type="text" name="toplamgun" id="toplamgun" /></td>
      </tr>
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Staj Başlangıç Tarihi</td>
        <td>:
          <input type="text" name="stajBT" id="stajBT" /> 
          12.12.2018</td>
      </tr>
	  <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Staj Bitiş Tarihi</td>
        <td>:
          <input type="text" name="stajST" id="stajST" />
          12.12.2018</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td class="altmenubaslik">Önceki Okul</td>
        <td>:
        <input type="text" name="okul" id="okul" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td class="altmenubaslik">Tip (DGS - YGS)</td>
        <td>: 
          <select name="tip" id="tip">
            <option selected="selected" value ="1" >Normal</option>
           <option value ="2" >DGS</option>
           <option value ="3" >YGS</option>
        </select></td>
      </tr>
      
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Staj Konusu</td>
        <td>:          
          <select contenteditable="true" name="konu" id="konu">
             <%
			
  konular ="SELECT * FROM konu order by  konu_no "

set konu = baglanti.Execute(konular)	
		
		While (NOT konu.EOF)
		

		  %>
            
            <option value="<% Response.Write(konu.Fields.Item("konu_no").Value)%>"><% Response.Write(konu.Fields.Item("konu_Adi").Value)%></option>
            
             <% 
				   konu.MoveNext()
							  
				  wend %>
            
          </select></td>
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
    
     
    <% end if%>
    
<table width="680" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="35" bgcolor="#0066FF" class="menuyazi">&nbsp; STAJ BİLGİSİ GİRİLENLER</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr></tr>
    </table>
<table id="customers"  width="100%" border="0" cellspacing="0" cellpadding="0">
    
  <tr>
    <td>&nbsp;</td>
    <td>No</td>
    <td>Ad</td>
    <td>Soyad</td>
    <td>Gün</td>
    <td>Staj Kurum</td>
    <td width="123">&nbsp;</td>
    <td width="109">&nbsp;</td>
    </tr>
    <%
			
  stajlar ="SELECT * FROM staj_bilgi,ogrenci where ogrenci.no = staj_bilgi.ogr_no and staj_bilgi.staj_no IN (select mulakat.staj_no from mulakat)"

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
          <td><a target="_self" href="staj.asp?islem=sil&nom=<% Response.Write(stajliste.Fields.Item("staj_no").Value)%>">Sil</a></td>
          <td><a target="_self" href="staj.asp?islem=duzelt&nom=<% Response.Write(stajliste.Fields.Item("staj_no").Value)%>">Düzelt</a></td>
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

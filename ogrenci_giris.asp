<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="stil2.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>..:: STAJ TAKİP SİSTEMİ ::.. Onur KÖSELER - Yaşam KARADAĞ - Ezgi ŞAHİN </title>
</head>
<script type="text/javascript">
$(document).ready(function() {
    $('#example').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdfHtml5'
        ]
    } );
} );

</script>







<script type="text/javascript" src="js/buttons.html5.min.js"></script>
<script type="text/javascript" src="js/vfs_fonts.js"></script>
<script type="text/javascript" src="js/pdfmake.min.js"></script>
<script type="text/javascript" src="js/jszip.min.js"></script>
<script type="text/javascript" src="js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="js/jquery-1.12.3.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>





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
ad = 	Request.Form("ad")
soyad = 	Request.Form("soyad")
tip = 	Request.Form("tip") 
but = 	Request.Form("Kaydet") 
butduzelt = 	Request.Form("Düzelt")

islem = 	Request.QueryString("islem") 
nom = 	Request.QueryString("nom")

if (but="Kaydet") then 
ogrenkaydet ="INSERT INTO ogrenci (no, ad, soyad, tip) VALUES ("&no&", '"&ad&"','"&soyad&"',"&tip&");"
set ooo = baglanti.Execute(ogrenkaydet)
end if


if(islem="sil") then

ogrensil ="DELETE FROM ogrenci WHERE (no = "&nom&");"
set ooo = baglanti.Execute(ogrensil)


%>
Silindi

<%
end if


if(butduzelt="Düzelt") then

ogrenduz ="UPDATE `staj`.`ogrenci` SET `no` = "&no&", `ad` = '"&ad&"', `soyad` = '"&soyad&"', `tip` = "&tip&" WHERE (`no` = "&no&");"

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
    <td height="35" bgcolor="#0066FF" class="menuyazi">&nbsp; ÖĞRENCİ BİLGİLERİ EKRANI</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td> 
   
   <% if (islem="duzelt") then
   
       
			
  duzeltt ="SELECT * FROM ogrenci where no="&nom

set duz = baglanti.Execute(duzeltt)	
		
		While (NOT duz.EOF)
		
        
							
   
    %>
    <form name="forr" action="ogrenci_giris.asp"  target="_self"  method="post">
    
    
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik"> No</td>
        <td>:
          <input type="text" name="no" id="no"  value="<% Response.Write(duz.Fields.Item("no").Value)%>"/></td>
      </tr>
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Ad</td>
        <td>:
          <input type="text" name="ad" id="ad" value="<% Response.Write(duz.Fields.Item("ad").Value)%>" /></td>
      </tr>
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Soyad</td>
        <td>:
          <input type="text" name="soyad" id="soyad" value="<% Response.Write(duz.Fields.Item("soyad").Value)%>" /></td>
      </tr>
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Öğretim Türü</td>
        <td>:          
          <select name="tip" id="tip">
            <option <% if (duz.Fields.Item("tip").Value=1) then Response.Write("selected") end if%>>1</option>
            <option <% if (duz.Fields.Item("tip").Value=2) then Response.Write("selected") end if%>>2</option>
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
        <td><input type="submit" name="Düzelt" id="Düzelt" value="Düzelt" /></td>
      </tr>
    </table>
    
    </form>
    
    <%
       duz.MoveNext()
							  
	 wend 
		
   else %>
    
    <form name="forr" action="ogrenci_giris.asp"  target="_self"  method="post">
    
    
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik"> No</td>
        <td>:
          <input type="text" name="no" id="no" /></td>
      </tr>
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Ad</td>
        <td>:
          <input type="text" name="ad" id="ad" /></td>
      </tr>
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Soyad</td>
        <td>:
          <input type="text" name="soyad" id="soyad" /></td>
      </tr>
      <tr>
        <td width="10">&nbsp;</td>
        <td class="altmenubaslik">Öğretim Türü</td>
        <td>:          
          <select name="tip" id="tip">
            <option>1</option>
            <option>2</option>
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
        <td><input type="submit" name="kaydet" id="kaydet" value="Kaydet" /></td>
      </tr>
    </table>
    
    </form>
    
    
    <% end if%>
    
    
    
    </td>
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
  <tr>
    <td height="35" bgcolor="#0066FF" class="menuyazi">&nbsp; ÖĞRENCİLER</td>
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
    <td>Ad</td>
    <td>Soyad</td>
    <td>Tip</td>
    <td width="89">&nbsp;</td>
    <td width="76">&nbsp;</td>
    <td width="145">Staj Durumu</td>
      </tr>
    <%
			
  ogrenciler ="SELECT * FROM ogrenci order by  no "

set ogrenci = baglanti.Execute(ogrenciler)	
		
		While (NOT ogrenci.EOF)
		

		  %>
                                         
                                       
  
  <tr>
  
 <td width="20">&nbsp; </td>
          <td width="40"><% Response.Write(ogrenci.Fields.Item("no").Value)%></td>
          <td width="110"><% Response.Write(ogrenci.Fields.Item("ad").Value)%></td>
          <td width="150"><% Response.Write(ogrenci.Fields.Item("soyad").Value)%> </td>
          <td width="50"><% Response.Write(ogrenci.Fields.Item("tip").Value)%></td>
          <td><a target="_self" href="ogrenci_giris.asp?islem=sil&nom=<% Response.Write(ogrenci.Fields.Item("no").Value)%>">Sil</a></td>
          <td><a target="_self" href="ogrenci_giris.asp?islem=duzelt&nom=<% Response.Write(ogrenci.Fields.Item("no").Value)%>">Düzelt</a></td>
          <td><%
		  
ekgun ="SELECT sum(gun) as toplam FROM ek where o_no = "&ogrenci.Fields.Item("no").Value
	ektoplam = 0
set ekogrenci = baglanti.Execute(ekgun)	
		
 		ektoplam = ekogrenci.Fields.Item("toplam").Value 
		
		  response.Write(ektoplam)


mulakatgun ="SELECT sum(kabul_gun) as toplam FROM mulakat,staj_bilgi where mulakat.staj_no = staj_bilgi.staj_no and staj_bilgi.ogr_no = "&ogrenci.Fields.Item("no").Value
toplam =0
set mulakatg = baglanti.Execute(mulakatgun)	
		  toplam = mulakatg.Fields.Item("toplam").Value 
		response.Write(" + ")
		response.Write(toplam)
			response.Write(" = ")
			geneltop =0
			
			if(ektoplam) then
			else 
			ektoplam = 0
			end if
			
			
			if(toplam) then 
			else
			toplam = 0
			end if
			
			
			
			 geneltop = CInt(toplam) + CInt(ektoplam)/2
			
			
			response.Write(geneltop)
			
		  %></td>
       
  
    
  </tr>

         <% 
				   ogrenci.MoveNext()
							  
				  wend %>
      
      
        
     </table></td>
  </tr>
   <tr>
     <td>&nbsp;</td>
   </tr>
   <tr>
     <td>  <input type="button" onclick="tableToExcel('testTable', 'W3C Example Table')" value="Export to Excel"><br /><br />
     
  </td>
   </tr>

  
  
  
  
  
  
</table>

</body>
</html>

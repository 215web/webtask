<!--#include file="conn.asp"-->
<!--#include file="inc_product_list.asp"-->
<%
dim rs,sql
dim c_id,c_title,detail
dim sql_new,rs_new,pkid,model,productname,smallpicpath,price1,price2,pipai
dim sitekeyword
%>

<%
if s_head="head4.asp" or s_productkind="4" then
	response.write "<!DOCTYPE html PUBLIC ""-//W3C//DTD XHTML 1.0 Transitional//EN"" ""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"">"
else
	response.write "<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.01 Transitional//EN"">"
end if
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
dim sql4,rs4,meta_all
dim sitename,sitedisc,sitetel
dim hotflag,cxflag
sql4="select sitename,sitedisc,sitetel,sitekeyword from siteinfo"
set rs4=server.createobject("adodb.recordset")
rs4.open sql4,conn,1,1
if rs4.bof or rs4.eof then
	
else
	sitename=rs4("sitename")
	sitedisc=rs4("sitedisc")
	sitetel=rs4("sitetel")
	sitekeyword = rs4("sitekeyword")&"&nbsp;"
	application("sitename")=sitename
	application("sitedisc")=sitedisc
	application("sitetel")=sitetel
	response.cookies("sitekeyword")= sitekeyword
	response.cookies("sitekeyword").Expires="2027-12-30"
end if
rs4.close
set rs4=nothing



sql4="select meta_a11 from meta"
set rs4=server.createobject("adodb.recordset")
rs4.open sql4,conn,1,1
if rs4.bof or rs4.eof then
	response.write "我的网店"
else
		meta_all=rs4("meta_a11")
		response.write meta_all
end if
rs4.close
set rs4=nothing


sql4="select l_id,showflag from e_left where l_id=25 or l_id=39 "
set rs4=server.createobject("adodb.recordset")
rs4.open sql4,conn,1,1
if rs4.bof or rs4.eof then
	
else
	do while not rs4.eof

		l_id=rs4("l_id")
		if l_id=25 then
			hotflag=rs4("showflag")
		else
			cxflag=rs4("showflag")
		end if
	rs4.movenext
	loop
end if
rs4.close
set rs4=nothing
%>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="i.css" type=text/css rel=stylesheet>
<link href="index_ad.css" type=text/css rel=stylesheet>

<script language="JavaScript">
<!--
function a(f)
{
  var r = f.rad;
  for(var ii=0; ii<r.length; ii++)
    if(r[ii].checked)
      return true;
 alert("请您选择一个选项。");
 return false;
}
//-->
</script>

<script language="javascript">
<!--
function SetBgColor(Menu)
{
		Menu.style.background="#F3F3F5";
}
function RestoreBgColor(Menu)
{
		Menu.style.background="#ffffff";
}
-->
</script>
<SCRIPT LANGUAGE="JavaScript">
var previous = "1"; 

function OnClickColor(eleName) 
{  
  if(previous  != "" && document.getElementById("but"+previous) != null){ 
        document.getElementById("but"+previous).style.background = "url(images/soft_tab_current.jpg)"; 
		document.getElementById("tab"+previous).style.display="none"; 
    } 
  document.getElementById("but"+eleName).style.background = "url(images/tab_bg.jpg)"; 
  document.getElementById("tab"+eleName).style.display="block";
  
  previous  = eleName; 
} 

</SCRIPT>

</head>

<body >
<!-- #include file="head.asp" -->
<%
dim biaoflag,lefturl,leftlink,righturl,rightlink,bannarflag,bannarurl,bannarlink
dim changeflag,curl1,curl2,curl3,curl4,curl5,clink1,clink2,clink3,clink4,clink5
sql4="select * from ad"
set rs4=server.createobject("adodb.recordset")
rs4.open sql4,conn,1,1
if rs4.bof or rs4.eof then

else
	biaoflag=rs4("biaoflag")
	
	lefturl=rs4("lefturl")
	leftlink=rs4("leftlink")
	righturl=rs4("righturl")
	rightlink=rs4("rightlink")
	
	bannarflag=rs4("bannarflag")
	bannarurl=rs4("bannarurl")
	bannarlink=rs4("bannarlink")
	
	changeflag=rs4("changeflag")
	curl1=rs4("curl1")
	curl2=rs4("curl2")
	curl3=rs4("curl3")
	curl4=rs4("curl4")
	curl5=rs4("curl5")

	ctext1=rs4("ctext1")
	ctext2=rs4("ctext2")
	ctext3=rs4("ctext3")
	ctext4=rs4("ctext4")
	ctext5=rs4("ctext5")

	clink1=rs4("clink1")
	clink2=rs4("clink2")
	clink3=rs4("clink3")
	clink4=rs4("clink4")
	clink5=rs4("clink5")
	
	hotpicurl=rs4("hotpicurl")
	hotpiclink=rs4("hotpiclink")
	
	mid_flag=rs4("mid_flag")
	rightpicurl1=rs4("rightpicurl1")
	rightpiclink1=rs4("rightpiclink1")
	rightpicurl2=rs4("rightpicurl2")
	rightpiclink2=rs4("rightpiclink2")
	rightpicurl3=rs4("rightpicurl3")
	rightpiclink3=rs4("rightpiclink3")

	topnewspicurl=rs4("topnewspicurl")
	topnewspiclink=rs4("topnewspiclink")

	cuxpicurl=rs4("cuxpicurl")
	cuxpiclink=rs4("cuxpiclink")
	
	newpicurl=rs4("newpicurl")
	newpiclink=rs4("newpiclink")
	
end if 
rs4.close
set rs4=nothing
%>
<table width="960" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="70" valign="top" style="padding-top:5px;">

	  <%
	  if topnewspicurl<>"" then
	  	if topnewspiclink<>"" then
			response.write "<a href='"&topnewspiclink&"' target='_blank'><img src='"&topnewspicurl&"' width='960' border='0'></a>"
		else
			response.write "<img src='"&topnewspicurl&"' width='960' border='0'>"
		end if
	  end if
	  %>

	<table width="960" border="0" cellspacing="0" cellpadding="0" style="margin-top:6px;">
      <tr>
        <td width="676" valign="top">
		
  <!--#Include file="flashad.asp"-->
		</td>

        <td width="284" valign="top">
		<table width="282" border="0" cellspacing="0" cellpadding="0" align=right>
            <tr>
              <td height=1 background="images/newstop.jpg"></td>
            </tr>
           
            <tr>
              <td height="268" valign="top" background="images/newsmid.jpg"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="23" background="images/tab_bg.jpg" id=but1 style="padding-top: 5px;" onClick="OnClickColor('1');"><div align="center"><font color="#666666"><strong>商城新闻</strong></font></div></td>
                    </tr>
                  <tr>
                    <td colspan=3 height=1 bgcolor='#cccccc'></td>
                  </tr>
                </table>
                  <table width="94%" border="0" align="center" cellpadding="0" cellspacing="0" id=tab1>
                    <tr>
                      <td height="70"><table width="265" height="47" border=0 cellpadding=1 cellspacing=1 align=center>
                          <tbody>
                            <tr>
                              <td><DIV class="line_orange">
                                <UL class=num>
                                    <% '商讯
							sql="select top "&s_news&" c_id,c_title,detail from e_contect where c_parent2=30 order by c_num desc,c_addtime desc,c_id desc"
							set rs=server.CreateObject("adodb.recordset")
							rs.open sql,conn,1,1
							if rs.bof or rs.eof then
								response.write "<div align=center>没有记录!</div>"
							else
							
								do while not rs.eof
									set c_id=rs("c_id")
									set c_title=rs("c_title")
									'if len(c_title)>20 then 
									'c_title2=left(c_title,19)&"…"
									'else
									c_title2=c_title
									'end if
									set detail=rs("detail")
								  if detail="1" then
										response.write "<li><NOBR><a href='show_all.asp?c_id="&c_id &"' title='"&c_title&"'>"&c_title2&"</a></NOBR></li>"
								  else
										response.write "<li><NOBR><a href='news.asp?l_id=30' title='"&c_title&"'>"&c_title2&"</a></NOBR></li>"
								  end if
								rs.movenext
								loop
								response.write "<TR>" 
									response.write "<TD height='20' align=right><a href='news.asp?l_id=30'>更多>></a></TD>"
								response.write "</TR>"
							end if
							rs.close
							set rs=nothing
							%>
                                  </UL>
                              </DIV></td>
                            </tr>
                          </tbody>
                      </table></td>
                    </tr>
                  </table>
                <table width="94%" border="0" align="center" cellpadding="0" cellspacing="0" id=tab2 style='display:none'>
                    <tr>
                      <td > 
                      </td>
                    </tr>
                  </table>
               </td>
            </tr>
            <tr>
              <td height=11 background="images/newsbottom.jpg"></td>
            </tr>
        </table>
		</td>
      </tr>
    </table>

	</td>
  </tr>
</table>


<table width="960" border="0" align="center" cellpadding="2" cellspacing="0" class="kindbg" style="margin-top:8px;">
  <tr>
    <td><font class="kindtext">本月特价商品</font></td>
  </tr>
</table>
<table width="960" border="0" align="center" cellpadding="0" cellspacing="0" class="kindtab">
  <tr>
    <td height="2" class="kindlinebg"></td>
  </tr>
  <tr>
    <td align="right"><a href="productlist.asp?hot=1"><img src="images/kindpro_more.jpg"  border="0"></a></td>
  </tr>
  <tr>
    <td height="5"></td>
  </tr>
  <tr>
    <td>
	   <TABLE cellSpacing=0 cellPadding=0 border=0 width="100%">
			<TBODY>
			  <TR> 
				<%'热卖商品
				sql_new="select top "&s_col*s_hot_line&" pkid,model,productname,smallpicpath,price1,price"&session("customkind")&",pipai,addtime from view_product where hot='1' and updown='1' order by hottime desc "  
				set rs_new=server.createobject("adodb.recordset")
				rs_new.open sql_new,conn,1,1
				if rs_new.bof or rs_new.eof then
					response.write "<td>此栏暂时没有商品记录！</td>"
				else
					i=1
					do while not rs_new.eof
					pkid=rs_new("pkid")
					model=rs_new("model")
					productname=rs_new("productname")
					smallpicpath=rs_new("smallpicpath")
					price1=rs_new("price1")
					price2=rs_new("price"&session("customkind"))
					pipai=rs_new("pipai")
					addtime=rs_new("addtime")
				
					call product_list(1)
					
					if i mod s_col =0 then
						response.write "</tr><tr><td height=8>&nbsp;</td></tr><tr>"
						i=1
					else
						i=i+1
					end if
					rs_new.movenext
					loop
				end if
				rs_new.close
				set rs_new=nothing
				%>
			  </TR>
			</TBODY>
		  </TABLE>
	</td>
  </tr>
</table>

<!------------中间三个图片广告begin--------------->
<%if mid_flag="1" then%>
<table width="960" border="0" cellspacing="0" cellpadding="0"  align="center" style="margin-top:10px;">
	<tr> 
	  <td width="33%"  align=left> 
		<%
		if rightpicurl1<>"" then
			response.write "<a href='"&rightpiclink1&"'><IMG  src='"&rightpicurl1&"' width=312 border=0></a> "
		end if
		%>
	  </td>
	  <td width="34%" align=center> 
		<%
		if rightpicurl2<>"" then
			response.write "<a href='"&rightpiclink2&"'><IMG  src='"&rightpicurl2&"' width=312 border=0></a> "
		end if
		%>
	  </td>
	  <td width="33%" align=right> 
		<%
		if rightpicurl3<>"" then
			response.write "<a href='"&rightpiclink3&"'><IMG  src='"&rightpicurl3&"' width=312 border=0></a> "
		end if
		%>
	  </td>
	</tr>
</table>
<%end if%>
<!-------------中间三个图片广告end------------------>

<table width="960" border="0" align="center" cellpadding="2" cellspacing="0" class="kindbg"  style="margin-top:10px;">
  <tr>
    <td><font class="kindtext">促销商品</font></td>
  </tr>
</table>
<table width="960" border="0" align="center" cellpadding="0" cellspacing="0" class="kindtab">
  <tr>
    <td height="2" class="kindlinebg"></td>
  </tr>
  <tr>
	<td align="right"><a href="productlist.asp?cx=1"><img src="images/kindpro_more.jpg"  border="0"></a></td>
  </tr>
  <tr>
    <td height="5"></td>
  </tr>
  <tr>
    <td>
			<TABLE cellSpacing=0 cellPadding=0 border=0 width="100%">
				<TBODY>
				  <TR> 
				  
				<%'促销商品
				sql_new="select top "&s_col*s_cuxiao_line&" pkid,model,productname,smallpicpath,price1,price"&session("customkind")&",pipai,addtime from view_product where good='1' and updown='1' order by goodtime desc"
				
				set rs_new=server.createobject("adodb.recordset")
				rs_new.open sql_new,conn,1,1
				if rs_new.bof or rs_new.eof then
					response.write "<td>此栏暂时没有商品记录！</td>"
				else
					i=1
					do while not rs_new.eof
					pkid=rs_new("pkid")
					model=rs_new("model")
					productname=rs_new("productname")
					smallpicpath=rs_new("smallpicpath")
					price1=rs_new("price1")
					price2=rs_new("price"&session("customkind"))
					pipai=rs_new("pipai")
					addtime=rs_new("addtime")
				
					call product_list(1)
					
					if i mod s_col =0 then
						response.write "</tr><tr><td height=8>&nbsp;</td></tr><tr>"
						i=1
					else
						i=i+1
					end if
					rs_new.movenext
					loop
				end if
				rs_new.close
				set rs_new=nothing
				%>
				
				
				  </TR>
				</TBODY>
			</TABLE>
			
			 
	</td>
  </tr>
</table>



<!--------------按分类显示begin-------------->
<%
sql="select kindnum,kindname from sh_kind where len(kindnum)=4 and indexshow='1' order by kindnum asc"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
if rs.bof or rs.eof then
	response.write "<table width=960><tr><td height=22><div align=center>没有记录!</div></td></tr></table>"
else
	do while not rs.eof
	kind_num=rs("kindnum")
	kind_name=rs("kindname")
%>

	<table width="960" border="0" align="center" cellpadding="2" cellspacing="0" class="kindbg" style="margin-top:10px;">
	  <tr>
		<td><font class="kindtext"><%=kind_name%></font></td>
	  </tr>
	</table>
	<table width="960" border="0" align="center" cellpadding="0" cellspacing="0" class="kindtab">
	  <tr>
		<td height="2" class="kindlinebg"></td>
	  </tr>
	  <tr>
		<td align="right"><a href="productlist.asp?kind=<%=kind_num%>"><img src="images/kindpro_more.jpg"  border="0"></a></td>
	  </tr>
	  <tr>
		<td height="5"></td>
	  </tr>
	  <tr>
		<td>
				<TABLE cellSpacing=0 cellPadding=0 border=0 width="100%">
					<TBODY>
					  <TR> 
						<%'按分类显示
						sql_new="select top "&s_col*s_new_line&" pkid,model,productname,smallpicpath,price1,price"&session("customkind")&",pipai,addtime from view_product where kind like '"&kind_num&"%' and updown='1' order by pkid desc "  
						'response.write sql_new
						'response.end
						set rs_new=server.createobject("adodb.recordset")
						rs_new.open sql_new,conn,1,1
						if rs_new.bof or rs_new.eof then
							response.write "<td>此栏暂时没有商品记录！</td>"
						else
							i=1
							do while not rs_new.eof
							pkid=rs_new("pkid")
							model=rs_new("model")
							productname=rs_new("productname")
							smallpicpath=rs_new("smallpicpath")
							price1=rs_new("price1")
							price2=rs_new("price"&session("customkind"))
							pipai=rs_new("pipai")
							addtime=rs_new("addtime")
						
							call product_list(1)
							
							if i mod s_col =0 then
								response.write "</tr><tr><td height=8>&nbsp;</td></tr><tr>"
								i=1
							else
								i=i+1
							end if
							rs_new.movenext
							loop
						end if
						rs_new.close
						set rs_new=nothing
						%>
					  </TR>
					</TBODY>
				</TABLE>
		</td>
	  </tr>
	</table>
<%
	rs.movenext
	loop
end if
rs.close
set rs=nothing
%>
<!-------------按分类显示end--------------->

<!-------------下面横广告begin------------->
<%if newpicurl<>"" then%>

<table width="960" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;">
	<TR> 
	  <TD vAlign=center align=middle >
	  <div align="center"><a href='<%=newpiclink%>'><IMG src="<%=newpicurl%>" border="0" width="960"></a></div>
	  </TD>
	</TR>
</table>
<%end if%>
<!-------------下面横广告end--------------->



 

<%if biaoflag="1" then%>
<!--#include file="ad.asp"-->
<%end if%>


<!-- #include file="foot.asp" -->

<%
conn.close
set conn=nothing
%>
<script language="javascript"> 
function showsrc()
{
	imgs = document.getElementsByTagName("img");
	imgsnum = imgs.length;
	for(imgi = 0 ;imgi < imgsnum;imgi++){
		 if ((typeof(imgs[imgi].src) == 'undefined' || imgs[imgi].src =='') && imgs[imgi].getAttribute('thissrc') != null)
		 imgs[imgi].src = imgs[imgi].getAttribute('thissrc');
	}
}
window.setTimeout("showsrc();",400);
</script>

</body>
</html>





<style type="text/css">
<!--
.style1 {font-weight: bold}
.style2 {
	color: #993333;
	font-weight: bold;
}
-->
</style>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<TABLE width="960" border=0 align="center" cellPadding=0 cellSpacing=0 background="images/foot_1.gif" style="margin-top:10px;">
  <!--DWLayoutTable-->
<TBODY>
    <TR>
	<TD width="10" background=images/foot_b_1.gif></TD>
      <TD width="20">&nbsp;</TD>
      <TD valign="top"> 
        <table border="0" width="98%" cellPadding=0 cellSpacing=0><tr><td valign='top' width='150'>
        <%
		sql4="select l_id,menukind,l_title,zhidingurl,newopen from e_left where showflag='是' and bigmenu='否' order by bigmenu desc,l_num"
		set rs4=server.createobject("adodb.recordset")
		rs4.open sql4,conn,1,1
		if rs4.bof or rs4.eof then
		else
			i=1
			colshu=rs4.recordcount
			
			do while not rs4.eof

				l_id=rs4("l_id")
				menukind=rs4("menukind")
				l_title=rs4("l_title")
				zhidingurl=rs4("zhidingurl")
				newopen=rs4("newopen")
				if i>1 then
					response.write "</td><td width=5><img src='images/foot_3.gif'></td><td valign='top'  width='145'>"
				end if
				response.write "<table cellPadding=0 cellSpacing=0><tr><td height=7></td><tr></table><b>"&l_title&"</b><br>"				
				
				sql3="select * from e_contect where c_parent2="&l_id&" order by c_num,c_id"
				set rs3=server.CreateObject("adodb.recordset")
				rs3.open sql3,conn,1,1
				if rs3.bof or rs3.eof then
				else
					do while not rs3.eof
						set c_id=rs3("c_id")
						set c_title=rs3("c_title")
						set c_addtime=rs3("c_addtime")
						set detail=rs3("detail")
						response.Write "<table cellPadding=0 cellSpacing=0><tr><td height=4></td><tr></table><IMG height=15 src='images/foot_2.gif' width=25 border=0  align='absmiddle' style='line-height:130%;'><a style='line-height:130%;' href='show_foot.asp?c_id="&c_id &"'"
						if newopen="是" then response.write " target='_blank' "
						response.Write ">"&c_title &"</a><br>"
						rs3.movenext
					loop
				end if
				
			rs4.movenext
  			i=i+1
  			loop			
		end if
		rs4.close
		set rs4=nothing		
		%>
		
	    </td></tr></table>
	  </TD>
	  <%if cstr(colshu)<"6" then%>
      <TD width="55"><a href='javascript:window.scroll(0,0)'><IMG src="images/top.gif" align=absMiddle border=0></a></TD>
	  <%end if%>
	  <TD width="5" background=images/foot_b_2.gif></TD>
    </TR>
  </TBODY>
</table>

 


<TABLE width="960" border=0 align="center" cellPadding=0 cellSpacing=0>
  <TBODY>
    <TR><td colspan=2 height=10></td></tr>
    <TR> 
      
      <TD width="62%"> 
        <%
			sql4="select * from siteright"
			set rs4=server.createobject("adodb.recordset")
			rs4.open sql4,conn,1,1
			if rs4.bof or rs4.eof then
					copyright=""
			else
					copyright=rs4("copyright")
			end if
			rs4.close
			set rs4=nothing
			response.write copyright
			%>      </TD>
    </TR>
	<TR><td colspan=2 height=20></td></tr>
  </TBODY>
</TABLE>


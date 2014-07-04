
<%
nowpath = Request.ServerVariables("SCRIPT_NAME")
if instr(nowpath,"news.asp")>0 then
else
%>
 <TABLE width="200" border=0 cellPadding=2 cellSpacing=0 class="weitab"  style="margin-top:5px;">
  <tr>
	  <td height="32" background="images/index_png24_a1.png"><font color="#999999"><strong>最新商讯</strong></font></td>
  </tr>
			<%
			sql="select top 5 c_id,c_title,detail from e_contect where c_parent2=30 order by c_num desc,c_addtime desc,c_id desc"
			set rs=server.CreateObject("adodb.recordset")
			rs.open sql,conn,1,1
			if rs.bof or rs.eof then
				response.write "<tr><td><div align=center>没有记录!</div></td></tr>"
			else
			
				do while not rs.eof
					set c_id=rs("c_id")
					set c_title=rs("c_title")
					if len(c_title)>29 then 
					c_title2=left(c_title,28)&"..."
					else
					c_title2=c_title
					end if
					set detail=rs("detail")
					if detail="1" then
						response.write "<TR><TD style='padding-left:4px;padding-right:4px;padding-top:3px;'>·<a href='show_all.asp?c_id="&c_id &"' title='"&c_title&"'>"&c_title2&"</a></td></tr>"&vbcrlf   
					else
						response.write "<TR><TD style='padding-left:4px;padding-right:4px;padding-top:3px;'>·<a href='news.asp?l_id=30' title='"&c_title&"'>"&c_title2&"</a></td></tr>"&vbcrlf
					end if
					rs.movenext
				loop
					response.write "<TR>" 
					response.write "<TD height='20' align=right><a href='news.asp?l_id=30'>更多>></a>&nbsp;</TD>"
					response.write "</TR>"
			end if
			rs.close
			set rs=nothing
		    %>
</table>
<%end if%>


<TABLE width="200" border=0 cellPadding=2 cellSpacing=0 class="weitab" style="margin-top:10px;">
<tr>
  <td height="32" colspan=2 background="images/index_png24_a1.png"><font color="#999999"><strong>最近浏览过的商品</strong></font></td>
</tr>
<%
haveshow = request.cookies("haveshow")
'response.write haveshow
if haveshow<>"" then
	arr=split(haveshow,",")
	
	for j=0 to Ubound(arr)
	if isnumeric(arr(j)) then
	
		sql="select pkid,productname,smallpicpath,hit,price1,price"&session("customkind")&" from e_product where pkid=" & arr(j)
		set rs=server.CreateObject("adodb.recordset")
		rs.open sql,conn,1,1
		if rs.bof or rs.eof then
		else
				set pkid=rs("pkid")
				set productname=rs("productname")
				set smallpicpath=rs("smallpicpath")
				set hit=rs("hit")
				set price1=rs("price1")
				set price2=rs("price"&session("customkind"))
%>
		  <TR> 
			<TD align=center vAlign=top width='25%'><A href="show.asp?pkid=<%=pkid%>"><IMG src="product/<%=smallpicpath%>" width='45' border="0" style="margin:2px;"></A></TD>
			<TD width='75%'>
				<A href="show.asp?pkid=<%=pkid%>" target=_blank><%=productname%></A>
				<DIV align="left" style="padding-bottom:3px;"><b>￥<%=price2%></b>&nbsp;&nbsp;<del>￥<%=price1%></del></DIV>
			</TD>
		  </TR>
		  <TR> 
			<TD align=middle height=5></TD>
		  </TR>
<%
		end if
		rs.close
		set rs=nothing
		if j=8 then
			exit for
		end if
	end if	
	next
	
else
	response.write "<tr><td height='25'>还没有浏览过的商品。</td></tr>"
end if
%>
</TABLE>





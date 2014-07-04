<!--#include file="conn.asp"-->
<%

'----1为必须为会员登陆后下单--0为不需登录而以游客的身份购买------must_login可在dataname.asp中设置beign---------
if must_login="1" then  '必须登陆才行
	if session("username")="" or session("s_stat")="" then    'if session("username")="" then 仅用此检测,后台人员可以代下单.
		conn.close
		set conn=nothing
		response.Redirect("QuicklyCheck.asp?jieshun=1")
		response.end
	end if
else
	if session("username")="" or session("s_stat")="" then    'if session("username")="" then 仅用此检测,后台人员可以代下单.
		if request.QueryString("action")="quickly" then
			'从直接购买通道进入
		else
			conn.close
			set conn=nothing
			response.Redirect("QuicklyCheck.asp?jieshun=1")
			response.end
		end if
	else
		'已登陆
	end if
end if
'----1为必须为会员登陆后下单--0为不需登录而以游客的身份购买------must_login可在dataname.asp中设置end-----------

	
%>
<%
if s_head="head4.asp" or s_productkind="4" then
	response.write "<!DOCTYPE html PUBLIC ""-//W3C//DTD XHTML 1.0 Transitional//EN"" ""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"">"
else
	response.write "<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.01 Transitional//EN"">"
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=application("sitename")%></title>
<link href="i.css" type=text/css rel=stylesheet>
<style type="text/css">
<!--

.style1 {font-size: 14px}
.style12 {color: #990000}
.radio{
      	BORDER-RIGHT: #666666 0px solid;BORDER-TOP: #666666 0px solid; BORDER-LEFT: #666666 0px solid; BORDER-BOTTOM: #666666 0px solid; BACKGROUND-COLOR: #ffffff;
}
input{BACKGROUND-COLOR: #fcfcfc;}
-->
</style></head>

<body>
<!-- #include file="head.asp" -->
<TABLE width="960" border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <tr>
    <td> 



<table width="960" height="352" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
    <td width="210" height="184" valign="top">
		<!-- #include file="inc_left_all.asp" -->
      </td>
	 <FORM id=theForm name="theForm" action="orderjs2.asp" method="post" onSubmit="return Juge()">
    <td width="750" valign="top">
	<table width="99%"  border="0" cellspacing="0" cellpadding="0">
                
                <tr>
        <td height=2></td>
      </tr>
    </table>
              <TABLE width="700" border=0 align="center" cellPadding=0 cellSpacing=2 class=a1>
                <TBODY>
          <TR>
            <TD height=30 colSpan=3><TABLE width="100%" border=0 cellPadding=0 cellSpacing=0>
<TBODY>
                        <TR> 
                            <TD width="539" 
                            height=30 background="images/buystep3.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="36%" height="22">&nbsp;</td>
                                  <td width="21%"><div align="center"><strong><font color="#FFFFFF">填写交易信息</font></strong></div></td>
                                  <td width="20%">
                                    <div align="center">生成订单</div></td>
                                  <td width="23%">
                                    <div align="center">网上支付或汇款</div></td>
                                </tr>
                              </table> </TD>
                            <TD width=157 height="50">&nbsp;</TD>
                        </TR>
                      </TBODY>
                    </TABLE></TD>
          </TR>
		  </tbody>
		  </table>


			
<table><tr><td height="5" width=100></td></tr></table>
              <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="42"><font color="#FF0000"><strong>温馨提示：</strong></font>
				  如果您已经注册成为<%=application("sitename")%>的会员，<a href="QuicklyCheck.asp?jieshun=1"> <font color="#0033CC"><strong>请点击这里登录</strong></font></a>，然后点击购物车进行结算即可。您也可现在去注册，再登录。<a href="regedit.asp"><font color="#006600"><strong>点击这里注册</strong></font></a> 
                    <a href="productlist.asp"><font color="#ff6600"><strong>点击这里继续购物</strong></font></a></td>
                </tr>
              </table>
<%
if session("username")<>"" then
dim sql7,rs7,vipno,truename,province,city,telphone1,telphone2,fax,mobile,address,postno,email
	sql7="select * from x_huiyuan where username='"&session("username")&"'"
	'response.write sql7
	
	
	set rs7=conn.execute(sql7)
	if rs7.bof or rs7.eof then
		customid="0"
	else
		customid=rs7("id")
		vipno=rs7("vipno") 
		truename=rs7("truename") 
		province=rs7("province") 
		city=rs7("city") 
		telphone1=rs7("telphone1") 
		telphone2=rs7("telphone2") 
		fax=rs7("fax") 
		mobile=rs7("mobile") 
		address=rs7("address") 
		postno=rs7("postno") 
		email=rs7("email") 
	end if
	rs7.close
	set rs7=nothing
end if
'response.write customid
%>
		      		      <table width="700" border=0 align="center" cellPadding=3 cellSpacing=1 bgColor=#cccccc class=black-pix12 id=Table3>
<tr> 
                  <td width="120" height="26"><strong><font color="#CC0000" class='style1'>收货人信息：</font></strong></td>
                  <td width="580">(<FONT color=#ff0000>标有*项必须填写</FONT>)</td>
                </tr>
				<input type="hidden" name="customid" value="<%=customid%>">
                <TR bgColor=#ffffff> 
                  <TD width=120><DIV align=right>收货人姓名：</DIV></TD>
                  <TD width=580> 
                    <INPUT id=Text2 style="FONT-SIZE: 9pt;width:170px;height:22px;" name=truename value="">
                    <FONT color=#ff0000>*</FONT> <font color=#666666>请留下您的真实姓名，以便收货。</font></TD>
                </TR>
			  <TR bgColor=#ffffff> 
				<TD height="35" align=right class=black> 
				  <DIV align=right>省份/城市/地区：</DIV></TD>
				<TD>
				<script language="javascript" src="pcasunzip.js"></script>
				<select name="province"  style="WIDTH: 130px"></select> <select name="city"  style="WIDTH: 140px"></select> <select name="area"  style="WIDTH: 140px"></select> <FONT color=#ff0000>*</FONT>
				<script language="javascript" defer>
				new PCAS("province","city","area");
				</script>
				</TD>
			  </TR>

			  <TR bgColor=#ffffff> 
				<TD height="47" align=right class=black> 
				<DIV align=right>详细地址：</DIV></TD>
				<TD> <INPUT style="FONT-WEIGHT: normal; FONT-SIZE: 9pt; LINE-HEIGHT: normal; FONT-STYLE: normal; FONT-VARIANT: normal" size=45 name=address> 
				<FONT color=#ff0000>*</FONT><font color="#666666">本地址用于送货上门或邮寄地址。</font> 
				<br></TD>
			  </TR>
			  <TR bgColor=#ffffff> 
				<TD height="35" align=right class=black> 
				  <DIV align=right>邮政编码：</DIV></TD>
				<TD> <INPUT name=postno  style="FONT-WEIGHT: normal; FONT-SIZE: 9pt;width:170px; LINE-HEIGHT: normal; FONT-STYLE: normal; FONT-VARIANT: normal" size=22 maxlength="15"> </TD>
			  </TR>
			  <TR bgColor=#ffffff> 
				<TD height="35" align=right class=black> 
				  <DIV align=right>固定电话：</DIV></TD>
				<TD> <INPUT style="FONT-WEIGHT: normal; FONT-SIZE: 9pt;width:170px; LINE-HEIGHT: normal; FONT-STYLE: normal; FONT-VARIANT: normal" size=22 name=telphone1> 
				<FONT color=#ff0000>*</FONT> <FONT color=#666666>含区号和电话号码，或分机号 如:010-88888888、010-88888888-21</FONT></TD>
			  </TR>
			  <TR bgColor=#ffffff> 
				<TD height="35" align=right class=black> 
				  <DIV align=right>移动电话：</DIV></TD>
				<TD> <INPUT style="FONT-WEIGHT: normal; FONT-SIZE: 9pt;width:170px; LINE-HEIGHT: normal; FONT-STYLE: normal; FONT-VARIANT: normal" size=22 name='mobile'> </TD>
			  </TR>
                <TR bgColor=#ffffff> 
                  <TD width="120" align=right class=black>电子邮件：</TD>
                  <TD width="580">
                    <INPUT name="email" value="<%=email%>" id=email style="FONT-SIZE: 9pt;width:170px;height:22px;" size=50 maxlength="60"></TD>
                </TR>
              </table>
              <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="5" width=100></td>
                </tr>
              </table>
              <table width="700" border=0 align="center" cellPadding=4 cellSpacing=1 bgColor=#cccccc class=black-pix12 id=Table3>
                <tr>
                  <td width="120" height="23"><font color="#CC0000"  class='style1'><strong>商品确认：</strong></font></td>
                  <td width="580">&nbsp;</td>
                </tr>
              </table>
              <table width="700" border="1" align="center" cellpadding="1" cellspacing="0" bordercolorlight=#cccccc bordercolordark=#ffffff>
                <tr bgColor=#eeeeee>
                  <td height="25" ><div align="center"><strong>序号</strong></div></td>
                  <td ><div align="center"><strong>&nbsp;</strong></div></td>
                  <td ><div align="center"><strong>商品号</strong></div></td>
                  <td ><div align="center"><strong>商品名</strong></div></td>
                  <td ><div align="center"><strong>单价</strong></div></td>
                  <td ><div align="center"><strong>数量</strong></div></td>
                  <td ><div align="center"><strong>金额</strong></div></td>
                </tr>
                <%
		dim sql4,rs4,id,num,pkid
		dim sql5,rs5,model,productname,price2,price,money,a,q,allmoney,allnum
		allmoney=0
		allnum=0
		
		sql4="select * from x_order where notemp='"&request.Cookies("notemp")&"'"
		set rs4=conn.execute(sql4)
		if rs4.bof or rs4.eof then
			noproduct="1"
		else
		i=1
			do while not rs4.eof
			id=rs4("id")
			num=rs4("num")
			pkid=rs4("pkid")
			colorsize=rs4("colorsize")
					sql5="select model,productname,smallpicpath,oneweight,price"&session("customkind")&" from e_product where pkid="&pkid
					set rs5=conn.execute(sql5)
					if rs5.bof or rs5.eof then
					else
						model=rs5("model")
						productname=rs5("productname")
						smallpicpath=rs5("smallpicpath")
						oneweight=rs5("oneweight")
						price2=rs5("price"&session("customkind"))
						price2=trim(price2)
						if price2<>"" then
							q=1
							for  q=1  to  len(price2)
								  a=mid(price2,q,1)
								  if a<"0"  or  a>"9" then 
									if a<>"." then exit for
								  end if
							next
							price=left(price2,q-1)
							money = num * price
							allweight = num * oneweight
							allmoney = allmoney + money
							allnum = allnum + num
						end if
	
						response.write "<tr >" 
						response.write "<td height='23' align='center'>"&i&"</td>"
						response.write "<td align='center'><a href='show.asp?pkid="&pkid&"' target='_blank'><IMG src='product/"&smallpicpath&"' height=60 border='0'></A></td>"
						response.write "<td><a href='show.asp?pkid="&pkid&"' target='_blank'><font color=#0033FF>"&model&"</font></a></td>"
						response.write "<td style='WIDTH: 250px; WORD-WRAP: break-word'><a href='show.asp?pkid="&pkid&"' target='_blank'>"&productname&" "&colorsize&"</a></td>"
						response.write "<td align=right>"&formatnumber(price,2)&"</td>"
						response.write "<td align=right>"&formatnumber(num,2)&"</td>"
						response.write "<td align=right>￥"&formatnumber(money,2)&"</td>"
						response.write "<INPUT type=hidden value='"&pkid&"' name=pkid"&i&"> "
						response.write "<INPUT type=hidden value='"&colorsize&"' name=colorsize"&i&"> "
						response.write "<INPUT type=hidden value='"&price&"' name=price"&i&"> "
						response.write "<INPUT type=hidden value='"&num&"' name=num"&i&"> "
						response.write "<INPUT type=hidden value='"&money&"' name=money"&i&"> "
						response.write "<INPUT type=hidden value='"&oneweight&"' name=oneweight"&i&"> "
						response.write "<INPUT type=hidden value='"&allweight&"' name=allweight"&i&"> "
						response.write "</tr>"&vbcrlf
						m=m+1
					end if
					rs5.close
			  rs4.movenext
			  i=i+1
			  loop
		end if
		rs4.close
		set rs4=nothing
		response.cookies("allmoney")=allmoney
			  %>
                <INPUT type=hidden value="<%=i-1%>" name=maxi>
                <tr bgColor=#f5f5f5>
                  <td height=26 colspan=5 align=right><strong>商品合计金额：</strong></td>
                  <td align=right><strong><%=formatnumber(allnum,2)%></strong></td>
                  <td align=right><strong>￥<%=formatnumber(allmoney,2)%></strong></td>
                </tr>
				<tr>
				  <td height="25" colspan=9 align=right><a href='order_all.asp?lookorder=1'><b><font color='#6699FF'>再去修改购物车&gt;&gt;</font></b></a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
			  </table>	
              <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="5" width=100></td>
                </tr>
              </table>

				<%
				sql4="select * from sh_sendkind where len(sendkind)>1 "
				set rs4=server.createobject("adodb.recordset")
				rs4.open sql4,conn,1,1
				if rs4.bof or rs4.eof then
				else
					freetotal=rs4("freetotal")
					if freetotal="" or isnull(freetotal) or not isnumeric(freetotal) then freetotal=0
					freezaiyao=rs4("freezaiyao")
				%>
              <table width="700" border=0 align="center" cellPadding=4 cellSpacing=1 bgColor=#cccccc class=black-pix12 id=Table3>
                <tr> 
                  <td width="120" height="23" id=songhou><font color="#CC0000" class='style1'><strong>送货方式：</strong></font></td>
                  <td width="580"><input name="freetotal" type="hidden" value="<%=freetotal%>">
				  <%
				  if freetotal>0 then
				  	response.write "购物满 <b style=""FONT-FAMILY:'Century Gothic';font-size:12pt; "">"&freetotal&"</b> 元免运费。"
				  end if
				  response.write freezaiyao
				  %>
				  </td>
                </tr>
				<%
					do while not rs4.eof
					sendkind=rs4("sendkind")
					sendmoney=rs4("sendmoney")
					zaiyao=rs4("zaiyao")
					self1=rs4("self1")
				%>
                <TR bgColor=#ffffff onMouseOver="this.style.background='#FFE4CA';" onMouseOut="this.style.background='#ffffff';"> 
                  <TD align=middle width=120><div align="right"><input type="radio" name="sendtype" value="<%=sendkind%>" class="radio" onClick="mytotal('<%=sendmoney%>')" onBlur="mytotal('<%=sendmoney%>')"></div></TD>
                  <TD width=580>采用 <b><%=sendkind%></b> ，费用 <%=sendmoney%> 元。<%=zaiyao%></TD>
                </TR>
				<%
					rs4.movenext
					loop
				end if
				rs4.close
				set rs4=nothing
				%>
              </table>
              <table border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td height="5" width=100></td>
                </tr>
              </table>
			  
			   

			 <table width="700" border=0 align="center" cellPadding=4 cellSpacing=1 bgColor=#cccccc class=black-pix12 id=Table3>
                <tr> 
                  <td width="120" height="23"><font color="#CC0000"  class='style1'><strong>需付金额：</strong></font></td>
                  <td width="580">&nbsp;</td>
                </tr>
              </table>
              <table width="700" border=0 align="center" cellPadding=4 cellSpacing=1 bgColor=#cccccc class=black-pix12>
                <tr bgColor=#F6F6F6>
                  <td height=28 colspan=8>
				  商品金额：￥ <INPUT type="text" name="allmoney" value="<%=round(allmoney,2)%>"  readonly style="width:50px;border:0px;BACKGROUND-COLOR: #F6F6F6;FONT-WEIGHT: bold; FONT-SIZE: 18px; COLOR: #666666;FONT-FAMILY: 'Century Gothic'">
				  &nbsp;&nbsp;&nbsp;&nbsp;送货费用：￥
                    <input type="text" name="sendmoney" value="0" readonly style="width:35px;border:0px;BACKGROUND-COLOR: #F6F6F6;FONT-WEIGHT: bold; FONT-SIZE: 18px; COLOR: #666666;FONT-FAMILY: 'Century Gothic'">
                    <input type="text" name="freedisc" value="" readonly style="height:20px;width:50px;border:0px;padding-top: 4px;BACKGROUND-COLOR: #F6F6F6; FONT-SIZE: 14px; COLOR: #ff0000;">
			
                    <strong>您本次购物总共需要支付：￥</strong> <input type="text" name="total" value="<%=allmoney%>" readonly style="width:85px;border:0px;BACKGROUND-COLOR: #F6F6F6;FONT-WEIGHT: bold; FONT-SIZE: 19px; COLOR:#f00;FONT-FAMILY: 'Century Gothic'">
                   </td>
                </tr>
              </table>
              <table border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td height="5" width=100></td>
                </tr>
              </table>
			  
			  
              <table width="700" border=0 align="center" cellPadding=4 cellSpacing=1 bgColor=#cccccc class=black-pix12 id=Table3>
                <tr> 
                  <td width="120" height="23" id=zhifu><font color="#CC0000"  class='style1'><strong>支付信息：</strong></font></td>
                  <td width="580">&nbsp;</td>
                </tr>
				
				
				

				<%
				sql4="select * from sh_pay1 where mystat='1' "
				set rs4=server.createobject("adodb.recordset")
				rs4.open sql4,conn,1,1
				if rs4.bof or rs4.eof then
				else
				%>
                <TR bgColor=#F5F5F5> 
				<TD align=middle> 
				<div align="right"><strong><font color="#FF9900">在线支付</font></strong></div></TD>
				<TD><font color="#666666">通过支付宝，PayPal贝宝，网上银行卡（一卡通/牡丹卡/龙卡等）等来实现在线支付。</font></TD>
                </TR>				
				<%
					do while not rs4.eof
					paykind=rs4("paykind")
					memo1=rs4("memo")
				%>
                <TR bgColor=#ffffff onMouseOver="this.style.background='#FFE4CA';" onMouseOut="this.style.background='#ffffff';"> 
                  <TD align=middle width=120><div align="right"><input type="radio" name="paytype" value="<%=paykind%>" class='radio'></div></TD>
                  <TD width=580><b><%=paykind%></b> <font color="#666666">（<%=memo1%>）</font></TD>
                </TR>
				<%
					rs4.movenext
					loop
				end if
				rs4.close
				set rs4=nothing
				%>



				<%
				'------------paypal begin-----------------
				sql4="select * from sh_pay_paypal where paypalstat='1' "
				set rs4=server.createobject("adodb.recordset")
				rs4.open sql4,conn,1,1
				if rs4.bof or rs4.eof then
				else
					paykind = RS4("paykind")
					'paypalkind = RS4("paypalkind")
					'business0 = RS4("business0")
					'currency_code0 = RS4("currency_code0")
					'business1 = RS4("business1")
					'currency_code1 = RS4("currency_code1")
					paypalmemo = RS4("paypalmemo")
				%>
                <TR bgColor=#ffffff onMouseOver="this.style.background='#FFE4CA';" onMouseOut="this.style.background='#ffffff';"> 
                  <TD align=middle width=120><div align="right"><input type="radio" name="paytype" value="<%=paykind%>" class='radio'></div></TD>
                  <TD width=580><b><%=paykind%></b> <font color="#666666">（<%=paypalmemo%>）</font></TD>
                </TR>
				<%
				end if
				rs4.close
				set rs4=nothing
				'------------paypal end-------------------
				%>	
				
				
				<%
				sql4="select * from sh_pay2 where len(bankno)>5 "
				set rs4=server.createobject("adodb.recordset")
				rs4.open sql4,conn,1,1
				if rs4.bof or rs4.eof then
				else
				%>
                <TR bgColor=#F5F5F5> 
<TD align=middle> 
<div align="right"><strong><font color="#FF9900">银行转帐</font></strong></div></TD>
                  <TD><font color="#666666">直接到银行柜台或柜员机将货款电汇到以下某个帐户，并电话告知我们，我们确认到款后立即为您发货。</font></TD>
                </TR>				
				<%
					do while not rs4.eof
					id=rs4("id")
					bankname=rs4("bankname")
					bankno=rs4("bankno")
					bankren=rs4("bankren")
					bankaddr=rs4("bankaddr")
					bankmemo=rs4("bankmemo")
				%>
                <TR bgColor=#ffffff onMouseOver="this.style.background='#FFE4CA';" onMouseOut="this.style.background='#ffffff';"> 
                  <TD align=middle width=120><div align="right"><input type="radio" name="paytype" value="<%=bankname%>" class='radio'></div></TD>
                  <TD width=580><b><%=bankname%></b>&nbsp;&nbsp;帐号：<%=bankno%>&nbsp;&nbsp;户名：<%=bankren%>&nbsp;&nbsp;开户银行：<%=bankaddr%></TD>
                </TR>
				<%
					rs4.movenext
					loop
				end if
				rs4.close
				set rs4=nothing
				%>
				
				
				
				<%
				sql4="select * from sh_pay3 where houstat='1' "
				set rs4=server.createobject("adodb.recordset")
				rs4.open sql4,conn,1,1
				if rs4.bof or rs4.eof then
				else
				%>
                <TR bgColor=#F5F5F5> 
<TD align=middle> 
<div align="right"><strong><font color="#FF9900">货到付款</font></strong></div></TD>
                  <TD><font color="#666666">送货人员送货上门后代收货款。</font></TD>
                </TR>				
				<%
					houpaykind=rs4("houpaykind")
					memo1=rs4("memo")&"&nbsp;"
					memo1 = replace(memo1,vbcrlf,"<br>")
					memo1 = replace(memo1," ","&nbsp;")
				%>
                <TR bgColor=#ffffff onMouseOver="this.style.background='#FFE4CA';" onMouseOut="this.style.background='#ffffff';"> 
                  <TD align=middle width=120><div align="right"><input type="radio" name="paytype" value="<%=houpaykind%>" class='radio'></div></TD>
                  <TD width=580><b><%=houpaykind%></b></TD>
                </TR>
                <TR bgColor=#ffffff > 
                  <TD align=middle width=120><div align="right">&nbsp;</TD>
                  <TD width=580><%=memo1%></TD>
                </TR>
				<%
				end if
				rs4.close
				set rs4=nothing
				%>
				
				
				
				<%
				sql4="select * from sh_pay4 where youstat='1' "
				set rs4=server.createobject("adodb.recordset")
				rs4.open sql4,conn,1,1
				if rs4.bof or rs4.eof then
				else
				%>
                <TR bgColor=#F6F6F6> 
<TD align=middle> 
<div align="right"><strong><font color="#FF9900">邮局汇款</font></strong></div></TD>
                  <TD bgcolor="#F5F5F5"><font color="#666666">到当地邮局办理，需3至7天到账。<br>
                    请在汇款单的附言处注明订单号（非常重要）和收货人姓名。 </font></TD>
                </TR>				
				<%
					youpaykind=rs4("youpaykind")
					memo1=rs4("memo")&"&nbsp;"
					memo1 = replace(memo1,vbcrlf,"<br>")
					memo1 = replace(memo1," ","&nbsp;")
				%>
                <TR bgColor=#ffffff onMouseOver="this.style.background='#FFE4CA';" onMouseOut="this.style.background='#ffffff';"> 
                  <TD align=middle width=120><div align="right"><input type="radio" name="paytype" value="<%=youpaykind%>" class='radio'></div></TD>
                  <TD width=580><b><%=youpaykind%></b></TD>
                </TR>
                <TR bgColor=#ffffff > 
                  <TD align=middle width=120><div align="right">&nbsp;</TD>
                  <TD width=580><%=memo1%></TD>
                </TR>
				<%
				end if
				rs4.close
				set rs4=nothing
				%>


				<%
				if session("username")<>"" and session("s_stat")<>"" then '只有会员自己结算，后台人员不可用此方式结算。begin
				sql5="select * from sh_pay5 where youstat='1' "
				set rs5=server.createobject("adodb.recordset")
				rs5.open sql5,conn,1,1
				if rs5.bof or rs5.eof then
				else
				%>
                <TR bgColor=#F6F6F6> 
				<TD align=middle> 
				<div align="right"><strong><font color="#FF9900">账户余额</font></strong></div></TD>
                  <TD bgcolor="#F5F5F5"><font color="#666666">本结算方式只有在本网店有预付款的会员使用。</font></TD>
                </TR>				
				<%
					youpaykind=rs5("youpaykind")
					memo1=rs5("memo")&"&nbsp;"
					memo1 = replace(memo1,vbcrlf,"<br>")
					memo1 = replace(memo1," ","&nbsp;")
				%>
                <TR bgColor=#ffffff onMouseOver="this.style.background='#FFE5CA';" onMouseOut="this.style.background='#ffffff';"> 
                  <TD align=middle width=120><div align="right"><input type="radio" name="paytype" value="<%=youpaykind%>" class='radio'></div></TD>
                  <TD width=580><b><%=youpaykind%></b>&nbsp;&nbsp;&nbsp;&nbsp;
				  您现在的账户余额为：
				  <%
					sql6="SELECT id, username,(select sum(czmoney) from sh_chongzhi where sh_chongzhi.customid=a.id and confirmflag='是') AS sumcz, "&_
					"(select sum(total) from x_bill where x_bill.customid=a.id and paytype='账户余额') AS sumkj,  "&_
					"(IIf(IsNull(sumcz),0,sumcz)-IIf(IsNull(sumkj),0,sumkj)) AS leftye  "&_
					"FROM x_huiyuan AS a where username='"&session("username")&"' "
					
					set rs6=server.createobject("adodb.recordset")
					rs6.open sql6,conn,1,1
					if rs6.bof or rs6.eof then
						response.write "￥<input type='text' name='leftye' value='0' readonly style='width:85;border:0px;BACKGROUND-COLOR: #ffffff;FONT-WEIGHT: bold; FONT-SIZE: 17px; COLOR:#f00;FONT-FAMILY: Century Gothic'>"
					else
						response.write "￥<input type='text' name='leftye' value='"&rs6("leftye")&"' readonly style='width:85;border:0px;BACKGROUND-COLOR: #ffffff;FONT-WEIGHT: bold; FONT-SIZE: 17px; COLOR:#f00;FONT-FAMILY: Century Gothic'>"
					end if
					rs6.close
					set rs6=nothing
				  %>
				  
				  </TD>
                </TR>
                <TR bgColor=#ffffff > 
                  <TD align=middle width=120><div align="right">&nbsp;</TD>
                  <TD width=580><%=memo1%></TD>
                </TR>
				<%
				end if
				rs5.close
				set rs5=nothing
				else
					sql5="select * from sh_pay5 where youstat='1' "
					set rs5=server.createobject("adodb.recordset")
					rs5.open sql5,conn,1,1
					if rs5.bof or rs5.eof then
					else
					response.write "<tr height=30 bgColor=#ffffff><td colspan=2 style='color:red; font-weight:bold;'>（“账户余额”结算方式只有注册会员登陆后使用。<a href='QuicklyCheck.asp?jieshun=1'> <font color='#0033CC'>请点击这里登录</font></a>）</td></tr>"
					end if
					rs5.close
					set rs5=nothing
				end if  '只有会员自己结算，后台人员不可用此方式结算。end
				%>
				
                <!--
                <TR bgColor=#ffffff> 
                  <TD align=middle width=115><div align="right">是否需要发票：</div></TD>
                  <TD width=401> 
                    <SELECT name=fapiao>
                      <OPTION value="否" selected>否</OPTION>
                      <OPTION value="是">是</OPTION> ***
                    </SELECT></TD>
                </TR>
				-->
			 </table>


              <table border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td height="5" width=100></td>
                </tr>
              </table>
			 <table width="700" border=0 align="center" cellPadding=4 cellSpacing=1 bgColor=#cccccc class=black-pix12 id=Table3>
                <tr> 
                  <td width="120" height="23"><font color="#CC0000"  class='style1'><strong>订单留言：</strong></font></td>
                  <td width="580">&nbsp;</td>
                </tr>
                <TR bgColor=#ffffff> 
                  <TD align=middle width=120> <div align="right">特别说明：</div></TD>
                  <TD width=580> <TEXTAREA name=memo rows=5 cols=55></TEXTAREA>
                    <br>
                    (注:如对送货时间或其他特别要求请注明) </TD>
                </TR>
              </table>
			  
              <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="50">
				<div align="center">
				<%if noproduct="1" then
					response.write "<input type='button' name='Submit' value='确认以上信息，提交订单' class='input2' onclick=""alert('对不起，不能提交订单。您还没有选购任何商品。')"">"
				  else
					response.write "<input type='submit' name='Submit' value='确认以上信息，提交订单' class='input2'>"
				  end if
				%>
				</div></td>
                </tr>
              </table>
              <p>&nbsp;</p>
            </td>
		</form>
  </tr>
</table>


    </td>
  </tr>

<TR><TD>

</TD></TR>
</table>

<SCRIPT language=JavaScript>
<!--
function mytotal(mon)
{
	theForm.sendmoney.value=mon;
	
	if (parseFloat(theForm.freetotal.value)>0)  //正确设置了购满金额
	{
		if (parseFloat(theForm.freetotal.value)>parseFloat(theForm.allmoney.value))
		{
			theForm.total.value=Math.round((parseFloat(theForm.allmoney.value) + parseFloat(theForm.sendmoney.value))*100)/100;
		}
		else
		{
			theForm.total.value=Math.round(parseFloat(theForm.allmoney.value)*100)/100;
			theForm.sendmoney.value="0";
			theForm.freedisc.value="（购满"+theForm.freetotal.value+"元免运费）";
		}
	}
	else
	{
		theForm.total.value=Math.round((parseFloat(theForm.allmoney.value) + parseFloat(theForm.sendmoney.value))*100)/100;
	}

theForm.total.value=Math.round((parseFloat(theForm.total.value)-parseFloat(theForm.youhjmoney.value))*100)/100;
   
}


function youhjtotal()
{

	var sumyhj=0;
	for (i=1;i<document.all.maxyy.value;i++)
	{
	
		if (document.all('dkbox'+i).checked==true) 
		{
			sumyhj=parseFloat(sumyhj) + parseFloat(document.all('dkbox'+i).value)
		}
		
	}
   theForm.youhjmoney.value=sumyhj;
   
   theForm.total.value=Math.round((parseFloat(theForm.allmoney.value)+ parseFloat(theForm.sendmoney.value) -parseFloat(theForm.youhjmoney.value))*100)/100;
   
}


function Juge()
{
   if (theForm.truename.value == "")
  {
    alert("请填写真实姓名。");
    theForm.truename.focus();
    return (false);
  }

  if (theForm.province.value == "")
  {
    alert("请选择省份!");
    document.theForm.province.focus();
    return false;
  }

  if (theForm.city.value == "")
  {
    alert("请选择城市!");
    document.theForm.city.focus();
    return false;
  }
  
  if (theForm.area.value == "市辖区")
  {
    alert("请选择地区!");
    document.theForm.area.focus();
    return false;
  }
  
   if (theForm.address.value == "")
  {
    alert("请填写送货详细地址。");
    theForm.address.focus();
    return (false);
  }

   if (theForm.telphone1.value == "")
  {
    alert("请填写联系电话。");
    theForm.telphone1.focus();
    return (false);
  }



  var intSelFlag=0;
  for(i=0;i<theForm.sendtype.length;i++)
  {
	if(theForm.sendtype[i].checked)  //特别这里有[i]
	{
		intSelFlag = 1; //选择了一个
		break ;
	}
  }
  if (intSelFlag ==0)
  {
	alert("请选择一种“送货方式”。");
	document.all.songhou.focus(); 
	return (false);
  }



  var intSelFlag2=0;
  var yepay="";
  for(j=0;j<theForm.paytype.length;j++)
  {
	if(theForm.paytype[j].checked)
	{
		intSelFlag2 = 1; //选择了一个
		yepay=theForm.paytype[j].value
		break ; 
	}
  }
  
  if (intSelFlag2 ==0)
  {
	alert("请选择一种“支付方式”。");
	document.all.zhifu.focus(); 
	return (false);
  }

<%if session("username")<>"" and session("s_stat")<>"" then '只有会员自己结算，后台人员不可用此方式结算。begin%>
  if (yepay =="账户余额")
  {
  	if( parseFloat(theForm.leftye.value) < parseFloat(theForm.total.value) )
	{
	alert("“账户余额”不足，未能完成结算。本次结算金额为："+theForm.total.value+"。您的账户余额为："+theForm.leftye.value+"。");
	return (false);
	}
  }
<%end if%>

   if (theForm.total.value == "")
  {
    alert("请选择一种“送货方式”。");
    return (false);
  }


   if(confirm("确认提交此订单吗？"))
      return true
   else
      return false;


}
-->
</script>
<!-- #include file="foot.asp" -->
<%
conn.close
set conn=nothing

%>
</body>
</html>




<%
sql4="select kindnum,kindname from sh_kind where len(kindnum)=4 order by kindnum "
set rs4=server.createobject("adodb.recordset")
rs4.open sql4,conn,1,1
if rs4.bof or rs4.eof then
	kindwidth=720
else
	kindshu=rs4.recordcount
	kindwidth=cint(720/(kindshu+1)-5)
end if
rs4.close
set rs4=nothing	
%>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<style type="text/css">
.menucontainer ul#topnav a.products {
	background: url(images/nav_products.png) no-repeat;
	width: <%=kindwidth%>px;    /*108 菜单宽度*/
	height:28px;
	padding-top:8px;
	padding-left:3px;
}
</style>
<link href="headlist.css" type=text/css rel=stylesheet>
<center class="cen">

 <div id="header">
 
<table  width="100%"  height="82" border="0">
    <tr>
	    <td rowspan="2" width="330"><a href="index.asp"><img  src="images/logo.jpg" border="0" align="left"></a></td>
	    <td colspan="2" valign="top">  
			<div id="top"><center>
			<%if session("username")="" or session("s_stat")="" then%> 您好！欢迎光临<%=application("sitename")%>！[ <b><a href="hyzq.asp"><font color="#FF6600">登录</font></a></b> / <b><a href="regedit.asp"><font color="#FF6600">注册</font></a></b> ]
			<%
			else
				response.write session("username") & " 您好！ "& session("customkindname")&" | <a href='hyzq.asp'>会员专区</a> | <a href='quit.asp'>安全退出</a>"
			end if%></center>
			</div>
        </td></tr>
	<tr>
		<td style="padding-top:6px;"><a href="order_all.asp?lookorder=1"><img  src="images/gwc.JPG" border="0" class='headimg'></a>
		<a href="hyzq.asp"><img src="images/zh.JPG" border="0"  class='headimg'></a> 
		<a href="show_foot.asp?pkid=2257&c_id=295"><img src="images/zxkf.JPG"  border="0" class='headimg'></a>
		</td>
		
		 
		
	</tr>
  </table> 
 
 <div id="banner"  >
 
  <table align="center" width="100%" cellspacing="0" cellpadding="0" border="0">
	<tr>
	<td height="43" align="left">
	<div class='headleft'>  <!--headleft begin-->
	
			<div class="menucontainer">
				<ul id="topnav">
				
				
					<li>
						<a href="index.asp" class="products0">主页</a>
					</li>
<%
		sql4="select kindnum,kindname,len(kindnum) as kindlen from sh_kind order by kindnum "
		set rs4=server.createobject("adodb.recordset")
		rs4.open sql4,conn,1,1
		if rs4.bof or rs4.eof then
		else
			kn=1
			kn2=1
			kn2_shu=1
			do while not rs4.eof
			
				kindnum4 = rs4("kindnum")
				kindname4 = rs4("kindname")
				kindlen = rs4("kindlen")
				
				if kn=1 then
						response.write "<li>"
							response.write "<a href='productlist.asp?kind="&kindnum4&"'  class='products'>"&kindname4&"</a>"  
							response.write "<div class='sub'>"
							   response.write "<div class='row'>"
				elseif kindlen=4 then
							   response.write "</div>"
							   'response.write "<div style='clear:both;width:200px;float:left; border:1px #fff solid;'>last45435353</div>" '最后加一行
							response.write "</div>"
						response.write "</li>"&vbcrlf
						response.write "<li>"
							response.write "<a href='productlist.asp?kind="&kindnum4&"'  class='products'>"&kindname4&"</a>"  
							response.write "<div class='sub'>"
							   response.write "<div class='row'>"
						kn2=1
						kn2_shu=1
				elseif kindlen=8 then
							if kn2>1 then
									response.write "</ul>"
							end if
							if kn2_shu>4 then  '设定下拉菜单的列数
								response.write "</div>"
								response.write "<div class='row'>"
								kn2_shu=1
							end if
									response.write "<ul>"    ' style='width:100px;'
										response.write "<li><h2><a href='productlist.asp?kind="&kindnum4&"'>"&kindname4&"</a></h2></li>"
							
							kn2=kn2+1
							kn2_shu=kn2_shu+1
				 
				else
				end if
			kn=kn+1
			rs4.movenext
			loop
								response.write "</ul>"
							   response.write "</div>"
							   'response.write "<div style='clear:both;width:200px;'>last45435353</div>"   '最后加一行
							response.write "</div>"
						response.write "</li>"

			



							   
end if
rs4.close
set rs4=nothing
%>
					
					

					
					
					
				</ul>
			</div>
		
	</div> <!--headleft end-->
	
	<div class="headright">
		<UL>
		  <LI><A class="a_mainquicknav a_mainquicknav_1" href="productlist.asp?hot=1">热卖</A> </LI>
		  <LI><A class="a_mainquicknav a_mainquicknav_2" href="productlist.asp?cx=1">促销</A> </LI>
		  <LI><A class="a_mainquicknav a_mainquicknav_3" href="lipinlist.asp">礼品礼券</A> </LI></UL>
	</div>


	</td>
	</tr>
	</table>
	
	<table align="center" width="100%" cellspacing="0" cellpadding="0" border="0" class="kindtab" >
	<tr>
	 <form style="padding-top: 10px;" action="productlist.asp" method="post" name="form1" >
	 <td  height="34" style="padding-left:10px;padding-top:1px;">
		 <div style=" margin:4px 0px 0px 0px; width:660px;height:25px; background:url(images/searchnew.jpg) no-repeat; padding-left:30px;padding-top:2px;padding-bottom:5px;">
			<input name='keyword' style="WIDTH: 247px; HEIGHT: 17px;border:0px; font-size:12px; background-color:#FFFFFF; " maxlength=40 value="" ><BUTTON style="width:70px;HEIGHT: 21px;border:0px;background: url(images/searchnew.jpg) no-repeat 0px 50px;CURSOR:pointer;" type=submit > </BUTTON><BUTTON style="width:70px;HEIGHT: 21px;border:0px;background: url(images/searchnew.jpg) no-repeat 0px 50px;CURSOR:pointer;" type=BUTTON onclick="window.location.href='advsearch.asp'"> </BUTTON>
			<%response.write "&nbsp;"&request.cookies("sitekeyword")%>
		</div></td>
	</FORM></tr>
	</table>
 
  </div>
  </div> 
  
<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript" src="jquery.hoverIntent.minified.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	function megaHoverOver(){
		$(this).find(".sub").stop().fadeTo('fast', 1).show();
			
		//Calculate width of all ul's
		(function($) { 
			jQuery.fn.calcSubWidth = function() {
				rowWidth = 0;
				//Calculate row
				$(this).find("ul").each(function() {					
					rowWidth += $(this).width(); 
				});	
			};
		})(jQuery); 
		
		if ( $(this).find(".row").length > 0 ) { //If row exists...
			var biggestRow = 0;	
			//Calculate each row
			$(this).find(".row").each(function() {							   
				$(this).calcSubWidth();
				//Find biggest row
				if(rowWidth > biggestRow) {
					biggestRow = rowWidth;
				}
			});
			//Set width
			$(this).find(".sub").css({'width' :biggestRow});
			$(this).find(".row:last").css({'margin':'0'});
			
		} else { //If row does not exist...
			
			$(this).calcSubWidth();
			//Set Width
			$(this).find(".sub").css({'width' : rowWidth});
			
		}
	}
	
	function megaHoverOut(){ 
	  $(this).find(".sub").stop().fadeTo('fast', 0, function() {
		  $(this).hide(); 
	  });
	}

	var config = {    
		 sensitivity: 2, // number = sensitivity threshold (must be 1 or higher)    
		 interval: 100, // number = milliseconds for onMouseOver polling interval    
		 over: megaHoverOver, // function = onMouseOver callback (REQUIRED)    
		 timeout: 500, // number = milliseconds delay before onMouseOut    
		 out: megaHoverOut // function = onMouseOut callback (REQUIRED)    
	};

	$("ul#topnav li .sub").css({'opacity':'0'});
	$("ul#topnav li").hoverIntent(config);


});

</script>
</center>

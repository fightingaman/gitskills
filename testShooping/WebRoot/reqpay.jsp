<%@page language="java" contentType="text/html;charset=gbk"%>
<%@page import="com.yeepay.*"%>
<%!String formatString(String text) {
		if (text == null) {
			return "";
		}
		return text;
	}%>
<%
	request.setCharacterEncoding("GBK");
	String keyValue = formatString(ConfigInfo.getVlaue("keyValue")); // �̼���Կ
		System.out.println(keyValue);	
	String nodeAuthorizationURL = formatString(ConfigInfo.getVlaue("backUrl")); // ���������ַ
	// �̼������û�������Ʒ��֧����Ϣ
	String p0_Cmd = formatString("Buy"); // ����֧�����󣬹̶�ֵ ��Buy��
	String p1_MerId = formatString(ConfigInfo.getVlaue("p1_MerId")); // �̻����
	System.out.println(p1_MerId);
	String p2_Order = formatString(request.getParameter("p2_Order")); // �̻�������
	String p3_Amt = formatString("0.01"); // ֧�����
	String p4_Cur = formatString("CNY"); // ���ױ���
	String p5_Pid = formatString(request.getParameter("p5_Pid")); // ��Ʒ����
	String p6_Pcat = formatString(request.getParameter("p6_Pcat")); // ��Ʒ����
	String p7_Pdesc = formatString(request.getParameter("p7_Pdesc")); // ��Ʒ����
	String p8_Url = formatString(request.getParameter("p8_Url")); // �̻�����֧���ɹ����ݵĵ�ַ
	String p9_SAF = formatString("0"); // ��Ҫ��д�ͻ���Ϣ 0������Ҫ  1:��Ҫ
	String pa_MP = formatString(request.getParameter("pa_MP")); // �̻���չ��Ϣ
	String pd_FrpId = formatString(request.getParameter("pd_FrpId")); // ֧��ͨ������
	// ���б�ű����д
	pd_FrpId = pd_FrpId.toUpperCase();
	String pr_NeedResponse = formatString("0"); // Ĭ��Ϊ"1"����ҪӦ�����,��֮
	String hmac = formatString(""); // ����ǩ����

	// ���MD5-HMACǩ��
	hmac = PaymentForOnlineService.getReqMd5HmacForOnlinePayment(
			p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid,
			p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId,
			pr_NeedResponse, keyValue);
%>
<html>
<head>
<title>To YeePay Page</title>
</head>
<body onload="javascript:document.forms[0].submit()">
<!-- tech.yeepay.com:8080/robot/debug.action   www.yeepay.com/app-merchant-proxy/node-->
	<form name="yeepay" action='http://www.yeepay.com/app-merchant-proxy/node' method='POST'>
		<input type='hidden' name='p0_Cmd' value='<%=p0_Cmd%>'> <input
			type='hidden' name='p1_MerId' value='<%=p1_MerId%>'> <input
			type='hidden' name='p2_Order' value='<%=p2_Order%>'> <input
			type='hidden' name='p3_Amt' value='<%=p3_Amt%>'> <input
			type='hidden' name='p4_Cur' value='<%=p4_Cur%>'> <input
			type='hidden' name='p5_Pid' value='<%=p5_Pid%>'> <input
			type='hidden' name='p6_Pcat' value='<%=p6_Pcat%>'> <input
			type='hidden' name='p7_Pdesc' value='<%=p7_Pdesc%>'> <input
			type='hidden' name='p8_Url' value='<%=p8_Url%>'> <input
			type='hidden' name='p9_SAF' value='<%=p9_SAF%>'> <input
			type='hidden' name='pa_MP' value='<%=pa_MP%>'> <input
			type='hidden' name='pd_FrpId' value='<%=pd_FrpId%>'> <input
			type="hidden" name="pr_NeedResponse" value="<%=pr_NeedResponse%>">
		<input type='hidden' name='hmac' value='<%=hmac%>'> 
	</form>
</body>
</html>

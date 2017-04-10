<%@ Page Language="VB" Debug="True" AutoEventWireup="false" CodeFile="db_connect.aspx.vb" Inherits="db_connect" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
<head>
<title></title>

<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<script language="VB" runat="server">

Dim SQL_str As String
Dim i,j As Integer
Dim Cmd As SqlCommand
Dim Obj_reader As SqlDataReader
Dim result As Boolean

Sub display_table(tablename)

   Cmd = New SqlCommand(SQL_str, conn)
   Obj_reader = Cmd.ExecuteReader()

   Response.Write("<br>")

   Response.Write("<table align=center border=1 bordercolor=black cellpadding=3>")
   Response.Write("<caption>" & tablename & "</caption>")

   '顯示資料表欄位名稱
   Response.Write("<tr>")
   For i = 0 To Obj_reader.FieldCount - 1
      Response.Write("<td bgcolor=yellow>" & Obj_reader.GetName(i) & "</td>")
   Next i
   Response.Write("</tr>")

   '逐筆顯示所有資料
   While Obj_reader.Read()
      Response.Write("<tr>")
      For i = 0 To Obj_reader.FieldCount - 1
         Response.Write("<td>")
         Response.Write(Obj_reader.Item(i))
         Response.Write("</td>")
      Next i
      Response.Write("</tr>")
   End While
   Response.Write("</table>")

   Obj_reader.close()

End Sub

</script>


</head>
<body>

<%

Dim divisions,patient,doctor,web_search As String

divisions=request.form("divisions")
patient=request.form("patient")
doctor=request.form("doctor")
web_search=request.form("web_search")

call db_connect()
conn.Open()          '開啟資料庫


If divisions="true" Then
   SQL_str = "select * from divisions"
   call display_table("divisions")
End If

If patient="true" Then
   SQL_str = "select * from patient"
   call display_table("patient")
End If

If doctor="true" Then
   SQL_str = "select * from doctor"
   call display_table("doctor")
End If

If web_search="true" Then
   SQL_str = "select * from web_search"
   call display_table("web_search")
End If


conn.Close()         '關閉資料庫

%>

</body>
</html>




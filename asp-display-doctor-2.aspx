<%@ Page Language="VB" Debug="True" AutoEventWireup="false" CodeFile="db_connect.aspx.vb" Inherits="db_connect" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
<head>
<title></title>
</head>
<body>

<%

Dim SQL_str As String
Dim i,j As Integer
Dim Cmd As SqlCommand
Dim Obj_reader As SqlDataReader
Dim result As Boolean

Dim DOC_name As String

DOC_name=request.form("DOC_name")

call db_connect()
conn.Open()          '開啟資料庫


'doctor關聯表--------------------------------------------------------------------

SQL_str = "select DOC_name AS 醫生姓名, eid AS 醫師編號, medicine AS 內科, surgery AS 外科, Pediatric_and_Gynecology_and_Obstetrics AS 婦產小兒, Other_Professional AS 其他專科, schedule AS 排班, DOC_status AS 醫師狀態  from doctor where  DOC_name = '" &  DOC_name & "'"
Cmd = New SqlCommand(SQL_str, conn)
Obj_reader = Cmd.ExecuteReader()

Response.Write("<table align=center border=1 bordercolor=black cellpadding=3>")

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


conn.Close()         '關閉資料庫

response.write("<br><br>done")

%>

</body>
</html>




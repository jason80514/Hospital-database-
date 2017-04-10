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

Dim name As String
Dim DOC_name As String
Dim patient_medical_record As String
Dim medicine As String
Dim Surgery As String
Dim Pediatric_and_Gynecology_and_Obstetrics As String
Dim Other_Professional As string
Dim birth As String
call db_connect()
conn.Open()                '開啟資料庫

Cmd = New SqlCommand(SQL_str, conn)

'顯示所有patient
SQL_str = "select name from patient" 
Cmd = New SqlCommand(SQL_str, conn)
Obj_reader = Cmd.ExecuteReader()

Response.Write("<table align=center border=1 bordercolor=black cellpadding=3>")

'顯示資料表欄位名稱-----------------------------
Response.Write("<tr>")
For i = 0 To Obj_reader.FieldCount - 1
   Response.Write("<td bgcolor=yellow>" & Obj_reader.GetName(i) & "</td>")
Next i
Response.Write("</tr>")


'逐筆顯示所有資料-------------------------------
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
Dim temp
Dim cmdx As sqlcommand
Obj_reader.close()
SQL_str = "select count(name) from patient"
Cmdx = New SqlCommand(SQL_str, conn)
temp = Cmdx.ExecuteScalar()
response.write("<br><br>")
response.write("總共病人數 : " & temp & "人")
conn.Close()         '關閉資料庫
response.write("<br><br>done")

%>

</body>
</html>


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
Dim birth As String
name=request.form("name")
call db_connect()
conn.Open()                '�}�Ҹ�Ʈw
'��ܩҦ�patient
SQL_str = "select name AS �f�H�m�W, birth AS �ͤ� from patient order by birth ASC"
Cmd = New SqlCommand(SQL_str, conn)
Obj_reader = Cmd.ExecuteReader()

Response.Write("<table align=center border=1 bordercolor=black cellpadding=3>")

'��ܸ�ƪ����W��-----------------------------
Response.Write("<tr>")
For i = 0 To Obj_reader.FieldCount - 1
   Response.Write("<td bgcolor=yellow>" & Obj_reader.GetName(i) & "</td>")
Next i
Response.Write("</tr>")


'�v����ܩҦ����-------------------------------
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
conn.Close()         '������Ʈw
response.write("<br><br>done")

%>

</body>
</html>


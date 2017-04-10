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
Dim sex As String
Dim patient_ID As String
Dim phone As String
Dim addressx As String
Dim patient_medical_record As String

pid=request.form("pid")
name=request.form("name")
birth=request.form("birth")
sex=request.form("sex")
patient_ID=request.form("patient_ID")
phone=request.form("phone")
addressx=request.form("addressx")
patient_medical_record=request.form("patient_medical_record")

response.write(pid & "<br>")
response.write(name & "<br>")
response.write(birth & "<br>")
response.write(sex & "<br>")
response.write(patient_ID & "<br>")
response.write(phone & "<br>")
response.write(addressx & "<br>")
response.write(patient_medical_record & "<br>")

If ((Len(patient_ID) = 0)) Then 
   response.write("patient_ID 不可空白") 
   response.end()
   elseif((Len(patient_ID) <> 10)) 
   response.write("patient_ID至少輸入十個字元") 
   response.end()
   End If
If((Len(birth) = 0)) then 
   response.write("birth不可空白")
   response.end() 
   elseif((Len(birth) > 10)) 
   response.write("birth超出輸入限制") 
   response.end()
   elseif((Len(birth) < 4))  
   response.write("birth不可低於4個字")
   response.end()
   End if
SQL_str="INSERT INTO patient VALUES ("
SQL_str=SQL_str & "'" & pid & "',"
SQL_str=SQL_str & "'" & name & "',"
SQL_str=SQL_str & "'" & birth & "',"
SQL_str=SQL_str & "'" & sex & "',"
SQL_str=SQL_str & "'" & patient_ID & "',"
SQL_str=SQL_str & "'" & phone & "',"
SQL_str=SQL_str & "'" & addressx & "',"
SQL_str=SQL_str & "'" & patient_medical_record & "')"

'response.write(SQL_str)
'response.end()

call db_connect()
conn.Open()          '開啟資料庫

Cmd = New SqlCommand(SQL_str, conn)
result = Cmd.ExecuteNonQuery()


'新增了一筆，顯示所有customer看一看結果

SQL_str = "select * from patient" 
Cmd = New SqlCommand(SQL_str, conn)
Obj_reader = Cmd.ExecuteReader()


'
'Dim temp
'SQL_str = "select count(*) from patient"
'Cmd = New SqlCommand(SQL_str, conn)
'temp = Cmd.ExecuteScarlar()
'response.write(temp)
'


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

conn.Close()         '關閉資料庫

response.write("<br><br>done")

%>

</body>
</html>




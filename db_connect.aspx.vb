Imports System.Data.SqlClient
Imports System.Data
Imports System.DBNull
Imports System.IO

Public Class db_connect

Inherits System.Web.UI.Page

public Source As String 
public conn As SqlConnection

Sub db_connect()
        Source = "Server = hospitalregisterationsystem.database.windows.net;Database=hospitalDB;User ID=a0960709163;Password=Jj810109;TrustServerCertificate=False;Connection Timeout=30;"
        conn = New SqlConnection(Source)   '連線
    End Sub
End Class

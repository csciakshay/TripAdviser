Imports System.Data.SqlClient
Partial Class city
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("Dbconnection").ConnectionString)
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ValidationSettings.UnobtrusiveValidationMode = UI.UnobtrusiveValidationMode.None
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        con.Open()
        Dim cmd As New SqlCommand("insert into citymst values('" & txtcity.Text & "')", con)
        cmd.ExecuteNonQuery()
        con.Close()



    End Sub
End Class

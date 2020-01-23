Imports System.Data.SqlClient
Partial Class citymst
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("Databs").ConnectionString)

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        con.Open()
        Dim cmd As New SqlCommand("insert into citymst values('" & txtcity.Text & "')", con)
        cmd.ExecuteNonQuery()
        con.Close()




    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ValidationSettings.UnobtrusiveValidationMode = UI.UnobtrusiveValidationMode.None
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        con.Open()
        Dim adap As New SqlDataAdapter("select * from citymst where Id='" & DropDownList1.SelectedValue & "' ", con)
        Dim ds As New Data.DataTable()
        adap.Fill(ds)
        txtcity.Text = ds.Rows(0)("city").ToString
    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        con.Open()
        Dim cmd As New SqlCommand("updatecity", con)
        cmd.CommandType = Data.CommandType.StoredProcedure
        cmd.Parameters.Add("@id", Data.SqlDbType.VarChar).Value = DropDownList1.SelectedValue
        cmd.Parameters.Add("@City", Data.SqlDbType.VarChar).Value = txtcity.Text
        If cmd.ExecuteNonQuery Then
            MsgBox("sucess")
        Else
            MsgBox("fail")

        End If
    End Sub

End Class

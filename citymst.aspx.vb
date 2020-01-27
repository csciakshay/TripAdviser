Imports System.Data.SqlClient
Partial Class citymst
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("Databs").ConnectionString)

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Try
            con.Open()
            Dim cmd As New SqlCommand("insert into citymst values('" & txtcity.Text & "')", con)
            If cmd.ExecuteNonQuery() Then
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Success", "alert('City name saved');", True)
                txtcity.Text = ""
            Else
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Fails", "alert('City name save fails');", True)
            End If
        Catch ex As Exception
            Response.Redirect("errorPage.aspx?errMsg=" + ex.Message, False)
        Finally
            con.Close()
        End Try




    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ' ValidationSettings.UnobtrusiveValidationMode = UI.UnobtrusiveValidationMode.None
        If Session("uname") Is Nothing Then
            Response.Redirect("loginpg.aspx", False)
        End If
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        Try
            con.Open()
            Dim adap As New SqlDataAdapter("select * from citymst where Id='" & DropDownList1.SelectedValue & "' ", con)
            Dim ds As New Data.DataTable()
            adap.Fill(ds)
            txtcity.Text = ds.Rows(0)("city").ToString
        Catch ex As Exception
            Response.Redirect("errorPage.aspx?errMsg=" + ex.Message, False)
        Finally
            con.Close()
        End Try
    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        Try
            con.Open()
            Dim cmd As New SqlCommand("updatecity", con)
            cmd.CommandType = Data.CommandType.StoredProcedure
            cmd.Parameters.Add("@id", Data.SqlDbType.VarChar).Value = DropDownList1.SelectedValue
            cmd.Parameters.Add("@City", Data.SqlDbType.VarChar).Value = txtcity.Text
            If cmd.ExecuteNonQuery Then
                txtcity.Text = ""
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Success", "alert('City name updated');", True)
            Else
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Fails", "alert('City name update fails');", True)
               
            End If
        Catch ex As Exception
            Response.Redirect("errorPage.aspx?errMsg=" + ex.Message, False)
        Finally
            con.Close()
        End Try
    End Sub

End Class

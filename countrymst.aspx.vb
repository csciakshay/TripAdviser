Imports System.Data.SqlClient
Partial Class countrymst
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("Databs").ConnectionString)

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Try
            con.Open()
            Dim cmd As New SqlCommand("insert into countrymst values('" & txtcountry.Text & "')", con)

            If cmd.ExecuteNonQuery() Then
                '   MsgBox("Sucess")
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Success", "alert('Country name saved');", True)
                txtcountry.text = ""
            Else
                '  MsgBox("Fail")
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Fails", "alert('Country name save fails');", True)
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

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        Try
            con.Open()
            Dim cmd As New SqlCommand("updatecountry", con)
            cmd.CommandType = Data.CommandType.StoredProcedure
            cmd.Parameters.Add("@Id", Data.SqlDbType.VarChar).Value = DropDownList1.SelectedValue
            cmd.Parameters.Add("@Country", Data.SqlDbType.VarChar).Value = txtcountry.Text
            If cmd.ExecuteNonQuery Then
                txtcountry.Text = ""
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Success", "alert('Country name updated');", True)
                'MsgBox("sucess")
            Else
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Fails", "alert('Country name update fails');", True)
                'MsgBox("fail")

            End If
        Catch ex As Exception
            Response.Redirect("errorPage.aspx?errMsg=" + ex.Message, False)
        Finally
            con.Close()
        End Try
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        Try
            con.Open()
            Dim adap As New SqlDataAdapter("select * from countrymst where id='" & DropDownList1.SelectedValue & "'", con)
            Dim ds As New Data.DataTable()
            adap.Fill(ds)
            txtcountry.Text = ds.Rows(0)("country").ToString
        Catch ex As Exception
            Response.Redirect("errorPage.aspx?errMsg=" + ex.Message, False)
        Finally
            con.Close()
        End Try
    End Sub
End Class

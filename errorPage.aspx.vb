
Partial Class errorPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Label1.Text = Request.QueryString("errMsg")
    End Sub
End Class

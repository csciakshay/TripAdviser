
Partial Class logout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Session.Abandon()
        Session.Clear()
        'Session.Timeout = 0
        Response.Redirect("loginpg.aspx", False)
    End Sub
End Class

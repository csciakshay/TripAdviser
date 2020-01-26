
Partial Class main
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("userImage") Is Nothing Then
            Image1.ImageUrl = "~/upload/no-image-available-grid.jpg"
            Label1.Text = ""
        Else
            Image1.ImageUrl = Session("userImage")
            Label1.Text = "Welcome " + Session("uname")
        End If
    End Sub
End Class


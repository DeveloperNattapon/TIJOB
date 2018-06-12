Option Strict On
Option Explicit On

Public Class Home
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserID").ToString = "" Then
            Response.Redirect("Login.aspx")
            Response.End()
        Else
            lblUser.Text = Session("Prefix_thai").ToString + " " + Session("Name_thai").ToString + " " + Session("Surname_thai").ToString

        End If
    End Sub

End Class
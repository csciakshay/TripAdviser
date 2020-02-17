<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="citymst.aspx.vb" Inherits="citymst" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="ftco-section contact-section ftco-degree-bg">
    	<div class="container">
            <div class="row">
                <div class ="col-md-4"></div>
                <div class ="col-md-4">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h1>City Registration</h1>
                </div>
                <div class ="col-md-4"></div>
            </div>
            <br />

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <contentTemplate>
            <div class="row">
                <div class ="col-md-4">
                </div>
                <div class ="col-md-4">
             <div class="form-group">
       <asp:Label ID="Label3" runat="server" Text="Id"></asp:Label>
                     <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" DataSourceID="SqlDataSource1" DataTextField="Id" DataValueField="Id" AutoPostBack="True"></asp:DropDownList>
                    
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Databs %>" SelectCommand="SELECT [Id] FROM [citymst]"></asp:SqlDataSource>
                    
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>
                 <div class ="col-md-4"></div>
                 </div>
                    </div>
         </div> 



             <div class="row">
                <div class ="col-md-4">
                </div>
                <div class ="col-md-4">
                    <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Select Country"></asp:Label>
                        <asp:DropDownList ID="countrydropdown" runat="server"  class="form-control"  DataTextField="Country" DataValueField="Id" AutoPostBack="True"></asp:DropDownList>
                        
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="countrydropdown"></asp:RequiredFieldValidator>
                </div>
                </div>
                <div class ="col-md-4"></div>
            </div>


             <div class="row">
                <div class ="col-md-4">
                </div>
                <div class ="col-md-4">
                    <div class="form-group">
                <asp:Label ID="Label4" runat="server" Text="Select State"></asp:Label>
                        <asp:DropDownList ID="statedropdown" runat="server" class="form-control" DataTextField="state" DataValueField="Id" AutoPostBack="True"></asp:DropDownList>
                       
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="statedropdown"></asp:RequiredFieldValidator>
                </div>
                </div>
                <div class ="col-md-4"></div>
            </div>
                </contentTemplate>
                </asp:UpdatePanel>

            <div class="row">
                <div class ="col-md-4">
                </div>
                <div class ="col-md-4">
                    <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Enter City"></asp:Label>
                <asp:TextBox ID="txtcity" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtcity"></asp:RequiredFieldValidator>
                </div>
                </div>
                <div class ="col-md-4"></div>
            </div>


             <div class="row">
                <div class ="col-md-4"></div>
                <div class ="col-md-4">
             <div class="form-group">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-info py-3 px-5"/>
                 <asp:Button ID="btnUpdate" runat="server" Text="Update" class="btn btn-info py-3 px-5"/>
                 </div>
                    </div>
                 <div class ="col-md-4"></div>
         </div> 
   </section> 
</asp:Content>


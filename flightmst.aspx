<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="flightmst.aspx.vb" Inherits="flightmst" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="ftco-section contact-section ftco-degree-bg">
    	<div class="container">
            <div class="row">
                <div class ="col-md-4"></div>
                <div class ="col-md-4">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h1>Flight Registration</h1>
                </div>
                <div class ="col-md-4"></div>
            </div>
            <br />
    
     
            <div class="row">
                <div class ="col-md-4">
                     <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text=" Enter Flight Name"></asp:Label>
                <asp:TextBox ID="txtnm" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtnm"></asp:RequiredFieldValidator>
                </div>
                </div>
                <div class ="col-md-4">
                  <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text=" Arrival Time"></asp:Label>
                <asp:TextBox ID="txttime" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txttime"></asp:RequiredFieldValidator>
                </div>  
                </div>
                <div class ="col-md-4">
                <div class="form-group">
                <asp:Label ID="Label3" runat="server" Text=" Departure Time"></asp:Label>
                <asp:TextBox ID="Txttime2" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txttime2"></asp:RequiredFieldValidator>
                </div>  
            </div>
                </div>


             <div class="row">
                <div class ="col-md-4">
                     <div class="form-group">
                <asp:Label ID="Label4" runat="server" Text="Economy Rate"></asp:Label>
                <asp:TextBox ID="txtrate" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtrate"></asp:RequiredFieldValidator>
                </div>
                </div>
                <div class ="col-md-4">
                  <div class="form-group">
                <asp:Label ID="Label5" runat="server" Text=" Business Rate"></asp:Label>
                <asp:TextBox ID="txtrate1" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtrate1"></asp:RequiredFieldValidator>
                </div>  
                </div>
                <div class ="col-md-4">
                <div class="form-group">
                <asp:Label ID="Label6" runat="server" Text=" Source"></asp:Label>
                <asp:TextBox ID="txtsource" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtsource"></asp:RequiredFieldValidator>
                </div>  
            </div>
                 </div>



             <div class="row">
                <div class ="col-md-4">
                     <div class="form-group">
                <asp:Label ID="Label7" runat="server" Text=" Destination"></asp:Label>
                <asp:TextBox ID="txtdestination" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtdestination"></asp:RequiredFieldValidator>
                </div>
                </div>
                <div class ="col-md-4">
                  <div class="form-group">
                <asp:Label ID="Label8" runat="server" Text="Flight No"></asp:Label>
                <asp:TextBox ID="txtno" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtno"></asp:RequiredFieldValidator>
                </div>  
                </div>
                <div class ="col-md-4">
               
                 </div>


            <div class="row">
                <div class ="col-md-4"></div>
                <div class ="col-md-4">
             <div class="form-group">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-primary py-3 px-5"/>
                 <div class ="col-md-4"></div>
                 </div>
                    </div>
        </div> 

      </div>
</section>
</asp:Content>


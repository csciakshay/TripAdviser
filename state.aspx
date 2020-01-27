<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="state.aspx.vb" Inherits="state" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="ftco-section contact-section ftco-degree-bg">
    	<div class="container">
            <div class="row">
                <div class ="col-md-4"></div>
                <div class ="col-md-4">
                    <h1>State Registration</h1>
                </div>
                <div class ="col-md-4"></div>
            </div>
            <br />

          <div class="row">
              <div class ="col-md-4">
                  </div>
              <div class="col-md-4 ">   
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Enter State"></asp:Label>
                <asp:TextBox ID="txtstate" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtstate"></asp:RequiredFieldValidator>
                </div>
             </div>
              <div class ="col-md-4">
                  </div>

              <div class="row">
              <div class ="col-md-4">
                  </div>
              <div class="col-md-4 ">
              <div class="form-group">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-primary py-3 px-5"/>
                  </div> 
              </div>
              
                  
                      </div> 


       </div>
 </section>
</asp:Content>


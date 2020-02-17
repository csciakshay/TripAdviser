<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="forgotpass.aspx.vb" Inherits="forgotpass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <section class="ftco-section contact-section ftco-degree-bg">
 <div class="container">
    <div class="row">
       <div class ="col-md-4">
       </div>
                <div class ="col-md-4">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h1>Forgot Password</h1>
                </div>
                    <div class ="col-md-4">
                    </div>
    </div>
            <br />
                          <div class="row">
                            <div class="col-md-4 ">   
                            </div>
                                <div class="col-md-4 ">
                                 <asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label><br />
                                 <asp:TextBox ID="txtFullName" runat="server" class="form-control"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtFullName"></asp:RequiredFieldValidator> 
                                </div>
                               <div class="col-md-4 ">   
                               </div>
                          </div>

                <div class="row">
                            <div class="col-md-4 ">   
                            </div>
                                <div class="col-md-4 ">
                                 <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label><br />
                                 <asp:TextBox ID="Txtemail" runat="server" class="form-control"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtemail"></asp:RequiredFieldValidator> 
                                </div>
                               <div class="col-md-4 ">   
                               </div>
                          </div>

                 <div class="row">
                            <div class="col-md-4 ">   
                            </div>
                                <div class="col-md-4 ">
                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <asp:Button ID="Button1" runat="server" Text="Submit"
                                       class="btn btn-info py-3 px-5" />
                                </div>
                               <div class="col-md-4 ">   
                               </div>
                          </div>
    

</div>
        </section>
</asp:Content>


<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="loginpg.aspx.vb" Inherits="loginpg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="ftco-section contact-section ftco-degree-bg">
    	<div class="container">
            <div class="row">
                <div class ="col-md-4"></div>
                <div class ="col-md-4">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h1>Login</h1>
                </div>
                <div class ="col-md-4"></div>
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
        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
        <asp:TextBox ID="txtpass" runat="server" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtpass"></asp:RequiredFieldValidator> 
                    
                </div>
                <div class="col-md-4 ">
               </div>    
            </div>


            <div class="row">
                <div class="col-md-4 ">
        
                    </div>
                <div class="col-md-2 ">
                    <asp:HyperLink ID="HyperLink1" runat="server">Forgot Password</asp:HyperLink>
                    </div>
                <div class="col-md-2 ">
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/registration.aspx">Registration</asp:HyperLink>
                    </div>

                <div class="col-md-4 ">
                    </div>
               </div>

            <div class="row">
             <div class="col-md-4 ">
               </div>    
             <div class="col-md-4 ">
                 <div class="form-group">
        <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-primary py-3 px-5"/>
               </div>    
             <div class="col-md-4 ">
               </div>    
            </div>
                </div> 
    	</div> 
         </section> 

</asp:Content>


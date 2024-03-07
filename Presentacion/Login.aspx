<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Presentacion.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-6 mx-auto">
            <div class="card my-5">
                <div class="card-header">
                    Login
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <label for="txtUsuario" class="form-label">Usuario</label>
                        <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="txtContrasena" class="form-label">Contraseña</label>
                        <asp:TextBox TextMode="Password" ID="txtContrasena" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" OnClick="btnIngresar_Click" CssClass="btn btn-danger" />
                        <a href="Default.aspx" class="btn btn-outline-danger">Regresar</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

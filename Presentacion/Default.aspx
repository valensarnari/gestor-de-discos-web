<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentacion.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="my-5">
        <h1>Bienvenido a la aplicación web de Discos!</h1>
        <p>Es hora de registrar nuestros discos preferidos...</p>
        <a href="Login.aspx" class="btn btn-danger">Logueate!</a>
    </div>
</asp:Content>

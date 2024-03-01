<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="Presentacion.Listado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView CssClass="table my-5" ID="dgvDiscos" AutoGenerateColumns="false" runat="server">
        <Columns>
            <asp:BoundField HeaderText="Id" DataField="Id" />
            <asp:BoundField HeaderText="Título" DataField="Titulo" />
            <asp:BoundField HeaderText="Fecha de lanzamiento" DataField="FechaLanzamiento" />
            <asp:BoundField HeaderText="Cantidad de canciones" DataField="CantidadCanciones" />
            <asp:BoundField HeaderText="Url imagen" DataField="UrlImagen" />
            <asp:BoundField HeaderText="Estilo" DataField="Estilo.Descripcion" />
            <asp:BoundField HeaderText="Tipo de edición" DataField="TipoEdicion.Descripcion" />
        </Columns>
    </asp:GridView>
</asp:Content>

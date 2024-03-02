<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="Presentacion.Listado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView DataKeyNames="Id" OnSelectedIndexChanged="dgvDiscos_SelectedIndexChanged" CssClass="table mt-5 mb-3" ID="dgvDiscos" AutoGenerateColumns="false" runat="server">
        <Columns>
            <asp:BoundField HeaderText="Id" DataField="Id" />
            <asp:BoundField HeaderText="Título" DataField="Titulo" />
            <asp:BoundField HeaderText="Fecha de lanzamiento" DataField="FechaLanzamiento" />
            <asp:BoundField HeaderText="Cantidad de canciones" DataField="CantidadCanciones" />
            <asp:BoundField HeaderText="Url imagen" DataField="UrlImagen" />
            <asp:BoundField HeaderText="Estilo" DataField="Estilo.Descripcion" />
            <asp:BoundField HeaderText="Tipo de edición" DataField="TipoEdicion.Descripcion" />
            <asp:CommandField HeaderText="Editar" ShowSelectButton="true" SelectText="✍️"/>
        </Columns>
    </asp:GridView>
    <a href="Alta.aspx" class="btn btn-danger">Agregar</a>
</asp:Content>

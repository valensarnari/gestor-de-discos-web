<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Alta.aspx.cs" Inherits="Presentacion.Alta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-6 mx-auto">
            <div class="my-3">
                <label for="txtId" class="form-label">Id</label>
                <asp:TextBox ID="txtId" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtTitulo" class="form-label">Titulo</label>
                <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtFecha" class="form-label">Fecha de lanzamiento</label>
                <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtCantidad" class="form-label">Cantidad de canciones</label>
                <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="ddlEstilo" class="form-label">Estilo</label>
                <asp:DropDownList ID="ddlEstilo" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <asp:Button OnClick="btnAgregar_Click" ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-danger" />
                <asp:Button OnClick="btnModificar_Click" ID="btnModificar" runat="server" Text="Modificar" CssClass="btn btn-danger" Visible="false" />
                <a href="Listado.aspx" class="btn btn-outline-danger">Cancelar</a>
            </div>
        </div>
        <div class="col-6">
            <div class="my-3">
                <label for="ddlTipoEdicion" class="form-label">Tipo de edición</label>
                <asp:DropDownList ID="ddlTipoEdicion" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
            <asp:ScriptManager runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <label for="txtUrlImagen" class="form-label">Url de imagen</label>
                        <asp:TextBox AutoPostBack="true" OnTextChanged="txtUrlImagen_TextChanged" ID="txtUrlImagen" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <asp:Image ID="imgDisco" Width="40%" runat="server" ImageUrl="https://t3.ftcdn.net/jpg/03/45/05/92/360_F_345059232_CPieT8RIWOUk4JqBkkWkIETYAkmz2b75.jpg" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>

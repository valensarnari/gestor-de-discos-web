<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="Presentacion.Listado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mt-3">
        <label for="txtFiltro" class="form-label">Filtrar por título</label>
        <asp:TextBox AutoPostBack="true" OnTextChanged="txtFiltro_TextChanged" ID="txtFiltro" runat="server" CssClass="form-control w-50"></asp:TextBox>
    </div>
    <div class="row my-3">
        <div class="col">
            <div class="my-3">
                <label for="ddlCampo" class="form-label">Campo</label>
                <asp:DropDownList AutoPostBack="true" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged" ID="ddlCampo" runat="server" CssClass="form-select">
                    <asp:ListItem Text="Título"></asp:ListItem>
                    <asp:ListItem Text="Cantidad de canciones"></asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" CssClass="mt-3 btn btn-danger" />
            </div>
        </div>
        <div class="col">
            <div class="my-3">
                <label for="ddlCriterio" class="form-label">Criterio</label>
                <asp:DropDownList ID="ddlCriterio" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
        </div>
        <div class="col">
            <div class="my-3">
                <label for="txtFiltroAvanzado" class="form-label">Filtro</label>
                <asp:TextBox ID="txtFiltroAvanzado" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
    </div>
    <asp:GridView DataKeyNames="Id" OnSelectedIndexChanged="dgvDiscos_SelectedIndexChanged" CssClass="table mb-3" ID="dgvDiscos" AutoGenerateColumns="false" runat="server">
        <Columns>
            <asp:BoundField HeaderText="Id" DataField="Id" />
            <asp:BoundField HeaderText="Título" DataField="Titulo" />
            <asp:BoundField HeaderText="Fecha de lanzamiento" DataField="FechaLanzamiento" />
            <asp:BoundField HeaderText="Cantidad de canciones" DataField="CantidadCanciones" />
            <asp:BoundField HeaderText="Url imagen" DataField="UrlImagen" />
            <asp:BoundField HeaderText="Estilo" DataField="Estilo.Descripcion" />
            <asp:BoundField HeaderText="Tipo de edición" DataField="TipoEdicion.Descripcion" />
            <asp:CommandField HeaderText="Editar" ShowSelectButton="true" SelectText="✍️" />
        </Columns>
    </asp:GridView>
    <a href="Alta.aspx" class="btn btn-danger">Agregar</a>
</asp:Content>

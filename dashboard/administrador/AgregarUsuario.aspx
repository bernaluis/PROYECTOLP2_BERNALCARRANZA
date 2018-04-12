<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/administrador/Maestra.master" AutoEventWireup="true" CodeFile="AgregarUsuario.aspx.cs" Inherits="dashboard_administrador_AgregarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contenidoDePagina" runat="Server">
    <script type="text/javascript">
        function modificarCarrera() {
            swal({
                title: "Correcto",
                text: 'Usuario agregado con exito',
                type: 'success',

                button: 'Aceptar'
            });
            setTimeout("redireccion()", 1000);
        }
        function error() {
            swal({
                title: "Error",
                text: 'Hubo un error al realizar la accion',
                type: 'error',
                button: 'Aceptar'
            });
        }
        function redireccion() {
            location.href = "Usuarios.aspx";
        }
    </script>

    <form id="Form1" name="menuEstu" runat="server" autocomplete="off">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row center-align">
                    <div class="container">
                        <div class="input-field col s12 m6">
                            <label>Nombres del Usuario:</label>
                            <asp:TextBox ID="txtNombUsu" runat="server"></asp:TextBox>
                        </div>
                        <div class="input-field col s12 m6">
                            <label>Apellidos del Usuario:</label>
                            <asp:TextBox ID="txtApelUsu" runat="server"></asp:TextBox>
                        </div>
                        <div class="input-field col s12 m12">
                            <label>Correo del Usuario:</label>
                            <asp:TextBox ID="txtCorreUsu" runat="server"></asp:TextBox>
                        </div>
                        <div class="input-field col s12 m12">
                            <asp:DropDownList ID="ddlTipoUsu" runat="server" CssClass="browser-default"></asp:DropDownList>
                        </div>
                        <div class="col s12 m12 center-align">
                            <asp:Button ID="guardarUsuario" CssClass="btn blue white-text" runat="server" Text="Guardar" OnClick="guardarUsuario_Click" />
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/gestor/Maestra.master" AutoEventWireup="true" CodeFile="EditarBecario.aspx.cs" Inherits="dashboard_gestor_EditarBecario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contenidoDePagina" Runat="Server">
    <script type="text/javascript">
        function modificarCarrera() {
            swal({
                title: "Correcto",
                text: 'Becario agregado con exito',
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
            location.href = "Becarios.aspx";
        }
    </script>
    <form id="Form1" name="menuEstu" runat="server" autocomplete="off">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row center-align">
                    <div class="container">
                        <div class="input-field col s12 m6">
                            <label class="active">Nombres del Becario:</label>
                            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                        </div>
                        <div class="input-field col s12 m6">
                            <label class="active">Apellidos del Becario:</label>
                            <asp:TextBox ID="txtApellidos" runat="server"></asp:TextBox>
                        </div>
                        <div class="input-field col s12 m12">
                            <label class="active">Correo del Becario:</label>
                            <asp:TextBox ID="txtCorreo" runat="server" TextMode="Email"></asp:TextBox>
                        </div>
                        <div class="input-field col s12 m6">
                            <label class="active">Fecha de nacimiento:</label>
                            <asp:TextBox TextMode="DateTime" ID="txtFechaN" runat="server" />
                        </div>
                        <div class="input-field col s12 m6">
                            <label class="active">Telefono:</label>
                            <asp:TextBox ID="txtTelefono" runat="server" TextMode="Phone"></asp:TextBox>
                        </div>
                        <div class="input-field col s12 m12">
                            <label class="active">Direccion:</label>
                            <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                        </div>
                 <div class="input-field col s12 m6">
                            <label class="active">Duracion del programa:</label>
                            <asp:TextBox ID="txtContra" runat="server"></asp:TextBox>
                        </div>
                        <div class="input-field col s12 m6">
                            <label class="active">DUI</label>
                            <asp:TextBox ID="txtDui" runat="server"></asp:TextBox>
                        </div>
                        <div class="input-field col s12 m6">
                            <label class="active">Universidad</label>
                            <asp:DropDownList ID="ddlUniversidades" runat="server" CssClass="browser-default"></asp:DropDownList>
                        </div>
                        <div class="input-field col s12 m6">
                            <label class="active">Carreras</label>
                            <asp:DropDownList ID="ddlCarreras" runat="server" CssClass="browser-default"></asp:DropDownList>
                        </div>
                        <div class="input-field col s12 m6">
                            <label class="active">Nivel educativo</label>
                            <asp:DropDownList ID="ddlNivel" runat="server" CssClass="browser-default"></asp:DropDownList>
                        </div>
                        <div class="input-field col s12 m6">
                            <label class="active">Programa de beca:</label>
                            <asp:DropDownList ID="ddlPrograma" runat="server" CssClass="browser-default"></asp:DropDownList>
                        </div>
                        <div class="input-field col s12 m6">
                            <label class="active">Fecha de inicio del programa:</label>
                            <asp:TextBox TextMode="DateTime" ID="fechaInicio" runat="server" />
                        </div>
                        <div class="input-field col s12 m6">
                            <label class="active">Fecha de fin del programa:</label>
                            <asp:TextBox TextMode="DateTime" ID="fechaFin" runat="server" />
                        </div>

                        <div class="col s12 m12 center-align">
                            <asp:Button ID="actualizarUsuario" CssClass="btn blue white-text" runat="server" Text="Modificar" OnClick="actualizarUsuario_Click"  />
                        </div>

                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>


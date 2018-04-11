<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/contador/Maestra.master" AutoEventWireup="true" CodeFile="AgregarAspectoBecario.aspx.cs" Inherits="dashboard_contador_AgregarAspectoBecario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contenidoDePagina" runat="Server">
    <script type="text/javascript">
        function agregarMonto() {
            swal({
                title: "Correcto",
                text: 'Monto agregado con exito',
                type: 'success',

                button: 'Aceptar'
            });
            setTimeout("redireccion()", 900);
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
            location.href = "PresupuestoBecario.aspx";
        }
    </script>
    <form id="Form1" name="menuEstu" runat="server" autocomplete="off">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row center-align">
                    <div class="container">
                        <div class="input-field col s12 m6">
                            <asp:DropDownList ID="ddlAspectos" CssClass="browser-default" runat="server"></asp:DropDownList>
                        </div>
                        <div class="input-field col s12 m6">
                            <label>Monto del aspecto:</label>
                            <asp:TextBox ID="txtMonto" CssClass="materialize-textarea" runat="server"></asp:TextBox>
                        </div>
                        <div class="col s12 m12 center-align">
                            <asp:Button ID="guardarMontoAspecto" CssClass="btn blue white-text" runat="server" Text="Guardar Monto" OnClick="guardarMontoAspecto_Click" />
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>
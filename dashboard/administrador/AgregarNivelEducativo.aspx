<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/administrador/Maestra.master" AutoEventWireup="true" CodeFile="AgregarNivelEducativo.aspx.cs" Inherits="dashboard_administrador_AgregarNivelEducativo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contenidoDePagina" runat="Server">
    <script type="text/javascript">
        function modificarCarrera() {
            swal({
                title: "Correcto",
                text: 'Nivel Educativo agregado con exito',
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
            location.href = "NivelEducativo.aspx";
        }
    </script>
    <form id="Form1" name="menuEstu" runat="server" autocomplete="off">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row center-align">
                    <div class="container">
                        <div class="input-field col s12 m12">
                            <label>Nivel Educativo:</label>
                            <asp:TextBox ID="txtNombNive" runat="server"></asp:TextBox>
                        </div>
                        <div class="col s12 m12 center-align">
                            <asp:Button ID="guardarNivelEducativo" CssClass="btn blue white-text" runat="server" Text="Guardar" OnClick="guardarNivelEducativo_Click" />
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>


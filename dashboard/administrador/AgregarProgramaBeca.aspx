<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/administrador/Maestra.master" AutoEventWireup="true" CodeFile="AgregarProgramaBeca.aspx.cs" Inherits="dashboard_administrador_AgregarProgramaBeca" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contenidoDePagina" runat="Server">
    <script type="text/javascript">
        function modificarCarrera() {
            swal({
                title: "Correcto",
                text: 'Carrera agregada con exito',
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
            location.href = "ProgramaBecas.aspx";
        }
    </script>
    <form id="Form1" name="menuEstu" runat="server" autocomplete="off">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row center-align">
                    <div class="container">
                        <div class="input-field col s12 m6">
                            <label>Codigo de Programa:</label>
                            <asp:TextBox ID="txtCodiProg" runat="server"></asp:TextBox>
                        </div>
                        <div class="input-field col s12 m6">
                            <label>Nombre de Programa:</label>
                            <asp:TextBox ID="txtNombProg" runat="server"></asp:TextBox>
                        </div>
                        <div class="input-field col s12 m12">
                            <label>Descripcion de Programa:</label>
                            <asp:TextBox ID="txtDescProg" CssClass="materialize-textarea" runat="server"></asp:TextBox>
                        </div>
                        <div class="col s12 m12 center-align">
                            <asp:Button ID="guardarProgramaBeca" CssClass="btn blue white-text" runat="server" Text="Guardar" OnClick="guardarProgramaBeca_Click" />
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>


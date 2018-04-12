<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/administrador/Maestra.master" AutoEventWireup="true" CodeFile="AgregarCarrera.aspx.cs" Inherits="dashboard_administrador_EditarCarrera" %>

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
            location.href = "Carrera.aspx";
        }
    </script>
   
            <form id="Form1" name="menuEstu" runat="server" autocomplete="off">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="row center-align">
                            <div class="container">
                                <div class="input-field col s12 m12">
                                    <label>Nombre de materia:</label>
                                    <asp:TextBox ID="txtNombCarr" runat="server"></asp:TextBox>
                                </div>
                                <div class="col s12 m12 center-align">
                                    <asp:Button ID="guardarCarrera" CssClass="btn blue white-text" runat="server" Text="Guardar" OnClick="guardarCarrera_Click" />
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </form>
        
</asp:Content>


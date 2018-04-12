<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/administrador/Maestra.master" AutoEventWireup="true" CodeFile="Ciclos.aspx.cs" Inherits="dashboard_administrador_Ciclos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contenidoDePagina" runat="Server">
    <script type="text/javascript">
        function eliminarCarrera() {
            swal({
                title: "Correcto",
                text: 'Ciclo eliminado con exito',
                type: 'success',
                button: 'Aceptar'
            });
        }
        function modificarCarrera() {
            swal({
                title: "Correcto",
                text: 'Ciclo modificado con exito',
                type: 'success',

                button: 'Aceptar'
            });
        }
        function error() {
            swal({
                title: "Error",
                text: 'Hubo un error al realizar la accion',
                type: 'error',
                button: 'Aceptar'
            });
        }
    </script>

    <form id="Form1" name="menuEstu" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row">
                    <h3 class="center-align">Ciclos</h3>
                    <div class="col s12 m12 center-align">
                        <a class="btn blue white-text" href="AgregarCiclo.aspx">Agregar Ciclo</a>
                        <p></p>
                    </div>
                    <div class="col s12 m12">
                        <div class="container">
                            <asp:GridView CssClass="highlight" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="id" OnRowUpdating="GridView1_RowUpdating">
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" ReadOnly="True" Visible="False"></asp:BoundField>
                                    <asp:BoundField DataField="nombre" HeaderText="Ciclo" SortExpression="nombre" />
                                    <asp:CommandField ButtonType="Button" HeaderText="Editar" ShowEditButton="True">
                                        <ControlStyle CssClass="btn blue white-text" />
                                    </asp:CommandField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CadenaConexion %>"
                                SelectCommand="SELECT id,nombre FROM ciclo"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/administrador/Maestra.master" AutoEventWireup="true" CodeFile="Universidad.aspx.cs" Inherits="Universidad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contenidoDePagina" runat="Server">
    <script type="text/javascript">
        function eliminarCarrera() {
            swal({
                title: "Correcto",
                text: 'Universidad eliminada con exito',
                type: 'success',
                button: 'Aceptar'
            });
        }
        function modificarCarrera() {
            swal({
                title: "Correcto",
                text: 'Universidad modificada con exito',
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
                            <h3 class="center-align">Universidades</h3>
                            <div class="col s12 m12 center-align">
                                <a class="btn blue white-text" href="AgregarUniversidad.aspx">Agregar Universidad</a>
                                <p></p>
                            </div>
                            <div class="col s12 m12">
                                <div class="container">
                                    <asp:GridView CssClass="highlight" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="id" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" AllowPaging="True">
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="Codigo" SortExpression="id" ReadOnly="True" Visible="False"></asp:BoundField>
                                            <asp:BoundField DataField="nombre" HeaderText="Universidad" SortExpression="nombre" />
                                            <asp:CommandField ShowEditButton="True" ButtonType="Button" EditText="Modificar" HeaderText="Modificar" UpdateText="Modificar">
                                                <ControlStyle CssClass="btn blue" />
                                            </asp:CommandField>
                                            <asp:CommandField ShowDeleteButton="True" ButtonType="Button" HeaderText="Eliminar">
                                                <ControlStyle CssClass="btn red" />
                                            </asp:CommandField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CadenaConexion %>"
                                        SelectCommand="SELECT id,nombre FROM universidad WHERE estado=1"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </form>
</asp:Content>


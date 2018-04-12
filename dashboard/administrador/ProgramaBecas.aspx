<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/administrador/Maestra.master" AutoEventWireup="true" CodeFile="ProgramaBecas.aspx.cs" Inherits="dashboard_administrador_ProgramaBecas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contenidoDePagina" runat="Server">
    <script type="text/javascript">
        function modificarCarrera() {
            swal({
                title: "Correcto",
                text: 'Programa modificado con exito',
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
    
            <form id="Form1" name="menuEstu" autocomplete="off" runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <h3 class="center-align">Programas de Beca</h3>
                            <div class="col s12 m12 center-align">
                                <a class="btn blue white-text" href="AgregarProgramaBeca.aspx">Agregar Programa Beca</a>
                                <p></p>
                            </div>
                            <div class="container">
                                <div class="col s12 m12">
                                    <label>Buscar Programa</label>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    <label class="helper-text">*puede buscar tanto por el codigo o por el nombre del programa</label>
                                </div>
                                <div class="col s12 m12 center-align">
                                    <asp:Button ID="Button1" CssClass="btn blue white-text" runat="server" Text="Buscar" OnClick="Button1_Click" />
                                </div>
                            </div>
                            <div class="col s12 m12">
                                <div class="container">
                                    <asp:GridView CssClass="highlight" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="id" OnRowUpdating="GridView1_RowUpdating">
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" ReadOnly="True" Visible="False"></asp:BoundField>
                                            <asp:BoundField DataField="codigo" HeaderText="Codigo" SortExpression="codigo" />
                                            <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                                            <asp:BoundField DataField="descripcion" HeaderText="Descripcion" SortExpression="descripcion" />
                                            <asp:CommandField ShowEditButton="True" ButtonType="Button" HeaderText="Editar">
                                                <ControlStyle CssClass="btn blue white-text" />
                                            </asp:CommandField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CadenaConexion %>"
                                        SelectCommand="SELECT id, codigo, nombre, descripcion FROM programa_beca WHERE (codigo LIKE '%'+@cod+'%') OR (nombre LIKE '%'+@nomb+'%')">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="TextBox1" Name="cod" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="TextBox1" Name="nomb" PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </form>
        
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/administrador/Maestra.master" AutoEventWireup="true" CodeFile="Usuarios.aspx.cs" Inherits="dashboard_administrador_Usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contenidoDePagina" runat="Server">
    <script type="text/javascript">
        function eliminarCarrera() {
            swal({
                title: "Correcto",
                text: 'Usuario eliminado con exito',
                type: 'success',

                button: 'Aceptar'
            });
        }
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
                    <h3 class="center-align">Usuarios</h3>
                    <div class="col s12 m12 center-align">
                        <a class="btn blue white-text" href="AgregarUsuario.aspx">Agregar Usuario</a>
                        <p></p>
                    </div>
                    <div class="container">
                        <div class="col s12 m12">
                            <label>Tipo de Usuario</label>
                            <asp:DropDownList CssClass="browser-default" ID="ddlTipoUsuario" runat="server">
                            </asp:DropDownList>
                            <label class="helper-text">*puede buscar por los demas tipos de usuario</label>
                            <p></p>
                        </div>
                        <div class="col s12 m12 center-align">
                            <asp:Button ID="Button1" CssClass="btn blue white-text" runat="server" Text="Buscar" OnClick="Button1_Click" />
                        </div>
                    </div>
                    <div class="col s12 m12">
                        <div class="container">
                            <asp:DropDownList ID="DropDownList2" runat="server">
                            </asp:DropDownList>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" Visible="False" />
                                    <asp:BoundField DataField="nombres" HeaderText="Nombres" SortExpression="nombres" />
                                    <asp:BoundField DataField="apellidos" HeaderText="Apellidos" SortExpression="apellidos" />
                                    <asp:BoundField DataField="correo" HeaderText="Correo" SortExpression="correo" />
                                    <asp:BoundField DataField="tipo" HeaderText="Tipo Usuario" SortExpression="tipo" />
                                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" HeaderText="Seleccionar">
                                        <ControlStyle CssClass="btn blue white-text" />
                                    </asp:CommandField>
                                    <asp:CommandField ButtonType="Button" HeaderText="Eliminar" ShowDeleteButton="True">
                                        <ControlStyle CssClass="btn red white-text" />
                                    </asp:CommandField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CadenaConexion %>" SelectCommand="SELECT u.id, u.nombres, u.apellidos, u.correo, tu.tipo
FROM usuario as u inner join tipo_usuario as tu
on u.id_tipo=tu.id WHERE u.id_tipo=@codiTipo AND u.id!=@idU">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlTipoUsuario" DefaultValue="1" Name="codiTipo" PropertyName="SelectedValue" />
                                    <asp:SessionParameter Name="idU" SessionField="codigoUsuario" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

</asp:Content>


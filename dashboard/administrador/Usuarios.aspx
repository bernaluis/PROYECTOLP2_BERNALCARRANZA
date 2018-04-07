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
    <div class="row">
        <div class="col s12 m12">
            <ul id="dropdown1" class="dropdown-content">
                <li><a href="Carrera.aspx">Carreras</a></li>
                <li><a href="Universidad.aspx">Universidades</a></li>
                <li><a href="NivelEducativo.aspx">Niveles Educativos</a></li>
                <li><a href="Ciclos.aspx">Ciclos</a></li>
                <li><a href="AspectPresupuesto.aspx">Aspectos de Presupuesto</a></li>
            </ul>
            <ul id="dropdown2" class="dropdown-content">
                <li><a href="Carrera.aspx">Carreras</a></li>
                <li><a href="Universidad.aspx">Universidades</a></li>
                <li><a href="NivelEducativo.aspx">Niveles Educativos</a></li>
                <li><a href="Ciclos.aspx">Ciclos</a></li>
                <li><a href="AspectPresupuesto.aspx">Aspectos de Presupuesto</a></li>
            </ul>
            <nav class="green darken-2">
                <div class="nav-wrapper">
                    <a href="Default.aspx" class="brand-logo">
                        <img src="../../img/fantel.jpg" /></a>
                    <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                        <li class="active"><a href="Usuarios.aspx">Usuarios</a></li>
                        <li><a href="ProgramaBecas.aspx">Programa de Becas</a></li>
                        <li><a class="dropdown-trigger" href="!#" data-target="dropdown1">Mantenimientos<i class="material-icons right">arrow_drop_down</i></a></li>
                        <li><a href="../DestruirSessionUsuario.aspx">Cerrar Sesion</a></li>
                    </ul>
                </div>
            </nav>
            <ul class="sidenav" id="mobile-demo">
                <div class="center-align">
                    <p></p>
                    <a href="Default.aspx" class="brand-logo">
                        <img src="../../img/fantel.jpg" /></a>
                </div>
                <li><a href="Usuarios.aspx">Usuarios</a></li>
                <li><a href="ProgramaBecas.aspx">Programa de Becas</a></li>
                <li><a class="dropdown-trigger" href="!#" data-target="dropdown2">Mantenimientos<i class="material-icons right">arrow_drop_down</i></a></li>
                <li><a href="../DestruirSessionUsuario.aspx">Cerrar Sesion</a></li>
            </ul>
            <br />
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
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" Visible="False" />
                                            <asp:BoundField DataField="nombres" HeaderText="Nombres" SortExpression="nombres" />
                                            <asp:BoundField DataField="apellidos" HeaderText="Apellidos" SortExpression="apellidos" />
                                            <asp:BoundField DataField="correo" HeaderText="Correo" SortExpression="correo" />
                                            <asp:BoundField DataField="tipo" HeaderText="Tipo Usuario" SortExpression="tipo" />
                                            <asp:CommandField ButtonType="Button" HeaderText="Eliminar" ShowDeleteButton="True">
                                                <ControlStyle CssClass="btn red white-text" />
                                            </asp:CommandField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CadenaConexion %>" SelectCommand="SELECT u.id, u.nombres, u.apellidos, u.correo, tu.tipo
FROM usuario as u inner join tipo_usuario as tu
on u.id_tipo=tu.id WHERE u.id_tipo=@codiTipo">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlTipoUsuario" DefaultValue="1" Name="codiTipo" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </form>
        </div>
    </div>
    <footer class="page-footer green darken-2">
        <div class="container">
            <div class="row">
                <div class="col l12 s12">
                    <h5 class="white-text center-align">FEDISAL</h5>
                    <hr />
                    <p class="grey-text text-lighten-4">
                        FEDISAL es una institución privada sin fines de lucro, fundada en 1992 por empresarios y miembros de la Institución Salesiana de El Salvador, con el fin de fomentar el desarrollo de la población salvadoreña, con una prioridad de trabajar por medio de la educación.
                    </p>
                </div>
            </div>
        </div>
        <div class="footer-copyright">
            <div class="container">
                © 2018 FEDISAL
            </div>
        </div>
    </footer>
</asp:Content>


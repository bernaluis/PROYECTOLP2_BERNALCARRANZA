<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/contador/Maestra.master" AutoEventWireup="true" CodeFile="Becario.aspx.cs" Inherits="dashboard_contador_Becario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contenidoDePagina" runat="Server">
    <div class="row">
        <div class="col s12 m12">
            <nav class="green darken-2">
                <div class="nav-wrapper">
                    <a href="MenuContador.aspx" class="brand-logo">
                        <img src="../../img/fantel.jpg" /></a>
                    <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                        <li class="active"><a href="Becario.aspx">Academico Becario</a></li>
                        <li><a href="PresupuestoBecario.aspx">Presupuesto Becario</a></li>
                        <li><a href="BitacoraBecario.aspx">Bitacora Becario</a></li>
                        <li><a href="../DestruirSessionUsuario.aspx">Cerrar Sesion</a></li>
                    </ul>
                </div>
            </nav>
            <ul class="sidenav" id="mobile-demo">
                <div class="center-align">
                    <p></p>
                    <a href="MenuContador.aspx" class="brand-logo">
                        <img src="../../img/fantel.jpg" /></a>
                </div>
                <li class="active"><a href="Becario.aspx">Academico Becario</a></li>
                <li><a href="PresupuestoBecario.aspx">Presupuesto Becario</a></li>
                <li><a href="BitacoraBecario.aspx">Bitacora Becario</a></li>
                <li><a href="../DestruirSessionUsuario.aspx">Cerrar Sesion</a></li>
            </ul>
            <br />
            <form id="Form1" name="menuEstu" runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <div class="container">
                                <div class="col s12 m12">
                                    <p style="font-size:20px;"><i class="material-icons left">filter_list</i>Filtros</p>
                                </div>
                                <div class="col s12 m3">
                                    <label>Programas:</label>
                                    <asp:DropDownList ID="ddlProgramasBecas" CssClass="browser-default" runat="server"></asp:DropDownList>
                                </div>
                                <div class="col s12 m3">
                                    <label>Universidades:</label>
                                    <asp:DropDownList ID="ddlUniversidad" CssClass="browser-default" runat="server"></asp:DropDownList>
                                </div>
                                <div class="col s12 m3">
                                    <label>Carreras:</label>
                                    <asp:DropDownList ID="ddlCarrera" CssClass="browser-default" runat="server"></asp:DropDownList>
                                </div>
                                <div class="col s12 m3">
                                    <label>Estado del becario</label>
                                    <asp:DropDownList ID="ddlEstado" CssClass="browser-default" runat="server">
                                        <asp:ListItem Value="1">Activo</asp:ListItem>
                                        <asp:ListItem Value="2">Finalizado</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col s12 m12 center-align">
                                    <p></p>
                                    <asp:Button ID="btnBuscarAlumnos" runat="server" CssClass="btn blue white-text" Text="Buscar Alumnos" OnClick="btnBuscarAlumnos_Click" />
                                    <p></p>
                                </div>
                                <div class="col s12 m12">
                                    <div class="divider"></div>
                                    <label>Codigos de Estudiantes(dependiendo de los filtros seleccionados)</label>
                                    <asp:DropDownList ID="ddlAlumnos" CssClass="browser-default" runat="server"></asp:DropDownList>
                                </div>
                                <div class="col s12 m12 center-align">
                                    <p></p>
                                    <asp:Button ID="btnBuscarExpediente" runat="server" CssClass="btn blue white-text" Text="Buscar Informacion Alumno" OnClick="btnBuscarExpediente_Click" />
                                </div>
                                <div class="col s12 m12 center-align">
                                    <p></p>
                                    <div class="divider"></div>
                                    <p></p>
                                    <asp:Label ID="codigo" Font-Size="30px" Font-Bold="true" Visible="false" runat="server"></asp:Label>
                                </div>
                                <div class="col s12 m12 center-align">
                                    <p></p>
                                    <div class="divider"></div>
                                    <p></p>
                                    <asp:Label ID="datosP" Font-Size="Larger" Visible="false" runat="server">Datos Personales</asp:Label>
                                    <p></p>
                                </div>
                                <div class="col s12 m12">
                                    <asp:GridView ID="GridView1" CssClass="striped responsive-table" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Visible="False">
                                        <Columns>
                                            <asp:BoundField DataField="nombres" HeaderText="Nombre" SortExpression="nombres" />
                                            <asp:BoundField DataField="apellidoos" HeaderText="Apellidos" SortExpression="apellidoos" />
                                            <asp:BoundField DataField="correo" HeaderText="Correo" SortExpression="correo" />
                                            <asp:BoundField DataField="direccion" HeaderText="Direccion" SortExpression="direccion" />
                                            <asp:BoundField DataField="telefono" HeaderText="Telefono" SortExpression="telefono" />
                                            <asp:BoundField DataField="dui" HeaderText="DUI" SortExpression="dui" />
                                            <asp:BoundField DataField="fecha_nacimiento" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Fecha Nacimiento" SortExpression="fecha_nacimiento" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CadenaConexion %>" SelectCommand="select nombres,apellidoos,correo,direccion,telefono,dui,fecha_nacimiento from becario where id=@codi">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlAlumnos" Name="codi" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div class="col s12 m12 center-align">
                                    <p></p>
                                    <div class="divider"></div>
                                    <p></p>
                                    <asp:Label ID="datosA" Font-Size="Larger" Visible="false" runat="server">Datos Academicos</asp:Label>
                                </div>
                                <div class="container">
                                    <div class="col s12 m12 center-align">
                                        <p></p>
                                        <asp:Label runat="server" Font-Size="Larger" Visible="false" ID="lblCiclos">Ciclos:</asp:Label>
                                        <asp:DropDownList Visible="false" ID="ddlCiclos" CssClass="browser-default" runat="server"></asp:DropDownList>
                                        <p></p>
                                    </div>
                                    <div class="col s12 m12 center-align">
                                        <asp:Button Visible="false" ID="btnBuscarNota" CssClass="btn blue white-text" runat="server" Text="Buscar Notas" OnClick="btnBuscarNota_Click" />
                                        <p></p>
                                    </div>
                                </div>
                                <div class="col s12 m12">
                                    <asp:GridView ID="GridView2" CssClass="striped responsive-table" runat="server" Visible="False" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                                        <Columns>
                                            <asp:BoundField DataField="nombre_materia" HeaderText="Materia" SortExpression="nombre_materia" />
                                            <asp:BoundField DataField="nota_materia" HeaderText="Nota" SortExpression="nota_materia" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CadenaConexion %>" SelectCommand="select notas.nombre_materia,notas.nota_materia 
from notas, becario 
where notas.id_becario=becario.id AND becario.codigo=@codi AND notas.id_ciclo=@ciclo">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="codigo" Name="codi" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="ddlCiclos" Name="ciclo" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <p></p>
                                    <div class="divider"></div>
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


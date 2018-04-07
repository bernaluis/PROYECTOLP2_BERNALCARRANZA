<%@ Page Title="" Language="C#" MasterPageFile="~/public/Maestra.master" AutoEventWireup="true" CodeFile="AcademiaBecario.aspx.cs" Inherits="AcademiaBecario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contenidoDePagina" runat="Server">
    <div class="row">
        <div class="col s12 m12">
            <nav class="light-blue">
                <div class="nav-wrapper">
                    <a href="Default.aspx" class="brand-logo">
                        <img src="../img/fantel.jpg" /></a>
                    <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="PresupuestoBecario.aspx">Gestion Presupuesto</a></li>
                        <li><a href="HistorialDesembolsos.aspx">Historial Desembolsos</a></li>
                        <li class="active"><a href="AcademiaBecario.aspx">Gestion Academica</a></li>
                        <li><a href="DestruirSession.aspx">Cerrar Sesion</a></li>
                    </ul>
                </div>
            </nav>
            <ul class="sidenav" id="mobile-demo">
                <li><a href="PresupuestoBecario.aspx">Gestion Presupuesto</a></li>
                <li><a href="HistorialDesembolsos.aspx">Historial Desembolsos</a></li>
                <li><a href="AcademicaBecario.aspx">Gestion Academica</a></li>
                <li><a href="DestruirSession.aspx">Cerrar Sesion</a></li>
            </ul>
            <br />
            <form id="Form1" name="materiasBeca" runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <h3 class="center-align">Mis Materias</h3>
                            <div class="col s12 m12 center-align">
                                <a class="btn blue white-text" href="AgregarMateria.aspx">Agregar Materias</a>
                                <p></p>
                            </div>
                            <div class="col m4"></div>
                            <div class="col s12 m4">
                                <asp:DropDownList CssClass="browser-default" ID="ddlCiclos" runat="server"></asp:DropDownList>
                            </div>
                            <div class="col m4"></div>
                            <div class="col s12 m12 center-align">
                                <p></p>
                                <asp:Button CssClass="btn blue white-text" ID="buscarMaterias" runat="server" Text="Buscar" OnClick="buscarMaterias_Click" />
                                <p></p>
                            </div>
                            <div class="col s12 m12">
                                <div class="container">
                                    <asp:GridView CssClass="highlight" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="nombre_materia" HeaderText="Materia" SortExpression="nombre_materia" />
                                        <asp:BoundField DataField="nota_materia" HeaderText="Nota" SortExpression="nota_materia" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CadenaConexion %>" SelectCommand="select notas.nombre_materia,notas.nota_materia 
from notas, becario 
where notas.id_becario=becario.id AND becario.codigo=@codi AND notas.id_ciclo=@ciclo">
                                    <SelectParameters>
                                        <asp:SessionParameter DefaultValue="" Name="codi" SessionField="codigo" />
                                        <asp:ControlParameter ControlID="ddlCiclos" DefaultValue="1" Name="ciclo" PropertyName="SelectedValue" />
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
    <footer class="page-footer blue">
        <div class="container">
            <div class="row">
                <div class="col l12 s12">
                    <h5 class="white-text center-align">FEDISAL</h5>
                    <hr />
                    <p class="grey-text text-lighten-4">
                        FEDISAL es una institución privada sin fines de lucro, fundada en 1992 por empresarios y miembros de la Institución Salesiana de El Salvador, con el fin de fomentar el desarrollo de la población salvadoreña, con una prioridad de trabajar por medio de la educación.
                            Desde 1992 ha ejecutado muchos proyectos a escala nacional, coordinando a múltiples instituciones educativas, en el marco de procesos transparentes y caracterizándonos por una excelente calidad de los servicios.
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


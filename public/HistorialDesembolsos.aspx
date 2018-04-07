<%@ Page Title="" Language="C#" MasterPageFile="~/public/Maestra.master" AutoEventWireup="true" CodeFile="HistorialDesembolsos.aspx.cs" Inherits="HistorialDesembolsos" %>

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
                        <li class="active"><a href="HistorialDesembolsos.aspx">Historial Desembolsos</a></li>
                        <li><a href="AcademiaBecario.aspx">Gestion Academica</a></li>
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
            <form id="Form1" name="menuEstu" runat="server">
                <div class="row">
                    <h3 class="center-align">Historial Desembolsos</h3>
                    <div class="container">
                        <div class="col s12 m12">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="aspecto" HeaderText="Aspecto Desembolso" SortExpression="aspecto" />
                                    <asp:BoundField DataField="monto de desembolso" HeaderText="Monto Desembolso" SortExpression="monto de desembolso" />
                                    <asp:BoundField DataField="fecha" HeaderText="Fecha Desembolso" SortExpression="fecha" DataFormatString="{0:dd/MM/yyyy}" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CadenaConexion %>" SelectCommand="select a.nombre as aspecto, d.monto as [monto de desembolso], d.fecha from desembolso as d, presupuesto_maestro as pm, presupuesto_detalle as pd, aspecto as a, becario as b
	WHERE d.id_presupuestoD=pd.id AND pd.id_maestro= pm.id AND pd.id_aspecto=a.id AND pm.id_becario=b.id AND
	b.codigo=@codi ORDER BY fecha desc">
                                <SelectParameters>
                                    <asp:SessionParameter Name="codi" SessionField="codigo" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
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


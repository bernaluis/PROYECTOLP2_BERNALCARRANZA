<%@ Page Title="" Language="C#" MasterPageFile="~/public/Maestra.master" AutoEventWireup="true" CodeFile="AgregarMateria.aspx.cs" Inherits="AgregarMateria" %>

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
                <li><a href="AcademicaBecario.aspx">Gestion Academica</a></li>
                <li><a href="DestruirSession.aspx">Cerrar Sesion</a></li>
            </ul>
            <br />
            <form id="Form1" name="materiasBeca" runat="server">
                <div class="row center-align">
                    <div class="container">
                        <div class="input-field col s12 m6">
                            <label>Nombre de materia:</label>
                            <asp:TextBox ID="txtNombMate" runat="server"></asp:TextBox>
                        </div>
                        <div class="input-field col s12 m6">
                            <label>Nota de materia:</label>
                            <asp:TextBox ID="txtNotaMate" runat="server"></asp:TextBox>
                        </div>
                        <div class="input-field col s12 m6">
                            <asp:DropDownList CssClass="browser-default" ID="ddlEstaTerc" runat="server">
                                <asp:ListItem Value="" disabled Selected Text="Quedaste en el tercio superior?"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Si"></asp:ListItem>
                                <asp:ListItem Value="0" Text="No"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="input-field col s12 m6">
                            
                            <asp:DropDownList CssClass="browser-default" ID="ddlCiclo" runat="server"></asp:DropDownList>
                        </div>
                        <div class="col s12 m12 center-align">
                            <asp:Button ID="guardarMateria" CssClass="btn blue white-text" runat="server" Text="Guardar" OnClick="guardarMateria_Click" />
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


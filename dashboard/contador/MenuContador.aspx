<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/contador/Maestra.master" AutoEventWireup="true" CodeFile="MenuContador.aspx.cs" Inherits="MenuContador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contenidoDePagina" runat="Server">
    <div class="row">
        <div class="col s12 m12">
            <nav class="green darken-2">
                <div class="nav-wrapper">
                    <a href="MenuContador.aspx" class="brand-logo">
                        <img src="../../img/fantel.jpg" /></a>
                    <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="Becario.aspx">Academico Becario</a></li>
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
                <li><a href="Becario.aspx">Academico Becario</a></li>
                <li><a href="PresupuestoBecario.aspx">Presupuesto Becario</a></li>
                <li><a href="BitacoraBecario.aspx">Bitacora Becario</a></li>
                <li><a href="../DestruirSessionUsuario.aspx">Cerrar Sesion</a></li>
            </ul>
            <br />
            <form id="Form1" name="menuEstu" runat="server">
                <div class="row">
                    <div class="col s12 m12">
                        <div class="card-panel green lighten-4">
                            <br />
                            <h3 class="black-text center-align">Bienvenido
                                <br />
                                <br />
                            </h3>
                        </div>
                    </div>
                </div>
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


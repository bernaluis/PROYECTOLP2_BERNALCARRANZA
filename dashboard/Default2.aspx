<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/Maestra.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contenidoDePagina" runat="Server">
    <script type="text/javascript">
        function CorrectoAdmin() {
            swal({
                title: "Correcto",
                text: 'Sesion iniciada con exito',
                type: 'success',

                button: 'Aceptar'
            });
            setTimeout("redireccionAdmin()", 1000);
        }
        function CorrectoContador() {
            swal({
                title: "Correcto",
                text: 'Sesion iniciada con exito',
                type: 'success',

                button: 'Aceptar'
            });
            setTimeout("redireccionContador()", 1000);
        }
        function CorrectoGestor() {
            swal({
                title: "Correcto",
                text: 'Sesion iniciada con exito',
                type: 'success',

                button: 'Aceptar'
            });
            setTimeout("redireccionGestor()", 1000);
        }
        function Incorrecto() {
            swal({
                title: "Incorrecto",
                text: 'Por favor revise sus credenciales',
                type: 'error',

                button: 'Aceptar'
            });
        }
        function redireccionAdmin() {
            location.href = "administrador/MenuAdmin.aspx";
        }
        function redireccionContador() {
            location.href = "contador/MenuContador.aspx";
        }
        function redireccionGestor() {
            location.href = "gestor/MenuGestorEducativo.aspx";
        }
    </script>
    <div class="row">
        <div class="col s12 m12">
            <nav class="indigo">
                <div class="nav-wrapper">
                    <a href="Default.aspx" class="brand-logo">
                        <img src="../img/fantel.jpg" /></a>
                </div>
            </nav>

            <form id="Form1" name="login" runat="server">
                <p></p>
                <div class="row">
                    <div class="col s12 m12">
                        <div class="card white">
                            <div class="card-content black-text">
                                <span class="card-title center-align">Iniciar Sesion</span>
                                <div class="container">
                                    <div class="input-field col s12">
                                        <label>Correo Electronico</label>
                                        <asp:TextBox ID="txtCorreo" runat="server" TextMode="Email"></asp:TextBox>
                                    </div>
                                    <div class="input-field col s12">
                                        <label>Contraseña</label>
                                        <asp:TextBox ID="txtContra" runat="server" TextMode="Password"></asp:TextBox>
                                    </div>
                                    <div class="right-align">
                                        <p><a href="RecuperarContra.aspx">Has olvidado tu contraseña?</a></p>
                                    </div>
                                    <div class="center-align">
                                        <asp:Button CssClass="btn grey white-text" ID="Button1" runat="server" Text="Iniciar Sesion" OnClick="Button1_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <footer class="page-footer indigo">
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


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
                            <div class="center-align">
                                <asp:Button CssClass="btn grey white-text" ID="Button1" runat="server" Text="Iniciar Sesion" OnClick="Button1_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

</asp:Content>


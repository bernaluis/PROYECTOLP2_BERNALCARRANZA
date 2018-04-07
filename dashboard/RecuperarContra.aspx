<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/Maestra.master" AutoEventWireup="true" CodeFile="RecuperarContra.aspx.cs" Inherits="RecuperarContra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contenidoDePagina" runat="Server">
        <div class="row">
        <div class="col s12 m12">
            <nav class="light-blue">
                <div class="nav-wrapper">
                    <a href="Default.aspx" class="brand-logo">
                        <img src="../img/fantel.jpg" /></a>
                </div>
            </nav>

            <form id="Form1" name="recuperar" runat="server">
                <p></p>
                <div class="row">
                    <div class="col s12 m12">
                        <div class="card blue-grey darken-1">
                            <div class="card-content white-text">
                                <span class="card-title center-align">Recuperar Contraseña</span>
                                <p class="center-align">Para recuperar su contraseña ingrese su correo al cual se le enviara una nueva contraseña</p>
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">email</i>
                                    <input placeholder="Ingrese su correo" id="correo" name="correo" type="email" class="validate">
                                    <label for="correo">Correo Electronico</label>
                                </div>
                                <div class="center-align">
                                    <asp:Button CssClass="btn blue white-text" ID="Button1" runat="server" Text="Enviar Contraseña" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <footer>
            <img src="../img/footer.png" width="100%" />
        </footer>
    </div>
</asp:Content>



<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/gestor/Maestra.master" AutoEventWireup="true" CodeFile="EditarIncidente.aspx.cs" Inherits="dashboard_gestor_EditarIncidente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contenidoDePagina" Runat="Server">
    <script type="text/javascript">
       function modificarCarrera() {
           swal({
               title: "Correcto",
               text: 'Incidente agregado con exito',
               type: 'success',

               button: 'Aceptar'
           });
           setTimeout("redireccion()", 1000);
       }
       function error() {
           swal({
               title: "Error",
               text: 'Hubo un error al realizar la accion',
               type: 'error',
               button: 'Aceptar'
           });
       }
       function redireccion() {
           location.href = "BitacoraEstudiante.aspx";
       }
    </script>
    <form id="Form1" name="menuEstu" runat="server" autocomplete="off">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row center-align">
                    <div class="container">
                        <div class="input-field col s12 m12">
                            <label class="active">Detalle de registro:</label>
                            <asp:TextBox ID="txtDetalle" runat="server"></asp:TextBox>
                        </div>
                        <div class="input-field col s12 m6 ">
                            <label class="active">Becario</label>
                            <asp:DropDownList ID="ddlAlumno" runat="server" CssClass="browser-default"></asp:DropDownList>
                        </div>
                        <div class="input-field col s12 m6 ">
                            <label class="active">Encargado</label>
                            <asp:DropDownList ID="ddlEncargado" runat="server" CssClass="browser-default"></asp:DropDownList>
                        </div>
                        <div class="col s12 m12 center-align">
                            <asp:Button ID="modificarIncidente" CssClass="btn blue white-text" runat="server" Text="Modificar" OnClick="modificarIncidente_Click"   />
                        </div>

                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>


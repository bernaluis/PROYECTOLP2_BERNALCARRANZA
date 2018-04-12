<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/gestor/Maestra.master" AutoEventWireup="true" CodeFile="Becarios.aspx.cs" Inherits="dashboard_gestor_Becarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contenidoDePagina" Runat="Server">
      <script type="text/javascript">
          function eliminar() {
              swal({
                  title: "Correcto",
                  text: 'Becario desactivado con exito',
                  type: 'success',
                  button: 'Aceptar'
              });
          }
          function modificar() {
              swal({
                  title: "Correcto",
                  text: 'Becario modificado con exito',
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
                <form id="Form1" name="menuEstu" runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <h3 class="center-align">Becarios</h3>
                            <div class="col s12 m12 center-align">
                                <a class="btn blue white-text" href="AgregarBecario.aspx">Agregar Becario</a>
                                <p></p>
                            </div>
                            <div class="col s12 m12">
                                <div class="container">
                                    <asp:GridView CssClass="highlight" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" ReadOnly="True"></asp:BoundField>
                                            <asp:BoundField DataField="codigo" HeaderText="Codigo" SortExpression="codigo" />
                                            <asp:BoundField DataField="n1" HeaderText="Nombres" SortExpression="n1" />
                                            <asp:BoundField DataField="n2" HeaderText="Universidad" SortExpression="n2" />
                                            <asp:BoundField DataField="n3" HeaderText="Carrera" SortExpression="n3" />
                                            <asp:BoundField DataField="n4" HeaderText="Programa" SortExpression="n4" />
                                            <asp:CommandField HeaderText="Editar" ShowSelectButton="True">
                                            </asp:CommandField>
                                          

                                            <asp:CommandField ShowDeleteButton="True" HeaderText="Eliminar" />
                                          
                                             
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CadenaConexion %>"
                                        SelectCommand="select b.id,b.codigo,b.nombres as n1,u.nombre as n2,c.nombre as n3,p.nombre as n4  from (((becario b inner join universidad u on b.id_universidad=u.id) inner join carrera c on b.id_carrera=c.id)  inner join programa_beca p on b.id_programaBeca=p.id  and b.estado=1)"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </form>
    
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/gestor/Maestra.master" AutoEventWireup="true" CodeFile="BitacoraEstudiante.aspx.cs" Inherits="dashboard_gestor_BitacoraEstudiante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contenidoDePagina" Runat="Server">
          <script type="text/javascript">
              
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
                            <h3 class="center-align">Registro incidentes</h3>
                            <div class="col s12 m12 center-align">
                                <a class="btn blue white-text" href="AgregarIncidente.aspx">Agregar Registro</a>
                                <p></p>
                            </div>
                            <div class="col s12 m12">
                                <div class="container">
                                    <asp:GridView CssClass="highlight" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" ReadOnly="True"></asp:BoundField>
                                            <asp:BoundField DataField="detalle" HeaderText="Detalle" SortExpression="detalle" />
                                            <asp:BoundField DataField="codigo" HeaderText="Becario" SortExpression="codigo" />
                                            <asp:BoundField DataField="nombres" HeaderText="Gestor" SortExpression="nombres" />
                                            <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha" />
                                           
                                          

                                            <asp:CommandField HeaderText="Editar" ShowSelectButton="True" />
                                            <asp:CommandField HeaderText="Eliminar" ShowDeleteButton="True" />

                                           
                                          

                                        </Columns>
                                    </asp:GridView>
                                   
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CadenaConexion %>"
                                        SelectCommand="select i.id,i.detalle,b.codigo,u.nombres ,i.fecha from ((incidentes i inner join becario b on b.id=i.id_becario) inner join usuario u on u.id=i.id)"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </form>

</asp:Content>


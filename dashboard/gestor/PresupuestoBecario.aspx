<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/gestor/Maestra.master" AutoEventWireup="true" CodeFile="PresupuestoBecario.aspx.cs" Inherits="dashboard_gestor_PresupuestoBecario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contenidoDePagina" Runat="Server">
      <form runat="server">
            <div class="row">
                            <h3 class="center-align">Presupuestos</h3>
                            
                            <div class="col s12 m12">
                                <div class="container">
                                    <asp:GridView CssClass="highlight" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="id" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" ReadOnly="True"></asp:BoundField>
                                            <asp:BoundField DataField="codigo" HeaderText="Codigo" SortExpression="codigo" />
                                            <asp:BoundField DataField="nombres" HeaderText="Nombres" SortExpression="nombres" />
                                            <asp:CommandField HeaderText="Seleccionar" ShowSelectButton="True" />
                                        </Columns>
                                    </asp:GridView>

                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CadenaConexion %>"
                                        SelectCommand="select id, codigo,nombres from becario where estado=1">
                        
                                    </asp:SqlDataSource>

                                </div>
                            </div>
                        </div>
      </form>
</asp:Content>


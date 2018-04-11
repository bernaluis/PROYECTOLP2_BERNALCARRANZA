<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/contador/Maestra.master" AutoEventWireup="true" CodeFile="Becario.aspx.cs" Inherits="dashboard_contador_Becario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contenidoDePagina" runat="Server">
    <form id="Form1" name="menuEstu" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="container">
                        <div class="col s12 m12">
                            <p style="font-size: 20px;"><i class="material-icons left">filter_list</i>Filtros</p>
                        </div>
                        <div class="col s12 m3">
                            <label>Programas:</label>
                            <asp:DropDownList ID="ddlProgramasBecas" CssClass="browser-default" runat="server"></asp:DropDownList>
                        </div>
                        <div class="col s12 m3">
                            <label>Universidades:</label>
                            <asp:DropDownList ID="ddlUniversidad" CssClass="browser-default" runat="server"></asp:DropDownList>
                        </div>
                        <div class="col s12 m3">
                            <label>Carreras:</label>
                            <asp:DropDownList ID="ddlCarrera" CssClass="browser-default" runat="server"></asp:DropDownList>
                        </div>
                        <div class="col s12 m3">
                            <label>Estado del becario</label>
                            <asp:DropDownList ID="ddlEstado" CssClass="browser-default" runat="server">
                                <asp:ListItem Value="1">Activo</asp:ListItem>
                                <asp:ListItem Value="2">Finalizado</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col s12 m12 center-align">
                            <p></p>
                            <asp:Button ID="btnBuscarAlumnos" runat="server" CssClass="btn blue white-text" Text="Buscar Alumnos" OnClick="btnBuscarAlumnos_Click" />
                            <p></p>
                        </div>
                        <div class="col s12 m12">
                            <div class="divider"></div>
                            <label>Codigos de Estudiantes(dependiendo de los filtros seleccionados)</label>
                            <asp:DropDownList ID="ddlAlumnos" CssClass="browser-default" runat="server"></asp:DropDownList>
                        </div>
                        <div class="col s12 m12 center-align">
                            <p></p>
                            <asp:Button ID="btnBuscarExpediente" runat="server" CssClass="btn blue white-text" Text="Buscar Informacion Alumno" OnClick="btnBuscarExpediente_Click" />
                        </div>
                        <div class="col s12 m12 center-align">
                            <p></p>
                            <div class="divider"></div>
                            <p></p>
                            <asp:Label ID="codigo" Font-Size="30px" Font-Bold="true" Visible="false" runat="server"></asp:Label>
                        </div>
                        <div class="col s12 m12 center-align">
                            <p></p>
                            <div class="divider"></div>
                            <p></p>
                            <asp:Label ID="datosP" Font-Size="Larger" Visible="false" runat="server">Datos Personales</asp:Label>
                            <p></p>
                        </div>
                        <div class="col s12 m12">
                            <asp:GridView ID="GridView1" CssClass="striped responsive-table" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Visible="False">
                                <Columns>
                                    <asp:BoundField DataField="nombres" HeaderText="Nombre" SortExpression="nombres" />
                                    <asp:BoundField DataField="apellidos" HeaderText="Apellidos" SortExpression="apellidos" />
                                    <asp:BoundField DataField="correo" HeaderText="Correo" SortExpression="correo" />
                                    <asp:BoundField DataField="direccion" HeaderText="Direccion" SortExpression="direccion" />
                                    <asp:BoundField DataField="telefono" HeaderText="Telefono" SortExpression="telefono" />
                                    <asp:BoundField DataField="dui" HeaderText="DUI" SortExpression="dui" />
                                    <asp:BoundField DataField="fecha_nacimiento" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Fecha Nacimiento" SortExpression="fecha_nacimiento" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CadenaConexion %>" SelectCommand="select nombres,apellidos,correo,direccion,telefono,dui,fecha_nacimiento from becario where id=@codi">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlAlumnos" Name="codi" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="col s12 m12 center-align">
                            <p></p>
                            <div class="divider"></div>
                            <p></p>
                            <asp:Label ID="datosA" Font-Size="Larger" Visible="false" runat="server">Datos Academicos</asp:Label>
                        </div>
                        <div class="container">
                            <div class="col s12 m12 center-align">
                                <p></p>
                                <asp:Label runat="server" Font-Size="Larger" Visible="false" ID="lblCiclos">Ciclos:</asp:Label>
                                <asp:DropDownList Visible="false" ID="ddlCiclos" CssClass="browser-default" runat="server"></asp:DropDownList>
                                <p></p>
                            </div>
                            <div class="col s12 m12 center-align">
                                <asp:Button Visible="false" ID="btnBuscarNota" CssClass="btn blue white-text" runat="server" Text="Buscar Notas" OnClick="btnBuscarNota_Click" />
                                <p></p>
                            </div>
                        </div>
                        <div class="col s12 m12">
                            <asp:GridView ID="GridView2" CssClass="striped responsive-table" runat="server" Visible="False" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                                <Columns>
                                    <asp:BoundField DataField="nombre_materia" HeaderText="Materia" SortExpression="nombre_materia" />
                                    <asp:BoundField DataField="nota_materia" HeaderText="Nota" SortExpression="nota_materia" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CadenaConexion %>" SelectCommand="select notas.nombre_materia,notas.nota_materia 
from notas, becario 
where notas.id_becario=becario.id AND becario.codigo=@codi AND notas.id_ciclo=@ciclo">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="codigo" Name="codi" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="ddlCiclos" Name="ciclo" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <p></p>
                            <div class="divider"></div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>
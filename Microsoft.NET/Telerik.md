# Telerik

* GridViewDataColumn can be edited
* GridViewBoundColumnBase are read-only (kinda one-way binding)
* GridViewCheckBoxColumn are checkboxes, but aligned left on edit

```XML
<telerik:GridViewBoundColumnBase.HeaderCellStyle>
    <!-- Provide a template for the header, in order to add a button to toggle the RDVs -->
    <!-- See https://docs.telerik.com/devtools/wpf/styling-and-appearance/styling-apperance-editing-control-templates -->
    <Style BasedOn="{StaticResource {x:Type telerik:GridViewHeaderCell}}" TargetType="telerik:GridViewHeaderCell">
        <Setter Property="Template">
            <Setter.Value>
                <!-- Starts new Template -->
                <ControlTemplate TargetType="telerik:GridViewHeaderCell">
                    <StackPanel Orientation="Horizontal">
                        <!-- The following ContentPresenter element acts as a placeholder for WPF to know where to display the Content. What content? The one belonging to this control we're styling! -->
                        <!-- See https://stackoverflow.com/a/1288006 -->
                        <ContentPresenter Name="HeaderTextPresenter" TextBlock.Foreground="Navy" TextBlock.FontWeight="Bold" TextBlock.FontSize="16">
                            <ContentPresenter.Style>
                                <Style>
                                    <Setter Property="TextBlock.Foreground" Value="Navy" />
                                </Style>
                            </ContentPresenter.Style>
                            <ContentPresenter.Resources>
                                <Style TargetType="TextBlock">
                                    <Setter Property="Foreground" Value="Navy" />
                                </Style>
                            </ContentPresenter.Resources>
                        </ContentPresenter>
                        <!-- We're inside the (kinda) generic template of a Gridview Header Cell, so to find the Command in our VM and bind to it,
                        we must go back up the hierarchy to the Window (that is, our UserControl), and target its DataContext specifically, that contains our VM. -->
                        <!-- See https://stackoverflow.com/questions/5642501/wpf-binding-commands-in-styles-and-or-data-templates-mvvm -->
                        <!-- See https://stackoverflow.com/questions/34390920/how-to-bind-a-button-command-in-wpf-style -->
                        <!-- See https://stackoverflow.com/questions/84278/how-do-i-use-wpf-bindings-with-relativesource -->
                        <Button Command="{Binding DataContext.ToggleRDVsCommand, Mode=OneTime, RelativeSource={RelativeSource AncestorType={x:Type commonControls:UserControlAdv}}}"  Width="10">+</Button>
                    </StackPanel>
                </ControlTemplate>
            </Setter.Value>
        </Setter>
    </Style>
</telerik:GridViewBoundColumnBase.HeaderCellStyle>
```

Telerik Watermark box on edit:

```XML
<telerik:GridViewBoundColumnBase Header="{Binding CommonResources.MCodeIndication}" DataMemberBinding="{Binding MCodeIndication, UpdateSourceTrigger=PropertyChanged}" ColumnGroupName="SelectionFields">
    <telerik:GridViewBoundColumnBase.CellEditTemplate>
        &lt;DataTemplate>
            <telerik:RadWatermarkTextBox Text="{Binding MCodeIndication, Mode=TwoWay, UpdateSourceTrigger=PropertyChanged}" HorizontalContentAlignment="Left" HorizontalAlignment="Stretch"/>
```

Note that it's possible to extract the XAML code of a Control using Visual Studio Designer!
Right-Click on the Control > Edit Template > Edit a Copy…
See <https://docs.telerik.com/devtools/wpf/styling-and-appearance/styling-apperance-editing-control-templates#extracting-control-templates-using-visual-studio>

This can be useful for Telerik controls (when their source code isn't installed locally), provided we first find out the actual standalone class.
E.g. GridViewCheckBoxColumn uses a GridViewCheckBox when in view mode and the standard CheckBox control as its editor
([Source](https://docs.telerik.com/devtools/wpf/controls/radgridview/styles-and-templates/columns-styling-checkboxcolumn)).

## GridViewCheckBox

```xml
<Style x:Key="GridViewCheckBoxStyle1" TargetType="{x:Type telerik:GridViewCheckBox}">
    <Setter Property="Template">
        <Setter.Value>
            <ControlTemplate TargetType="{x:Type telerik:GridViewCheckBox}">
                <Grid HorizontalAlignment="Left" Height="13" VerticalAlignment="Center" Width="13">
                                        
                    <Border BorderBrush="#FF989898" BorderThickness="1">
                        <Border BorderBrush="#FFEEEEEE" BorderThickness="1">
                            <Border BorderBrush="#FFB9B9B9" BorderThickness="1" Background="#FFE0E0E0">
                                <Grid Margin="0">
                                    <Path x:Name="IndeterminatePath" Data="M14.708333,144.5L20.667,144.5" HorizontalAlignment="Center" Height="7" Margin="0" Stretch="Fill" Stroke="#FF8D8D8D" StrokeThickness="1.5" Visibility="Collapsed" VerticalAlignment="Center" Width="7"/>
                                    <Path x:Name="CheckedPath" Data="M32.376187,77.162509L35.056467,80.095277 40.075451,70.02144" HorizontalAlignment="Center" Margin="0" Stretch="Fill" Stroke="#FF8D8D8D" StrokeThickness="1.5" Visibility="Collapsed" VerticalAlignment="Center"/>
                                </Grid>
                            </Border>
                        </Border>
                    </Border>
                </Grid>
            </ControlTemplate>
        </Setter.Value>
    </Setter>
</Style>```

   M S B A M L   `   `   `  ????E  AProject 07, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:Project_07
Project_07  5      #    Project_07.ViewAllStudentPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      *localclr-namespace:Project_07     5      -   5          N? Title$  ViewAllStudentPage??5	      .??5      ? .+?5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ DGridStudents??5         AutoGenerateColumns .     
IsReadOnly . 
???????   Columns 5      4  .System.Windows.Controls.DataGridTemplateColumn  5      ,  &System.Windows.Controls.DataGridColumn   Width5  /System.Windows.Controls.DataGridLengthConverter$
 auto 6)      CellTemplate 5      ?? 5      .R?5      ??  ??Name$ EditStudentBtn??6%   -   5        $ ??Редактировать??5   =   $??14(?6U   
???????$??2??6?   $??4??6?   $??0,0,0,5q?6?   5      5      0  *System.Windows.Controls.DataGridTextColumn  5         Header$ ФИО??6%   $
 auto 62   1  +System.Windows.Controls.DataGridBoundColumn	   Binding	 6?   ?? *
FullName+  5      $ Дата рождения??6%   $
 auto 6<   	 6I   ?? *
Birthday+
 ?? StringFormat$
 {0:dd.MM.yyyy}??  5      $! Домашний адрес??6%   $
 auto 6=   	 6J   ?? *Addresses.HomeAddress+  5      $+ %Среднее образование??6%   $	 150 6B   	 6N   ?? *HighSchools.HighSchool+  5      $ Курс??6%   $
 auto 63   	 6@   ?? *Course+  5      $  Специальность??6%   $
 auto 6<   	 6J   ?? *
Speciality+5      5      5      
   M S B A M L   `   `   `  ????E  AProject 07, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:Project_07
Project_07  5   	       Project_07.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   *localclr-namespace:Project_07     5   	     ? Title$&   Добро пожаловать!??5   	   $	??500??6#   $	??900??60    ? WindowStartupLocation$ CenterScreen=?6<   .??5	      ?  ? ColumnDefinitions 5
   
   ?? 5      $	??30* ?6   ?? 5      $	??40* ?6   ?? 5      $	??40* ?6   ?? 5      $	??40* ?6   ?? 5      $	??40* ?6   ?? 5      $	??30* ?6    ? RowDefinitions 5   
   ?? 5      $	??20* ?6   ?? 5      $	??47* ?6   ?? 5      $	??47* ?6   ?? 5      $	??47* ?6   ?? 5      $	??18* ?6   .+?5   
   ? 
????İ?$??5??6+   $??7??6<   ?? 5   
   
???????$??1??6(   $??7??65   $??3??6I    ?? CornerRadius$ 10??6Z   $??5q?6l   ?? 5   
   -   5         ??Name$ 	TimeBlock??5      $??hh.mm.ss??6'   $??5??67    ?? TextAlignment$ Center=?6G   $??14(?6^   $??Center=?6l   ?? 5   
   -   5        $ 	DateBlock??5      $??dd.mm.yy??6'   $??0??67   $ Center=?6G   $??14(?6^   $??Center=?6l   ?? 5    
   $??0??6   $??7??6   $??Center=?61   $??Center=?6U   $??24(?6w   .??5!      ?? $ Center=?6   Мой Студент6<   5"       ? 5$   
   -   5          ?Name$ MainWindowFrame??5$        ? NavigationUIVisibility$ Hidden=?6)   $??0??6I   $??1??6Y   $??7??6f   $??3??6z   $??5q?6?   ?? 5&   
   -   5        	 ??Name$	 AddStudentBtn??5&      {?.  $??Добавить??6:   $??14(?6M   
???????$??1??6r   $??4??6?   $??0,0,0,5q?6?      LeftButtonStyle#???   6?   6?   ?? 5(   
   -   5        $	 DeleteStudentBtn??5(      $??Удалить??6+   $??14(?6=   
???????$??2??6b   $??4??6r   {?.  $??0,0,0,5q?6?   ?? 5*   
   -   5        $	 ViewStudentList??5*      $??14(?6*   $??3??68   
???????$??4??6_   $??0,0,0,5q?6l   .??5+      ?? $ Center=?6   Вывести?? 67   !список студентов6T   5,      ?? 5.   
   -   5        $	 CteateReport??5.      $??Отчеты??6'   $??14(?68   $??4??6F   
???????$??4??6m   $??0,0,0,5q?6z     RightButtonStyle#???  6?   6?   50      51      
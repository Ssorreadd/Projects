﻿#pragma checksum "..\..\DeathPeoplePage.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "912A56CDBB9EFEA3D8C5CC03CDE95CC2841C7E99FDC84E046FEE8843CCBE5333"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using Project_04;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace Project_04 {
    
    
    /// <summary>
    /// DeathPeoplePage
    /// </summary>
    public partial class DeathPeoplePage : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 23 "..\..\DeathPeoplePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button Delete;
        
        #line default
        #line hidden
        
        
        #line 25 "..\..\DeathPeoplePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox GroupingByGenderCB;
        
        #line default
        #line hidden
        
        
        #line 26 "..\..\DeathPeoplePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox GroupingByAgeCB;
        
        #line default
        #line hidden
        
        
        #line 27 "..\..\DeathPeoplePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox GroupingByCauseOfDeathCB;
        
        #line default
        #line hidden
        
        
        #line 29 "..\..\DeathPeoplePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button Reset;
        
        #line default
        #line hidden
        
        
        #line 31 "..\..\DeathPeoplePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid DGridDemography;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/Project 04;component/deathpeoplepage.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\DeathPeoplePage.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            
            #line 8 "..\..\DeathPeoplePage.xaml"
            ((Project_04.DeathPeoplePage)(target)).IsVisibleChanged += new System.Windows.DependencyPropertyChangedEventHandler(this.Page_IsVisibleChanged);
            
            #line default
            #line hidden
            return;
            case 2:
            this.Delete = ((System.Windows.Controls.Button)(target));
            
            #line 23 "..\..\DeathPeoplePage.xaml"
            this.Delete.Click += new System.Windows.RoutedEventHandler(this.Delete_Click);
            
            #line default
            #line hidden
            return;
            case 3:
            this.GroupingByGenderCB = ((System.Windows.Controls.ComboBox)(target));
            
            #line 25 "..\..\DeathPeoplePage.xaml"
            this.GroupingByGenderCB.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.GroupingByGenderCB_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 4:
            this.GroupingByAgeCB = ((System.Windows.Controls.ComboBox)(target));
            
            #line 26 "..\..\DeathPeoplePage.xaml"
            this.GroupingByAgeCB.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.GroupingByAgeCB_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 5:
            this.GroupingByCauseOfDeathCB = ((System.Windows.Controls.ComboBox)(target));
            
            #line 27 "..\..\DeathPeoplePage.xaml"
            this.GroupingByCauseOfDeathCB.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.GroupingByCauseOfDeathCB_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 6:
            this.Reset = ((System.Windows.Controls.Button)(target));
            
            #line 29 "..\..\DeathPeoplePage.xaml"
            this.Reset.Click += new System.Windows.RoutedEventHandler(this.Reset_Click);
            
            #line default
            #line hidden
            return;
            case 7:
            this.DGridDemography = ((System.Windows.Controls.DataGrid)(target));
            return;
            }
            this._contentLoaded = true;
        }
    }
}

using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using DetectLanguage;

namespace Gui_prog_1
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            Loaded += MainWindowLoadedAsync;
        }

        private async void MainWindowLoadedAsync(object sender, RoutedEventArgs e)
        {
            DetectLanguageClient client = new DetectLanguageClient("43c0a1624afbc3e0eaf26c31d5d8c79b");

            DetectResult[] results = await client.DetectAsync(textbox1.Text);
            Language[] languages = await client.GetLanguagesAsync();
            for (int i = 0; languages.Length > i; i++)
            {
                LvLanguage.Items.Add(languages[i].name);
                if (results[0].language == languages[i].code)
                {
                    label1.Content = languages[i].name;
                }
            }


        }

        private async void Button_Click(object sender, RoutedEventArgs e)
        {
            DetectLanguageClient client = new DetectLanguageClient("43c0a1624afbc3e0eaf26c31d5d8c79b");

            DetectResult[] results = await client.DetectAsync(textbox1.Text);
            Language[] languages = await client.GetLanguagesAsync();
            for (int i = 0; languages.Length > i; i++)
            {
                if (results[0].language == languages[i].code)
                {
                    label1.Content = languages[i].name;
                }
            }
            label2.Content = $"Kan man stole på mit svar: {results[0].reliable}";
            label3.Content = $"Så mange procent sikker er jeg: {results[0].confidence}%";
        }
    }
}

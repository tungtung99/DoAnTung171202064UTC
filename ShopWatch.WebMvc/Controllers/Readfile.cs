using ShopWatch.WebMvc.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;

namespace ShopWatch.WebMvc.Controllers
{
    public class ReadFile
    {
        public static void ReadFileTxt()
        {
            try
            {
                using (StreamReader sr = new StreamReader(@"C:\Users\Admin\Desktop\watch1\ShopWatchFinal\ShopWatch.WebMvc\Scripts\Docx\district.txt"))
                {
                    string line = "";
                    List<District> lst = new List<District>();

                    while ((line = sr.ReadLine()) != null)
                    {
                        string[] lstnew = line.Split(',');
                        lst.Add(new District(lstnew[0], lstnew[1], lstnew[2]));
                        Golobal.districts = lst;
                    }
                }
                using (StreamReader sr = new StreamReader(@"C:\Users\Admin\Desktop\watch1\ShopWatchFinal\ShopWatch.WebMvc\Scripts\Docx\province.txt"))
                {
                    string line = "";
                    List<Province> lst = new List<Province>();
                    while ((line = sr.ReadLine()) != null)
                    {
                        string[] lstnew = line.Split(',');
                        lst.Add(new Province(lstnew[0], lstnew[1]));
                        Golobal.provinces = lst;
                    }
                }
                using (StreamReader sr = new StreamReader(@"C:\Users\Admin\Desktop\watch1\ShopWatchFinal\ShopWatch.WebMvc\Scripts\Docx\village.txt"))
                {
                    string line = "";
                    List<Village> lst = new List<Village>();
                    while ((line = sr.ReadLine()) != null)
                    {
                        string[] lstnew = line.Split(',');
                        lst.Add(new Village(lstnew[0], lstnew[1], lstnew[2]));
                        Golobal.villages = lst;
                    }
                }
                using (StreamReader sr = new StreamReader(@"C:\Users\Admin\Desktop\watch1\ShopWatchFinal\ShopWatch.WebMvc\Scripts\Docx\ward.txt"))
                {
                    string line = "";
                    List<Ward> lst = new List<Ward>();
                    while ((line = sr.ReadLine()) != null)
                    {
                        string[] lstnew = line.Split(',');
                        lst.Add(new Ward(lstnew[0], lstnew[1], lstnew[2]));
                        Golobal.wards = lst;
                    }
                }
            }
            catch (Exception e)
            {
                Debug.WriteLine("The file could not be read:");
                Debug.WriteLine(e.Message);
            }
        }
    }
}

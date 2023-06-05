using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Science.Models
{
    public class News1
    {
        public int news_id { get; set; }
        public string title { get; set; }
        public string image { get; set; }
        public int status { get; set; }
        public string descrip { get; set; }
        public string note { get; set; }
        public DateTime created_at { get; set; }
        public DateTime updated_at { get; set; }
        public string type { get; set; }
        public int id_loai_tin_tuc { get; set; }
        public string Ma_loai { get; set; }
        public string Loai_tin_tuc { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Science.Models
{
    public class NewsDTO
    {
        public int id_loai_tin_tuc { get; set; }
        public string Ma_loai { get; set; }
        public string Loai_tin_tuc { get; set; }
        public List<New> list_new { get; set; }
    }
}
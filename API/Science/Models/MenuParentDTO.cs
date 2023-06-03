using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Science.Models
{
    public class MenuParentDTO : MenuParent
    {
        public int menu_parent_id { get; set; }
        public string menu_parent_code { get; set; }
        public string menu_parent_name { get; set; }
        public string title { get; set; }
        public int status { get; set; }
        public string image { get; set; }
        public Nullable<DateTime> created_at { get; set; }
        public Nullable<DateTime> updated_at { get; set; }
        public Nullable<DateTime> deleted_at { get; set; }

        public List<MenuDTO> ListMenu { get; set; }
    }

    public class MenuDTO
    {
        public int menu_id { get; set; }
        public string menu_code { get; set; }
        public string menu_name { get; set; }
        public int menu_parent_id { get; set; }
        public int status { get; set; }
    }
}
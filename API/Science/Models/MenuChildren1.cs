﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Science.Models
{
    public class MenuChildren1:MenuChildren
    {
        public int menu_id { get; set; }
        public string menu_code { get; set; }
        public string menu_name { get; set; }
        public int status { get; set; }
    }
}
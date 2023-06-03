using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Science.Models
{
    public class AccountDTO : Account
    {
        public string token { get; set; }
    }
}
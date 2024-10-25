using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PackFoodReady2Go.Core
{
    public class RecaptchaResponse
    {
        public bool success { get; set; }
        public double score { get; set; }
    }

}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Diagnostics;
using System.Web.Script.Serialization;
using System.Collections;

namespace WebServiceTest
{
    /// <summary>
    /// Handler1 的摘要说明
    /// </summary>
    public class Handler1 : IHttpHandler
    {
        public class Team
        {
            public string Name { get; set; }
            public List<User> Users { get; set; }
        }
        public class User
        {
            public int Id { get; set; }
            public string Name { get; set; }
        }

        public void ProcessRequest(HttpContext context)
        {
            string message = context.Request.Form["message"];
            string name = context.Request.Form["name"];
            Debug.WriteLine(message);
            Debug.WriteLine(name);

            string jsonString = HttpUtility.UrlDecode(context.Request.Form.ToString());
            Debug.WriteLine(jsonString);
            //Debug.WriteLine(HttpUtility.HtmlDecode(context.Request.Form.ToString()));
            
            //Hashtable
            JavaScriptSerializer js = new JavaScriptSerializer();


            Dictionary<string, Object> jsonD = (Dictionary<string, Object>)js.DeserializeObject(jsonString);
            if (jsonD != null)
            {
                if (jsonD.ContainsKey("username"))
                {
                    Debug.WriteLine(jsonD["username"]);
                }
                if (jsonD.ContainsKey("usernamexx"))
                {
                    Debug.WriteLine(jsonD["usernamexx"]);
                }
                if (jsonD.ContainsKey("age"))
                {
                    Debug.WriteLine(jsonD["age"]);
                }
                if (jsonD.ContainsKey("birthday"))
                {
                    Debug.WriteLine(jsonD["birthday"]);
                }
                if (jsonD.ContainsKey("program_language"))
                {
                    Array program_languages = (Array)jsonD["program_language"];
                    foreach (string program_language in program_languages)
                    {
                        Debug.WriteLine(program_language);
                    }
                }
            }


            

            Team team = new Team()
            {
                Name = "梦之队",
                Users = new List<User>() {
                 new User() { Id = 1, Name = "XXX" },
                  new User() { Id = 2, Name = "YYY" },
                   new User() { Id = 3, Name = "ZZZ" },
                }
            };
            string json = js.Serialize(team);
            Debug.WriteLine(json);
            context.Response.ContentType = "text/plain";
            context.Response.Write(json);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
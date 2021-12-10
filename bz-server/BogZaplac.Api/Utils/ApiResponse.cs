using Microsoft.AspNetCore.Mvc;
using System.Net;

namespace BogZaplac.Api.Utils
{
    public class ApiResponse
    {
        public static IActionResult Json(HttpStatusCode status, object content)
        {
            return new ContentResult
            {
                StatusCode = (int)status,
                Content = Newtonsoft.Json.JsonConvert.SerializeObject(content),
                ContentType = "application/json"
            };
        }
    }
}

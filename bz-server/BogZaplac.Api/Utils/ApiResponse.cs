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

        public static IActionResult NotFound() => new ContentResult { StatusCode = (int) HttpStatusCode.NotFound };
        public static IActionResult NotModified() => new ContentResult { StatusCode = (int)HttpStatusCode.NoContent };
    }
}

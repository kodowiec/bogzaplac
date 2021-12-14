using Microsoft.AspNetCore.Mvc;
using BogZaplac.Api.Utils;
using System.Net;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BogZaplac.Api.Controllers
{
    [Route("receipt")]
    [ApiController]
    public class ReceiptController : ControllerBase
    {
        [HttpGet("{id}")]
        public IActionResult Get([FromServices] BogZaplac.Database.Client dbClient, int id)
        {
            var rec = dbClient.GetReceipt(id);
            return (rec != null)? ApiResponse.Json(HttpStatusCode.OK, new Receipt(rec.ID, rec.Image)) : ApiResponse.NotFound();
        }
        
        [HttpPost]
        public IActionResult Post([FromServices] BogZaplac.Database.Client dbClient, [FromForm] ReceiptUpload upload)
        {
            var rec = dbClient.PutReceipt(new Database.Receipt(upload.Username, GetByteArrayFromImage.Get(upload.image)));
            return (rec != null)? ApiResponse.Json(HttpStatusCode.Created, rec) : ApiResponse.NotModified();
        }
    }
}

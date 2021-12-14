using Microsoft.AspNetCore.Mvc;
using BogZaplac.Api.Utils;
using System.Net;

namespace BogZaplac.Api.Controllers
{
    [ApiController]
    [Route("history")]
    public class HistoryController : ControllerBase
    {
        private readonly ILogger<HistoryController> _logger;

        public HistoryController(ILogger<HistoryController> logger)
        {
            _logger = logger;
        }

        [HttpPost]
        public IActionResult Create([FromServices] BogZaplac.Database.Client dbClient, [FromForm] HIUpload upload)
        {
            var tmp = new Database.HistoryItemWithImage();
            tmp.Cost = upload.Cost;
            tmp.Date = (upload.Date == null)? DateTime.Now.ToString("dd MMM yyyy HH:mm:ss") : upload.Date;
            tmp.Username = upload.Username;
            tmp.Image = (upload.Image == null)? null : GetByteArrayFromImage.Get(upload.Image);
            
            var hi = (tmp.Image == null)? dbClient.PutHistoryItem(tmp) :  dbClient.PutHistoryWithImage(tmp);
            return (hi == null)? ApiResponse.NotModified() : ApiResponse.Json(HttpStatusCode.Created, hi);
        }

        [HttpGet]
        public IActionResult Get([FromServices] BogZaplac.Database.Client dbClient)
        {
            List<BogZaplac.Database.HistoryItem> historyItems = dbClient.GetHistoryItems(100, 0).List;

            return ApiResponse.Json(HttpStatusCode.OK, historyItems.OrderByDescending(x => x.ID).ToList());
        }

        [HttpGet]
        [Route("{id}")]
        public IActionResult Get([FromServices] BogZaplac.Database.Client dbClient, int id)
        {
            var item = dbClient.GetHistoryItem(id);
            return (item == null || item?.Date == null)? ApiResponse.NotFound() : ApiResponse.Json(HttpStatusCode.OK, item);
        }
    }
}
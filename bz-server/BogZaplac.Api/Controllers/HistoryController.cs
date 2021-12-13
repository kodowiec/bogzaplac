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

        [HttpGet]
        public IActionResult Get([FromServices] BogZaplac.Database.Client dbClient)
        {
            List<BogZaplac.Database.HistoryItem> historyItems = dbClient.GetHistoryItems(100, 0).List;

            return ApiResponse.Json(HttpStatusCode.OK, historyItems.OrderByDescending(x => x.ID).ToList());
        }
    }
}
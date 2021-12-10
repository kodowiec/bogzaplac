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
        public IActionResult Get()
        {
            /* temp - prototyping */
            List<HistoryItem> historyItems = new List<HistoryItem>();

            for (int i = 0; i < 10; i++)
            {
                var rnd = new Random();
                HistoryItem item = new HistoryItem();
                item.ID = i;
                item.Date = DateTime.Now.Ticks;
                item.Username = $"user{i}";
                item.Cost = (((double) rnd.Next(10000)) / 100).ToString();
                item.ReceiptID = rnd.Next(0, 100);
                historyItems.Add(item);
            }

            return ApiResponse.Json(HttpStatusCode.OK, historyItems.OrderByDescending(x => x.Date).ToList());
        }
    }
}
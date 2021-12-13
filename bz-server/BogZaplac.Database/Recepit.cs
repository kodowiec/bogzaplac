namespace BogZaplac.Database
{
    public class Receipt
    {
        public int ID { get; set; }
        public string Url { get; set; } = "";
    }

    public class HistoryItem
    {
        public int ID { get; set; }
        public string Username { get; set; } = "";
        public string Date { get; set; } = "";
        public string Cost { get; set; } = "";
        public int ReceiptID { get; set; }
    }
}

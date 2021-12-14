namespace BogZaplac.Database
{
    public class Receipt
    {
        public int? ID { get; set; }
        public string Username { get; set; }
        public byte[] Image { get; set; }

        public Receipt() { }

        public Receipt(string user, byte[] img)
        {
            this.Username = user;
            this.Image = img;
        }
    }

    public class HistoryItem
    {
        public int? ID { get; set; }
        public string Username { get; set; } = "";
        public string Date { get; set; } = "";
        public string Cost { get; set; } = "";
        public int? ReceiptID { get; set; }
    }

    public class HistoryItemWithImage : HistoryItem
    {
        public byte[]? Image;
    }
}

namespace BogZaplac.Api
{
    public class Receipt
    {
        public int? ID { get; set; }
        public byte[] image { get; set; }

        public Receipt() { }

        public Receipt(int? id, byte[] img)
        {
            this.ID = id;
            this.image = img;
        }
    }

    public class ReceiptUpload
    {
        public string Username { get; set; } = "";
        public IFormFile image { get; set; }
    }

    public class HistoryItem
    {
        public int ID { get; set; }
        public string Username { get; set; } = "";
        public string Date { get; set; } = "";
        public string Cost { get; set; } = "";
        public int ReceiptID { get; set; }
    }

    public class HIUpload
    {
        public string Username { get; set; }
        public string Cost { get; set; }
        public IFormFile? Image { get; set; }
        public string? Date { get; set; }
    }
}
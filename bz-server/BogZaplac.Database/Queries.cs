using Dapper;

namespace BogZaplac.Database
{
    partial class Client
    {
        public PagedList<HistoryItem> GetHistoryItems(int limit = 0, int offset = 0)
        {
            var total = Connection.Query<int>($"SELECT * FROM history ORDER BY id DESC").FirstOrDefault();
            var result = Connection.Query<HistoryItem>($"SELECT * FROM history ORDER BY id DESC LIMIT {limit} OFFSET {offset}").AsList();
            return new PagedList<HistoryItem>(result, offset, total);
        }

        public HistoryItem? GetHistoryItem(int id)
        {
            return Connection.Query<HistoryItem>($"SELECT * FROM history WHERE ID = {id}").FirstOrDefault();
        }

        public uint? PutHistoryWithImage(HistoryItemWithImage item)
        {
            var receipt = PutReceipt(new Receipt(item.Username, item.Image));
            item.ReceiptID = (int?) receipt;
            return (receipt == 0)? null : PutHistoryItem(item);
        }

        public uint PutHistoryItem(HistoryItem item)
        {
            return Connection.Query<uint>("INSERT INTO history (Username, Cost, Date, ReceiptID) VALUES (@Username, @Cost, @Date, @ReceiptID); select LAST_INSERT_ID();", item).First();
        }

        public Receipt? GetReceipt(int id)
        {
            return Connection.Query<Receipt>($"SELECT * FROM receipts WHERE ID={id}").FirstOrDefault();
        }

        public uint PutReceipt(Receipt receipt)
        {
            return Connection.Query<uint>("INSERT INTO receipts (Username, Image) VALUES (@Username, @Image); select LAST_INSERT_ID();", receipt).First();
        }
    }
}

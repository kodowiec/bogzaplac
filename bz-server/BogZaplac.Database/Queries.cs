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
    }
}

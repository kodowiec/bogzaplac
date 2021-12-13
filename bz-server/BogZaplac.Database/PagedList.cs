namespace BogZaplac.Database
{
    public class PagedList<T> : List<T>
    {
        public int Offset { get; set; }
        public int Total { get; set; }
        private IEnumerable<T> _list;

        public PagedList(IEnumerable<T> items, int offset, int total) : base(items)
        {
            this.Offset = offset;
            this.Total = total;
            this._list = items;
        }

        public List<T> List
        {
            get
            {
                return this._list.ToList();
            }
        }
    }
}

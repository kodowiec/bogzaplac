using System.Data;
using System.Data.Common;
using MySql.Data.MySqlClient;

namespace BogZaplac.Database
{
    public partial class Client
    {
        private string _hostname;
        private int _port;
        private string _database;
        private string _username;
        private string _password;
        private string _connectionString;

        private MySqlConnection _connection;

        public DbConnection Connection
        {
            get
            {
                CreateConnection();

                return this._connection;
            }
        }

        public Client(string hostname, int port, string database, string user, string password)
        {
            this._hostname = hostname;
            this._port = port;
            this._database = database;
            this._username = user;
            this._password = password;
            this._connectionString = string.Format("server={0};uid={1};pwd={2};database={3};", hostname, user, password, database);

            CreateConnection();
        }

        private void CreateConnection()
        {
            if (this._connection == null) this._connection = new MySqlConnection(this._connectionString);
            if (this._connection.State != System.Data.ConnectionState.Open) this._connection.Open();
        }

        public void Close(bool dispose = false)
        {
            this._connection.Close();
            if (dispose)
            {
                this._connection.Dispose();
                this._connection = null;
            }
        }
    }
}
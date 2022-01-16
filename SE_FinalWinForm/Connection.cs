using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SE_FinalWinForm
{
    class Connection
    {
        private static string cnn = "Data Source=DESKTOP-4FSJ52K\\SQLEXPRESS;Initial Catalog=OnlineShop;Integrated Security=True";
        
        public static SqlConnection GetSqlConnection()
        {
            return new SqlConnection(cnn);
        }
    }
}

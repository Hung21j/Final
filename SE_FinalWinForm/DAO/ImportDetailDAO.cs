//using Microsoft.ReportingServices.Diagnostics.Internal;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SE_FinalWinForm.DAO
{
    public class ImportDetailDAO
    {
        SqlDataAdapter dataAdapter;
        private static ImportDetailDAO instance;

        public static ImportDetailDAO Instance
        {
            get { if (instance == null) instance = new ImportDetailDAO(); return ImportDetailDAO.instance; }
            private set { ImportDetailDAO.instance = value; }
        }

        private ImportDetailDAO() { }

        public bool InsertFormIn(int id, string proName, DateTime date, float price, int quan, string curr, float total)
        {
            string query = string.Format("INSERT dbo.ImportFormDetail (id, productName, date, price, quantity, currency, total) VALUES ({0},N'{1}',{2},{3},{4},N'{5}',{6})",id,proName,date,price,quan,curr,total);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }

        public bool UpdateInForm(string proName, DateTime date, float price, int quan, string curr, float total, int id)
        {
            string query = string.Format("UPDATE dbo.ImportFormDetail SET [ProductName] = N'{0}', Date = {1}, [Price] = {2}, Quantity = {3}, Currency = N'{4}', Total = {5} WHERE id = {6}", proName, date, price, quan, curr, total, id);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }

        public bool DeleteInForm(int id)
        {
            string query = string.Format("Delete ImportFormDetail where id = {0}", id);
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public DataTable getAllInfo()
        {
            DataTable dataTable = new DataTable();
            string query = "select * from dbo.ImportFormDetail";
            using (SqlConnection sqlConnection = Connection.GetSqlConnection())
            {
                sqlConnection.Open();
                dataAdapter = new SqlDataAdapter(query, sqlConnection);
                dataAdapter.Fill(dataTable);
                sqlConnection.Close();
            }
            return dataTable;
        }
    }
}

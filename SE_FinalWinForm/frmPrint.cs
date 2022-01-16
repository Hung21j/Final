using Microsoft.Reporting.WinForms;
using SE_FinalWinForm.DAO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SE_FinalWinForm
{
    public partial class frmPrint : Form
    {
        public frmPrint()
        {
            InitializeComponent();
        }

        private void frmPrint_Load(object sender, EventArgs e)
        {
            try
            {
                reportViewer1.LocalReport.ReportEmbeddedResource = "SE_FinalWinForm.rptPrint.rdlc";
                ReportDataSource reportDataSource = new ReportDataSource();
                reportDataSource.Name = "DataSet1";
                reportDataSource.Value = ImportDetailDAO.Instance.getAllInfo();
                reportViewer1.LocalReport.DataSources.Add(reportDataSource);

                this.reportViewer1.RefreshReport();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}

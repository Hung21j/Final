using SE_FinalWinForm.DTO;
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
    public partial class frmIndex : Form
    {
        private Account loginAccount;

        public Account LoginAccount
        {
            get { return loginAccount; }
            set { loginAccount = value; /*ChangeAccount(loginAccount.IsAdmin);*/ }
        }

        public frmIndex(Account acc)
        {
            InitializeComponent();

            this.LoginAccount = acc;

        }

        void ChangeAccount(int isAdmin)
        {
            //myProfileToolStripMenuItem.Enabled = isAdmin == 1;
            changeInformationToolStripMenuItem.Text += " (" + LoginAccount.Name + ")";
        }

        private void importFormToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmImport fImport = new frmImport();

            fImport.Show();
        }

        private void productsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmProducts fProducts = new frmProducts();
            fProducts.Show();
        }


        private void myProfileToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmAccount fAccount = new frmAccount();

            fAccount.Show();
        }



        private void changeInformationToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmAccountChange f = new frmAccountChange(LoginAccount);
            f.UpdateAccount += f_UpdateAccount;
            f.ShowDialog();
        }

        void f_UpdateAccount(object sender, AccountEvent e)
        {
            changeInformationToolStripMenuItem.Text = "Thông tin tài khoản (" + e.Acc.Name + ")";
        }

        private void logoutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();

        }

        
    }
}

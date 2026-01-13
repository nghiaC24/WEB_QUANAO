using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace YourProject
{
    public partial class Default : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["ShopQuanAoDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDanhMuc();
                LoadSanPham();
            }
        }

        private void LoadDanhMuc()
        {
            using (SqlConnection con = new SqlConnection(strCon))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM DanhMuc", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rpDanhMuc.DataSource = dt;
                rpDanhMuc.DataBind();
            }
        }

        private void LoadSanPham()
        {
            string idDM = Request.QueryString["idDM"];
            using (SqlConnection con = new SqlConnection(strCon))
            {
                // SQL mặc định: Lấy tất cả sản phẩm
                string sql = @"SELECT sp.*, th.TenTH, dm.TenDanhMuc 
                               FROM SanPham sp 
                               JOIN ThuongHieu th ON sp.MaTH = th.MaTH
                               JOIN DanhMuc dm ON sp.MaDM = dm.MaDM";

                // Nếu có idDM trên URL thì thêm điều kiện WHERE
                if (!string.IsNullOrEmpty(idDM))
                {
                    sql += " WHERE sp.MaDM = @MaDM";
                }

                SqlCommand cmd = new SqlCommand(sql, con);
                if (!string.IsNullOrEmpty(idDM))
                {
                    cmd.Parameters.AddWithValue("@MaDM", idDM);
                }

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rpSanPham.DataSource = dt;
                rpSanPham.DataBind();
            }
        }
    }
}
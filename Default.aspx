<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="YourProject.Default" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Shop Quần Áo - Trang Chủ</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #fcfcfc; margin: 0; }
        
        /* Menu Danh mục phía trên */
        .category-tabs { display: flex; justify-content: center; gap: 20px; padding: 30px 0; border-bottom: 1px solid #eee; }
        .tab-item { text-decoration: none; color: #888; font-weight: bold; text-transform: uppercase; font-size: 13px; transition: 0.3s; }
        .tab-item:hover, .tab-item.active { color: #000; border-bottom: 2px solid #000; }

        /* Lưới sản phẩm */
        .product-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); gap: 30px; padding: 40px; }
        .product-card { background: #fff; border-radius: 8px; position: relative; transition: 0.3s; }
        .product-image-wrapper { background-color: #f3f3f3; padding: 20px; text-align: center; border-radius: 8px; }
        .product-image { width: 100%; height: 300px; object-fit: contain; }
        .product-info { padding: 15px 0; position: relative; }
        .product-price { float: right; font-weight: bold; font-size: 16px; color: #333; }
        .brand { font-size: 11px; color: #0066cc; font-weight: bold; text-transform: uppercase; }
        .name { font-size: 15px; font-weight: 600; margin: 5px 0; color: #222; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="category-tabs">
            <a href="Default.aspx" class="tab-item">Tất cả</a>
            <asp:Repeater ID="rpDanhMuc" runat="server">
                <ItemTemplate>
                    <a href='Default.aspx?idDM=<%# Eval("MaDM") %>' class="tab-item">
                        <%# Eval("TenDanhMuc") %>
                    </a>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <div class="product-grid">
            <asp:Repeater ID="rpSanPham" runat="server">
                <ItemTemplate>
                    <div class="product-card">
                        <div class="product-image-wrapper">
                            <a href='ChiTietSanPham.aspx?id=<%# Eval("MaSP") %>'>
                                <img src='<%# "Images/" + Eval("AnhBia") %>' class="product-image" />
                            </a>
                        </div>
                        <div class="product-info">
                            <span class="product-price"><%# String.Format("{0:N0}₫", Eval("DonGia")) %></span>
                            <div class="brand"><%# Eval("TenTH") %></div>
                            <h3 class="name"><%# Eval("TenSP") %></h3>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
USE [CT25Team11]
GO
ALTER TABLE [dbo].[Quanlykho] DROP CONSTRAINT [FK_Quanlykho_Sanpham]
GO
ALTER TABLE [dbo].[Quanlykho] DROP CONSTRAINT [FK_Quanlykho_Donhang]
GO
ALTER TABLE [dbo].[Nguoidung] DROP CONSTRAINT [FK_Nguoidung_Thanhtoan]
GO
ALTER TABLE [dbo].[Nguoidung] DROP CONSTRAINT [FK_Nguoidung_TaiKhoan]
GO
ALTER TABLE [dbo].[Nguoidung] DROP CONSTRAINT [FK_Nguoidung_Sanpham]
GO
ALTER TABLE [dbo].[Nguoidung] DROP CONSTRAINT [FK_Nguoidung_Giohang]
GO
ALTER TABLE [dbo].[Nguoidung] DROP CONSTRAINT [FK_Nguoidung_Giaohang]
GO
ALTER TABLE [dbo].[Nguoidung] DROP CONSTRAINT [FK_Nguoidung_Donhang]
GO
ALTER TABLE [dbo].[Donhang] DROP CONSTRAINT [FK_Donhang_Giaohang]
GO
ALTER TABLE [dbo].[Donhang] DROP CONSTRAINT [FK_Donhang_Chitietdonhang]
GO
/****** Object:  Table [dbo].[Thanhtoan]    Script Date: 5/21/2021 10:08:05 PM ******/
DROP TABLE [dbo].[Thanhtoan]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 5/21/2021 10:08:05 PM ******/
DROP TABLE [dbo].[TaiKhoan]
GO
/****** Object:  Table [dbo].[Sanpham]    Script Date: 5/21/2021 10:08:05 PM ******/
DROP TABLE [dbo].[Sanpham]
GO
/****** Object:  Table [dbo].[Quanlykho]    Script Date: 5/21/2021 10:08:05 PM ******/
DROP TABLE [dbo].[Quanlykho]
GO
/****** Object:  Table [dbo].[Nguoidung]    Script Date: 5/21/2021 10:08:05 PM ******/
DROP TABLE [dbo].[Nguoidung]
GO
/****** Object:  Table [dbo].[Lienhe]    Script Date: 5/21/2021 10:08:05 PM ******/
DROP TABLE [dbo].[Lienhe]
GO
/****** Object:  Table [dbo].[Khuyenmai]    Script Date: 5/21/2021 10:08:05 PM ******/
DROP TABLE [dbo].[Khuyenmai]
GO
/****** Object:  Table [dbo].[Giohang]    Script Date: 5/21/2021 10:08:05 PM ******/
DROP TABLE [dbo].[Giohang]
GO
/****** Object:  Table [dbo].[Giaohang]    Script Date: 5/21/2021 10:08:05 PM ******/
DROP TABLE [dbo].[Giaohang]
GO
/****** Object:  Table [dbo].[Donhang]    Script Date: 5/21/2021 10:08:05 PM ******/
DROP TABLE [dbo].[Donhang]
GO
/****** Object:  Table [dbo].[Doanhthu]    Script Date: 5/21/2021 10:08:05 PM ******/
DROP TABLE [dbo].[Doanhthu]
GO
/****** Object:  Table [dbo].[Chitietdonhang]    Script Date: 5/21/2021 10:08:05 PM ******/
DROP TABLE [dbo].[Chitietdonhang]
GO
/****** Object:  Table [dbo].[Chitietdonhang]    Script Date: 5/21/2021 10:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Chitietdonhang](
	[Madonhang] [varchar](10) NOT NULL,
	[Gia] [int] NULL,
	[Masanpham] [varchar](10) NULL,
	[ngaygiaohang] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Madonhang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Doanhthu]    Script Date: 5/21/2021 10:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doanhthu](
	[Thang] [int] NULL,
	[Tongdoanhthu] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Tongdoanhthu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Donhang]    Script Date: 5/21/2021 10:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Donhang](
	[Madonhang] [varchar](10) NOT NULL,
	[Giatridonhang] [int] NULL,
	[Thongtindonhang] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[Madonhang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Giaohang]    Script Date: 5/21/2021 10:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Giaohang](
	[Donvivanchuyen] [nvarchar](50) NULL,
	[Thoigiangiaohang] [datetime] NULL,
	[Madonhang] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Madonhang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Giohang]    Script Date: 5/21/2021 10:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Giohang](
	[Magiohang] [varchar](10) NOT NULL,
	[Masanpham] [varchar](10) NULL,
	[Gia] [int] NULL,
	[Soluong] [int] NULL,
	[Tongtien] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Magiohang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Khuyenmai]    Script Date: 5/21/2021 10:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Khuyenmai](
	[Makhuyenmai] [varchar](10) NOT NULL,
	[Ngaykhuyenmai] [date] NULL,
	[Thongtinsukien] [nvarchar](1000) NULL,
	[Makhachhang] [varchar](10) NOT NULL,
	[Sodiemtichluy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Makhuyenmai] ASC,
	[Makhachhang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lienhe]    Script Date: 5/21/2021 10:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lienhe](
	[Thongtinlienhe] [nvarchar](100) NULL,
	[Tuvanvien] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nguoidung]    Script Date: 5/21/2021 10:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nguoidung](
	[id] [varchar](10) NOT NULL,
	[Ho] [varchar](10) NULL,
	[Ten] [varchar](10) NULL,
	[Ngaythangnamsinh] [date] NULL,
	[Gioitinh] [int] NULL,
	[Mail] [nvarchar](100) NULL,
	[Diachi] [nvarchar](200) NULL,
	[Sodienthoai] [char](10) NULL,
	[Madonhang] [varchar](10) NULL,
	[Trungbinhdanhgia] [nvarchar](100) NULL,
	[Nhanxet] [nvarchar](1000) NULL,
	[Thongtinlienhe] [nvarchar](100) NULL,
	[Tentaikhoan] [nvarchar](50) NULL,
	[Magiohang] [varchar](10) NOT NULL,
	[Phuongthucthanhtoan] [nvarchar](50) NULL,
	[Makhachhang] [varchar](10) NULL,
	[Masanpham] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[Magiohang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Quanlykho]    Script Date: 5/21/2021 10:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Quanlykho](
	[Soluonghang] [int] NULL,
	[Sodonhang] [int] NULL,
	[Madonhang] [varchar](10) NOT NULL,
	[Masanpham] [varchar](10) NOT NULL,
	[Thoigianxuatnhaphang] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Madonhang] ASC,
	[Masanpham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sanpham]    Script Date: 5/21/2021 10:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sanpham](
	[id] [varchar](10) NULL,
	[Tensanpham] [nvarchar](100) NULL,
	[Hinhanh] [image] NULL,
	[Gia] [int] NULL,
	[Masanpham] [varchar](10) NOT NULL,
	[Soluong] [int] NULL,
	[Phanloai] [nvarchar](20) NULL,
	[Thongtinsanpham] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[Masanpham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 5/21/2021 10:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[Tentaikhoan] [nvarchar](50) NOT NULL,
	[Matkhau] [nvarchar](50) NULL,
	[Dangnhap] [nvarchar](50) NULL,
	[Dangky] [nvarchar](50) NULL,
	[Doimatkhau] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Tentaikhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Thanhtoan]    Script Date: 5/21/2021 10:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Thanhtoan](
	[Phuongthucthanhtoan] [nvarchar](50) NOT NULL,
	[Voucher] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Phuongthucthanhtoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Donhang]  WITH CHECK ADD  CONSTRAINT [FK_Donhang_Chitietdonhang] FOREIGN KEY([Madonhang])
REFERENCES [dbo].[Chitietdonhang] ([Madonhang])
GO
ALTER TABLE [dbo].[Donhang] CHECK CONSTRAINT [FK_Donhang_Chitietdonhang]
GO
ALTER TABLE [dbo].[Donhang]  WITH CHECK ADD  CONSTRAINT [FK_Donhang_Giaohang] FOREIGN KEY([Madonhang])
REFERENCES [dbo].[Giaohang] ([Madonhang])
GO
ALTER TABLE [dbo].[Donhang] CHECK CONSTRAINT [FK_Donhang_Giaohang]
GO
ALTER TABLE [dbo].[Nguoidung]  WITH CHECK ADD  CONSTRAINT [FK_Nguoidung_Donhang] FOREIGN KEY([Madonhang])
REFERENCES [dbo].[Donhang] ([Madonhang])
GO
ALTER TABLE [dbo].[Nguoidung] CHECK CONSTRAINT [FK_Nguoidung_Donhang]
GO
ALTER TABLE [dbo].[Nguoidung]  WITH CHECK ADD  CONSTRAINT [FK_Nguoidung_Giaohang] FOREIGN KEY([Madonhang])
REFERENCES [dbo].[Giaohang] ([Madonhang])
GO
ALTER TABLE [dbo].[Nguoidung] CHECK CONSTRAINT [FK_Nguoidung_Giaohang]
GO
ALTER TABLE [dbo].[Nguoidung]  WITH CHECK ADD  CONSTRAINT [FK_Nguoidung_Giohang] FOREIGN KEY([Magiohang])
REFERENCES [dbo].[Giohang] ([Magiohang])
GO
ALTER TABLE [dbo].[Nguoidung] CHECK CONSTRAINT [FK_Nguoidung_Giohang]
GO
ALTER TABLE [dbo].[Nguoidung]  WITH CHECK ADD  CONSTRAINT [FK_Nguoidung_Sanpham] FOREIGN KEY([Masanpham])
REFERENCES [dbo].[Sanpham] ([Masanpham])
GO
ALTER TABLE [dbo].[Nguoidung] CHECK CONSTRAINT [FK_Nguoidung_Sanpham]
GO
ALTER TABLE [dbo].[Nguoidung]  WITH CHECK ADD  CONSTRAINT [FK_Nguoidung_TaiKhoan] FOREIGN KEY([Tentaikhoan])
REFERENCES [dbo].[TaiKhoan] ([Tentaikhoan])
GO
ALTER TABLE [dbo].[Nguoidung] CHECK CONSTRAINT [FK_Nguoidung_TaiKhoan]
GO
ALTER TABLE [dbo].[Nguoidung]  WITH CHECK ADD  CONSTRAINT [FK_Nguoidung_Thanhtoan] FOREIGN KEY([Phuongthucthanhtoan])
REFERENCES [dbo].[Thanhtoan] ([Phuongthucthanhtoan])
GO
ALTER TABLE [dbo].[Nguoidung] CHECK CONSTRAINT [FK_Nguoidung_Thanhtoan]
GO
ALTER TABLE [dbo].[Quanlykho]  WITH CHECK ADD  CONSTRAINT [FK_Quanlykho_Donhang] FOREIGN KEY([Madonhang])
REFERENCES [dbo].[Donhang] ([Madonhang])
GO
ALTER TABLE [dbo].[Quanlykho] CHECK CONSTRAINT [FK_Quanlykho_Donhang]
GO
ALTER TABLE [dbo].[Quanlykho]  WITH CHECK ADD  CONSTRAINT [FK_Quanlykho_Sanpham] FOREIGN KEY([Masanpham])
REFERENCES [dbo].[Sanpham] ([Masanpham])
GO
ALTER TABLE [dbo].[Quanlykho] CHECK CONSTRAINT [FK_Quanlykho_Sanpham]
GO

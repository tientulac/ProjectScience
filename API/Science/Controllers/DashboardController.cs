using Science.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace Science.Controllers
{
    [RoutePrefix("api/v1/dashboard")]
    public class DashboardController : ApiController
    {
        private LinqDataContext db = new LinqDataContext();

        [HttpGet]
        public ResponseBase<dashboard> GetList()
        {
            try
            {
                var dataAlbumImage = db.SP_AlbumImage().FirstOrDefault().SoLuong;
                var dataComment = db.SP_Comment().FirstOrDefault().SoLuong;
                var dataLoaiTinTuc = db.SP_LoaiTinTuc().FirstOrDefault().SoLuong;
                var data_menu = db.SP_menu().FirstOrDefault().SoLuong;
                var dataNews = db.SP_News().FirstOrDefault().SoLuong;
                var dataPolicy = db.SP_Policy().FirstOrDefault().SoLuong;
                var dataSlideImagek = db.SP_SlideImage().FirstOrDefault().SoLuong;
                var dataUrlLink = db.SP_UrlLink().FirstOrDefault().SoLuong;
                return new ResponseBase<dashboard>
                {
                    data = new dashboard()
                    {
                        AlbumImage = dataAlbumImage.Value,
                        Comment = dataComment.Value,
                        LoaiTinTuc = dataLoaiTinTuc.Value,
                        Menu = data_menu.Value,
                        News = dataNews.Value,
                        Policy = dataPolicy.Value,
                        SlideImage = dataSlideImagek.Value,
                        UrlLink = dataUrlLink.Value,
                    },
                    message = "Thành công",
                    status = 200
                };
            }
            catch (Exception ex)
            {
                return new ResponseBase<dashboard>
                {
                    status = 500,
                    message = ex.Message
                };
            }
        }
    }
}
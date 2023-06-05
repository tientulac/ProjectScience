using Science.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace Science.Controllers
{
    public class NewsController : ApiController
    {
        private LinqDataContext db = new LinqDataContext();

        [HttpGet]
        public ResponseBase<List<sp_TinTuc_LoadResult>> GetList()
        {
            try
            {
                return new ResponseBase<List<sp_TinTuc_LoadResult>>
                {
                data = db.sp_TinTuc_Load().ToList(),
                    message = "Thành công",
                    status = 200
                };
            }
            catch (Exception ex)
            {
                return new ResponseBase<List<sp_TinTuc_LoadResult>>
                {
                    status = 500,
                    message = ex.Message
                };
            }
        }

        [HttpPost]
        public ResponseBase<bool> Save(New req)
        {
            try
            {
                if (req.news_id > 0)
                {
                    var ai = db.News.FirstOrDefault(x => x.news_id == req.news_id);
                    ai.title = req.title;
                    ai.note = req.note;
                    ai.status = req.status;
                    ai.descrip = req.descrip;
                    ai.image = req.image;
                    ai.updated_at = DateTime.Now;
                    ai.type = req.type;
                    db.SubmitChanges();
                }
                else
                {
                    req.created_at = DateTime.Now;
                    db.News.InsertOnSubmit(req);
                    db.SubmitChanges();
                }
                return new ResponseBase<bool>
                {
                    data = true,
                    status = 200,
                    message = "Thành công"
                };
            }
            catch (Exception ex)
            {
                return new ResponseBase<bool>
                {
                    status = 500,
                    message = ex.Message
                };
            }
        }

        [HttpDelete]
        public ResponseBase<bool> Delete(int id = 0)
        {
            try
            {
                var ai = db.News.FirstOrDefault(x => x.news_id == id);
                db.News.DeleteOnSubmit(ai);
                db.SubmitChanges();
                return new ResponseBase<bool>
                {
                    data = true,
                    status = 200,
                    message = "Thành công"
                };
            }
            catch (Exception ex)
            {
                return new ResponseBase<bool>
                {
                    status = 500,
                    message = ex.Message
                };
            }
        }

        [HttpGet, Route("api/v1/News/LoadNewByType")]
        public ResponseBase<List<NewsDTO>> LoadNewByType()
        {
            try
            {
                var _type = db.LoaiTinTucs.Where(x => x.Ma_loai != "TB");
                var list = new List<NewsDTO>();
                foreach (var item in _type)
                {
                    var newDTO = new NewsDTO()
                    {
                        id_loai_tin_tuc = item.id_loai_tin_tuc,
                        Ma_loai = item.Ma_loai,
                        Loai_tin_tuc = item.Loai_tin_tuc
                    };
                    newDTO.list_new = new List<New>();
                    if (db.News.Where(x => x.type == newDTO.Ma_loai).ToList().Any())
                    {
                        newDTO.list_new = db.News.Where(x => x.type == newDTO.Ma_loai).ToList();
                    }
                    list.Add(newDTO);
                }
                return new ResponseBase<List<NewsDTO>>
                {
                    data = list,
                    message = "Thành công",
                    status = 200
                };
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
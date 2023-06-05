using Science.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace Science.Controllers
{
    [RoutePrefix("api/v1/QuanLyGopY")]
    public class QuanLyGopYController : ApiController
    {
        private LinqDataContext db = new LinqDataContext();

        [HttpGet]
        public ResponseBase<List<QuanLyGopY>> GetList()
        {
            try
            {
                return new ResponseBase<List<QuanLyGopY>>
                {
                    data = db.QuanLyGopies.ToList(),
                    message = "Thành công",
                    status = 200
                };
            }
            catch (Exception ex)
            {
                return new ResponseBase<List<QuanLyGopY>>
                {
                    status = 500,
                    message = ex.Message
                };
            }
        }

        [HttpPost]
        public ResponseBase<bool> Save(QuanLyGopY req)
        {
            try
            {
                req.Ngay_hoi = DateTime.Now;
                db.QuanLyGopies.InsertOnSubmit(req);
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

        [HttpDelete]
        public ResponseBase<bool> Delete(int id = 0)
        {
            try
            {
                var ai = db.QuanLyGopies.FirstOrDefault(x => x.id_gop_y == id);
                db.QuanLyGopies.DeleteOnSubmit(ai);
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
    }
}
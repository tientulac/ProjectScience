using Science.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace Science.Controllers
{
    [RoutePrefix("api/v1/LoaiTinTuc")]
    public class LoaiTinTucController : ApiController
    {
        private LinqDataContext db = new LinqDataContext();

        [HttpGet]
        public ResponseBase<List<LoaiTinTuc>> GetList()
        {
            try
            {
                return new ResponseBase<List<LoaiTinTuc>>
                {
                    data = db.LoaiTinTucs.ToList(),
                    message = "Thành công",
                    status = 200
                };
            }
            catch (Exception ex)
            {
                return new ResponseBase<List<LoaiTinTuc>>
                {
                    status = 500,
                    message = ex.Message
                };
            }
        }

        [HttpPost]
        public ResponseBase<bool> Save(LoaiTinTuc req)
        {
            try
            {

                if (req.id_loai_tin_tuc > 0)
                {
                    var ai = db.LoaiTinTucs.FirstOrDefault(x => x.id_loai_tin_tuc == req.id_loai_tin_tuc);
                    ai.Ma_loai = req.Ma_loai;
                    ai.Loai_tin_tuc = req.Loai_tin_tuc;
                    db.SubmitChanges();
                }
                else
                {
                    db.LoaiTinTucs.InsertOnSubmit(req);
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
                var ai = db.LoaiTinTucs.FirstOrDefault(x => x.id_loai_tin_tuc == id);
                db.LoaiTinTucs.DeleteOnSubmit(ai);
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
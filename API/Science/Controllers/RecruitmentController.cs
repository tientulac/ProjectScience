using Science.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace Science.Controllers
{
    public class RecruitmentController : ApiController
    {
        private LinqDataContext db = new LinqDataContext();

        [HttpGet]
        public ResponseBase<List<Recruitment>> GetList()
        {
            try
            {
                return new ResponseBase<List<Recruitment>>
                {
                    data = db.Recruitments.ToList(),
                    message = "Thành công",
                    status = 200
                };
            }
            catch (Exception ex)
            {
                return new ResponseBase<List<Recruitment>>
                {
                    status = 500,
                    message = ex.Message
                };
            }
        }

        [HttpPost]
        public ResponseBase<bool> Save(Recruitment req)
        {
            try
            {
                if (req.recruiment_id > 0)
                {
                    var record = db.Recruitments.FirstOrDefault(x => x.recruiment_id == req.recruiment_id);
                    record.title = req.title;
                    record.content = req.content;
                    record.note = req.note;
                    record.status = req.status;
                    record.descrip = req.descrip;
                    record.image = req.image;
                    record.Address = req.Address;
                    record.poster = req.poster;
                    record.wage = req.wage;
                    record.quantity = req.quantity;
                    record.updated_at = DateTime.Now;
                    db.SubmitChanges();
                }
                else
                {
                    req.created_at = DateTime.Now;
                    db.Recruitments.InsertOnSubmit(req);
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
                var ai = db.Recruitments.FirstOrDefault(x => x.recruiment_id == id);
                db.Recruitments.DeleteOnSubmit(ai);
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
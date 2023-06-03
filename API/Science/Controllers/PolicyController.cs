using Science.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace Science.Controllers
{
    public class PolicyController : ApiController
    {
        private LinqDataContext db = new LinqDataContext();

        [HttpGet]
        public ResponseBase<List<Policy>> GetList()
        {
            try
            {
                return new ResponseBase<List<Policy>>
                {
                    data = db.Policies.ToList(),
                    message = "Thành công",
                    status = 200
                };
            }
            catch (Exception ex)
            {
                return new ResponseBase<List<Policy>>
                {
                    status = 500,
                    message = ex.Message
                };
            }
        }

        [HttpPost]
        public ResponseBase<bool> Save(Policy req)
        {
            try
            {
                if (req.policy_id > 0)
                {
                    var record = db.Policies.FirstOrDefault(x => x.policy_id == req.policy_id);
                    record.title = req.title;
                    record.content = req.content;
                    record.note = req.note;
                    record.status = req.status;
                    record.descrip = req.descrip;
                    record.image = req.image;
                    record.updated_at = DateTime.Now;
                    db.SubmitChanges();
                }
                else
                {
                    req.created_at = DateTime.Now;
                    db.Policies.InsertOnSubmit(req);
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
                var ai = db.Policies.FirstOrDefault(x => x.policy_id == id);
                db.Policies.DeleteOnSubmit(ai);
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
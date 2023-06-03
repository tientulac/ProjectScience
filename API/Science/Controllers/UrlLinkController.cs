using Science.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace Science.Controllers
{
    [RoutePrefix("api/v1/url-link")]
    public class UrlLinkController : ApiController
    {
        private LinqDataContext db = new LinqDataContext();

        [HttpGet]
        public ResponseBase<List<UrlLink>> GetList()
        {
            try
            {
                return new ResponseBase<List<UrlLink>>
                {
                    data = db.UrlLinks.ToList(),
                    message = "Thành công",
                    status = 200
                };
            }
            catch (Exception ex)
            {
                return new ResponseBase<List<UrlLink>>
                {
                    status = 500,
                    message = ex.Message
                };
            }
        }

        [HttpPost]
        public ResponseBase<bool> Save(UrlLink req)
        {
            try
            {
                if (req.url_link_id > 0)
                {
                    var record = db.UrlLinks.FirstOrDefault(x => x.url_link_id == req.url_link_id);
                    record.title = req.title;
                    record.status = req.status;
                    record.image = req.image;
                    record.descrip = req.descrip;
                    record.note = req.note;
                    record.url = req.url;
                    record.updated_at = DateTime.Now;
                    db.SubmitChanges();
                }
                else
                {
                    req.created_at = DateTime.Now;
                    db.UrlLinks.InsertOnSubmit(req);
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
                var ai = db.UrlLinks.FirstOrDefault(x => x.url_link_id == id);
                db.UrlLinks.DeleteOnSubmit(ai);
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
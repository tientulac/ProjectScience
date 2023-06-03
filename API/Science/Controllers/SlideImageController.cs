using Science.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace Science.Controllers
{
    public class SlideImageController : ApiController
    {
        private LinqDataContext db = new LinqDataContext();

        [HttpGet]
        public ResponseBase<List<SlideImage>> GetList()
        {
            try
            {
                return new ResponseBase<List<SlideImage>>
                {
                    data = db.SlideImages.ToList(),
                    message = "Thành công",
                    status = 200
                };
            }
            catch (Exception ex)
            {
                return new ResponseBase<List<SlideImage>>
                {
                    status = 500,
                    message = ex.Message
                };
            }
        }

        [HttpPost]
        public ResponseBase<bool> Save(SlideImage req)
        {
            try
            {
                if (req.slide_image_id > 0)
                {
                    var ai = db.SlideImages.FirstOrDefault(x => x.slide_image_id == req.slide_image_id);
                    ai.title = req.title;
                    ai.note = req.note;
                    ai.status = req.status;
                    ai.descrip = req.descrip;
                    ai.image = req.image;
                    ai.updated_at = DateTime.Now;
                    db.SubmitChanges();
                }
                else
                {
                    req.created_at = DateTime.Now;
                    db.SlideImages.InsertOnSubmit(req);
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
                var ai = db.SlideImages.FirstOrDefault(x => x.slide_image_id == id);
                db.SlideImages.DeleteOnSubmit(ai);
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
using Science.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace Science.Controllers
{
    [RoutePrefix("api/v1/album-image")]
    public class AlbumImageController : ApiController
    {
        private LinqDataContext db = new LinqDataContext();

        [HttpGet]
        public ResponseBase<List<AlbumImage>> GetList()
        {
            try
            {
                return new ResponseBase<List<AlbumImage>>
                {
                    data = db.AlbumImages.ToList(),
                    message = "Thành công",
                    status = 200
                };
            }
            catch (Exception ex)
            {
                return new ResponseBase<List<AlbumImage>>
                {
                    status = 500,
                    message = ex.Message
                };
            }
        }

        [HttpPost]
        public ResponseBase<bool> Save(AlbumImage req)
        {
            try
            {
                if (req.album_image_id > 0)
                {
                    var ai = db.AlbumImages.FirstOrDefault(x => x.album_image_id == req.album_image_id);
                    ai.title = req.title;
                    ai.content = req.content;
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
                    db.AlbumImages.InsertOnSubmit(req);
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
                var ai = db.AlbumImages.FirstOrDefault(x => x.album_image_id == id);
                db.AlbumImages.DeleteOnSubmit(ai);
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
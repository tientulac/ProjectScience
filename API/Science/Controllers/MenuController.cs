using Science.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace Science.Controllers
{
    [RoutePrefix("api/v1/menu")]
    public class MenuController : ApiController
    {
        private LinqDataContext db = new LinqDataContext();

        [HttpGet]
        public ResponseBase<List<MenuChildren>> GetList(int id = 0)
        {
            try
            {
                return new ResponseBase<List<MenuChildren>>
                {
                    data = db.Menus.Where(x=>x.menu_parent_id==id).ToList(),
                    message = "Thành công",
                    status = 200
                };
            }
            catch (Exception ex)
            {
                return new ResponseBase<List<MenuChildren>>
                {
                    status = 500,
                    message = ex.Message
                };
            }
        }

        [HttpPost]
        public ResponseBase<bool> Save(MenuChildren req)
        {
            try
            {
                if (req.menu_id > 0)
                {
                    var record = db.Menus.FirstOrDefault(x => x.menu_id == req.menu_id);
                    record.menu_code = req.menu_code;
                    record.menu_name = req.menu_name;
                    record.title = req.title;
                    record.menu_parent_id = req.menu_parent_id;
                    record.status = req.status;
                    record.image = req.image;
                    record.updated_at = DateTime.Now;
                    db.SubmitChanges();
                }
                else
                {
                    req.created_at = DateTime.Now;
                    db.Menus.InsertOnSubmit(req);
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
                var ai = db.Menus.FirstOrDefault(x => x.menu_id == id);
                db.Menus.DeleteOnSubmit(ai);
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
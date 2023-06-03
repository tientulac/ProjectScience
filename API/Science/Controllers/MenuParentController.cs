using Science.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace Science.Controllers
{
    public class MenuParentController : ApiController
    {
        private LinqDataContext db = new LinqDataContext();

        [HttpGet]
        public ResponseBase<List<MenuParent>> GetList()
        {
            try
            {
                return new ResponseBase<List<MenuParent>>
                {
                    data = db.MenuParents.ToList(),
                    message = "Thành công",
                    status = 200
                };
            }
            catch (Exception ex)
            {
                return new ResponseBase<List<MenuParent>>
                {
                    status = 500,
                    message = ex.Message
                };
            }
        }

        [HttpPost]
        public ResponseBase<bool> Save(MenuParent req)
        {
            try
            {
                if (req.menu_parent_id > 0)
                {
                    var record = db.MenuParents.FirstOrDefault(x => x.menu_parent_id == req.menu_parent_id);
                    record.menu_parent_code = req.menu_parent_code;
                    record.menu_parent_name = req.menu_parent_name;
                    record.title = req.title;
                    record.status = req.status;
                    record.image = req.image;
                    record.updated_at = DateTime.Now;
                    db.SubmitChanges();
                }
                else
                {
                    req.created_at = DateTime.Now;
                    db.MenuParents.InsertOnSubmit(req);
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
                var ai = db.MenuParents.FirstOrDefault(x => x.menu_parent_id == id);
                db.MenuParents.DeleteOnSubmit(ai);
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
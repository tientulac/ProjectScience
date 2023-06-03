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
        public ResponseBase<List<MenuParentDTO>> GetList()
        {
            var list = new List<MenuParentDTO>();
            var listParent = db.MenuParents.ToList();
            if (listParent.Any())
            {
                foreach (var item in listParent)
                {
                    var menuParentDTO = new MenuParentDTO
                    {
                        menu_parent_id = item.menu_parent_id,
                        menu_parent_code = item.menu_parent_code,
                        menu_parent_name = item.menu_parent_name,
                        title = item.title
                    };
                    menuParentDTO.ListMenu = new List<MenuDTO>();
                    var _menu = db.Menus.Where(x => x.menu_parent_id == item.menu_parent_id);
                    if (_menu.Any())
                    {
                        foreach (var m in _menu)
                        {
                            menuParentDTO.ListMenu.Add(new MenuDTO
                            {
                                menu_id = m.menu_id,
                                menu_code = m.menu_code,
                                menu_name = m.menu_name,
                                menu_parent_id = m.menu_parent_id.GetValueOrDefault()
                            });
                        }
                    }
                    list.Add(menuParentDTO);
                }
            }
            return new ResponseBase<List<MenuParentDTO>>
            {
                data = list,
                message = "Thành công",
                status = 200
            };
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
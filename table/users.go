package table

import (
	"github.com/GoAdminGroup/go-admin/context"
	"html/template"

	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"
	"github.com/GoAdminGroup/go-admin/template/types"
	"github.com/GoAdminGroup/go-admin/template/types/form"
)

func GetUsersTable(ctx *context.Context) table.Table {

	usersTable := table.NewDefaultTable(table.DefaultConfigWithDriver("mysql"))

	info := usersTable.GetInfo()

	info.AddField("Id", "id", db.Int)
	info.AddField("姓名", "name", db.Varchar)
	info.AddField("性别", "gender", db.Tinyint).FieldDisplay(func(model types.FieldModel) interface{} {
		if model.Value == "0" {
			return "男"
		}
		if model.Value == "1" {
			return "女"
		}
		return "未知"
	})
	info.AddField("城市", "city", db.Varchar)
	info.AddField("ip", "ip", db.Varchar)
	info.AddField("手机号", "phone", db.Varchar)
	info.AddField("创建时间", "created_at", db.Timestamp).FieldSortable()
	info.AddField("修改时间", "updated_at", db.Timestamp)

	info.SetTable("users").SetTitle("Users").SetDescription("客户").
		SetAction(template.HTML(`<a href="http://google.com"><i class="fa fa-google"></i></a>`)) // 自定义操作按钮

	formList := usersTable.GetForm()

	formList.AddField("Id", "id", db.Int, form.Default).FieldNotAllowAdd()
	formList.AddField("名称", "name", db.Varchar, form.Text)
	formList.AddField("性别", "gender", db.Tinyint, form.Radio).
		FieldOptions([]types.FieldOption{
			{
				SelectedLabel:    "gender",
				Text:    "男",
				Value:    "0",
				Selected: true,
			}, {
			SelectedLabel:    "gender",
			Text:     "女",
			Value:      "1",
			Selected: false,
			},
		})
	formList.AddField("城市", "city", db.Varchar, form.Text)
	formList.AddField("ip地址", "ip", db.Varchar, form.Ip)
	formList.AddField("手机号", "phone", db.Varchar, form.Text)
	formList.AddField("创建时间", "created_at", db.Timestamp, form.Datetime)
	formList.AddField("修改时间", "updated_at", db.Timestamp, form.Datetime)

	formList.SetTable("users").SetTitle("Users").SetDescription("Users")

	return usersTable
}

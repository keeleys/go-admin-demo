package main

import (
	_ "github.com/GoAdminGroup/go-admin/adapter/gin"
	"github.com/GoAdminGroup/go-admin/engine"
	"github.com/GoAdminGroup/go-admin/examples/datamodel"
	"github.com/GoAdminGroup/go-admin/modules/config"
	_ "github.com/GoAdminGroup/go-admin/modules/db/drivers/mysql"
	"github.com/GoAdminGroup/go-admin/plugins/admin"
	"github.com/GoAdminGroup/go-admin/plugins/example"
	"github.com/GoAdminGroup/go-admin/template"
	"github.com/GoAdminGroup/go-admin/template/chartjs"
	_ "github.com/GoAdminGroup/themes/adminlte"
	"github.com/gin-gonic/gin"
	"go-admin-demo/table"
)

func main() {
	r := gin.Default()
	eng := engine.Default()
	cfg := config.ReadFromJson("./mysql/config.json")
	adminPlugin := admin.NewAdmin(datamodel.Generators)
	template.AddComp(chartjs.NewChart())

	adminPlugin.AddGenerator("user", datamodel.GetUserTable)
	adminPlugin.AddGenerator("users", table.GetUsersTable)

	examplePlugin := example.NewExample()
	_ = eng.AddConfig(cfg).AddPlugins(adminPlugin,examplePlugin).Use(r)

	eng.HTML("GET", "/admin",  datamodel.GetContent )
	_ = r.Run(":9033")
}
